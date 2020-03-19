<?xml version="1.0"?>
<!-- Output TSV metadata of ELTeC-SLV corpus -->
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

  <xsl:output method="text"/>
  
  <xsl:template match="@*"/>
  <xsl:template match="text()"/>

  <xsl:template match="tei:teiCorpus">
    <xsl:text>ID&#9;Name&#9;VIAF&#9;Gender&#9;Birth&#9;Death&#9;Title&#9;Subtitle&#9;</xsl:text>
    <xsl:text>Printed&#9;Digitised&#9;Period&#9;Size&#9;Canon&#9;Words&#9;Tokens&#10;</xsl:text>
    <xsl:apply-templates select="tei:TEI"/>
  </xsl:template>
  
  <xsl:template match="tei:TEI">
    <xsl:variable name="sourceDesc" select="tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
    <xsl:variable name="digitalSource" select="$sourceDesc/tei:bibl[@type='digitalSource']"/>
    <xsl:variable name="printSource" select="$sourceDesc/tei:bibl[@type='printSource']"/>
    <xsl:variable name="textDesc" select="tei:teiHeader/tei:profileDesc/tei:textDesc"/>
    <xsl:variable name="author" select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author[1]"/>
    <xsl:variable name="dates" select="substring-before(substring-after($author, '('), ')')"/>
    
    <xsl:value-of select="@xml:id"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="substring-before($author, ' (')"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$author/@ref"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$textDesc/eltec:authorGender/@key"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="substring-before($dates, '-')"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="substring-after($dates, '-')"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$printSource/tei:title[1]"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$printSource/tei:title[2]"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of  select="$printSource/tei:date[1]"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of  select="$digitalSource/tei:date[1]"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$textDesc/eltec:timeSlot/@key"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$textDesc/eltec:size/@key"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="$textDesc/eltec:canonicity/@key"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="count(tei:text//tei:w)"/>
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="count(tei:text//tei:w) + count(tei:text//tei:pc) "/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
