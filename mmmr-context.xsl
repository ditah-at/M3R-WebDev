<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns:mets="http://www.loc.gov/METS/"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:analyse="http://www.w3.org/2001/sw/DataAccess/rf1/result2" exclude-result-prefixes="#all"
    xmlns:xlink="https://www.w3.org/1999/xlink" xmlns:bibtex="http://bibtexml.sf.net/" xmlns:o="http://www.fedora.info/definitions/1/0/access/"  version="2.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <!-- Include static.xsl -->
    <xsl:include href="http://www.ditah.at/M3R-WebDev/mmmr-static.xsl"/>
    <xsl:variable name="idno" select="'http://glossa.uni-graz.at/o:k4984.1r'"/>
    <!-- Variable PID -->
    <xsl:variable name="pid" select="mets:mets/@OBJID"/>
    <xsl:param name="model"></xsl:param>
    <xsl:variable name="hostname" select="&apos;http://glossa.uni-graz.at/archive&apos;"></xsl:variable>
    
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <!-- Seitenaufbau: Head, Body (Spalten), Footer -->
    <xsl:template match="/">
        <html lang="de">
            <!-- Head -->
            <xsl:call-template name="head"/>
            <!-- Body -->
            <body style="position:relative" id="myScrollspy" data-spy="scroll">
                <!-- Template header -->
                <xsl:call-template name="header"/>
                <!-- Template nav -->
                <xsl:call-template name="nav"/>
                <!-- Spalten -->
                <main class="container" style="position:relative;height:100%;overflow-y:scroll"
                    id="myScrollspy2">
                    <section class="row">
                        <article class="col-md-10 hidden-xs hidden-sm">
                            <div class="panel">
                                <xsl:choose>
                                    <xsl:when test="$model=&apos;BibTeX&apos;">
                                        <xsl:apply-templates select="bibtex:file"></xsl:apply-templates>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="s:sparql"></xsl:apply-templates>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                        </article>
                    </section>
                </main>
                <!-- Footer -->
                <xsl:call-template name="footer"/>
            </body>
        </html>
        
        
    </xsl:template>
    <xsl:template match="s:sparql">
        <xsl:variable name="context" select="s:results/s:result/s:context"></xsl:variable>
        <html>
            <head></head>
            <body>
                <h2>
                    <xsl:value-of select="$context"></xsl:value-of>
                </h2>
                <hr size="1"></hr>
                <table border="0" cellpadding="5">
                    <xsl:for-each select="s:results/s:result">
                        <xsl:variable name="pid" select="substring-after(s:pid/@uri, &apos;/&apos;)"></xsl:variable>
                        <tr>
                            <td>
                                <img height="36px">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="$hostname"></xsl:value-of>
                                        <xsl:text>/objects/</xsl:text>
                                        <xsl:value-of select="$pid"></xsl:value-of>
                                        <xsl:text>/datastreams/THUMBNAIL/content</xsl:text>
                                    </xsl:attribute>
                                </img>
                            </td>
                            <td>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>/</xsl:text>
                                        <xsl:value-of select="$pid"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:value-of select="$pid"></xsl:value-of>
                                </a>
                            </td>
                            <td>
                                <xsl:value-of select="s:title"></xsl:value-of>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <xsl:variable name="url" select="concat($hostname,&apos;/objects/&apos;,$pid,&apos;/methods/sdef:Object/getMethods&apos;)"></xsl:variable>
                                <xsl:for-each select="document($url)//o:sDef">
                                    <xsl:call-template name="method">
                                        <xsl:with-param name="oid" select="$pid"></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="method">
        <xsl:param name="oid"></xsl:param>
        <xsl:variable name="pid" select="@pid"></xsl:variable>
        <xsl:for-each select="o:method">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="concat($hostname,&apos;/objects/&apos;,$oid,&apos;/methods/&apos;,$pid,&apos;/&apos;,@name)"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="concat($pid,&apos;/&apos;,@name)"></xsl:value-of>
            </a>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="bibtex:file">
        <p>
            <b>
                <xsl:value-of select="//bibtex:title"></xsl:value-of>
            </b>
            <br></br>
            <xsl:value-of select="//bibtex:publisher"></xsl:value-of>
        </p>
    </xsl:template>
    
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <xsl:template name="nav_sub">
        <!-- Navigationsleiste -->
        <div class="stick headerbox panel" style="margin-bottom:0px;margin-top:0px;z-index:1">
            <xsl:value-of select="/"/>
        </div>
    </xsl:template>
   </xsl:stylesheet>
