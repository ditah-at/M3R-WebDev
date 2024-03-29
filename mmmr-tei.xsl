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
                            <xsl:value-of select="//tei:teiHeader//tei:title"/>
                        </h1>
                        <h2>Manuscript Description</h2>
                        <div>   
                            <xsl:value-of select="//tei:sourceDesc"/>
                        </div>
                        <div>
                            <ul>
                            <xsl:for-each select="//tei:additional/tei:surrogates/tei:bibl">
                                <li>
                                <a href="{tei:ref/@target}"><xsl:value-of select="tei:title"/></a>
                                </li>
                            </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
        </article>
    </xsl:template>
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <xsl:template name="nav_sub">
        <!-- Navigationsleiste -->
        <div class="stick headerbox panel" style="margin-bottom:0px;margin-top:0px;z-index:1">
            <xsl:value-of select="/"/>
        </div>
    </xsl:template>
    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
</xsl:stylesheet>
