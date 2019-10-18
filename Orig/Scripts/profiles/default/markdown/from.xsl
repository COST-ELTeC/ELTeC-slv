<!-- ET: FIDDLED SO THAT IT PARSES WIKISOURCE MARKDOWN -->
<!-- So, instead of ### Heading it is === Heading ===  -->
<!-- This is not taken care of up-stream, so this is no-op -->
<xsl:stylesheet 
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei xs">

  <xsl:import href="../../../Stylesheets/profiles/default/markdown/from.xsl"/>
  <!--xsl:import href="/project/tei/Stylesheets/profiles/default/markdown/from.xsl"/-->

   <!-- Indent only for debugging! -->
   <!--xsl:output method="xml" indent="yes" omit-xml-declaration="no"/-->

   <xsl:function name="tei:xxx-parseLine" as="element()*">
     <xsl:param name="vLine" as="xs:string*"/>
   
     <xsl:variable name="nLine" select="normalize-space($vLine)"/>
     <xsl:choose>
       <xsl:when test="string-length($nLine)=0"/>
       <xsl:when test="starts-with($vLine, '    ')">
         <xsl:analyze-string select="$vLine" regex="^(    )+(.*)$">
           <xsl:matching-substring>
             <BCODE level="{string-length(regex-group(1))}">
               <xsl:sequence select="tei:parseString(regex-group(2))"/>
             </BCODE>
           </xsl:matching-substring>
         </xsl:analyze-string>
       </xsl:when>
       <xsl:when test="starts-with($nLine, '```')">
         <!-- fenced code block (in some flavors delimited with ~~~ instead) -->
         <FCODE/>
       </xsl:when>
       <!-- ET: ADDED THIS CONDITION FOR WIKISOURCE MARKDOWN -->
       <xsl:when test="starts-with($nLine, '=')">
     	 <xsl:analyze-string select="$nLine" regex="^(=+) ?(.*?)( ?=*)$">
     	   <xsl:matching-substring>
             <HEAD level="{string-length(regex-group(1))}">
     	       <xsl:sequence select="tei:parseString(regex-group(2))"/>
     	     </HEAD>
     	   </xsl:matching-substring>
     	   <xsl:non-matching-substring>
     	     <xsl:sequence select="tei:parseString(.)"/>
     	   </xsl:non-matching-substring>
     	 </xsl:analyze-string>
       </xsl:when>
       <xsl:when test="starts-with($nLine, '#')">
     	 <xsl:analyze-string select="$nLine" regex="^(#+) ?(.*)(#*)$">
     	   <xsl:matching-substring>
             <HEAD level="{string-length(regex-group(1))}">
     	       <xsl:sequence select="tei:parseString(regex-group(2))"/>
     	     </HEAD>
     	   </xsl:matching-substring>
     	   <xsl:non-matching-substring>
     	     <xsl:sequence select="tei:parseString(.)"/>
     	   </xsl:non-matching-substring>
     	 </xsl:analyze-string>
       </xsl:when>
       <xsl:when test="starts-with($nLine, '- ') or starts-with($nLine, '* ')">
         <ITEM n="item">
           <xsl:sequence select="tei:parseString(substring($nLine, 3))"/>
         </ITEM>
       </xsl:when>
       <xsl:when test="matches($nLine,'^[0-9]\. ')">
         <NITEM n="item">
           <xsl:sequence select="tei:parseString(normalize-space(substring-after($nLine, '. ')))"/>
         </NITEM>
       </xsl:when>
       <xsl:when test="matches($nLine,'^>')">
         <BQUOTE n="item">
           <xsl:sequence select="tei:parseString(substring($nLine, 2))"/>
         </BQUOTE>
       </xsl:when>
       <xsl:otherwise>
         <p>
           <xsl:sequence select="tei:parseString($nLine)"/>
         </p>
       </xsl:otherwise>
     </xsl:choose>
   </xsl:function>
   
 </xsl:stylesheet> 
