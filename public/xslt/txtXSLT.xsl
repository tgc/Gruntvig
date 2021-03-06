<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:TEI="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="popups.xsl"/>

    <xsl:template match="TEI:TEI">        
       
        <div class="rootText">
                <div class="kolofonBlad">
                    
                    <div class="kolofonTitle">
                        <xsl:choose>
                            <xsl:when test="//TEI:titleStmt/TEI:author">
                                <xsl:call-template name="author"/>
                            </xsl:when>
                            <xsl:when test="//TEI:titleStmt/TEI:editor[@role='editor']">
                                <xsl:call-template name="editor"/>
                            </xsl:when>
                        </xsl:choose>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:text></xsl:text><i><xsl:text>Grundtvigs Værker, </xsl:text></i><xsl:text>version </xsl:text><xsl:value-of select="//TEI:idno[@type='content']"/><xsl:text></xsl:text>
                    </div>
                    <div class="kolofon">
                        <xsl:choose>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='0.9'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 3. marts 2011</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.0'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 15. maj 2012</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.1'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 15. november 2012</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.2'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 1. maj 2013</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.3'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 1. oktober 2013</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.4'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 1. maj 2014</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.5'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 31. oktober 2014</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.6'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 4. maj 2015</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.7'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 3. november 2015</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.8'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 29. april 2016</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.9'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 1. november 2016</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:idno[@type='firstUpload']='1.10'">
                                <xsl:text>Offentliggjort første gang i version </xsl:text><xsl:value-of select="//TEI:idno[@type='firstUpload']"/><xsl:text>, 1. maj 2017</xsl:text>
                            </xsl:when>                            
                        </xsl:choose>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:text>Tekstkilder</xsl:text>
                            <xsl:for-each select="//TEI:listWit[@xml:id='emendation']/TEI:witness">
                                <div class="table">
                                    <table class="listWit">
                                        <tr>
                                            <td class="sigel">
                                                <xsl:choose>
                                                    <xsl:when test="@xml:id='DU'">
                                                        <xsl:text>D&amp;U</xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="@xml:id"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>                                                
                                            </td>
                                            <td class="source">
                                                <xsl:choose>
                                                    <xsl:when test="@xml:id='A'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text>, </xsl:text>
                                                        </span>
                                                        <span class="num">
                                                            <xsl:apply-templates select="TEI:num"/>
                                                        </span>
                                                        <xsl:text> (SJ: </xsl:text>
                                                        <xsl:apply-templates select="@n"/>
                                                        <xsl:text>)</xsl:text> 
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='B'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text>, </xsl:text>
                                                        </span>
                                                        <span class="num">
                                                            <xsl:apply-templates select="TEI:num"/>
                                                        </span>
                                                        <xsl:text> (SJ: </xsl:text>
                                                        <xsl:apply-templates select="@n"/>
                                                        <xsl:text>)</xsl:text> 
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='C'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text>, </xsl:text>
                                                        </span>
                                                        <span class="num">
                                                            <xsl:apply-templates select="TEI:num"/>
                                                        </span>
                                                        <xsl:text> (SJ: </xsl:text>
                                                        <xsl:apply-templates select="@n"/>
                                                        <xsl:text>)</xsl:text> 
                                                    </xsl:when>
                                                    <xsl:when test="not(@xml:id)">
                                                        <span class="descList">
                                                            <xsl:apply-templates/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='R'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='K'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='r'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='k'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='DU'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text> </xsl:text>
                                                        </span>
                                                        <span class="num">
                                                            <xsl:apply-templates select="TEI:num"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='Gskv'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text> </xsl:text>
                                                        </span>
                                                        <span class="num">
                                                            <xsl:apply-templates select="TEI:num"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='GSV'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text> </xsl:text>
                                                        </span>
                                                        <span class="num">
                                                            <xsl:apply-templates select="TEI:num"/>
                                                        </span>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='PS'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text> </xsl:text>
                                                        </span>
                                                        <xsl:for-each select="TEI:num">
                                                            <xsl:value-of select="."/>
                                                            <xsl:if test="following-sibling::TEI:num">
                                                                <xsl:choose>
                                                                    <xsl:when test="following-sibling::TEI:num[position()!=last()]">
                                                                        <xsl:text>, </xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:text> og </xsl:text>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='US'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text> </xsl:text>
                                                        </span>
                                                        <xsl:for-each select="TEI:num">
                                                            <xsl:value-of select="."/>
                                                            <xsl:if test="following-sibling::TEI:num">
                                                                <xsl:choose>
                                                                    <xsl:when test="following-sibling::TEI:num[position()!=last()]">
                                                                        <xsl:text>, </xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:text> og </xsl:text>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:when test="@xml:id='VU'">
                                                        <span class="desc">
                                                            <xsl:apply-templates select="TEI:desc"/>
                                                            <xsl:text> </xsl:text>
                                                        </span>
                                                        <xsl:for-each select="TEI:num">
                                                            <xsl:value-of select="."/>
                                                            <xsl:if test="following-sibling::TEI:num">
                                                                <xsl:choose>
                                                                    <xsl:when test="following-sibling::TEI:num[position()!=last()]">
                                                                        <xsl:text>, </xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:text> og </xsl:text>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <span style="color:red">
                                                            <xsl:text>TEKSTKILDE MANGLER!!!</xsl:text>
                                                        </span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </xsl:for-each>
                            
                            
                            <xsl:if test="//TEI:listWit[@xml:id='pageNumber']/TEI:witness">
                                <xsl:text>Andre udgaver</xsl:text>
                                <xsl:for-each select="//TEI:listWit[@xml:id='pageNumber']/TEI:witness">
                                    <div class="table">
                                        <table class="witList">
                                            <tr>
                                                <td class="sigel">
                                                    <xsl:value-of select="@xml:id"/>
                                                </td>
                                                <td class="source">
                                                    <span class="desc">
                                                        <xsl:apply-templates select="TEI:desc"/>
                                                        <xsl:text> </xsl:text>
                                                    </span>
                                                    <span class="vol">
                                                        <xsl:for-each select="TEI:num">
                                                            <xsl:value-of select="."/>
                                                            <xsl:if test="following-sibling::TEI:num">
                                                                <xsl:choose>
                                                                    <xsl:when test="following-sibling::TEI:num[position()!=last()]">
                                                                        <xsl:text>, </xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:text> og </xsl:text>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </xsl:for-each>
                            </xsl:if>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:text>Teksten er etableret af </xsl:text>
                            <xsl:for-each select="//TEI:editor[@role='editionPhilologist']">
                                <xsl:value-of select="."/>
                                <xsl:if test="following-sibling::TEI:editor[@role='editionPhilologist']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='editionPhilologist'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        <xsl:call-template name="delimiterFullStop"/>
                    </div>
                    
                     <div class="kolofon">
                        <xsl:if test="//TEI:note[@type='com']">
                            <xsl:text>Punktkommentarer ved </xsl:text>
                            <xsl:for-each select="document(//TEI:note[@type='com']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:author">
                                <xsl:apply-templates/>
                                <xsl:if test="following-sibling::TEI:author">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:author[position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:text>, redigeret af </xsl:text>
                            <xsl:for-each select="document(//TEI:note[@type='com']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='editor']">
                                <xsl:apply-templates select="."/>
                                <xsl:if test="following-sibling::TEI:editor[@role='editor']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='editor'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//TEI:note[@type='noCom']">
                            <xsl:text>Punktkommentarerne er under udarbejdelse</xsl:text>
                        </xsl:if>
                        <xsl:if test="//TEI:note[@type='minusCom']"/>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="//TEI:note[@type='intro']">
                            <xsl:text>Indledning ved </xsl:text>
                            <xsl:for-each select="document(//TEI:note[@type='intro']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:author">
                                <xsl:apply-templates/>
                                <xsl:if test="following-sibling::TEI:author">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:author[position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>                            
                            <xsl:text>, redigeret af </xsl:text>
                            <xsl:for-each select="document(//TEI:note[@type='intro']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='editor']">
                                <xsl:apply-templates/>
                                <xsl:if test="following-sibling::TEI:editor[@role='editor']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='editor'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//TEI:note[@type='noIntro']">
                            <xsl:text>Indledningen er under udarbejdelse</xsl:text>
                        </xsl:if>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="//TEI:note[@type='txr']">
                            <xsl:text>Tekstredegørelse ved </xsl:text> 
                            <xsl:for-each select="document(//TEI:note[@type='txr']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:author">
                                <xsl:apply-templates/>
                                <xsl:if test="following-sibling::TEI:author">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:author[position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:text>, redigeret af </xsl:text>
                            <xsl:for-each select="document(//TEI:note[@type='txr']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='editor']">
                                <xsl:apply-templates select="."/>
                                <xsl:if test="following-sibling::TEI:editor[@role='editor']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='editor'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//TEI:note[@type='noTxr']">
                            <xsl:text>Tekstredegørelsen er under udarbejdelse</xsl:text>
                        </xsl:if>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="//TEI:note[@type='var']">
                            <xsl:text>Varianter er etableret af </xsl:text> 
                            <xsl:for-each select="document(//TEI:note[@type='txr']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:author">
                                <xsl:apply-templates/>
                                <xsl:if test="following-sibling::TEI:author">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:author[position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        <!-- udkom. 2015.04.15 
                        <xsl:choose>
                            <xsl:when test="//TEI:note[@type='noVar']">
                                <xsl:text>Varianter er endnu ikke etableret.</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:note[@type='minusVar']">
                                <xsl:text>GV udgiver ikke varianter til dette værk.</xsl:text>
                            </xsl:when>
                            <xsl:when test="//TEI:note[@type='unknownVar']">
                                <xsl:text>Der kendes ikke varianter til dette værk.</xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        -->
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="//TEI:note[@type='noBible' or @type='noMyth' or @type='noPersName' or @type='noPlaceName' or @type='noTitle']">
                            <xsl:text>Opmærkning til registrene er under udarbejdelse.</xsl:text>                            
                        </xsl:if>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:text>XML ved Kim Steen Ravn</xsl:text>
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="document(//TEI:note[@type='com']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='contributor']">
                            <xsl:text>For hjælp til punktkommentarer takkes </xsl:text>
                            <xsl:for-each select="document(//TEI:note[@type='com']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='contributor']">
                                <xsl:apply-templates select="."/>
                                <xsl:if test="following-sibling::TEI:editor[@role='contributor']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='contributor'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:call-template name="delimiterFullStop"/>
                        </xsl:if>                        
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="document(//TEI:note[@type='intro']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='contributor']">
                            <xsl:text>For hjælp til indledning takkes </xsl:text> 
                            <xsl:for-each select="document(//TEI:note[@type='intro']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='contributor']">
                                <xsl:apply-templates select="."/>
                                <xsl:if test="following-sibling::TEI:editor[@role='contributor']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='contributor'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:call-template name="delimiterFullStop"/>
                        </xsl:if>                        
                    </div>
                    
                    <div class="kolofon">
                        <xsl:if test="document(//TEI:note[@type='txr']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='contributor']">
                            <xsl:text>For hjælp til tekstredegørelse takkes </xsl:text> 
                            <xsl:for-each select="document(//TEI:note[@type='txr']/@target)//TEI:TEI/TEI:teiHeader/TEI:fileDesc/TEI:titleStmt/TEI:editor[@role='contributor']">
                                <xsl:apply-templates select="."/>
                                <xsl:if test="following-sibling::TEI:editor[@role='contributor']">
                                    <xsl:choose>
                                        <xsl:when test="following-sibling::TEI:editor[@role='contributor'][position()!=last()]">
                                            <xsl:call-template name="delimiterComma"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> og </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:call-template name="delimiterFullStop"/>
                        </xsl:if>                        
                    </div>
                    
                    <div class="copyright">
                        <xsl:text>Copyright: </xsl:text><i><xsl:text>Grundtvigs Værker</xsl:text></i>
                    </div>
                    
                    <xsl:call-template name="noChapter"/>
                    
                </div>
                
                <xsl:apply-templates select="TEI:text"/>
                
            </div>
    </xsl:template>
    
    <xsl:template match="TEI:g">
        <span class="rotate">
            <xsl:apply-templates/>
        </span>        
    </xsl:template>
    
    <xsl:template name="author">        
        <xsl:choose>
            <!-- main title -->
            <xsl:when test="//TEI:title[@rend='main' and not(@rendition) and not(@next) and not(@prev)]">
                N.F.S. Grundtvig
                <i><xsl:apply-templates select="//TEI:title[@rend='main']"/></i>
            </xsl:when>
            <xsl:when test="//TEI:title[@rend='main' and @rendition='supp']">
                N.F.S. Grundtvig
                [<i><xsl:apply-templates select="//TEI:title[@rend='main']"/></i>]
            </xsl:when>
            <xsl:when test="//TEI:title[@rend='main' and not(@rendition) and not(@next) and @prev='Anmeldelse af']">
                N.F.S. Grundtvig
                <span><xsl:text>[Anmeldelse af] </xsl:text><i><xsl:apply-templates select="//TEI:title[@rend='main']"/></i></span>
            </xsl:when>
            <xsl:when test="//TEI:title[@rend='main' and not(@rendition) and @next and not(@prev)]">
                N.F.S. Grundtvig
                <span><i><xsl:apply-templates select="//TEI:title[@rend='main']"/></i><xsl:text> [</xsl:text><xsl:value-of select="//TEI:title[@rend='main']/@next"/><xsl:text>]</xsl:text></span>
            </xsl:when>
            <!-- part title -->
            <xsl:when test="//TEI:title[@rend='part' and not(@rendition) and not(@next) and not(@prev)]">
                N.F.S. Grundtvig
                &#x201C;<xsl:apply-templates select="//TEI:title[@rend='part']"/>&#x201D;
            </xsl:when>
            <xsl:when test="//TEI:title[@rend='part' and @rendition='supp']">
                N.F.S. Grundtvig
                &#x201C;[<xsl:apply-templates select="//TEI:title[@rend='part']"/>]&#x201D;
            </xsl:when>
            <xsl:when test="//TEI:title[@rend='part' and not(@rendition) and not(@next) and @prev='Anmeldelse af']">
                N.F.S. Grundtvig
                <xsl:text>&#x201C;[Anmeldelse af] </xsl:text><xsl:apply-templates select="//TEI:title[@rend='part']"/>&#x201D;
            </xsl:when>
            <xsl:when test="//TEI:title[@rend='part' and not(@rendition) and @next and not(@prev)]">
                N.F.S. Grundtvig
                &#x201C;<xsl:apply-templates select="//TEI:title[@rend='part']"/><xsl:text> [</xsl:text><xsl:value-of select="//TEI:title[@rend='part']/@next"/><xsl:text>]</xsl:text>&#x201D;
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="editor">
        <xsl:choose>
            <xsl:when test="//TEI:titleStmt/TEI:editor[@xml:id='LCH']">
                L.C. Hagen (udg.)
                <i>
                    <xsl:apply-templates select="//TEI:title[@rend='main']"/>
                </i>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="noChapter">
        <xsl:if test="//TEI:body[@xml:id]">
            <div style="margin: 0.5em">
                <div><a href="public/images/1829_481A_img.html" target="_blank" style="text-decoration: none">Klik her for at se <i>Tidens Ström</i></a>. Dette værk vises i et nyt vindue.</div>
                
                <div>Udgaven af dette værk anvender Image Markup Tool, som er frigivet under Mozilla Public License, version 1.1. Se <a href="https://www.mozilla.org/MPL/1.1/" target="_blank" style="text-decoration: none">https://www.mozilla.org/MPL/1.1/</a></div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="TEI:lb">        
        <br>
            <xsl:apply-templates/>
        </br>        
    </xsl:template>
    
    <!-- titelblad START -->
    
    <xsl:template match="TEI:front[@rend]">
        <div class="frontChapter">
            <xsl:if test="@rend">   
                <xsl:attribute name="name">
                    <xsl:value-of select="@rend"/>
               </xsl:attribute> 
            </xsl:if>
            <xsl:apply-templates/>
        </div>               
    </xsl:template> 
    
    <xsl:template match="TEI:front[not(@rend)]/TEI:div[@type]">
        <div class="frontChapter">
            <xsl:if test="@type">   
                <xsl:attribute name="name">
                    <xsl:value-of select="@type"/>
               </xsl:attribute> 
            </xsl:if>
            <xsl:apply-templates/>
        </div>               
    </xsl:template>    
    
    <xsl:template match="TEI:titlePage[@type]">
        <div class="titlePage">
            <xsl:choose>
                <xsl:when test="@type='dustTitlePage'">
                    <div class="dustTitlePaget">
                        <br/><br/><br/><br/><br/>
                        <xsl:apply-templates/>
                    </div>
                </xsl:when>
                <xsl:when test="@type='first'">
                    <div class="titlePageMain">
                        <xsl:apply-templates/>
                    </div>
                </xsl:when>
                <xsl:when test="@type='second'">
                    <div class="titlePagePart">
                        <xsl:apply-templates/>
                    </div>
                </xsl:when>
                <xsl:when test="@type='dust'">
                    <div class="titlePagePart">
                        <xsl:apply-templates/>
                    </div>
                </xsl:when>
            </xsl:choose>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:titlePart">
        <xsl:choose>
            <xsl:when test="@type='dustTitlePage'">
                <div class="dustTitlePage">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@type='main'">
                <div class="titlePartMain">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@type='part'">
                <div class="titlePartPart">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:figure[@type='engraver']">
        <div class="engraver">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:div1[@type]">
        <div1 class="{@type}">
            <xsl:apply-templates/>
        </div1>
    </xsl:template>
    
    <xsl:template match="TEI:byline">
        <div class="byline">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:docAuthor">
        <div class="docAuthor">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:note[@type='prof']">
        <div class="noteProf">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:docImprint">        
        <div class="docImprint">
            <xsl:apply-templates/>
        </div>        
    </xsl:template>
    
    <xsl:template match="TEI:docTitle">
        <div class="docTitle">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:pubPlace">        
        <div class="pubPlace">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:docDate">
        <xsl:choose>
            <xsl:when test="parent::TEI:pubPlace">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <div class="docDate">
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:publisher">        
        <div class="publisher">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:epigraph">
        <div class="epigraph">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- titelblad END -->
    
    <!-- motto START -->
    
    <xsl:template match="TEI:div1[@type='motto']">        
        <div class="motto">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- motto END -->
    
    <xsl:template match="TEI:char">
        <xsl:choose>
            <xsl:when test="@rend='space1'">
                &#x2003;
            </xsl:when>
            <xsl:when test="@rend='space2'">
                &#x2003;&#x2003;
            </xsl:when>
            <xsl:when test="@rend='space3'">
                &#x2003;&#x2003;&#x2003;
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- to ord i samme linje START -->
    
    <xsl:template match="TEI:span[@rend='wordBox']">
        <span class="wordBox">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="TEI:span[@rend='wordContainer']">
        <span class="wordContainer">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="TEI:span[@rend='top']">
        <span class="top">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="TEI:span[@rend='down']">
        <span class="down">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- to ord i samme linje END -->
    
    <xsl:template match="TEI:lg[@rend='wordBox']">
        <table class="wordBox">            
            <tr valign="top">
                <td class="lgNumber">
                    <xsl:value-of select="@n"/>
                </td>
                <td class="lg">
                    <xsl:apply-templates/>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:lg[@rend='romanType']">
        <table class="schwab">            
            <tr valign="top">
                <td class="lgNumber">
                    <xsl:value-of select="@n"/>
                </td>
                <td class="lg">
                    <span class="romanType"><xsl:apply-templates/></span>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:lg">
        <table class="lg">            
            <tr valign="top">
                <td class="lgNumber">
                    <xsl:value-of select="@n"/>
                </td>
                <td class="lg">
                    <xsl:apply-templates/>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:l">
        <xsl:choose>
            <xsl:when test="@rend='blank'">
                <br/>
            </xsl:when>
            <xsl:when test="not(@rend)">
                <div class="l_noIndent">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@rend='refrain' or @rend='interRefrain' or @rend='varRefrain' and @rendition">
                <div class="l_{@rendition}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="l_{@rend}">
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:head"> 
        <xsl:choose>
            <xsl:when test="@rend and not(@rendition) and not(@xml:id)">
                <div class="head{@rend}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@rend and @rendition and not(@xml:id)">
                <div class="head{@rend}{@rendition}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@rend and @xml:id">
                <div class="head{@rend}" id="{@xml:id}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div>
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:app">
        <xsl:choose>
            <xsl:when test="@select='yes'">
                <span class="app" href="#">
                    <span class="lem">
                        <xsl:apply-templates select="TEI:lem"/>
                    </span>
                    <span class="appInvisible">
                        <xsl:text>] </xsl:text>
                        <xsl:if test="TEI:lem/@wit!='A' or @wit!='DU'">
                            <span class="wit">
                                <i>
                                    <xsl:value-of select="TEI:lem/@wit"/>
                                    <xsl:text>, </xsl:text>
                                </i>
                            </span>
                        </xsl:if>
                        <xsl:if test="TEI:lem/@wit='DU'">
                            <span class="wit">
                                <i>
                                    <xsl:value-of select="TEI:lem"/>
                                    <xsl:text>D&amp;U</xsl:text>
                                    <xsl:text>, </xsl:text>
                                </i>
                            </span>
                        </xsl:if>
                        <xsl:apply-templates select="TEI:rdg[not(@type)]"/>
                        <xsl:if test="*[@type='add' and not(@subtype)]">
                            <xsl:text> </xsl:text>
                            <!-- kursiv fjernet fra add -->
                            <xsl:apply-templates select="*[@type='add']"/>
                        </xsl:if>
                        <xsl:if test="*[@type='add' and @subtype]">
                            <xsl:text> </xsl:text>
                            <i><xsl:apply-templates select="*[@type='add' and @subtype]"/></i>
                            <xsl:text> </xsl:text>
                            <i>
                                <xsl:value-of select="TEI:note/@subtype"/>
                            </i>
                        </xsl:if>
                    </span>
                </span>
            </xsl:when>
            <xsl:when test="@select='no' or @select='disc'">
                <xsl:value-of select="TEI:rdg"/>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="TEI:rdg">
        <span class="rdg">
            <xsl:apply-templates/>
        </span>
        <span class="wit">                
            <xsl:text> </xsl:text>
            <i>
                <xsl:value-of select="@wit"/>
                <xsl:choose>
                    <xsl:when test="following-sibling::TEI:rdg[current()/@type or not(@type)]">
                        <xsl:text>, </xsl:text>
                    </xsl:when>
                    <xsl:when test="following-sibling::TEI:rdg[not(current()/@type) and @type]">
                        <xsl:text>; </xsl:text>
                    </xsl:when>
                </xsl:choose>
                <!-- kan koges ned til: 
                    <xsl:when test="following-sibling::TEI:rdg">
                    <xsl:text>; </xsl:text>
                    </xsl:when>
                -->
            </i>
        </span>
    </xsl:template>
    
    <!-- footnote STRAT -->
    
    <xsl:template match="TEI:note[@type='footnote']">
        <xsl:variable name="id">
            <xsl:number count="TEI:note[@type='footnote']" level="any" from="TEI:body"/>
        </xsl:variable>
        <a id="retur{$id}" href="#note{$id}" class="footnote">
            <xsl:value-of select="$id"/>
        </a>
    </xsl:template>
    
    <xsl:template match="TEI:note[@type='footnote']" mode="foot">
        <xsl:variable name="id">
            <xsl:number count="TEI:note[@type='footnote']" level="any" from="TEI:body"/>
        </xsl:variable>
        <a id="note{$id}" href="#retur{$id}" class="footnote">
            <xsl:value-of select="$id"/>
        </a>               
        <div class="footnote">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template name="footnote">
        <xsl:choose>
            <xsl:when test="*[local-name()!='div']//TEI:note[@type='footnote' and @rendition]">
                <xsl:apply-templates select="*[local-name()!='div']//TEI:note[@type='footnote']" mode="foot"/>
            </xsl:when>
            <xsl:when test="*[local-name()!='div']//TEI:note[@type='footnote' and not(@rendition)]">
                <hr class="footLine"/>
                <xsl:apply-templates select="*[local-name()!='div']//TEI:note[@type='footnote']" mode="foot"/>
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
    <!--xsl:template name="footnote">
        <xsl:if test="*[local-name()!='div']//TEI:note[@type='footnote']">
            <hr class="footLine"/>
            <xsl:apply-templates select="*[local-name()!='div']//TEI:note[@type='footnote']" mode="foot"/>
        </xsl:if>
    </xsl:template-->
    
    <!--xsl:template match="TEI:body[@type='TS']//TEI:div"/-->
    
    <xsl:template match="TEI:body[not(@xml:id)]//TEI:div"> <!--Allow div in div, KK 2014-03-19-->
        <div class="chapter">
            <xsl:if test="@type">   
                <xsl:attribute name="name">
                    <xsl:for-each select="ancestor::TEI:div">
                        <xsl:text> &#x2003;</xsl:text>
                    </xsl:for-each>
                    <xsl:value-of select="@type"/>
                </xsl:attribute> 
            </xsl:if>
            <div>
                <xsl:if test="//TEI:note[@type='marginNote']">
                    <xsl:attribute name="class">mainColumn</xsl:attribute>
                </xsl:if>
                <!-- otherwise superfluous div -->
                <xsl:apply-templates select="node()[local-name()!='div']"/>
                <xsl:call-template name="footnote"/>
            </div>
        </div>
        <xsl:apply-templates select="TEI:div"/>
    </xsl:template>
    
    <xsl:template match="TEI:note[@type='marginNote']">
        <div class="marginNote">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!--

    <xsl:template match="TEI:body//TEI:div">
        <div class="chapter">
            <xsl:if test="@type">   
                <xsl:attribute name="name">
                    <xsl:for-each select="ancestor::TEI:div">
                        <xsl:text>&#x2003;</xsl:text>
                    </xsl:for-each>
                    <xsl:value-of select="@type"/>
               </xsl:attribute> 
            </xsl:if>
            <xsl:apply-templates select="node()[local-name()!='div']"/>
            <xsl:call-template name="footnote"/>
        </div>
        <xsl:apply-templates select="TEI:div"/>
    </xsl:template>
    
    -->
    
    <!-- footnote template fra linj 698 -->
    
    <xsl:template match="TEI:note[@type='footnote']">
        <xsl:variable name="id">
            <xsl:number count="TEI:note[@type='footnote']" level="any" from="TEI:text"/>
        </xsl:variable>
        <a id="retur{$id}" href="#note{$id}" class="footMarker">
            <span>
                <xsl:value-of select="$id"/>
            </span>
        </a>
    </xsl:template>
    
    <xsl:template match="TEI:note[@type='footnote']" mode="foot">
        <xsl:variable name="id">
            <xsl:number count="TEI:note[@type='footnote']" level="any" from="TEI:text"/>
        </xsl:variable>
        <a id="note{$id}" href="#retur{$id}" class="footMarker">
            <span>
                <xsl:value-of select="$id"/>
            </span>
        </a>
        <span class="footnote">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <!-- <xsl:call-template name="footnote"/> -->
    
    <xsl:template match="TEI:div[@type='bibleVerse' or @type='motto' or @type='preFace']">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
        <xsl:call-template name="footnote"/>
    </xsl:template>
    
    <!-- footnote END -->
    
    <!--xsl:template match="TEI:hi">
        <span class="{@rend}">
            <xsl:apply-templates/>
        </span>
    </xsl:template-->
    
    <xsl:template match="TEI:front//TEI:hi[@rend]">
        <span class="{@rend}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="//TEI:body[@rendition='schwab']//TEI:hi">
        <xsl:choose>
            <xsl:when test="@rend='schwab'">
                <span class="italic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='spaced'">
                <span class="bold">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='italic'">
                <span class="bold">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="{@rend}">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//TEI:body[@rendition='size1']//TEI:hi">
        <xsl:choose>
            <xsl:when test="@rend='size1'">
                <span class="italic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='spaced'">
                <span class="bold">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='italic'">
                <span class="bold">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="{@rend}">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//TEI:body[not(@rendition)]//TEI:hi">
        <span class="{@rend}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="TEI:seg[@type and @n and @type!='comStart' and @type!='comEnd']">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='com']">
                <span class="seg">
                    <xsl:attribute name="id">
                        <xsl:value-of select="replace(base-uri(), '.*?([0-9].*)_txt.xml$', '$1')" />
                        <xsl:text>_</xsl:text>
                        <xsl:value-of select="@n"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </span>                
            </xsl:when>
            <xsl:otherwise>
                <span class="noSeg">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:seg[@type='comStart' and @n]">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='com']">
                <span class="segStart">
                    <xsl:attribute name="id">
                        <xsl:value-of select="replace(base-uri(), '.*?([0-9].*)_txt.xml$', '$1')" />
                        <xsl:text>_</xsl:text>
                        <xsl:value-of select="@n"/>
                    </xsl:attribute>
                    &#x25BA;
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="noSeg">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:seg[@type='comEnd' and @n]">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='com']">
                <span class="segEnd">
                    <xsl:attribute name="id">
                        <xsl:value-of select="replace(base-uri(), '.*?([0-9].*)_txt.xml$', '$1')" />
                        <xsl:text>_</xsl:text>
                        <xsl:value-of select="@n"/>
                    </xsl:attribute>                                        
                    &#x25C4;
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="noSeg">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:p[not(contains(@rend, 'space')) and not(@rend='hangingIndent')]">      
        <div class="{@rend}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:p[@rend='hangingIndentPro' and not(@n)]">        
        <div class="hangingIndentPro">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:p[@rend='hangingIndentPro' and @n]">
        <table class="proverb">            
            <tr valign="top">
                <td class="proverbNo">
                    <xsl:value-of select="@n"/>
                </td>
                <td class="proverb">
                    <xsl:apply-templates/>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:p[(contains(@rend, 'space'))]">
        <div class="{@rend}">
            <xsl:apply-templates/>
        </div>
        <!--xsl:choose>
            <xsl:when test="@rend='center spaceOne'">
                <div class="centerSpaceOne">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@rend='center spaceTwo'">
                <div class="centerSpaceOne">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
        </xsl:choose-->
    </xsl:template>

    <xsl:template match="TEI:pb[@type='text' and not(@rend='supp')]"> 
        <span onclick="showhidePb('{generate-id()}')" style="cursor:pointer" title="A">|</span>
        <span id="{generate-id()}" class="appInvisible">
            <a href="{@facs}" class="app" title="fax" id="{@facs}">
                <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>
            </a>
        </span>
    </xsl:template>
    
    <xsl:template match="TEI:pb[@type='text' and @rend='supp']">
            <span onclick="showhidePb('{generate-id()}')" style="cursor:pointer" title="A">|</span>
            <span id="{generate-id()}" class="appInvisible">
                <a href="{@facs}" class="app" title="fax" id="{@facs}">
                    <xsl:text>[</xsl:text>
                    <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>
                    <xsl:text>]</xsl:text>
                </a>
            </span>
    </xsl:template>
    
    <xsl:template match="TEI:pb[@type='edition']">
        <span onclick="showhidePb('{generate-id()}')" style="cursor:pointer" title="{@ed}">|</span>
        <span id="{generate-id()}" class="appInvisible">
            <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>
        </span>
    </xsl:template>

    <xsl:template match="TEI:pb[@type='text' and not(@rend='supp') and not(parent::TEI:seg)]"> 
        <a hrel="{@facs}" class="app faksimile_viewer" style="cursor:pointer">
            <span class="pb{@ed}">
            <xsl:text>|</xsl:text>
                <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>
            </span>
        </a>        
    </xsl:template>
    
    <xsl:template match="TEI:pb[@type='text' and @rend='supp']">
        <a hrel="{@facs}" class="app faksimile_viewer" style="cursor:pointer">
            <span class="pb{@ed}">
            <xsl:text>|</xsl:text>
                [<xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>]
            </span>
        </a>  
    </xsl:template>
    
    <xsl:template match="TEI:pb[@type='edition']">
        <span class="pb{@ed}">
            <xsl:text>|</xsl:text>
            <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>
        </span>
    </xsl:template>
    
    <xsl:template match="TEI:pb[@type='epiText']">
        <span class="pb{@ed}">
            <a class="pdf"
                href="img/{@facs}"
                onclick="return blank('epi',this.href)">                
                <xsl:text>|</xsl:text>
                <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>                
            </a>
        </span>       
    </xsl:template>
        
    <!--xsl:template match="TEI:seg/TEI:pb">
            <span class="size">
                <xsl:text>|</xsl:text>
                <xsl:value-of select="@ed"/>:<xsl:value-of select="@n"/>
            </span>
    </xsl:template-->
    
    <xsl:template name="delimiterComma">
        <xsl:text>, </xsl:text>
    </xsl:template>
    
    <xsl:template name="delimiterFullStop">
        <xsl:text>.</xsl:text>
    </xsl:template>
        
    <xsl:template match="TEI:persName">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noPersName']">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <a class="persName" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:rs[@type='bible' and not(@subtype)]">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noBible']">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='normForm'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='allusion'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=allusion til {@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='reference'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. {@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='eg'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. fx {@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='quote'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='allusion1787'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=allusion til {@key} (1787)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='reference1787'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. {@key} (1787)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='eg1787'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. fx {@key} (1787)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='quote1787'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key} (1787)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>            
            <xsl:when test="@rend='referenceSeptuaginta'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key} (Septuaginta)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='quoteSeptuaginta'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key} (Septuaginta)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='normFormSeptuaginta'">
                <a class="bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key} (Septuaginta)">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>            
        </xsl:choose>
    </xsl:template>
    
    <!-- bibleStart and bibleEnd START -->
    
    <xsl:template match="TEI:rs[@type='bible' and @subtype='bibleStart']">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noBible']">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='normForm'">                
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key}">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='allusion'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=allusion til {@key}">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='reference'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. {@key}">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='eg'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. fx {@key}">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='quote'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key}">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='allusion1787'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=allusion til {@key} (1787)">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='reference1787'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. {@key} (1787)">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='eg1787'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. fx {@key} (1787)">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@rend='quote1787'">
                <a class="bibleStart rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key} (1787)">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:rs[@type='bible' and @subtype='bibleEnd']">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noBible']">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='normForm'">                
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key}">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='allusion'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=allusion til {@key}">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='reference'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. {@key}">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='eg'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. fx {@key}">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='quote'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key}">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='allusion1787'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=allusion til {@key} (1787)">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='reference1787'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. {@key} (1787)">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='eg1787'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content=jf. fx {@key} (1787)">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
            <xsl:when test="@rend='quote1787'">
                <a class="bibleEnd rs_bible" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}?content={@key} (1787)">
                    <xsl:apply-templates/>
                    &#x25C4;
                </a>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- bibleStart and bibleEnd END -->
    
    <xsl:template match="TEI:placeName">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noPlaceName']">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <a class="placeName" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:rs[@type='myth' or @type='mythStart' or @type='mythEnd']">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noMyth']">
                <span class="noMyth">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@type='mythStart'">
                <a class="mythStart rs_myth" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}">
                    &#x25BA;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:when test="@type='mythEnd'">
                <a class="mythEnd rs_myth" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}">
                    &#x25C4;
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="rs_myth">
                    <a class="myth rs_myth" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}">
                        <xsl:apply-templates/>
                    </a>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:rs[@type='title']">
        <xsl:choose>
            <xsl:when test="//TEI:notesStmt/TEI:note[@type='noTitle']">
                <span>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <a class="titleRef" href="ajax/getReference/{@key}" rel="ajax/getReference/{@key}">
                    <xsl:apply-templates/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- table START -->
    
    <xsl:template match="TEI:table[@type='cast']">        
        <table class="cast">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <!-- table index START -->
    
    <xsl:template match="TEI:table[@type='index']">
        <table class="index">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='index']/TEI:row">
        <xsl:choose>
            <xsl:when test="//TEI:row[@rend]">
                <tr class="{@rend}">
                    <xsl:apply-templates/>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <tr class="index">
                    <xsl:apply-templates/>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='index']//TEI:p">
        <xsl:choose>
            <xsl:when test="//TEI:p[@rend]">
                <div class="{@rend}Index">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- index21 START -->
    
    <xsl:template match="TEI:table[@type='index' and @rendition='21']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="index21" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="index22" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='index' and @rendition='21']/TEI:row/TEI:cell">
        <xsl:variable name="chp-id">
            <xsl:for-each select="//TEI:div[TEI:head[@xml:id=current()/../@corresp]]"> <!-- should be 1 at most -->
                <xsl:number level="any"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="index21" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="index21" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="index21{@rend}">
                    <a class="index" onclick="currentChapter={$chp-id+count(//TEI:front[@rend])};gotoChapter(currentTextId,currentChapter)">                        
                        <!-- title="Kap.nr.{$chp-id}+{count(//TEI:front[@rend])}"-->
                        <xsl:apply-templates/>
                    </a>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- index21 END -->
    
    <!-- index32 START -->
    
    <xsl:template match="TEI:table[@type='index' and @rendition='32']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="index32" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="index32" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='index' and @rendition='32']/TEI:row/TEI:cell">
        <xsl:variable name="chp-id">
            <xsl:for-each select="//TEI:div[TEI:head[@xml:id=current()/../@corresp]]"> <!-- should be 1 at most -->
                <xsl:number level="any"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="index32" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="index32" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="index32">
                    <a class="index" onclick="currentChapter={$chp-id+count(//TEI:front[@rend])};gotoChapter(currentTextId,currentChapter)"> <!-- title="Kap.nr.{$chp-id}+{count(//TEI:front[@rend])}"-->
                        <xsl:apply-templates/>
                    </a>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- index32 END -->
    
    <!-- index33 START -->
    
    <xsl:template match="TEI:table[@type='index' and @rendition='33']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="index33" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="index33" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <!--xsl:otherwise>
                <td class="index">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise-->
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='index' and @rendition='33']/TEI:row/TEI:cell">
        <xsl:variable name="chp-id">
            <xsl:for-each select="//TEI:div[TEI:head[@xml:id=current()/../@corresp]]"> <!-- should be 1 at most -->
                <xsl:number level="any"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="index33" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="index33" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="index33">
                    <a class="index" onclick="currentChapter={$chp-id+count(//TEI:front[@rend])};gotoChapter(currentTextId,currentChapter)"> <!-- title="Kap.nr.{$chp-id}+{count(//TEI:front[@rend])}"-->
                        <xsl:apply-templates/>
                    </a>
                </td>
            </xsl:otherwise>
        </xsl:choose>
        <!--<td class="index">
            <a class="index" onclick="currentChapter={$chp-id+count(//TEI:front[@rend])};gotoChapter(currentTextId,currentChapter)"> <!-\- title="Kap.nr.{$chp-id}+{count(//TEI:front[@rend])}"-\->
                <xsl:apply-templates/>
            </a>
        </td>-->
    </xsl:template>
    
    <!-- index33 END -->
    
    <!-- table index END -->
    
    <xsl:template match="TEI:ref[@type='endNote']">
      <xsl:variable name="chp-id">
        <xsl:for-each select="//TEI:div[.//TEI:note[@type='endNote' and @n=current()/@n]]"> <!-- should be 1 at most -->
          <xsl:number level="any"/>
        </xsl:for-each>
      </xsl:variable>
      <a id="endNoteRetur{@n}" class="endNoteRef" chp="{$chp-id+count(//TEI:front[@rend])}" target="endNote{@n}" title="slutnote">
        <xsl:value-of select="@n"/>
      </a>
    </xsl:template>

    <xsl:template match="TEI:ref[@type='imgText']">
        <a  href="public/images/{@target}" onclick="return blank('txt',this.href)">
            <xsl:apply-templates/>
        </a>       
    </xsl:template>

    <xsl:template match="TEI:note[@type='endNote']">
      <xsl:variable name="chp-id">
        <xsl:for-each select="//TEI:div[.//TEI:ref[@type='endNote' and @n=current()/@n]]"> <!-- should be 1 at most -->
          <xsl:number level="any"/>
        </xsl:for-each>
      </xsl:variable>
      <a id="endNote{@n}" class="endNoteRef" chp="{$chp-id+count(//TEI:front[@rend])}" target="endNoteRetur{@n}" title="tilbage">
        <xsl:value-of select="@n"/>
      </a>
      <!--a id="endNote{@n}" class="endNote" href="#endNoteRetur{@n}" onclick="currentChapter={$chp-id+count(//TEI:front[@rend])};gotoChapter(currentTextId,currentChapter)" title="tilbage">
            <xsl:value-of select="@n"/>
        </a-->
        <div class="endNote">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='plain']/TEI:row">
        <tr class="plain">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='synopsis']">
        <table class="synopsis">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='synopsis']/TEI:row">
        <tr class="synopsis">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='synopsis']/TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="synopsis" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="synopsis" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="synopsis">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='subscription']/TEI:row">
        <tr class="subscription">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='synopsis']/TEI:row">
        <tr class="synopsis">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='subscription']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="subscription" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="subscription" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="subscription">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='synopsis']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="synopsis" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="synopsis" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="synopsis">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- table END -->
    
    <!-- skilletegn START -->
      
    
    <xsl:template match="TEI:fw">
        <xsl:choose>
            <xsl:when test="@type='blank'">
                <br/>
            </xsl:when>
            <xsl:when test="@type='asterisk'">
                <div class="asterisk">
                    <xsl:text>&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@type='asterisk2'">
                <div class="asterisk3">
                    <xsl:text>&#x002A;&#x2003;&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@type='asterisk3'">
                <div class="asterisk3">
                    <xsl:text>&#x002A;</xsl:text>
                    <br/>
                    <xsl:text>&#x002A;&#x2003;&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@type='longLine'">
                <div class="longLine">
                    <hr align="center" width="16%"/>
                </div>
            </xsl:when>
            <xsl:when test="@type='shortLine'">
                <div class="shortLine">
                    <hr align="center" width="8%"/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:graphic">
        <xsl:choose>
            <xsl:when test="@style='blank'">
                <br/>
                <br/>
            </xsl:when>
            <xsl:when test="@style='asterisk'">
                <div class="asterisk">
                    <xsl:text>&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@style='asterisk2'">
                <div class="asterisk3">
                    <xsl:text>&#x002A;&#x2003;&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@style='asterisk3'">
                <div class="asterisk3">
                    <xsl:text>&#x002A;</xsl:text>
                    <br/>
                    <xsl:text>&#x002A;&#x2003;&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@style='asteriskUp'">
                <div class="asteriskUp">
                    <xsl:text>&#x002A;</xsl:text>
                    <br/>
                    <xsl:text>&#x002A;&#x2003;&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@style='asteriskDown'">
                <div class="asteriskDown">
                    <xsl:text>&#x002A;&#x2003;&#x002A;</xsl:text>
                    <br/>
                    <xsl:text>&#x002A;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@style='cross'">
                <div class="cross">
                    <xsl:text>&#x271D;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@style='longLine'">
                <div class="longLine">
                    <hr align="center" width="16%"/>
                </div>
            </xsl:when>
            <xsl:when test="@style='shortLine'">
                <div class="shortLine">
                    <hr align="center" width="8%"/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- skilletegn END -->
    
    <!-- illustationer START -->
    
    <xsl:template match="TEI:figure">
        <xsl:choose>
            <xsl:when test="@type='imageMyth'">
                <div class="imageMyth">
                    <div class="imageMythHead">
                        <xsl:apply-templates select="TEI:head"/>
                    </div>
                    <div>
                        <img src="img/{TEI:graphic/@url}" width="100%" alt="Sorry!"/>
                    </div>
                    <div class="imageMythFigDisc">
                        <xsl:apply-templates select="TEI:figDesc"/>
                    </div>
                </div>
            </xsl:when>
            <xsl:when test="@type='longLine'">
                <hr align="center" width="40%"/>
            </xsl:when>
            <xsl:when test="@type='shortLine'">
                <hr align="center" width="25%"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>    
    
    <xsl:template match="TEI:figure/TEI:head">
        <div class="image_head">
            <xsl:value-of select="text()"/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:figure/TEI:figDesc">
        <div class="image_desc">
            <xsl:value-of select="text()"/>
        </div>
    </xsl:template>

    <xsl:template match="TEI:figure/TEI:graphic">
        <img class="imageMyth" src="img/{@url}"/>
    </xsl:template>
    
    <!-- illustrationer END -->
    
    <!-- drama START -->
    
    <xsl:template match="TEI:note[@type='drama']">
        <xsl:choose>
            <xsl:when test="@rendition='set' and @rend">
                <div class="{@rendition}_{@rend}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='cast']/TEI:row">
        <tr class="hat">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='cast']/TEI:head">
        <div class="cast">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:table[@type='cast']/TEI:row/TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="{@rend}" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="{@rend}" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="{@rend}">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:span">
        <xsl:choose>
            <xsl:when test="@rend='2rows'">
                <span style="font-size:300%">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- drama END -->
    
    <!-- back START -->
    
    <xsl:template match="TEI:body[@style='romanType']">
        <div style="font-family: sans-serif">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="TEI:back//TEI:div"> <!-- div i div i back, KSR 2014.06.12 -->
        <div class="chapter">
            <xsl:if test="@type">   
                <xsl:attribute name="name">
                    <xsl:for-each select="ancestor::TEI:div">
                        <xsl:text>&#x2003;</xsl:text>
                    </xsl:for-each>
                    <xsl:value-of select="@type"/>
               </xsl:attribute> 
            </xsl:if>
            <xsl:apply-templates select="node()[local-name()!='div']"/>
            <xsl:call-template name="footnote"/>
        </div>
        <xsl:apply-templates select="TEI:div"/>
    </xsl:template>
    
    <!-- tabel corrigenda START -->
    
    <xsl:template match="TEI:table[@xml:id='corrigenda']">
        <table class="corrigenda">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:table[@xml:id='corrigenda']/TEI:row">
        <xsl:choose>
            <xsl:when test="//TEI:row">
                <tr class="corrigenda">
                    <xsl:apply-templates/>
                </tr>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="TEI:table[@xml:id='corrigenda']/TEI:row/TEI:cell/TEI:hi">
        <span class="{@rend}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- corrigenda33 START -->
    
    <xsl:template match="TEI:table[@xml:id='corrigenda' and @rendition='33']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="corrigenda33" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="corrigenda33" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="corrigenda33">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- corrigenda33 END -->
    
    <!-- corrigenda44 START -->
    
    <xsl:template match="TEI:table[@xml:id='corrigenda' and @rendition='44']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="corrigenda44" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="corrigenda44" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="corrigenda44">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- corrigenda44 END -->
    
    <!-- corrigenda55 START -->
    
    <xsl:template match="TEI:table[@xml:id='corrigenda' and @rendition='55']//TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="corrigenda55" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="corrigenda55" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="corrigenda55">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- corrigenda55 END -->
    
    <!-- tabel corrigenda END -->
    
    <!--xsl:template match="TEI:table">        
        <table class="{@xml:id}">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="TEI:table[@xml:id='corrigenda']/TEI:row">
        <tr class="corrigenda">
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="TEI:table[@xml:id='corrigenda']/TEI:row/TEI:cell">
        <xsl:choose>
            <xsl:when test="@rows">
                <td class="{@rend}" rowspan="{@rows}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:when test="@cols">
                <td class="{@rend}" colspan="{@cols}">
                    <xsl:apply-templates/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td class="corrigenda">
                    <xsl:apply-templates/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template-->
    
    <!-- back END -->
    
    <!-- list START -->
    
    <xsl:template match="TEI:list">
        <xsl:choose>
            <xsl:when test="@type='decimal'">
                <ul>
                    <xsl:for-each select="TEI:item">
                        <li class="decimal">
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:when test="@type='ordered'">
                <ul>
                    <xsl:for-each select="TEI:item">
                        <li class="ordered">
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:when test="@type='simple'">
                <ul>
                    <xsl:for-each select="TEI:item">
                        <li class="simple">
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:when test="@type='lowerAlpha'">
                <ul>
                    <xsl:for-each select="TEI:item">
                        <li class="lowerAlpha">
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:when test="@type='noDot'">
                <ul>
                    <xsl:for-each select="TEI:item">
                        <li class="noDot">
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- list END -->

</xsl:stylesheet>