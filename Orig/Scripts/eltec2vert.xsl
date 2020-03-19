<?xml version="1.0"?>
<!-- Transform one file from the ELTeC-SVL corpus 
     to CQP vertical format (which is still XML though, and needs another polish) -->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:eltec="http://distantreading.net/eltec/ns"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    xmlns:et="http://nl.ijs.si/et"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="fn et tei xs xi"
    version="2.0">

  <xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>
  
  <xsl:template match="@*"/>
  <xsl:template match="text()"/>

  <xsl:template match="tei:TEI">
    <xsl:variable name="sourceDesc" select="tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
    <xsl:variable name="digitalSource" select="$sourceDesc/tei:bibl[@type='digitalSource']"/>
    <xsl:variable name="printSource" select="$sourceDesc/tei:bibl[@type='printSource']"/>
    <xsl:variable name="textDesc" select="tei:teiHeader/tei:profileDesc/tei:textDesc"/>
    <text id="{@xml:id}">
      
      <!-- Take only first author and title: too complicated to have more! -->
      <xsl:attribute name="author" select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author[1]"/>
      <xsl:attribute name="title" select="$printSource/tei:title[1]"/>
      <xsl:attribute name="date" select="$printSource/tei:date[1]"/>
      
      <xsl:attribute name="authorGender" select="$textDesc/eltec:authorGender/@key"/>
      <xsl:attribute name="size" select="$textDesc/eltec:size/@key"/>
      <xsl:attribute name="canonicity" select="$textDesc/eltec:canonicity/@key"/>
      <xsl:attribute name="timeSlot">
	<xsl:variable name="key" select="$textDesc/eltec:timeSlot/@key"/>
	<xsl:choose>
	  <xsl:when test="$key = 'T1'">T1 (1840-1859)</xsl:when>
	  <xsl:when test="$key = 'T2'">T2 (1860-1879)</xsl:when>
	  <xsl:when test="$key = 'T3'">T3 (1880-1899)</xsl:when>
	  <xsl:when test="$key = 'T4'">T4 (1900-1920)</xsl:when>
	  <xsl:otherwise>WHAT IS THIS?</xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      
      <xsl:attribute name="url_text">
	<xsl:choose>
	  <xsl:when test="$digitalSource/tei:idno[@type='wikilink']">
	    <xsl:value-of select="$digitalSource/tei:idno[@type='wikilink']"/>
	  </xsl:when>
	  <xsl:when test="$digitalSource/tei:idno[@type='url']">
	    <xsl:value-of select="$digitalSource/tei:idno[@type='url']"/>
	  </xsl:when>
	  <xsl:otherwise>-</xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="url_author">
	<xsl:choose>
	  <xsl:when test="$printSource/tei:author[1][@ref]">
	    <xsl:value-of select="$printSource/tei:author[1]/@ref"/>
	  </xsl:when>
	  <xsl:otherwise>-</xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates select="tei:text"/>
    </text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="tei:div">
    <xsl:variable name="element">
      <xsl:value-of select="@type"/>
      <xsl:if test="@type='group'">
	<xsl:variable name="n" select="count(ancestor::tei:div[@type='group'])"/>
	<xsl:if test="$n &gt; 0">
	  <xsl:value-of select="$n"/>
	</xsl:if>
      </xsl:if>
    </xsl:variable>
    <xsl:element name="{$element}">
      <xsl:attribute name="id" select="@xml:id"/>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates/>
    </xsl:element>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
    
  <xsl:template match="tei:p | tei:l | tei:note | tei:s">
    <xsl:copy>
      <xsl:attribute name="id" select="@xml:id"/>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates/>
    </xsl:copy>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
    
  <xsl:template match="tei:rs">
    <name>
      <xsl:attribute name="type" select="@type"/>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates/>
    </name>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  
  <!-- TOKENS -->
  <xsl:template match="tei:pc | tei:w">
    <xsl:value-of select="concat(.,'&#9;',et:output-annotations(.))"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:if test="@join = 'right' or @join='both' or
		  following-sibling::tei:*[1]/@join = 'left' or
		  following-sibling::tei:*[1]/@join = 'both'">
      <g/>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:function name="et:output-annotations">
    <xsl:param name="token"/>
    <xsl:variable name="id" select="$token/@xml:id"/>
    <xsl:variable name="lemma">
      <xsl:choose>
	<xsl:when test="$token/@lemma">
	  <xsl:value-of select="$token/@lemma"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="substring($token,1,1)"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="msd" select="replace(
				     substring-after($token/@msd, 'XPOS='),
				     '\|.*', '')"/>
    <xsl:variable name="ud-pos" select="$token/@pos"/>
    <xsl:variable name="ud-feats">
      <xsl:variable name="fs" select="replace(
				      replace($token/@msd, '\|?XPOS=[^|]+', ''),
				      '\|?SpaceAfter=[^|]+', '')"/>
      <xsl:choose>
	<xsl:when test="normalize-space($fs)">
	  <xsl:value-of select="replace($fs, '\|', ' ')"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text>-</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:sequence select="concat($lemma, '&#9;', $msd, '&#9;', $ud-pos, '&#9;', $ud-feats)"/>
  </xsl:function>

</xsl:stylesheet>
