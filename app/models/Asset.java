/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 * 
 */
package models;

import controllers.DoSearch;
import helpers.Helpers;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.persistence.*;
import play.db.jpa.GenericModel;
import javax.xml.transform.stream.StreamSource;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.Serializer;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.hibernate.annotations.Type;
import play.db.jpa.JPABase;

/**
 *
 *
 * This class holds all xml-files
 * Variants of originals are held in variant-counter, original is number 0
 * Name of xml-file as given when uploaded is overridden by the title in the teiHeader (KK 2014-03-05)
 * Name of assets should be on type
 *
 * Enunmeration of asset-type is kept in string due to db-restrinctions on jpa-enums
 *
 */
@Entity
public class Asset extends GenericModel {

    @Id
    @GeneratedValue(generator = "asset_id_seq_gen")
    @SequenceGenerator(name = "asset_id_seq_gen", sequenceName = "asset_id_seq")
    public long id;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String xml;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String html;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String htmlAsText;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String comment;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String name;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String fileName;
    public int variant;
    public int pictureNumber = 0;
    @Column(name = "import_date")
    @Temporal(TemporalType.TIMESTAMP)
    public java.util.Date importDate;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String rootName;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String type;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    public String refs;
    
    /* no enum-support in db, unfornately */
    public static String imageType = "imageType";
    public static String countryImage = "countryuImage";
    public static String introType = "introType";
    public static String manusType = "manus";
    public static String rootType = "root";
    public static String variantType = "variant";
    public static String commentType = "comment";
    public static String mythType = "myth";
    public static String personType = "person";
    public static String placeType = "place";
    public static String veiledningType = "veiledning";
    public static String txrType = "txr";
    public static String varListType = "varList";
    public static String bibleType = "bible";
    public static String registranten = "registranten";
    public static String bookinventory = "bookinventory";
    public static String mapVej = "mapVej";
    public static String mapXml = "mapXml";
    public static String bibliografi = "bibliografi";
    public static String titleType = "titleRef"; /*added 2016-03-17 by KK*/

    /**
     * Used by images
     * images on form rootname_number.jpg
     */
    public Asset(String name, String fileName, String comment, String type) {
        this.name = name;
        this.fileName = fileName;
        this.comment = comment;
        this.type = type;
        this.rootName = fileName.replace(".jpg", "").replaceFirst("_\\d+$", "");
        System.out.println("Rootname: " + rootName);
    }

    public Asset(String name, String fileName, String html, String xml, String comment, int variant, String type, String ref) {
        System.out.println("***** Constructing new asset, type is: " + type);
        this.variant = variant;
        this.name = name;
        this.html = html;
        this.xml = xml;
        this.importDate = new java.util.Date();
        this.comment = comment;
        this.fileName = fileName;
        this.rootName = getRootName(fileName, type);
        this.type = type;
        this.refs = ref;
        System.out.println("Root-name: " + rootName);
    }

    
        
   private static boolean nonEmpty(Asset var) {
        Pattern p = Pattern.compile("type\\s*=\\s*[\"'](minusVar|unknownVar)[\"']");
        Matcher m = p.matcher(var.xml);
        if (m.find()) {
            return false;
        } else {
            return true;
        }
   }
    
/**
 * 
 * Save element to solr
 * 
 */   
    public void index() {
        boolean doIndex = true;
        // add rules where not to index
        if (type.equals(variantType) && doIndex && !nonEmpty(this)) {
            doIndex = false;
        }
        if (doIndex) {
            try {
                SolrServer server = Helpers.getSolrServer();
                SolrInputDocument doc1 = new SolrInputDocument();
                doc1.addField("id", "asset_" + id);
                doc1.addField("text", htmlAsText);
                doc1.addField("type", type);
                doc1.addField("pgid", id);
                long sj = DoSearch.extractSj(this.fileName);
                doc1.addField("sj", sj);
                if (sj == 0) return;
                server.add(doc1);
                server.commit();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
   
   
    /**
     * Always make html searchable as text before saving
     */
    @Override
    public <T extends JPABase> T save() {
        System.out.println("Hey - I am saved");
        htmlAsText = Helpers.stripHtml(html);
        T t = super.save();
        index();
        return t;
    }
        

    @Override
    public <T extends JPABase> T delete() {
        try {
            SolrServer server = Helpers.getSolrServer();
            server.deleteById("asset_" + id);
            server.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return super.delete();
    }
    
    
    /**
     * create teaser for search-list
     * 
     * @return html with lookfor highlighted
     */
    public String getTeaser(String lookfor) {
        return DoSearch.createTeaser(htmlAsText, lookfor);
    }

    
    /**
     * Get the id for an asset
     * Use the filename is a key
     *
     * @return database-id
     * 
     */
    public Long getCorrespondingRootId() {
        Long res = null;
        System.out.println("Getting root for: " + this.fileName);
        try {
            Asset root = Asset.find("rootName = :rootName and type = :type").setParameter("rootName", rootName).setParameter("type", Asset.rootType).first();
            res = root.id;
        } catch(Exception e) {
            System.err.println("Could not find root-class of file: " + this.fileName);
        }
        return res;
    }

    /**
     * The txt-file should have a corresponding intro-file
     * get file name from teiHeader (KK 2014-03-05)
     * @return id of intro-file asset
     * 
     */
    public String getCorrespondingIntro() { //<note type="intro" target="1804_28_intro.xml">
        String rN= rootName;
        Pattern p= Pattern.compile( "<note [^>]*type=[\"'](intro|noIntro)[\"'][^>]*>" );
        Matcher m= p.matcher( xml );
        if( m.find() ) {
            p= Pattern.compile( "target=[\"']([^\"]*)[\"']" );
            m= p.matcher( m.group(0) );
            if( m.find() )
                rN= getRootName( m.group(1).trim(), Asset.introType );
        }

        System.out.println("Looking for intro rootname: " + rN);
        Asset intro = Asset.find("rootName = :rootName and type = :type").setParameter("rootName", rN).setParameter("type", Asset.introType).first();
        return (intro != null ? intro.html : "");
    }

    /**
     * The txt-file should have a corresponding txr-file
     * @return id of txt-file
     * 
     */
    public String getCorrespondingTxr() {
        Asset txr = Asset.find("rootName = :rootName and type = :type").setParameter("rootName", rootName).setParameter("type", Asset.txrType).first();
        System.out.println("Txr is: " + txr);
        return (txr != null ? txr.html : "");
    }

    /**
     * The txt-file should have a corresponding comment-file
     *
     * @return comment-content as String after preprocessing
     * 
     */
    public String getCorrespondingComment() {
        Asset comment = Asset.find("fileName = :fileName and type = :type").setParameter("fileName", rootName + "_com.xml").setParameter("type", Asset.commentType).first();
        // System.out.println("Corresponding comment: " + intro.html);
        return (comment != null ? comment.html : "");
    }

    /**
     * Get xml and references for this asset
     * Currently not in use
     */
    public String getHtmlAndReferences() {
        return xml + refs;
    }

    /**
     * Calculates root name of an asset, based on the syntax of the filename
     * The root-name is stored in the asset model
     * @return root-name of the asset
     */
    public static String getRootName(String fileNameIn, String assetType) {
        String fileName = fileNameIn;
        fileName = fileName.replaceFirst(".xml", "").replaceFirst("_intro", "").replaceFirst("_com", "").replaceFirst("_txt", "").replaceFirst("_varList", "").replaceFirst("_txr", "").replaceFirst("_fax", "");
        if (assetType.equals(Asset.rootType) ||
                assetType.equals(Asset.commentType) ||
                assetType.equals(Asset.introType) ||
                assetType.equals(Asset.txrType) ||
                assetType.equals(Asset.veiledningType) ||
                assetType.equals(Asset.varListType)) return fileName;
        
        Pattern pattern = Pattern.compile("(.*)_.*\\d+$");
        Matcher matcher = pattern.matcher(fileName);
        if (!matcher.matches()) {
            System.out.println("Setting root name to: " + fileName);
            return fileName;
        } else {
            System.out.println("Setting root name to (regexp match): " + matcher.group(1));
            return matcher.group(1);
        }
    }

    public static Asset uploadCountryImage(String name, String comment, File file) {
        String fileName = file.getName();
        Asset asset = new Asset(name, fileName, comment, Asset.countryImage);
        asset.importDate = new Date();
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "images" + File.separator + fileName;
        Helpers.copyfile(file.getAbsolutePath(), filePath); 
        asset.save();
        return asset;
    }

    
    public static void uploadIBinary(String name, String comment, File file) {
        String fileName = file.getName();
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "images" + File.separator + fileName;
        Helpers.copyfile(file.getAbsolutePath(), filePath);
        return;
    }
    
    
    
    /**
     * 
     * Handles upload of fix-image
     * Binary file is copied and kept in the application-path
     * Every picture has a number, this is calculated based on the file-name
     * Asset with type Asset.imageType is created
     * 
     */
    public static Asset uploadFax(String name, String comment, File file) {
        String fileName = file.getName();
        fileName = fileName.replaceFirst("_fax", "_").replaceFirst("_0+", "_");
        Asset asset;
        if (Asset.find("fileName = :fileName").setParameter("fileName", fileName).first() != null) {
            asset = Asset.find("fileName = :fileName").setParameter("fileName", fileName).first();
            asset.comment = comment;
            asset.name = name;
            asset.type = Asset.imageType;
        } else {
            asset = new Asset(name, fileName, comment, Asset.imageType);
        }
        asset.importDate = new Date();
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "images" + File.separator + fileName;
        Helpers.copyfile(file.getAbsolutePath(), filePath);
        String[] pictureNums = fileName.replace(".jpg", "").split("_");
        int pictureNum = Integer.parseInt(pictureNums[pictureNums.length - 1]);
        asset.pictureNumber = pictureNum;
        asset.save();
        return asset;
    }

    /**
     * Keep a local version of the uploaded xml
     * Might not be needed?
     * 
     */
    private static String copyXmlToXmlDirectory(File epub) {
        File newFile = new File(play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xml" + File.separator + epub.getName());
        Helpers.copyfile(epub.getAbsolutePath(), newFile.getAbsolutePath());
        return newFile.getAbsolutePath();
    }

    /**
     * Get the content of <tag attrName="attrValue"> in xml
     * 
     */
    /* KK 2014-03-05, 2015-10-08, 2017-03-29 */
    public static String getXmlElem( String xml, String tag, String attrName, String attrValue ) {
        Pattern p= Pattern.compile( "<" + tag + "\\s+[^>]*" + attrName + "\\s*=\\s*[\"']" + attrValue + "[\"'][^>]*>(.*?)</" + tag + "\\s*>", Pattern.DOTALL );
        Matcher m= p.matcher( xml );
        if( m.find() )
            return m.group(1).trim() + ( m.find(m.end()) ? " m.fl." : "" );
        else
            return "";
    }

    /**
     * Get the value of attrName in <tag> in xml
     * 
     */
    /* KK 2015-10-08*/
    static String getXmlAttrValue( String xml, String tag, String attrName ) {
        Pattern p= Pattern.compile( "<" + tag + "\\s+[^>]*" + attrName + "\\s*=\\s*[\"']([^\"']*)[\"'][^>]*>" );
        Matcher m= p.matcher( xml );
        if( m.find() )
            return m.group(1).trim();
        else
            return "";
    }

    /**
     * Get the content of <term>s in <outerElem> in xml, delimited by "#"
     * 
     */
    /* KK 2015-10-08 */
    public static String getXmlTerms( String xml, String outerElem ) {
        String firstTextClass= "";
        int t1= xml.indexOf("<textClass>"), t2= xml.indexOf("</textClass>");
        if( t1>=0 && t2>=0 ) {
            firstTextClass= xml.substring( t1, t2 );
             // the first textClass WITHOUT attributes
        }
        //else
        //    System.out.println( "No textClass, "+ t1 + "," + t2 );            
        Pattern p= Pattern.compile( "<" + outerElem + "[^>]*>(.*)</" + outerElem + "\\s*>", Pattern.DOTALL );
        Matcher m= p.matcher( firstTextClass );
        if( m.find() ) {
            //System.out.println( outerElem + " found: " + m.group(1) );
            String result= "";
            p= Pattern.compile( "<term[^>]*>([^<]*)</term\\s*>" );
            m= p.matcher( m.group(1) );
            while( m.find() )
              result+= ( result.equals("")?"":"#" ) + m.group(1).trim();
            if( result.equals("") )
                return "ingen";
            else
                return result;
        }
        else {
            return "ingen";
        }
    }
    
    /**
     * Convert xml hexadecimal char entities to unicode string
     * 
     */
    /* KK 2014-03-05 xx */
    private static String ent2str( String ent ) {
        Pattern p= Pattern.compile( "&#x([0-9A-Fa-f]+);" );
        Matcher m= p.matcher( ent );
        while( m.find() ){
            ent= ent.replaceFirst( m.group(0), String.format("%c",Integer.parseInt(m.group(1),16)) );
        }
        return ent;
    }
    
    /**
     * 
     * Handle upload of xml-file
     * Calculate asset-type based on file-name
     * Copy and keep xml-file
     * Calculate and keep html based on the right xslt
     * 
     * Note:
     * variant = 0 means it is the original
     *
     *
     */
    public static Asset uploadXmlFile(String name, String comment, File epub) {
        int variant = 0;
        String type;
        System.out.println("Epub name: " + epub.getName());
        if (epub.getName().contains("_bibl")) {
            type = Asset.bibliografi;
        } else
        if (epub.getName().equals("map_vej.xml")) {
            type = Asset.mapVej;
        } else if (epub.getName().startsWith("map_")) {
            type = Asset.mapXml;
        } else if (epub.getName().contains("_vej")) {
            type = Asset.veiledningType;
        } else if (epub.getName().equals("place.xml")) {
            type = Asset.placeType;
        } else if (epub.getName().equals("bible.xml")) {
            type = Asset.bibleType;
        } else if (epub.getName().equals("regList.xml")) {
            type = Asset.registranten;
        } else if (epub.getName().equals("pers.xml")) {
            type = Asset.personType;
        } else if (epub.getName().equals("myth.xml")) {
            type = Asset.mythType;
        } else if (epub.getName().equals("title.xml")) {
            type = Asset.titleType;
        } else if (epub.getName().replace(".xml", "").endsWith("_com")) {
            type = Asset.commentType;
        } else if (epub.getName().contains("intro")) {
            type = Asset.introType;
        } else if (epub.getName().contains("bookInventory")) {
            type = Asset.bookinventory;
        } else if (epub.getAbsolutePath().matches(".*_ms[1-9]*.xml")) {
            System.out.println("Type is manustype!");
            Pattern pattern = Pattern.compile("ms(\\d+)");
            Matcher matcher = pattern.matcher(epub.getAbsolutePath());
            String found = "no match";
            if (matcher.find()) {
                System.out.println("Manus number is: " + matcher.group(1));
                found = matcher.group(1);
                variant = Integer.parseInt(found);
            }
            type = Asset.manusType;
        } else if (epub.getName().contains("txr")) {
            type = Asset.txrType;
        } else if (epub.getName().contains("varList")) {
            System.out.println("Type is varList");
            type = Asset.varListType;
        } else {
            Pattern pattern = Pattern.compile("v(\\d+)");
            Matcher matcher = pattern.matcher(epub.getAbsolutePath());
            String found = "no match";
            if (matcher.find()) {
                System.out.println("Variant is: " + matcher.group(1));
                found = matcher.group(1);
                variant = Integer.parseInt(found);
                type = Asset.variantType;
            } else {
                System.out.println("No variant found");
                type = Asset.rootType;
            }
        }
        System.out.println("File: " + epub);
        System.out.println("File-type: " + type);
        String copiedFile = copyXmlToXmlDirectory(epub);
        System.out.println("Copied file: " + copiedFile);
        
        String html = "";
        String preName= "";
        
        // consider a hash :-)
        if (type.equals(Asset.bibliografi)) {
          html = Asset.xmlRefToHtml(epub.getAbsolutePath(), "biblDescXSLT.xsl"); 
        } else if (type.equals(Asset.mapVej) || type.equals(Asset.mapXml)) {
          html =  Asset.xmlRefToHtml(epub.getAbsolutePath(), "vejXSLT.xsl"); 
        } else if (type.equals(Asset.veiledningType)) {
          html = fixHtml(Asset.xmlRefToHtml(epub.getAbsolutePath(), "vejXSLT.xsl"));
        } else if (type.equals(Asset.placeType)) {
            html = fixHtml(Asset.xmlRefToHtml(epub.getAbsolutePath(), "placeXSLT.xsl"));
        } else if (type.equals(Asset.personType)) {
            html = Asset.xmlRefToHtml(epub.getAbsolutePath(), "persXSLT.xsl");
        } else if (type.equals(Asset.commentType)) {
            html = fixHtml(Asset.xmlRefToHtml(copiedFile, "comXSLT.xsl"));
            preName= "Punktkomm. til ";
        } else if (type.equals(Asset.introType)) {
            html = fixHtml(Asset.xmlToHtmlIntro(copiedFile));
            preName= "Indl. til ";
        } else if (type.equals(Asset.variantType)) {
            html = fixHtml(Asset.xmlToHtmlVariant(copiedFile));
            //preName= "Var. til "; use shortForm
        } else if (type.equals(Asset.rootType)) {
            html = fixHtml(Asset.xmlToHtml(copiedFile));
        } else if (type.equals(Asset.manusType)) {
            html = Asset.xmlToHtmlManus(copiedFile);
            //preName= "Ms. til "; use shortForm
        } else if (type.equals(Asset.mythType)) {
            html = Asset.xmlRefToHtml(epub.getAbsolutePath(), "mythXSLT.xsl");
        } else if (type.equals(Asset.titleType)) {
            html = Asset.xmlRefToHtml(epub.getAbsolutePath(), "titleXSLT.xsl");
        } else if (type.equals(Asset.bibleType)) {
            html = Asset.xmlRefToHtml(epub.getAbsolutePath(), "bibleXSLT.xsl");
        } else if (type.equals(Asset.registranten)) {
            html = Asset.xmlRefToHtml(epub.getAbsolutePath(), "regListXSLT.xsl");
        } else if (type.equals(Asset.txrType)) {
            html = fixHtml(Asset.xmlRefToHtml(copiedFile, "txrXSLT.xsl"));
            preName= "Tekstred. til ";
        } else if (type.equals(Asset.varListType)) {
            html = Asset.xmlRefToHtml(copiedFile, "varListXSLT.xsl");
        } else if (type.equals(Asset.bookinventory)) {
            html = Asset.xmlRefToHtml(copiedFile, "bookInventoryXSLT.xsl");
        } else {
            html = "Not found: filetype unknown";
            throw new Error("No recognized filetype found");
        }
        if (html.startsWith("Error")) {
            throw new Error("Probably an error in xslt-stylesheet or xml: " + html);
        }

        // create or update asset
        String xml = "";
        try {
            xml = Helpers.readFile(epub.getAbsolutePath());
        } catch (IOException ex) {
            Logger.getLogger(Asset.class.getName()).log(Level.SEVERE, null, ex);
        }

        // String refs = Helpers.getReferencesFromXml(xml, epub.getName().replaceFirst("", html));
        String references = "";
        String prevQual= getXmlAttrValue( xml, "title", "prev" ),
               nextQual= getXmlAttrValue( xml, "title", "next" );
        String teiHeaderTitle= getXmlElem( xml, "title", "rend", "shortForm" );
        if( prevQual!="" )
            prevQual= "[" + prevQual + "] ";
        if( nextQual!="" )
            nextQual= " [" + nextQual + "]";
        if( teiHeaderTitle!=null )
            name= preName + prevQual + ent2str( teiHeaderTitle ) + nextQual;
        else
            name= preName + epub.getName();
        System.out.println( "hdrName: " + name );

        Asset asset;
        System.out.println("Filename: " + epub.getName());
        if (Asset.find("filename", epub.getName()).fetch().size() > 0) {
            System.out.println("--- Updating asset with name: " + epub.getName());
            asset = Asset.find("filename", epub.getName()).first();
            if (!name.trim().equalsIgnoreCase(epub.getName().trim())) asset.name = name;
            asset.html = html;
            asset.comment = comment;
            asset.variant = variant;
            asset.importDate = new Date();
            asset.type = type;
            asset.refs = references;
            asset.fileName = epub.getName();
            asset.rootName = getRootName(epub.getName(), asset.type);
            asset.xml = xml;
        } else {
            asset = new Asset(name, epub.getName(), html, xml, comment, variant, type, references);
        }
        asset.save();
        System.out.println("Root-name: " + asset.rootName);
        System.out.println("Asset is saved, total assets: " + Asset.findAll().size());
        if (asset.type.equals(Asset.rootType)) {
            Chapter.createChaptersFromAsset(asset);
        }
        return asset;
    }

    // remove headers so html can be shown in div
    // consider fixing xslt later
    private static String fixHtml(String html) {
        // System.out.println("Fixing html - removing body");
        // html = html.replaceFirst("(?s).*<body.*?>", "<div class='simple' id='top'>");
        // System.out.println("Fixing html 2");
        // html = html.replaceFirst("(?s)</body.*", "</div>");
        // System.out.println("Fixing html 3");
        html = html.replaceAll("<div class='[^']+'/>", "").replaceAll("<div class=\"[^\"]+\"/>", "");
        System.out.println("Html if fixed :-)");
        return html;
    }

    /**
     * Get variants and manuses based on the root-asset
     * @return List of variants, manuses and varLists connected to this asset
     * 
     */
    public static List<Asset> getVariants(long assetId) {

        Asset rootAsset = Asset.findById(assetId);
        System.out.println("rootName: " + rootAsset.id);  
        List<Asset> variants = Asset.find("rootName = ? and (type = ?  or type =  ? or type = ?) order by type, variant", rootAsset.rootName, Asset.variantType, Asset.manusType, Asset.varListType).fetch();
        return variants;
    }

    
    /**
     * Get correspondig manus to an asset
     * @return List of manuses 
     */
    public static List<Asset> getManus(long assetId) {
        Asset rootAsset = Asset.findById(assetId);
        List<Asset> manus = Asset.find("rootName = ? and type = ? ", rootAsset.rootName, "manus").fetch();
        if (manus.isEmpty()) {
            manus = Asset.find("rootName = ? and type = ? ", rootAsset.rootName.replaceFirst("_1", ""), "manus").fetch();
        }
        return manus;
    }

    /**
     * Combine xml and xslt for ref-type assets
     */
    public static String xmlRefToHtml(String fileName, String xsltPath) {
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + xsltPath;
        return xmlToHtml(fileName, filePath);
    }

    /**
     * Combine xml and xslt for myth-type assets
     */
    public static String xmlToHtmlMyth(String fileName) {
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + "mythXSLT.xsl";
        return xmlToHtml(fileName, filePath);
    }

    /**
     * Combine xml and xslt for manus-type assets
     */
    public static String xmlToHtmlManus(String fileName) {
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + "msXSLT.xsl";
        return xmlToHtml(fileName, filePath);
    }

    /**
     * Combine xml and xslt for intro-type assets
     */
    public static String xmlToHtmlIntro(String fileName) {
        System.out.println("Uploading introduction");
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + "introXSLT.xsl";
        return xmlToHtml(fileName, filePath);
    }

    /**
     * Combine xml and xslt for var-type assets
     */
    public static String xmlToHtmlVariant(String fileName) {
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + "varXSLT.xsl";
        return xmlToHtml(fileName, filePath);
    }

    /**
     * Combine xml and xslt for root-type assets
     */
    public static String xmlToHtml(String fileName) {
        // String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + "xhtml2" + File.separator + "tei.xsl";
        String filePath = play.Play.applicationPath.getAbsolutePath() + File.separator + "public" + File.separator + "xslt" + File.separator + "txtXSLT.xsl";
        return xmlToHtml(fileName, filePath);
    }

    
    /**
     * Does the xslt-transformation of a xml-file and and a xslt-file
     * @params fileName - name of xml-file
     * @params fileName - name of xslt - file
     * 
     */
    public static String xmlToHtml(String fileName, String filePath) {
        System.out.println("User dir: " + System.getProperty("user.dir"));
        try {
            File xmlIn = new File(fileName);
            StreamSource source = new StreamSource(xmlIn);
            Processor proc = new Processor(false);
            XsltCompiler comp = proc.newXsltCompiler();
            System.out.println("Filepath: " + filePath);
            XsltExecutable exp = comp.compile(new StreamSource(new File(filePath)));
            Serializer out = new Serializer();
            ByteArrayOutputStream buf = new ByteArrayOutputStream();
            out.setOutputProperty(Serializer.Property.METHOD, "xhtml");
            out.setOutputProperty(Serializer.Property.OMIT_XML_DECLARATION, "yes");
            out.setOutputProperty(Serializer.Property.INDENT, "no");
            out.setOutputProperty(Serializer.Property.ENCODING, "utf-8");
            out.setOutputStream(buf);
            // out.setOutputFile(new File("tour.html"));
            XsltTransformer trans = exp.load();
            // trans.setInitialTemplate(new QName("main"));
            trans.setSource(source);
            trans.setDestination(out);
            trans.transform();
            // System.out.println("Output generated: " + buf.toString());
            return buf.toString("utf-8");
        } catch (Exception e) {
            e.printStackTrace();
            return ("Error: " + e.toString());
        }

    }
    
    public int getNumberOfPictures() {
        System.out.println("**** Looking for rootName: " + rootName);
        return Asset.find("rootName = :rootName and type = :type").setParameter("rootName", rootName).setParameter("type", Asset.imageType).fetch().size();
    }

    public String getFileNameWithoutXml() {
        return this.rootName;
    }

    
    
}
