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
    <xsl:processing-instruction name="xml-model">
      href="../../Schemas/eltec-1.rng" type="application/xml"
      schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
    <xsl:text>&#10;</xsl:text>
    <xsl:processing-instruction name="xml-model">
      href="../../Schemas/eltec-1.rng" type="application/xml"
      schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
    <xsl:text>&#10;</xsl:text>
    <xsl:variable name="pass1">
      <xsl:apply-templates/>
    </xsl:variable>
    <!-- Give correct @xml:id to TEI and @n to p -->
    <xsl:apply-templates mode="id" select="$pass1"/>
  </xsl:template>

  <xsl:template mode="id" match="tei:TEI">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <!-- From "WIKI00024-1891" to "SLV00024" -->
      <xsl:variable name="id">
	<!--xsl:text>SLV</xsl:text>
	    <xsl:value-of select="replace(@xml:id, 'WIKI(\d+)-.+', '$1')"/-->
	<!-- Already correctly set in add-metadata -->
	<xsl:value-of select="@xml:id"/>
      </xsl:variable>
      <xsl:attribute name="xml:id" select="$id"/>
      <xsl:apply-templates mode="id">
	<xsl:with-param name="id" select="$id"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="id" match="tei:text">
    <xsl:param name="id"/>
    <xsl:copy>
      <xsl:attribute name="n">
	<xsl:value-of select="$id"/>
      </xsl:attribute>
      <xsl:apply-templates mode="id">
	<xsl:with-param name="id" select="$id"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

  <xsl:template mode="id" match="tei:text//tei:p">
    <xsl:param name="id"/>
    <xsl:copy>
      <xsl:attribute name="n">
	<xsl:value-of select="$id"/>
	<xsl:text>.</xsl:text>
	<xsl:number level="any" from="tei:text"/>
      </xsl:attribute>
      <xsl:apply-templates mode="id">
	<xsl:with-param name="id" select="$id"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <!-- Copy everything else -->
  <xsl:template mode="id" match="*">
    <xsl:param name="id"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates mode="id">
	<xsl:with-param name="id" select="$id"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  <xsl:template mode="id" match="text()">
    <xsl:value-of select="."/>
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
  <xsl:template match="tei:hi | tei:emph">
    <xsl:apply-templates/>
  </xsl:template>
  
  <!-- Change these elements -->

  <!-- teiHeader -->

  <xsl:template match="tei:titleStmt/tei:title">
    <title>
      <xsl:value-of select="ancestor::tei:teiHeader//tei:sourceDesc/tei:bibl/tei:title[@type='reg']"/>
      <xsl:text> : edicija ELTeC</xsl:text>
    </title>
    <xsl:apply-templates select="ancestor::tei:teiHeader//tei:sourceDesc/tei:bibl/tei:author"/>
  </xsl:template>
  
  <xsl:template match="tei:titleStmt/tei:respStmt">
    <respStmt>
      <xsl:apply-templates select="tei:resp"/>
      <xsl:apply-templates select="tei:name"/>
    </respStmt>
    <respStmt>
      <resp>Pretvorba zapisa IMP v ELTeC.</resp>
      <resp xml:lang="en">Conversion from IMP to ELTeC encoding.</resp>
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
      <resp>Skrbištvo WikiVira.</resp>
      <resp xml:lang="en">Stewardship of WikiVir (Slovene WikiSource).</resp>
      <name>Miran Hladnik</name>
    </respStmt>
  </xsl:template>
  
  <xsl:template match="tei:titleStmt/tei:respStmt/tei:resp
		       [. = 'Pretvorba zapisa Wiki/DjVu v TEI.']">
    <resp><xsl:value-of select="."/></resp>
    <resp xml:lang="en">Conversion form Wiki/DjVu to TEI.</resp>
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
      <publisher ref="https://distant-reading.net">COST Action "Distant Reading for European Literary History" (CA16204)</publisher>
      <xsl:comment>
	<distributor ref="https://zenodo.org/communities/eltec/">Zenodo</distributor>
      </xsl:comment>
      <distributor ref="https://github.com/COST-ELTeC/ELTeC-slv">GitHub</distributor>
      <date><xsl:value-of select="$Today"/></date>
      <availability>
	<licence target="https://creativecommons.org/licenses/by/4.0/"/>
      </availability>
      <!--ref type="doi" target="https://doi.org/10.5281/zenodo.XXXXXX"/-->
    </publicationStmt>
  </xsl:template>

  <xsl:template match="tei:sourceDesc/tei:bibl">
    <xsl:variable name="facsimile"
		  select="/tei:TEI/tei:facsimile/tei:graphic[1]/@url"/>
    <xsl:variable name="titlePageImage"
		  select="/tei:TEI/tei:facsimile/tei:surface[1]/tei:graphic[1]/@url"/>
    <bibl type="digitalSource">
      <author><xsl:value-of select="replace(tei:author[1], ' \(\d+-\d+\)', '')"/></author>
      <title><xsl:value-of select="tei:title[@type='reg']"/> : edicija IMP</title>
      <xsl:apply-templates select="//tei:teiHeader//tei:publicationStmt/tei:date"/>
      <!--publisher>
	<xsl:text>CLARIN.SI </xsl:text>
        <ref target="{$imp-handle}"><xsl:value-of select="$imp-handle"/></ref>
      </publisher-->
      <idno type="handle"><xsl:value-of select="$imp-handle"/></idno>
      <idno type="url">
	<xsl:text>http://nl.ijs.si/imp/wikivir/dl/</xsl:text>
	<xsl:value-of select="ancestor::tei:teiHeader//tei:idno"/>
	<xsl:text>.html</xsl:text>
      </idno>
      <idno type="wikilink"><xsl:value-of select="tei:pubPlace/tei:ref[1]/@target"/></idno>
    </bibl>
    <bibl type="printSource">
      <author><xsl:value-of select="replace(tei:author[1], ' \(\d+-\d+\)', '')"/></author>
      <xsl:apply-templates select="tei:title[@type='orig']"/>
      <xsl:apply-templates select="tei:date"/>
      <idno type="urn"><xsl:value-of select="tei:pubPlace/tei:ref[2]/@target"/></idno>
      <ref target="{$titlePageImage}">Title page</ref>
      <ref target="{$facsimile}">Facsimile</ref>
    </bibl>
  </xsl:template>
  
  <xsl:template match="tei:encodingDesc">
    <encodingDesc n="eltec-1">
      <p xml:lang="en">This edition for ELTeC was automatically down-converted from the IMP digital library edition, and several pieces of ELTeC-specific metadata were added.</p>
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
	<xsl:when test="$year &gt;= 1840 and $year &lt;= 1859">T1</xsl:when>
        <xsl:when test="$year &gt;= 1860 and $year &lt;= 1879">T2</xsl:when>
        <xsl:when test="$year &gt;= 1880 and $year &lt;= 1899">T3</xsl:when>
        <xsl:when test="$year &gt;= 1900 and $year &lt;= 1920">T4</xsl:when>
        <xsl:otherwise>
	  <xsl:message terminate="yes" select="concat('ERROR: Strange year ', $year)"/>
	  <xsl:text>???</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="normalize-space(@key) and @key ne $slot">
      <xsl:message terminate="no" select="concat('ERROR: periods for ',
					  /tei:TEI/@xml:id, ' do not match: ',
					  @key, ' !== ', $slot)"/>
    </xsl:if>
    <eltec:timeSlot key="{$slot}"/>
  </xsl:template>
  
  <xsl:template match="tei:langUsage">
    <langUsage>
      <language xml:lang="en" ident="sl">Slovenian</language>
    </langUsage>
  </xsl:template>
  
  <xsl:template match="tei:revisionDesc">
    <revisionDesc xml:lang="en">
      <change when="{$Today}">Tomaž Erjavec: converted to ELTeC</change>
      <!--xsl:apply-templates/-->
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
      <xsl:variable name="incipit">
	<xsl:apply-templates mode="incipit" select="tei:*"/>
      </xsl:variable>
      <xsl:if test="$incipit/tei:*">
	<div type="liminal">
	  <xsl:copy-of select="$incipit"/>
	</div>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
    <xsl:if test=".//tei:note">
      <back>
        <div type="notes">
	  <xsl:apply-templates mode="notes" select=".//tei:note"/>
        </div>
      </back>
    </xsl:if>
  </xsl:template>

  <xsl:template mode="incipit" match="tei:body/tei:*">
    <xsl:if test="self::tei:p or self::tei:lg">
      <p>
	<xsl:apply-templates/>
      </p>
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
    <ref>
      <xsl:attribute name="target">
        <xsl:value-of select="concat('#', /tei:TEI/@xml:id, '_N')"/>
	<xsl:number from="tei:body" level="any"/>
      </xsl:attribute>
    </ref>
  </xsl:template>
    
  <!-- Add type to divs (taken more or less from ELTeC Scripts releaseChecker.xsl  -->
  <xsl:template match="tei:body//tei:div">
    <xsl:choose>
      <!-- Hard-code liminal divs, as there are very few -->
      <xsl:when test="(/tei:TEI/@xml:id = 'SLV00024' and not(preceding::tei:div)) or
		      (/tei:TEI/@xml:id = 'SLV00112' and not(preceding::tei:div)) or
		      (/tei:TEI/@xml:id = 'SLV00325' and not(preceding::tei:div)) or
		      (/tei:TEI/@xml:id = 'SLV00497' and not(preceding::tei:div)) or
		      (/tei:TEI/@xml:id = 'SLV10004' and not(preceding::tei:div[2])) or
		      (/tei:TEI/@xml:id = 'SLV20001' and not(preceding::tei:div))
		      ">
        <div type="liminal">
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:when test="tei:p and not(child::tei:div)">
        <div type="chapter">
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:when test="tei:div">
        <div type="group">
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

  <!-- These will be wrapped in a liminal div -->
  <xsl:template match="tei:body/tei:p | tei:body/tei:lg"/>
  
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

  <!-- Do not mark up corrections - there are few, we don't have this in
       WikiSource, and it complicates processing -->
  <xsl:template match="tei:choice">
    <xsl:value-of select="tei:corr"/>
  </xsl:template>
  
  <!-- Copy everything else -->
  <xsl:template match="* | @* | processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>
