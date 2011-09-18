<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns="http://www.w3.org/1999/xhtml"
xmlns:doc="http://www.xqdoc.org/1.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
exclude-result-prefixes="xs doc fn"
version="2.0">

<xsl:output method="xhtml" indent="no" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>

<xsl:param name="source" as="xs:string"/>
  <!-- generate module html //-->
  <xsl:template match="doc:xqdoc">
    <html version="-//W3C//DTD XHTML 1.1//EN">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="Generator" content="xquerydoc - https://github.com/xquery/xquerydoc" />
        <meta http-equiv="Authors" content="Copyright 2011 - John Snelson, James Fuller" />

	<title>xqDoc - </title>
        <style type="text/css">
          body {
          font-family: Helvetica;
          padding: 0.5em  1em;
          }
          pre {
          font-family: Inconsolata, Consolas, monospace;
          }
          ol.results {
          padding-left: 0;
          }
          .footer {
          text-align:right;
          border-top: solid 4px;
          padding: 0.25em 0.5em;
          font-size: 85%;
          color: #999;
          }
          li.result {
          list-style-position: inside;
          list-style: none;
          height:140px;
          }
          h2 {
          display: inline-block;
          margin: 0;
          }

          h2 a,
          .result h3 a {
          text-decoration: inherit;
          color: inherit;
          }
          h3{
	  font-size: 140%;
	  background-color: #aaa;
	  border-bottom: 1px solid #000;
	  width: 100%;
	  }
          h4{
	  font-size: 100%;
	  background-color: #ddd;
	  width: 90%;
	  }

          .namespace {
          color: #999;
          }
          .namespace:before {
          content: "{";
          }
          .namespace:after {
          content: "}";
          }
          table{
          width:75%;
          float:right;
          }
          td {
          height:100px;
          width:50%;
          vertical-align:text-top;
          }
        </style>

	<script src="lib/prettify.js"
                type="lib/javascript">&#160; </script>
	<script src="lib/lang-xq.js"
                type="text/javascript">&#160; </script>
	<link rel="stylesheet" type="text/css" href="lib/prettify.css">&#160;</link>
      </head>
      <body class="home">
        <a href="index.html">XQuery API index</a>
	<div id="main">
          <xsl:apply-templates/>

          <div>
          <h3>Original Source Code</h3>
          <pre class="prettyprint lang-xq"><xsl:value-of select="$source"/></pre>
          </div>
          <br/>
          <div class="footer"><p
                                style="text-align:right"><i><xsl:value-of
                                select="()"/></i> |
          generated by xquerydoc <a
                                  href="https://github.com/xquery/xquerydoc"
                                  target="xquerydoc">https://github.com/xquery/xquerydoc</a></p></div>
        </div>
	<script type="application/javascript">
	  window.onload = function(){ prettyPrint(); }
	</script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="doc:module">
    <h1><span class="namespace"><xsl:value-of
    select="doc:uri"/></span> &#160;<xsl:value-of select="@type"/> module </h1>
    <xsl:apply-templates select="*[not(name(.) eq 'doc:uri')]"/>
  </xsl:template>

  <xsl:template match="doc:variables">
    <div>
    <h3>Variables</h3>
    <ul>
    <xsl:apply-templates/>
    </ul>
    </div>
  </xsl:template>

  <xsl:template match="doc:variable">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="doc:uri">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="doc:functions">
    <div>
    <h3>Functions</h3>
    <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="doc:function">
    <h4><pre class="prettyprint lang-xq"><u>Function:</u>&#160;<xsl:value-of select="doc:name"/><xsl:value-of select="doc:signature"/></pre></h4>
    <xsl:apply-templates select="*[not(name(.) eq 'doc:signature')][not(name(.) eq 'doc:name')]"/> 
  </xsl:template>

  <xsl:template match="doc:parameters">
    <h5>Params</h5>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="doc:parameter">
    <li><xsl:value-of select="doc:name"/>: <xsl:value-of select="doc:type"/></li>
  </xsl:template>

  <xsl:template match="doc:return">
    <h5>Returns</h5>
    <ul><li><xsl:value-of select="@occurrencee"/>: <xsl:value-of select="."/></li></ul>
  </xsl:template>

  <xsl:template match="doc:comment">
    <h5>Description</h5>
    <xsl:apply-templates mode="custom"/>
  </xsl:template>

  <xsl:template match="doc:description" mode="custom">
    <p><xsl:apply-templates select="."/></p>
  </xsl:template>

  <xsl:template match="*:p" mode="custom">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="*:pre" mode="custom">
     <pre class="prettyprint lang-xq"><xsl:value-of select="."/></pre>
  </xsl:template>

  <xsl:template match="doc:author" mode="custom">
    Author: <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="doc:version">
    Version: <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="doc:version" mode="custom">
    v.<xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="doc:param" mode="custom">
    <xsl:apply-templates/>
  </xsl:template>

  <!--xsl:template match="doc:custom" mode="custom">
    <xsl:apply-templates select="."/>
  </xsl:template>

  <xsl:template match="doc:param" mode="custom">
    <xsl:apply-templates select="."/>
  </xsl:template>


  <xsl:template match="doc:version" mode="custom">
    <xsl:apply-templates select="."/>
  </xsl:template-->

  <xsl:template match="doc:control"/>

  <xsl:template match="text()">
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

</xsl:stylesheet>
