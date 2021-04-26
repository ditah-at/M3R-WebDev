<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns:mets="http://www.loc.gov/METS/"
    exclude-result-prefixes="#all" version="2.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <!--  Parameter  -->
    <xsl:param name="locale"/>
    <xsl:param name="mode"/>
    <xsl:param name="context"/>
    <!--  Variable CID  -->
    <xsl:variable name="cid">
        <!--
 das ist der pid des contextes, kommt aus dem sparql (ggfs. query anpassen) - wenn keine objekte zugeordnet sind, gibt es ihn nicht! 
-->
        <xsl:value-of select="/s:sparql/s:results/s:result[1]/s:cid"/>
    </xsl:variable>
    <!--  Variablen Suchergebnisse  -->
    <xsl:variable name="query" select="sparql/head/query"/>
    <xsl:variable name="hitTotal" select="/sparql/head/hitTotal"/>
    <xsl:variable name="hitPageStart" select="/sparql/head/hitPageStart"/>
    <xsl:variable name="hitPageSize" select="/sparql/head/hitPageSize"/>
    <xsl:variable name="hitsFrom" select="sparql/navigation/hits/from"/>
    <xsl:variable name="hitsTo" select="sparql/navigation/hits/to"/>
    <!--
 Variablen ZIM, GAMS, Uni Graz, DeGruyter, Franz-Nabl-Institut 
-->
    <xsl:variable name="zim-acdh"> Zentrum für Informationsmodellierung – Austrian Centre for
        Digital Humanities </xsl:variable>
    <xsl:variable name="gams">Geisteswissenschaftliches Asset Management System</xsl:variable>
    <xsl:variable name="uni_graz">Universität Graz</xsl:variable>
    <xsl:variable name="de_gruyter">De Gruyter</xsl:variable>
    <xsl:variable name="franz_nabl_institut">Franz-Nabl-Institut für
        Literaturforschung</xsl:variable>
    <!--  Variablen Projekt  -->
    <xsl:variable name="server"/>
    <xsl:variable name="gamsdev">http://glossa.uni-graz.at/gamsdev/clausen/</xsl:variable>
    <xsl:variable name="projectTitle">
        <xsl:text>M3R</xsl:text>
    </xsl:variable>
    <xsl:variable name="subTitle">
        <xsl:text>Multimodal Manuscript Representation</xsl:text>
    </xsl:variable>
    <!--  Variable jquery js -->
    <xsl:variable name="jquery_js">
        <xsl:value-of select="'/lib/1.0/jquery-1.11.3.min.js'"/>
    </xsl:variable>
    <!--  Variable bootstrap js -->
    <xsl:variable name="bootstrap_js">
        <xsl:value-of select="'/lib/1.0/bootstrap-3.3.5/js/bootstrap.min.js'"/>
    </xsl:variable>
    <!--  Variable mmmr js -->
    <xsl:variable name="mmmr_js">
        <xsl:value-of select="concat($gamsdev, 'gams-www/js/mmmr.js')"/>
    </xsl:variable>
    <!--  Variable bootstrap css  -->
    <xsl:variable name="bootstrap_css">
        <xsl:value-of select="'/lib/1.0/bootstrap-3.3.5/css/bootstrap.min.css'"/>
    </xsl:variable>
    <!--  Variable mmmr css  -->
    <xsl:variable name="mmmr_css">
        <xsl:value-of select="concat($gamsdev, 'mmmr/css/mmmr.css')"/>
    </xsl:variable>
    <!--  Variable mmmr-nav css  -->
    <xsl:variable name="mmmr_nav_css">
        <xsl:value-of select="concat($gamsdev, 'gams-www/css/mmmr-nav.css')"/>
    </xsl:variable>
    <!--  Variable sticky-kit js  -->
    <xsl:variable name="sticky_kit_js">
        <xsl:value-of select="concat($gamsdev, 'gams-www/js/jquery.sticky-kit.min.js')"/>
    </xsl:variable>
    <!--  Variable jquery.scrollspy js  -->
    <xsl:variable name="scrollspy_js">
        <xsl:value-of select="concat($gamsdev, 'gams-www/js/jquery.scrollspy.js')"/>
    </xsl:variable>
    <!--  Template head -->
    <xsl:template name="head">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <!--
 The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags 
-->
            <meta name="keywords" content="MSI, Spectroscopy, Manuscript"/>
            <meta name="description" content="Multimodal Manusrcipt Representation"/>
            <meta name="publisher"
                content="Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities"/>
            <meta name="content-language" content="en"/>
            <!--  Projekttitel  -->
            <title>
                <xsl:value-of select="$projectTitle"/>
            </title>
            <!--  Einbindung jquery js  -->
            <script type="text/javascript" src="{$jquery_js}">
<xsl:text/>
</script>
            <!--  Einbindung bootstrap js  -->
            <script type="text/javascript" src="{$bootstrap_js}">
<xsl:text/>
</script>
            <!--
 Einbindung ohad js 
            <script type="text/javascript" src="{$ohad_js}"><xsl:text> </xsl:text></script> 
-->
            <!--  Einbindung mmmr js  -->
            <script type="text/javascript" src="{$mmmr_js}">
<xsl:text/>
</script>
            <!--  Einbindung sticky-kit js  -->
            <script type="text/javascript" src="{$sticky_kit_js}">
<xsl:text/>
</script>
            <!--  Einbindung matchHeight js  -->
            <script type="text/javascript" src="/lib/1.0/plugins/matchHeight/jquery.matchHeight.js">
<xsl:text/>
</script>
            <script type="text/javascript" src="/lib/1.0/plugins/matchHeight/matchHeight.js">
<xsl:text/>
</script>
            <!--  Einbindung chart js  -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js">
<xsl:text/>
</script>
            <!--  Einbindung scrollspy js  -->
            <script type="text/javascript" src="{$scrollspy_js}">
<xsl:text/>
</script>
            <!--  Einbindung bootstrap css  -->
            <link href="{$bootstrap_css}" rel="stylesheet"/>
            <!--   Einbindung mmmr css  -->
            <link href="http://www.ditah.at/M3R-WebDev/mmmr.css" rel="stylesheet" type="text/css"/>
            <!--   Einbindung ohad-nav css  -->
            <link href="{$mmmr_nav_css}" rel="stylesheet" type="text/css"/>
            <!--
  Einbindung datatables css  
            <link
                href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css"
                rel="stylesheet"/>  
-->
            <!--   Einbindung chart css  -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
                rel="stylesheet"/>
        </head>
    </xsl:template>
    <!--  Template header  -->
    <xsl:template name="header">
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-11">
                        <h1>
                            <xsl:value-of select="$projectTitle"/>
                        </h1>
                        <h2>
                            <xsl:value-of select="$subTitle"/>
                        </h2>
                    </div>
                    <!--  col-lg col-md col-sm col-xs  -->
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-1">
                        <div class="unilogo">
                            <!--  TU Wien  -->
                            <a href="//www.tuwien.at" class="unilogo">
                                <img height="62" class="logoUni" style="margin-right:25px"
                                    src="{concat($gamsdev,'mmmr/img/tu.png')}" title="TU Wien"
                                    alt="{$uni_graz}"/>
                            </a>
                            <!--  KFU  -->
                            <a href="//www.uni-graz.at" class="unilogo">
                                <img height="62" class="logoUni"
                                    src="/templates/img/logo_uni_graz_4c.jpg" title="{$uni_graz}"
                                    alt="{$uni_graz}"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </xsl:template>
    <!--  Template nav -->
    <xsl:template name="nav">
        <nav class="navbar navbar-default navbar-static-top" id="nav">
            <div class="container" style="height:50">
                <!--
 Brand and toggle get grouped for better mobile display 
-->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar">
                            <xsl:text/>
                        </span>
                        <span class="icon-bar">
                            <xsl:text/>
                        </span>
                        <span class="icon-bar">
                            <xsl:text/>
                        </span>
                    </button>
                    <a class="navbar-brand hidden-lg hidden-md hidden-sm" href="#">Navigation</a>
                </div>
                <!--
 Collect the nav links, forms, and other content for toggling 
-->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <!--  Home  -->
                        <li>
                            <xsl:if
                                test="$cid = 'context:ohad' and $context != 'analog' and $context != 'digital' and $context != 'forschungsergebnisse' and $mode != 'imprint'">
                                <xsl:attribute name="class">active</xsl:attribute>
                            </xsl:if>
                            <a href="">Home</a>
                        </li>
                        <!--  Historisch-kritische Ausgabe  -->
                        <li class="dropdown">
                            <xsl:if test="$context = 'analog'">
                                <xsl:attribute name="class">dropdown active</xsl:attribute>
                            </xsl:if>
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false"> Manuscripts <span
                                    class="caret">
                                    <xsl:text/>
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <xsl:if test="$context = 'analog' and $locale = 'ueber'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/context:mmmr">All
                                        Manuscripts</a>
                                </li>
                                <li role="seperator" class="divider"/>
                                <li>
                                    <xsl:if test="$context = 'analog' and $locale = 'ueber'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/o:mmmr.k4984">K 4984</a>
                                </li>
                                <li>
                                    <xsl:if test="/mets:mets/@OBJID = 'o:k4984.1r'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/o:k4984.1r">Folio 1r</a>
                                </li>
                                <li role="seperator" class="divider"/>
                                <li>
                                    <xsl:if test="$context = 'analog' and $locale = 'ueber'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/o:mmmr.hs1">Traditionskodex
                                        HS1</a>
                                </li>
                                <li>
                                    <xsl:if test="/mets:mets/@OBJID = 'o:mmmr.hs1.50r'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/o:mmmr.hs1.50r">Folio 50r</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <xsl:if
                                test="$cid = 'context:ohad' and $context != 'analog' and $context != 'digital' and $context != 'forschungsergebnisse' and $mode != 'imprint'">
                                <xsl:attribute name="class">active</xsl:attribute>
                            </xsl:if>
                            <a href="http://glossa.uni-graz.at/query:mmmr.deletion">Search</a>
                        </li>
                        <li class="dropdown">
                            <xsl:if test="$context = 'analog'">
                                <xsl:attribute name="class">dropdown active</xsl:attribute>
                            </xsl:if>
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false"> SKOS <span class="caret">
                                    <xsl:text/>
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <xsl:if test="$context = 'analog' and $locale = 'ueber'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/o:mmmr.damage">Damage</a>
                                </li>
                                <li>
                                    <xsl:if test="/mets:mets/@OBJID = 'o:k4984.1r'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="http://glossa.uni-graz.at/o:mmmr.deletion">Deletion</a>
                                </li>
                            </ul>
                        </li>
                        <!--
 Digitale Edition
                        <li class="dropdown">
                            <xsl:if test="$context = 'digital'">
                                <xsl:attribute name="class">dropdown active</xsl:attribute>
                            </xsl:if>
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">Digitale Edition <span
                                    class="caret"><xsl:text> </xsl:text></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <xsl:if test="contains($locale, 'gww')">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a href="/context:dramen">Dramen</a>
                                </li>
                                <li role="separator" class="divider">
                                    <xsl:text> </xsl:text>
                                </li>
                                <li>
                                    <xsl:if test="contains($locale, 'gww')">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a
                                        href="/o:ohad.5405/sdef:TEI/get?context=digital&amp;locale=gww"
                                        >Geschichten aus dem Wiener Wald</a>
                                </li>
                                <li role="separator" class="divider">
                                    <xsl:text> </xsl:text>
                                </li>
                                <li>
                                    <xsl:if test="$context = 'digital' and $locale = 'ueber'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a
                                        href="/context:ohad/sdef:Context/get?locale=ueber&amp;context=digital"
                                        >Über die digitale Edition</a>
                                </li>
                                <li>
                                    <xsl:if test="$context = 'digital' and $locale = 'codierung'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a
                                        href="/context:ohad/sdef:Context/get?locale=codierung&amp;context=digital"
                                        >Codierungsrichtlinien</a>
                                </li>
                            </ul>
                        </li>  
-->
                        <!--
 Forschungspublikationen 
                        <li class="dropdown">
                            <xsl:if test="$context = 'forschungsergebnisse'">
                                <xsl:attribute name="class">dropdown active</xsl:attribute>
                            </xsl:if>
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">Forschungspublikationen
                                    <span class="caret"><xsl:text> </xsl:text></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <xsl:if
                                        test="$context = 'forschungsergebnisse' and $locale = 'hka'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a
                                        href="/context:ohad/sdef:Context/get?locale=hka&amp;context=forschungsergebnisse"
                                        >Historisch-kritische Ausgabe: Grundlagen und Maximen </a>
                                </li>
                                <li>
                                    <xsl:if
                                        test="$context = 'forschungsergebnisse' and $locale = 'einzelstudien'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a
                                        href="/context:ohad/sdef:Context/get?locale=einzelstudien&amp;context=forschungsergebnisse"
                                        >Einzelstudien</a>
                                </li>
                                <li>
                                    <xsl:if
                                        test="$context = 'forschungsergebnisse' and $locale = 'de_dramennetzwerk'">
                                        <xsl:attribute name="class">active</xsl:attribute>
                                    </xsl:if>
                                    <a
                                        href="/context:ohad/sdef:Context/get?locale=de_dramennetzwerk&amp;context=forschungsergebnisse"
                                        >Digitale Edition: Dramennetzwerkanalyse</a>
                                </li>
                            </ul>
                        </li>
-->
                    </ul>
                </div>
            </div>
        </nav>
    </xsl:template>
    <!--  Template footer  -->
    <xsl:template name="footer">
        <footer>
            <div class="container">
                <div class="row">
                    <!--  Linke Spalte  -->
                    <!--  hidden-xs  -->
                    <div class="col-md-6 quicklinks hidden-xs">
                        <h6>Quick-Links</h6>
                        <a href="http://gams.uni-graz.at" target="_blank">
                            <img class="logo " src="/templates/img/gamslogo_weiss.png"
                                title="{$gams}" alt="{$gams}"/>
                        </a>
                        <a href="//informationsmodellierung.uni-graz.at/" target="_blank">
                            <img class="logo" src="/templates/img/ZIM_weiss.png" title="{$zim-acdh}"
                                alt="{$zim-acdh}"/>
                        </a>
                        <a href="//cvl.tuwien.ac.at" target="_blank">
                            <img class="logo " style="height:30px; width: auto;"
                                src="{concat($gamsdev,'/mmmr/img/cvl.png')}" title="CVL"
                                alt="{$franz_nabl_institut}"/>
                        </a>
                        <a class="link" href="//creativecommons.org/licenses/by-nc-sa/4.0/"
                            target="_blank">
                            <img class="logol" alt="CC BY-NC-SA"
                                src="{concat($gamsdev,'/ohad/img/cc.png')}" title="CC BY-NC-SA"/>
                            <img class="logol" alt="CC BY-NC-SA"
                                src="{concat($gamsdev,'/ohad/img/by.png')}" title="CC BY-NC-SA"/>
                            <img class="logol" alt="CC BY-NC-SA"
                                src="{concat($gamsdev,'/ohad/img/nc.png')}" title="CC BY-NC-SA"/>
                            <img class="logol" alt="CC BY-NC-SA"
                                src="{concat($gamsdev,'/ohad/img/sa.png')}" title="CC BY-NC-SA"/>
                        </a>
                    </div>
                    <!--  visible-xs  -->
                    <div class="col-md-6 quicklinks visible-xs">
                        <h6>Quick-Links</h6>
                        <a href="http://gams.uni-graz.at" target="_blank">
                            <img class="logo " style="height:30px; width: auto;"
                                src="/templates/img/gamslogo_weiss.png" title="{$gams}"
                                alt="{$gams}"/>
                        </a>
                        <a href="//informationsmodellierung.uni-graz.at/" target="_blank">
                            <img class="logo" style="height:30px; width: auto;"
                                src="/templates/img/ZIM_weiss.png" title="{$zim-acdh}"
                                alt="{$zim-acdh}"/>
                        </a>
                        <a href="//cvl.tuwien.ac.at" target="_blank">
                            <img class="logo " style="height:30px; width: auto;"
                                src="{concat($gamsdev,'/mmmr/img/cvl.png')}" title="CVL" alt="CVL"/>
                        </a>
                        <!--

                        <a class="link" href="//creativecommons.org/licenses/by-nc-sa/4.0/"
                            target="_blank">
                            <img class="logol" alt="CC BY-NC-SA" style="height:30px; width: auto;"
                                src="{concat($gamsdev,'/ohad/img/cc.png')}" title="CC BY-NC-SA"/>
                            <img class="logol" alt="CC BY-NC-SA" style="height:30px; width: auto;"
                                src="{concat($gamsdev,'/ohad/img/by.png')}" title="CC BY-NC-SA"/>
                            <img class="logol" alt="CC BY-NC-SA" style="height:30px; width: auto;"
                                src="{concat($gamsdev,'/ohad/img/nc.png')}" title="CC BY-NC-SA"/>
                            <img class="logol" alt="CC BY-NC-SA" style="height:30px; width: auto;"
                                src="{concat($gamsdev,'/ohad/img/sa.png')}" title="CC BY-NC-SA"/>
                        </a>
-->
                    </div>
                    <!--  Rechte Spalte  -->
                    <div class="col-md-6">
                        <h6>Contact</h6>
                        <p>
                            <a href="" target="_blank">Gerlinde Schneider</a>
                            <br/> KFU <br/>
                            <a href="https://cvl.tuwien.ac.at/staff/simon-brenner/" target="_blank"
                                >Simon Brenner</a>
                            <br/> TU Wien <br/>
                            <a href="" target="_blank">Hans Clausen</a>
                            <br/> KFU <br/>
                            <a href="">Impressum</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </xsl:template>
</xsl:stylesheet>
