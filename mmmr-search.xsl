<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs dcterms rdf skos" version="2.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <!-- Include static.xsl -->
    <xsl:include href="http://www.ditah.at/M3R-WebDev/mmmr-static.xsl"/>
    
    <!-- View -->
    <xsl:variable name="view"
        select="substring-after(tokenize($mode, ';')[contains(., '$view')], '|')"/>
    <xsl:variable name="server2" select="'http://glossa.uni-graz.at/'"/>
    
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
                        <!-- Linke Spalte -->
                        <xsl:call-template name="column_left"/>
                        <!-- Rechte Spalte -->
                        <xsl:call-template name="column_right"/>
                    </section>
                </main>
                <!-- Footer -->
                <xsl:call-template name="footer"/>
            </body>
        </html>
        
        
    </xsl:template>
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <!-- Rechte Spalte -->
    <xsl:template name="column_right">
        <!-- Rechte Spalte -->
        <article class="col-md-4 stick hidden-xs hidden-sm">
            <!-- Template headerbox -->
            <xsl:call-template name="headerbox"/>
        </article>
    </xsl:template>
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <!-- Headerbox -->
    <xsl:template name="headerbox">
        <div class="panel panel-default"
            style="border:0; border-radius:0; padding:0;margin-top:0px;margin-bottom:0px">
            <div class="panel-header headerbox" role="tab" id="headingTwo3"
                style="padding-left:20px; padding-right:20px;padding-top:7px"> </div>
        </div>
        <!-- Accordion -->
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <!-- Auswahl -->
            <div class="panel panel-default"
                style="border:0; border-radius:0; padding:0; margin-top:0px">
                <!-- Überschrift -->
                <div class="panel-heading" role="tab" id="headingOne"
                    style="padding-left:20px;padding-right:20px;width:100%;display:table"> </div>
                
                <!-- Inhalt -->
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                    aria-labelledby="headingOne">
                    <div class="panel-body"
                        style="padding-left:20px; padding-top:10px; padding-right:20px; padding-bottom:20px"
                        > </div>
                </div>
            </div>
            <!-- Datenexport -->
            <div class="panel panel-default" style="border:0; border-radius:0; padding:0;">
                <!-- Überschrift -->
                <div class="panel-heading" role="tab" id="headingTwo" style="padding-left:20px"> </div>
                <!-- Inhalt -->
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                    aria-labelledby="headingTwo">
                    <div class="panel-body"
                        style="padding-left:20px; padding-top:10px; padding-right:20px; padding-bottom:10px;"
                        > </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <!-- Linke Spalte -->
    <xsl:template name="column_left">
        <!-- Linke Spalte -->
        <article class="col-md-8">
            <!-- Auswahl Ansicht -->
            <xsl:choose>
                <xsl:when test="$view = 'leseansicht'">
                    <!-- Textausgabe -->
                    <div class="panel text"
                        style="padding-top:50px;padding-bottom:20px; margin-top:0px;font-family:Droid Serif, Georgia, Times New Roman, Times, serif; ">
                        <!-- Template Leseansicht -->
                    </div>
                </xsl:when>
                <!-- Netzwerk -->
                <xsl:when test="$view = 'netzwerk'">
                    <div class="panel"
                        style="padding-top:50px; margin-top:0px;font-family:Droid Serif, Georgia, Times New Roman, Times, serif; ">
                        <!-- Template Netzwerk -->
                    </div>
                </xsl:when>
                <!-- Analyse -->
                <xsl:when test="$view = 'analyse'">
                    <div class="panel"
                        style="padding-top:50px;padding-bottom:20px;margin-top:0px; font-family:Droid Serif, Georgia, Times New Roman, Times, serif; ">
                        <!-- Template Analyse -->
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="panel">
                        <h1>
                           Search for:
                        </h1>

                        <!--
                        
                        Search for  Folio with:
                        
                        concat('http://gams.uni-graz.at/archive/objects/query:dic.persons/methods/sdef:Query/getXML?params=$1|%3Cinfo:fedora/o:dic.authors/%23', $context,'%3E') -->
                        
                        <!--
                        <xsl:for-each select="doc('http://glossa.uni-graz.at/archive/objects/query:deletions/methods/sdef:Query/getXML?params=$1|%3Chttp://gams.uni-graz.at/thesaurus/liquidDeletions%23 ')/s:sparql/s:results/s:result">
                            <div> <xsl:value-of select="concat($server2,substring-after(s:pid/@uri,'/'))"/>
                                <a href="{concat($server2,substring-after(s:pid/@uri,'/'))}">Objekt aufrufen</a>
                            </div>
                        </xsl:for-each>
                        -->
                        <!--
                        <xsl:for-each select="doc('http://glossa.uni-graz.at/archive/objects/query:deletions/methods/sdef:Query/getXML')/s:sparql/s:results/s:result">
                            <div> <xsl:value-of select="concat($server2,substring-after(s:pid/@uri,'/'))"/>
                                <a href="{concat($server2,substring-after(s:pid/@uri,'/'))}">Objekt aufrufen</a>
                            </div>
                        </xsl:for-each>
                        
                        
                        
                        
                        
                        <http://gams.uni-graz.at/thesaurus/liquidDeletions> 
                        -->
                        <br/>
                        <ul>
                            <li>
                        <a href="http://glossa.uni-graz.at/archive/objects/query:deletions/methods/sdef:Query/get?params=$1|&lt;http://gams.uni-graz.at/thesaurus/deletions>">Deletions</a>
                        <xsl:apply-templates select="rdf:RDF"></xsl:apply-templates>
                                <ul>
                                <li>
                                    <a href="http://glossa.uni-graz.at/archive/objects/query:deletions/methods/sdef:Query/get?params=$1|&lt;http://gams.uni-graz.at/thesaurus/liquidDeletions>">Liquid Deletions</a>
                                    <xsl:apply-templates select="rdf:RDF"></xsl:apply-templates>
                                </li>
                                </ul>
                                
                            </li>
                            
                        </ul>
                        <br/>
                        <br/>
                        <xsl:for-each select="//s:sparql/s:results/s:result">
                            <div> <xsl:value-of select="concat($server2,substring-after(s:pid/@uri,'/'))"/>
                                <a href="{concat($server2,substring-after(s:pid/@uri,'/'))}"> Objekt aufrufen</a>
                            </div>
                        </xsl:for-each>
                        
                    </div>
                    
                    
                </xsl:otherwise>
            </xsl:choose>
        </article>
    </xsl:template>
</xsl:stylesheet>
    