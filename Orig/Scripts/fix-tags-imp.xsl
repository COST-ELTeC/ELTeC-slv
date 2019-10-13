<!-- Re-tag IMP document for ELTEC -->
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
  <xsl:preserve-space elements="tei:p tei:hi"/>

  <xsl:key name="id" match="tei:surface" use="@xml:id"/>
  <xsl:param name="imp-handle">http://hdl.handle.net/11356/1031</xsl:param>
  
  <xsl:variable name="Today" select="substring-before(current-date() cast as xs:string, '+')"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&#10;&lt;?</xsl:text>
    <xsl:text>xml-model href="https://distantreading.github.io/Schema/eltec-1.rng"</xsl:text>
    <xsl:text disable-output-escaping="yes">?&gt;&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Suppress these attributes -->
  <xsl:template match="tei:text//tei:*/@xml:id"/>
  <xsl:template match="tei:title/@type"/>
  <xsl:template match="tei:note/@place"/>
  <xsl:template match="tei:note/@type"/><!-- all are authorial -->
  
  <!-- Suppress these elements -->
  <xsl:template match="tei:principal"/>
  <xsl:template match="tei:editionStmt"/>
  <xsl:template match="tei:taxonomy"/>
  <xsl:template match="tei:textClass"/>
  <xsl:template match="tei:facsimile"/>
  <xsl:template match="tei:front|tei:back"/>
  <xsl:template match="tei:lb"/>
  <xsl:template match="tei:title[@type='reg']"/>
  
  <!-- Suppress these tags -->

  <!-- Not sure if hi/emph should be suppresed, cf. unclear statements in
       https://distantreading.github.io/encoding_proposal.html
       But note that one problem with hi/emph is not addressed:
       without them <p> content is plain text (modulo empty <pb/>), which
       makes it much easier to linguistically annotate text, as you don't need
       to worry about existing annotation inside paragraphs.
  -->
  <!--xsl:template match="tei:hi | tei:emph">
    <xsl:apply-templates/>
  </xsl:template-->
  <!-- Seems <l> is to be left intact, cf.
       https://github.com/distantreading/WG1/wiki/textFeatures
  -->
  <!--xsl:template match="tei:l">
    <xsl:apply-templates/>
  </xsl:template-->

  <!-- Change these elements -->

  <!-- teiHeader -->

  <xsl:template match="tei:titleStmt/tei:title">
    <title>
      <xsl:value-of select="ancestor::tei:teiHeader//tei:sourceDesc/tei:bibl/tei:title[@type='orig']"/>
      <xsl:text> : ELTeC edition</xsl:text>
    </title>
    <xsl:apply-templates select="ancestor::tei:teiHeader//tei:sourceDesc/tei:bibl/tei:author"/>
  </xsl:template>
  
  <xsl:template match="tei:titleStmt/tei:respStmt">
    <respStmt>
      <name>Tomaž Erjavec</name>
      <resp xml:lang="en">Conversion from IMP to ELTeC.</resp>
    </respStmt>
    <respStmt>
      <xsl:apply-templates/>
    </respStmt>
  </xsl:template>
  
  <xsl:template match="tei:titleStmt/tei:respStmt/tei:resp
		       [. = 'Pretvorba zapisa Wiki/DjVu v TEI.']">
    <xsl:copy>
      <xsl:text>Conversion form Wiki/DjVu to TEI.</xsl:text>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tei:extent">
    <extent>
      <xsl:apply-templates/>
      <measure unit="pages">
	<xsl:value-of select="count(//tei:body//tei:pb)"/>
      </measure>
    </extent>
  </xsl:template>

  <xsl:template match="tei:publicationStmt">
    <publicationStmt xml:lang="en">
      <p>Added to ELTeC <date><xsl:value-of select="$Today"/></date></p>
      <!-- ELTeC will have to discuss <availablity>! -->
      <!--p>This work is licensed under the
        <ref target="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons
        Attribution-ShareAlike 4.0 International License</ref>.</p-->
    </publicationStmt>
  </xsl:template>

  <xsl:template match="tei:sourceDesc/tei:bibl">
    <xsl:variable name="facsimile"
		  select="/tei:TEI/tei:facsimile/tei:graphic[1]/@url"/>
    <xsl:variable name="titlePageImage"
		  select="/tei:TEI/tei:facsimile/tei:surface[1]/tei:graphic[1]/@url"/>
    <bibl type="digitalSource">
      <title><xsl:value-of select="tei:title[1]"/></title>
      <author><xsl:value-of select="tei:author"/></author>
      <publisher>
	<xsl:text>CLARIN.SI </xsl:text>
        <ref target="{$imp-handle}"><xsl:value-of select="$imp-handle"/></ref>
      </publisher>
      <idno type="url">
	<xsl:text>http://nl.ijs.si/imp/wikivir/dl/</xsl:text>
	<xsl:value-of select="ancestor::tei:teiHeader//tei:idno"/>
	<xsl:text>.html</xsl:text>
      </idno>
      <idno type="wikilink"><xsl:value-of select="tei:pubPlace/tei:ref[1]/@target"/></idno>
      <idno type="urn"><xsl:value-of select="tei:pubPlace/tei:ref[2]/@target"/></idno>
      <idno type="handle"><xsl:value-of select="$imp-handle"/></idno>
    </bibl>
    <bibl type="unspecified" xml:lang="en">
      <ref target="{$titlePageImage}">Title page</ref>
      <ref target="{$facsimile}">Facsimile</ref>
      <xsl:apply-templates select="tei:date"/>
    </bibl>
  </xsl:template>
  
  <xsl:template match="tei:encodingDesc">
    <encodingDesc n="eltec-1">
      <p/>
      <!--projectDesc>
	<p xml:lang="en">COST Action CA16204 - Distant Reading for European Literary History</p>
      </projectDesc-->
    </encodingDesc>
  </xsl:template>
  
  <xsl:template match="eltec:size">
    <xsl:variable name="size">
      <xsl:variable name="words"
		    select="//tei:teiHeader//tei:fileDesc/tei:extent/tei:measure[@unit='words']"/>
      <xsl:choose>
        <xsl:when test="$words &lt; 50000">short</xsl:when>
        <xsl:when test="$words &gt; 100000">long</xsl:when>
        <xsl:otherwise>medium</xsl:otherwise>
      </xsl:choose>   
    </xsl:variable>
    <eltec:size key="{$size}"/>
  </xsl:template>
  
  <xsl:template match="eltec:timeSlot">
    <xsl:variable name="slot">
      <xsl:variable name="year"
		    select="//tei:teiHeader//tei:sourceDesc/tei:bibl/tei:date[1]"/>
      <xsl:choose>
	<xsl:when test="$year &lt; 1860 and $year &gt; 1839">T1</xsl:when>
        <xsl:when test="$year &lt; 1880 and $year &gt; 1859">T2</xsl:when>
        <xsl:when test="$year &lt; 1900 and $year &gt; 1879">T3</xsl:when>
        <xsl:when test="$year &lt; 1921 and $year &gt; 1899">T4</xsl:when>
        <xsl:otherwise>
	  <xsl:message select="concat('ERROR: Strange year ', $year)"/>
	  <xsl:text>???</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <eltec:timeSlot key="{$slot}"/>
  </xsl:template>
  
  <xsl:template match="tei:langUsage">
    <langUsage>
      <language xml:lang="en" ident="sl">Slovenian</language>
    </langUsage>
  </xsl:template>
  
  <xsl:template match="tei:revisionDesc">
    <revisionDesc>
      <change xml:lang="en" when="{$Today}">Tomaž Erjavec: converted to ELTeC</change>
      <xsl:apply-templates/>
    </revisionDesc>
  </xsl:template>
  <xsl:template match="tei:change">
    <change when="{tei:date}">
      <xsl:apply-templates/>
    </change>
  </xsl:template>
  <xsl:template match="tei:change/tei:date"/>
  <xsl:template match="tei:change/tei:name">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- body -->
  <xsl:template match="tei:body">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
    <xsl:if test=".//tei:note">
      <back xmlns="http://www.tei-c.org/ns/1.0">
        <div type="notes">
	  <xsl:apply-templates mode="notes" select=".//tei:note"/>
        </div>
      </back>
    </xsl:if>
  </xsl:template>

  <xsl:template mode="notes" match="tei:note">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="xml:id">
        <xsl:value-of select="concat(/tei:TEI/@xml:id, '_N')"/>
	<xsl:number from="tei:body" level="any"/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tei:note">
    <ref xmlns="http://www.tei-c.org/ns/1.0">
      <xsl:attribute name="target">
        <xsl:value-of select="concat('#', /tei:TEI/@xml:id, '_N')"/>
	<xsl:number from="tei:body" level="any"/>
      </xsl:attribute>
    </ref>
  </xsl:template>
    
  <!-- Add type to divs (taken more or less from ELTeC Scripts releaseChecker.xsl  -->
  <xsl:template match="tei:body//tei:div">
    <xsl:choose>
      <xsl:when test="tei:p and not(child::tei:div)">
        <div type="chapter" xmlns="http://www.tei-c.org/ns/1.0">
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:when test="tei:div">
        <div type="group" xmlns="http://www.tei-c.org/ns/1.0">
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:otherwise>
	<xsl:message>ERROR: Strange div <xsl:value-of select="@xml:id"/></xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- We do not preserve page breaks, as not all novels will have them -->
  <xsl:template match="tei:pb"/>
  <!--
      <pb n="{@n}"
      facs="{key('id', substring-after(@facs, '#'))/tei:graphic[1]/@url}"/>
      </xsl:template>
  -->

  <xsl:template match="tei:lg">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!-- Hmm, dodgy -->
  <xsl:template match="tei:choice">
    <corr>
      <xsl:value-of select="tei:corr"/>
    </corr>
  </xsl:template>
  
  <!-- Copy everything else -->
  <xsl:template match="* | @* | processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="text()">
    <!--Normalisation would glue together "xxx <hi>bla</hi> yyy" -->
    <!--xsl:value-of select="normalize-space(.)"/-->
    <xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>
