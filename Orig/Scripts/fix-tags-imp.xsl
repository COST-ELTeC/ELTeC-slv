<!-- Re-tag IMP document for ELTEC -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:t="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h t eltec">

  <xsl:output indent="yes"/>
  <xsl:strip-space elements="t:*"/>
  <xsl:preserve-space elements="t:p t:hi"/>

  <xsl:key name="id" match="t:surface" use="@xml:id"/>
  <xsl:param name="imp-handle">http://hdl.handle.net/11356/1031</xsl:param>
  
  <xsl:variable name="Today" select="substring-before(current-date() cast as xs:string, '+')"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&#10;&lt;?</xsl:text>
    <xsl:text>xml-model href="https://distantreading.github.io/Schema/eltec-1.rng"</xsl:text>
    <xsl:text disable-output-escaping="yes">?&gt;&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Suppress these attributes -->
  <xsl:template match="t:text//t:*/@xml:id"/>
  <xsl:template match="t:title/@type"/>
  <xsl:template match="t:note/@place"/>
  <xsl:template match="t:note/@type"/><!-- all are authorial -->
  
  <!-- Suppress these elements -->
  <xsl:template match="t:principal"/>
  <xsl:template match="t:editionStmt"/>
  <xsl:template match="t:taxonomy"/>
  <xsl:template match="t:textClass"/>
  <xsl:template match="t:facsimile"/>
  <xsl:template match="t:front|t:back"/>
  <xsl:template match="t:lb"/>
  <xsl:template match="t:title[@type='reg']"/>
  
  <!-- Suppress these tags -->

  <!-- Not sure if hi/emph should be suppresed, cf. unclear statements in
       https://distantreading.github.io/encoding_proposal.html
       But note that one problem with hi/emph is not addressed:
       without them <p> content is plain text (modulo empty <pb/>), which
       makes it much easier to linguistically annotate text, as you don't need
       to worry about existing annotation inside paragraphs.
  -->
  <!--xsl:template match="t:hi | t:emph">
    <xsl:apply-templates/>
  </xsl:template-->
  <!-- Seems <l> is to be left intact, cf.
       https://github.com/distantreading/WG1/wiki/textFeatures
  -->
  <!--xsl:template match="t:l">
    <xsl:apply-templates/>
  </xsl:template-->

  <!-- Change these elements -->

  <!-- teiHeader -->

  <xsl:template match="t:titleStmt/t:title">
    <title>
      <xsl:value-of select="ancestor::t:teiHeader//t:sourceDesc/t:bibl/t:title[@type='orig']"/>
      <xsl:text> : ELTeC edition</xsl:text>
    </title>
    <xsl:apply-templates select="ancestor::t:teiHeader//t:sourceDesc/t:bibl/t:author"/>
  </xsl:template>
  
  <xsl:template match="t:titleStmt/t:respStmt">
    <respStmt>
      <name>Tomaž Erjavec</name>
      <resp xml:lang="en">Conversion from IMP to ELTeC.</resp>
    </respStmt>
    <respStmt>
      <xsl:apply-templates/>
    </respStmt>
  </xsl:template>
  
  <xsl:template match="t:extent">
    <extent>
      <xsl:apply-templates/>
      <measure unit="pages">
	<xsl:value-of select="count(//t:body//t:pb)"/>
      </measure>
    </extent>
  </xsl:template>

  <xsl:template match="t:publicationStmt">
    <publicationStmt xml:lang="en">
      <p>Added to ELTeC <date><xsl:value-of select="$Today"/></date></p>
      <!-- ELTeC will have to discuss <availablity>! -->
      <!--p>This work is licensed under the
        <ref target="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons
        Attribution-ShareAlike 4.0 International License</ref>.</p-->
    </publicationStmt>
  </xsl:template>

  <xsl:template match="t:sourceDesc/t:bibl">
    <xsl:variable name="facsimile"
		  select="/t:TEI/t:facsimile/t:graphic[1]/@url"/>
    <xsl:variable name="titlePageImage"
		  select="/t:TEI/t:facsimile/t:surface[1]/t:graphic[1]/@url"/>
    <bibl>
      <title><xsl:value-of select="t:title[1]"/></title>
      <author><xsl:value-of select="t:author"/></author>
      <publisher>
	<xsl:text>CLARIN.SI </xsl:text>
        <ref target="{$imp-handle}"><xsl:value-of select="$imp-handle"/></ref>
      </publisher>
      <idno type="url">
	<xsl:text>http://nl.ijs.si/imp/wikivir/dl/</xsl:text>
	<xsl:value-of select="ancestor::t:teiHeader//t:idno"/>
	<xsl:text>.html</xsl:text>
      </idno>
      <idno type="wikilink"><xsl:value-of select="t:pubPlace/t:ref[1]/@target"/></idno>
      <idno type="urn"><xsl:value-of select="t:pubPlace/t:ref[2]/@target"/></idno>
      <idno type="handle"><xsl:value-of select="$imp-handle"/></idno>
    </bibl>
    <bibl type="copyText" xml:lang="en">
      <ref target="{$titlePageImage}">Title page</ref>
      <ref target="{$facsimile}">Facsimile</ref>
      <xsl:apply-templates select="t:date"/>
    </bibl>
  </xsl:template>
  
  <xsl:template match="t:encodingDesc">
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
		    select="//t:teiHeader//t:fileDesc/t:extent/t:measure[@unit='words']"/>
      <xsl:choose>
        <xsl:when test="$words &lt; 50000">short</xsl:when>
        <xsl:when test="$words &gt; 150000">long</xsl:when>
        <xsl:otherwise>medium</xsl:otherwise>
      </xsl:choose>   
    </xsl:variable>
    <eltec:size key="{$size}"/>
  </xsl:template>
  
  <xsl:template match="eltec:timeSlot">
    <xsl:variable name="slot">
      <xsl:variable name="year"
		    select="//t:teiHeader//t:sourceDesc/t:bibl/t:date[1]"/>
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
  
  <xsl:template match="t:langUsage">
    <langUsage>
      <language xml:lang="en" ident="sl">Slovenian</language>
    </langUsage>
  </xsl:template>
  
  <xsl:template match="t:revisionDesc">
    <revisionDesc>
      <change xml:lang="en" when="{$Today}"><name>Tomaž Erjavec</name>: converted to ELTeC</change>
      <xsl:apply-templates/>
    </revisionDesc>
  </xsl:template>
  <xsl:template match="t:change">
    <change when="{t:date}">
      <xsl:apply-templates/>
    </change>
  </xsl:template>
  <xsl:template match="t:change/t:date"/>

  <!-- body -->
  <xsl:template match="t:pb">
    <pb n="{@n}"
	facs="{key('id', substring-after(@facs, '#'))/t:graphic[1]/@url}"/>
  </xsl:template>

  <xsl:template match="t:lg">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!-- Hmm, dodgy -->
  <xsl:template match="t:choice">
    <corr>
      <xsl:value-of select="t:corr"/>
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
