<!-- Extract journal edition from eZISS -->
<!-- Insert header from this script -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h tei eltec">

  <xsl:output indent="yes"/>
  <xsl:strip-space elements="tei:*"/>

  <xsl:variable name="today">2020-02-18</xsl:variable>
  <xsl:variable name="id">SLV30001</xsl:variable>

  <xsl:template match="/">
    <xsl:processing-instruction name="xml-model">
      href="../../Schemas/eltec-1.rng" type="application/xml"
            schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
    <xsl:text>&#10;</xsl:text>
    <xsl:processing-instruction name="xml-model">
      href="../../Schemas/eltec-1.rng" type="application/xml"
            schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
      <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:TEI">
    <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="sl" xml:id="{$id}">
      <xsl:variable name="pass1">
	<xsl:apply-templates/>
      </xsl:variable>
      <xsl:apply-templates mode="pass2" select="$pass1"/>
    </TEI>
  </xsl:template>
  
  <xsl:template match="tei:teiHeader">
    <teiHeader>
      <fileDesc>
        <titleStmt>
          <title>S poti : edicija ELTeC</title>
            <author ref="viaf:51848354">Cankar, Izidor (1886-1958)</author>
            <respStmt>
               <resp>Pretvorba zapisa eZISS v ELTeC.</resp>
               <resp xml:lang="en">Conversion from eZISS TEI to ELTeC encoding.</resp>
               <name>Tomaž Erjavec</name>
            </respStmt>
            <respStmt>
               <resp>Izbira romanov in dodajanje metapodatkov ELTeC.</resp>
               <resp xml:lang="en">Novel selection and ELTeC metadata.</resp>
               <name>Marko Juvan</name>
               <name>Miran Hladnik</name>
               <name>Katja Mihurko Poniž</name>
            </respStmt>
            <respStmt>
               <resp>Uredila digitalno izdajo eZISS.</resp>
               <resp xml:lang="en">Edited source eZISS digital edition.</resp>
               <name>Matija Ogrin</name>
               <name>Luka Vidmar</name>
            </respStmt>
         </titleStmt>
         <extent>
            <measure unit="words">27044</measure>
         </extent>
         <publicationStmt xml:lang="en">
            <publisher ref="https://distant-reading.net">COST Action "Distant Reading for European Literary History" (CA16204)</publisher>
            <distributor ref="https://github.com/COST-ELTeC/ELTeC-slv">GitHub</distributor>
            <date>
	      <xsl:value-of select="$today"/>
	    </date>
            <availability>
               <licence target="https://creativecommons.org/licenses/by/4.0/"/>
            </availability>
         </publicationStmt>
         <sourceDesc>
            <bibl type="digitalSource">
               <title>Izidor Cankar. S poti : edicija eZISS</title>
               <idno type="wikilink">nl.ijs.si/e-zrc/izidor/</idno>
               <date>2007</date>
            </bibl>
            <bibl type="printSource">
               <author ref="https://sl.wikipedia.org/wiki/Izidor_Cankar">Izidor Cankar</author>
               <title>S poti</title>
               <date>1913</date>
            </bibl>
         </sourceDesc>
      </fileDesc>
      <encodingDesc n="eltec-1">
         <p xml:lang="en">This ELTeC edition was automatically converted from the <ref target="http://nl.ijs.si/e-zrc/izidor/">eZISS digital edition</ref>, and several pieces of ELTeC-specific metadata were added. In particular, the source TEI was first downloaded, ELTeC-specific metadata was added and the encoding simplified via an XSLT stylesheet. It should be noted that the source eZISS edition contains the texts of both the original edition from 1913 as well as the revised edition from 1919. This ElTeC edition retains only the 1913 edition text.</p>
      </encodingDesc>
      <profileDesc>
         <langUsage>
            <language xml:lang="en" ident="sl">Slovenian</language>
         </langUsage>
         <textDesc xmlns:eltec="http://distantreading.net/eltec/ns">
            <eltec:authorGender key="M"/>
            <eltec:size key="short"/>
            <eltec:canonicity key="high"/>
            <eltec:timeSlot key="T4"/>
         </textDesc>
      </profileDesc>
      <revisionDesc xml:lang="en">
         <change when="{$today}">Tomaž Erjavec: converted to ELTeC</change>
      </revisionDesc>
   </teiHeader>
  </xsl:template>
  
  <xsl:template match="tei:text">
    <xsl:copy>
      <xsl:apply-templates select="tei:body"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tei:body">
    <xsl:copy>
      <xsl:apply-templates select=".//tei:div[@type='section']"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="tei:div">
    <div type="chapter">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
    
  <xsl:template match="tei:app">
    <xsl:apply-templates select="tei:rdg[@wit='DS']"/>
  </xsl:template>
  <xsl:template match="tei:rdg">
    <xsl:apply-templates/>
  </xsl:template>
    
  <xsl:template match="tei:head">
    <xsl:variable name="text">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:if test="normalize-space($text)">
      <xsl:copy>
	<xsl:value-of select="normalize-space($text)"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
    
  <!-- cf. https://github.com/distantreading/WG1/wiki/textFeatures
       But note that Wiki sources most likely wont have <l>s marked up
  -->
  <xsl:template match="tei:p | tei:lg">
    <xsl:variable name="text">
      <xsl:apply-templates/>
    </xsl:variable>
    <!-- Don't output empty paragraphs -->
    <xsl:if test="normalize-space($text)">
      <p>
	<xsl:choose>
	  <xsl:when test="tei:l">
	    <xsl:apply-templates/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="normalize-space($text)"/>
	  </xsl:otherwise>
	</xsl:choose>
      </p>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="tei:l">
    <l>
      <xsl:apply-templates/>
    </l>
  </xsl:template>

  <!-- Only one label, and this is it, follow French example: -->
  <xsl:template match="tei:label">
    <milestone type="subChapter" rend="asteriskes" unit="asterisk"/>
  </xsl:template>

  <!-- Notes are editorial -->
  <xsl:template match="tei:note"/>

  <xsl:template match="tei:lb | tei:ptr"/>
  
  <!-- Ignore rendering -->
  <xsl:template match="tei:emph">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Copy everything else -->
  <xsl:template match="*">
    <xsl:if test="ancestor::tei:body">
      <xsl:message>WARN: strange <xsl:value-of select="name()"/>: <xsl:value-of select="."/></xsl:message>
    </xsl:if>
    <xsl:copy>
      <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="@* | processing-instruction()">
    <xsl:copy/>
  </xsl:template>
    
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template mode="pass2" match="tei:text">
    <xsl:copy>
      <xsl:attribute name="n" select="$id"/>
      <xsl:apply-templates mode="pass2"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- We have a funny (last) section which we merge into previous one -->
  <xsl:template mode="pass2" match="tei:div[tei:head='***']"/>
  <xsl:template mode="pass2" match="tei:head[.='***']">
    <milestone type="subChapter" rend="asteriskes" unit="asterisk"/>
  </xsl:template>
  <xsl:template mode="pass2" match="tei:div[following-sibling::tei:div[1][tei:head='***']]">
    <xsl:copy>
      <xsl:attribute name="type">chapter</xsl:attribute>
      <xsl:apply-templates mode="pass2"/>
      <xsl:apply-templates mode="pass2" select="following-sibling::tei:div[1]/tei:*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="pass2" match="tei:body//tei:p">
    <xsl:choose>
      <xsl:when test="normalize-space(.)='*'">
	<milestone type="subChapter" rend="asterisk" unit="asterisk"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:copy>
	  <xsl:attribute name="n">
	    <xsl:value-of select="$id"/>
	    <xsl:text>.</xsl:text>
	    <xsl:number level="any" from="tei:text"/>
	  </xsl:attribute>
	  <xsl:apply-templates mode="pass2"/>
	</xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template mode="pass2" match="*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates mode="pass2"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template mode="pass2" match="text()">
    <xsl:value-of select="."/>
  </xsl:template>

</xsl:stylesheet>
