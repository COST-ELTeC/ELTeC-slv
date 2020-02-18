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
    <xsl:apply-templates select="//tei:TEI//tei:body//tei:p"/>
  </xsl:template>
  
  <xsl:template match="tei:p">
    <xsl:if test="matches(., '^[\p{P}]+$')">
      <xsl:value-of select="concat('WARN: p ',
			    @n, ' contains ', ., '&#10;')"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
