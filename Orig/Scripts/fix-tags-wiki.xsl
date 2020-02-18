<!-- Re-tag TEI WikiSource document for ELTEC -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:et="http://nl.ijs.si/et" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h et tei eltec">

  <xsl:output indent="yes"/>
  <xsl:strip-space elements="tei:*"/>

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
    <xsl:apply-templates mode="id" select="$pass1">
      <xsl:with-param name="id" select="/tei:TEI/@xml:id"/>
    </xsl:apply-templates>
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
  
  <!-- Change these elements -->

  <!-- teiHeader -->

  <xsl:template match="tei:titleStmt/tei:title">
    <title>
      <xsl:value-of select="."/>
      <xsl:text> : edicija ELTeC</xsl:text>
    </title>
  </xsl:template>
  
  <xsl:template match="tei:titleStmt/tei:respStmt">
    <respStmt>
      <resp>Pretvorba zapisa WikiVir v ELTeC.</resp>
      <resp xml:lang="en">Conversion from WikiVir to ELTeC encoding.</resp>
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

  <xsl:template match="tei:encodingDesc">
    <encodingDesc n="eltec-1">
      <p xml:lang="en">This ELTeC edition was automatically converted from the <ref target="https://sl.wikisource.org/">Slovene WikiSource</ref> digital library edition, and several pieces of ELTeC-specific metadata were added. In particular, the source mark-down was first downloaded, and then fixed with a Perl script, which substitutes Wiki MD marking for heads with the regular one, normalises some characters and removes interal markup expressed in {{..}} and as XML tags. This also means that certain markup from the source is lost, e.g. pagebreaks, original vs. corrected words (corrected are retained), poems and their lines, and notes (which are removed). However, it would be extremely difficult to convert this, furthermore it seems that such markup is used only in some novels. The "cooked" MD files are then converted to TEI with the docx2tei stylesheet, ELTeC metadata is added, and the resulting file fixed to ELTeC schema via a XSLT stylesheet.</p>
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
      <xsl:variable name="year" select="//tei:teiHeader//tei:sourceDesc/
					tei:bibl[@type='printSource']/tei:date"/>
      <xsl:choose>
	<xsl:when test="$year &gt;= 1840 and $year &lt;= 1859">T1</xsl:when>
        <xsl:when test="$year &gt;= 1860 and $year &lt;= 1879">T2</xsl:when>
        <xsl:when test="$year &gt;= 1880 and $year &lt;= 1899">T3</xsl:when>
        <xsl:when test="$year &gt;= 1900 and $year &lt;= 1920">T4</xsl:when>
	<xsl:when test="$year &lt;= 1840">
	  <xsl:message terminate="no">
	    <xsl:text>WARN: Book too old: </xsl:text>
	    <xsl:value-of select="$year"/>
	  </xsl:message>
	  <xsl:text>T1</xsl:text>
	</xsl:when>
	<xsl:when test="$year &gt;= 1920">
	  <xsl:message terminate="no">
	    <xsl:text>WARN: Book too new: </xsl:text>
	    <xsl:value-of select="$year"/>
	  </xsl:message>
	  <xsl:text>T4</xsl:text>
	</xsl:when>
        <xsl:otherwise>
	  <xsl:message terminate="yes" select="concat('what?:', $year)"/>
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
    </revisionDesc>
  </xsl:template>

  <xsl:template match="tei:body">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:choose>
	<xsl:when test="tei:div">
	  <!-- Gets rid of Wiki paragraphs with meta-data at start and end of text -->
	  <xsl:apply-templates select="tei:div"/>
	</xsl:when>
	<xsl:when test="tei:p">
	  <!-- If novel has no divs, we have to wing it -->
	  <div type="chapter">
	    <xsl:message>WARN: inserting div into <xsl:value-of select="/tei:TEI/@xml:id"/></xsl:message>
	    <xsl:apply-templates select="tei:p"/>
	  </div>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:message terminate="yes">ERROR: bad doc <xsl:value-of select="/tei:TEI/@xml:id"/></xsl:message>
      </xsl:otherwise>
      </xsl:choose>
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
      <xsl:when test="following-sibling::tei:div[tei:head = 'Prvo poglavje'][2]">
	<xsl:message>ERROR: Pod svodobnim soncem, fix!</xsl:message>
	<xsl:message>ERROR: Strange div: <xsl:value-of select="substring(., 1, 30)"/></xsl:message>
      </xsl:when>
      <xsl:otherwise>
	<xsl:message>ERROR: Strange div: <xsl:value-of select="substring(., 1, 30)"/></xsl:message>
      </xsl:otherwise>
    </xsl:choose>
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

  <xsl:template match="tei:p | tei:eg">
    <xsl:variable name="text">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="not(normalize-space($text))"/>
      <xsl:when test="matches($text, '^[ -]+$')">
	<milestone type="subChapter" rend="dashes" unit="dash"/>
      </xsl:when>
      <xsl:when test="matches($text, '^\*$')">
	<milestone type="subChapter" rend="asterisk" unit="asterisk"/>
      </xsl:when>
      <xsl:when test="matches($text, '^[ *]+$')">
	<milestone type="subChapter" rend="asteriskes" unit="asterisk"/>
      </xsl:when>
      <xsl:when test="tei:l">
	<p>
	  <xsl:apply-templates/>
	</p>
      </xsl:when>
      <xsl:otherwise>
	<p>
	  <xsl:value-of select="normalize-space($text)"/>
	</p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- In Wiki SLV10030 we find a row of dashes in a list -->
  <xsl:template match="tei:list">
    <xsl:choose>
      <xsl:when test="matches(tei:item, '^[ -]+$')">
	<milestone type="subChapter" rend="dashes" unit="dash"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:item">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:l">
    <xsl:copy>
      <xsl:value-of select="normalize-space(.)"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Copy everything else -->
  <xsl:template match="* | @* | processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="text()">
    <!-- Fixing escaped asterisk, ordinals and mdashes -->
    <xsl:variable name="text"
		  select="replace(
			  replace(
			  replace(.,
			  '&amp;ndash;', '–'),
			  '✱', '*'),
			  '\\(\d+\.)', '$1')"/>
     <xsl:value-of select="et:unescapeCharacters($text)"/>
  </xsl:template>

  <xsl:function name="et:unescapeCharacters">
    <xsl:param name="text" as="xs:string"/>
    <xsl:analyze-string select="$text" regex="&amp;#([0-9]+);">
      <xsl:matching-substring>
	<xsl:value-of select="codepoints-to-string(xs:integer(regex-group(1)))"/>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
	<xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:function>
  
</xsl:stylesheet>
