<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns:mets="http://www.loc.gov/METS/"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:analyse="http://www.w3.org/2001/sw/DataAccess/rf1/result2" exclude-result-prefixes="#all"
    xmlns:xlink="https://www.w3.org/1999/xlink" version="2.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <!-- Include static.xsl -->
    <xsl:include href="http://www.ditah.at/M3R-WebDev/mmmr-static.xsl"/>
    <xsl:variable name="idno" select="'http://glossa.uni-graz.at/o:k4984.1r'"/>
    <!-- Variable PID -->
    <xsl:variable name="pid" select="mets:mets/@OBJID"/>
    <!-- View -->
    <xsl:variable name="view"
        select="substring-after(tokenize($mode, ';')[contains(., '$view')], '|')"/>
    
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
                            <div class="pane">
                                <h1>Projekt mmmr</h1>
                            </div>
                        </article>
                    </section>
                </main>
                <!-- Footer -->
                <xsl:call-template name="footer"/>
            </body>
        </html>
        
        
    </xsl:template>
   </xsl:stylesheet>
