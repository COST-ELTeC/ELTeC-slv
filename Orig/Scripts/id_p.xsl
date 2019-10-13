<!-- ID <p>, so it can be matched against samples -->
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

  <xsl:template match="tei:body//tei:p">
    <xsl:copy>
      <xsl:attribute name="n">
	<xsl:text>SLV-</xsl:text>
	<xsl:value-of select="replace(substring-before(/tei:TEI/@xml:id, '-'), 'WIKI', '')"/>
	<xsl:text>.</xsl:text>
	<xsl:number level="any" from="tei:body"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
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
