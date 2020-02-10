<!-- Show text bearing elements in ELTeC -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h tei eltec">

  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:apply-templates select="//tei:TEI//tei:body"/>
  </xsl:template>
  
  <xsl:template match="tei:body/tei:p">
    <xsl:value-of select="concat('ERROR: body/p in ',
			  ancestor::tei:TEI/@xml:id, '&#10;')"/>
  </xsl:template>
  
  <xsl:template match="tei:div/tei:l">
    <xsl:value-of select="concat('ERROR: body/l in ',
			  ancestor::tei:TEI/@xml:id, '&#10;')"/>
  </xsl:template>
  
  <xsl:template match="text()"/>
  <xsl:template match="tei:*">
    <xsl:choose>
      <!-- This is ok! -->
      <!--xsl:when test="self::tei:div and tei:p and tei:div">
	<xsl:value-of select="concat('ERROR: dif/div+p in ', ancestor::tei:TEI/@xml:id,
			      '&#9;', tei:p[1], '&#10;')"/>
	<xsl:apply-templates/>
      </xsl:when-->
      <xsl:when test="tei:* and text()[normalize-space(.)]">
	<xsl:value-of select="concat(name(), '&#9;mixed content&#10;')"/>
	<xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="tei:*">
	<xsl:value-of select="concat(name(), '&#9;element content: ',
			      string-join(distinct-values(tei:*/name()), ', '), '&#10;')"/>
	<xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="normalize-space(text())">
	<xsl:value-of select="concat(name(), '&#9;text content&#10;')"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="concat(name(), '&#9;empty element&#10;')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
