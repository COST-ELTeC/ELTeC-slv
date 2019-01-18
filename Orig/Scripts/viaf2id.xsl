<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xsd="http://www.w3.org/2001/XMLSchema"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:schemaLocation="http://www.loc.gov/zing/srw/ http://www.loc.gov/standards/sru/sru1-1archive/xml-files/srw-types.xsd"
		xmlns:ns1="http://www.loc.gov/zing/srw/"
		xmlns:ns2="http://viaf.org/viaf/terms#"
		xmlns:ns3="http://viaf.org/viaf/terms#"
		xmlns:ns4="http://www.loc.gov/zing/srw/"
		xmlns:ns5="http://www.loc.gov/zing/cql/xcql/"
		xmlns:foaf="http://xmlns.com/foaf/0.1/"
		xmlns:owl="http://www.w3.org/2002/07/owl#"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:void="http://rdfs.org/ns/void#" 
		xmlns:srw="http://www.loc.gov/zing/srw/"
		xmlns:eltec="http://distantreading.net/eltec/ns"
		exclude-result-prefixes="xsd xsi ns1 ns2 ns3 ns4 ns5 foaf owl rdf void srw">

  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="//srw:numberOfRecords[1] = 0">
	<xsl:text>0&#9;-</xsl:text>
      </xsl:when>
      <xsl:when test="//srw:numberOfRecords[1] = 1">
	<xsl:value-of select="//ns2:viafID"/>
	<xsl:text>&#9;</xsl:text>
	<xsl:value-of select="//ns2:primaryTopic/@resource"/>
      </xsl:when>
      <xsl:otherwise>
	<!-- have to find best match -->
	<xsl:variable name="query" select="//srw:xQuery/ns5:searchClause/ns5:term"/>
	<xsl:variable name="name" select="replace($query, ' \(.+', '')"/>
	<xsl:variable name="dates" select="replace($query, '.+ \((.+?)\)', '$1')"/>
	<xsl:variable name="viaf">
	  <xsl:apply-templates
	      select="//srw:record[.//ns3:nameType = 'Personal']
		      [.//ns3:mainHeadings/ns3:data/ns3:text = $name]">
	  </xsl:apply-templates>
	</xsl:variable>
	<xsl:value-of select="$viaf//ns2:viafID"/>
	<xsl:text>&#9;</xsl:text>
	<xsl:value-of select="$viaf//ns2:primaryTopic/@resource"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="//srw:recordData">
    <xsl:copy-of select="."/>
  </xsl:template>
</xsl:stylesheet>
