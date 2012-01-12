#xquerydoc v0.1

Parses [xqDoc](http://xqdoc.org/source.html) style comments from your xquery and generates a set of API
level html documentation all implemented in pure XQuery v1.0.

The xquerydoc commandline uses [XML Calabash](http://xmlcalabash.com) (which ships with [Saxon](http://www.saxonica.com)) though 
as xquerydoc is implemented in pure XQuery v1.0 you may also invoke
from most XQuery processors (Saxon, MarkLogic, XQilla, eXist ...).

## Features

* parsing of XQuery 1.0, XQuery 3.0 and other variants (MarkLogic)
* pure XQuery parsing of xqdoc comments
* generation of simple, customizable documentation
* support for html, markdown output formats
* recursive directory processing
* Invoke from commandline or from within your own XQuery applications

##Install (Mac/Unix/Linux)

Download the xquerydoc installer from 

https://github.com/xquery/xquerydoc/downloads

Double click the installation package or run 

```bash
java -jar xquerydoc-0.1.jar
```

and it should start a step by step graphical installation.

Alternatively you could can always clone a copy from github

https://github.com/xquery/xquerydoc


## Dependencies

To run the commandline version you will need Java 1.5 or higher installed

xquerydoc ships with Norman Walsh's XML Calabash an xproc processor
implemented in Java and runs xquerydoc via xproc xquerydoc step.

Note that Java and XProc processor is not required as you can run
xquerydoc directly from XQuery itself (see 'invoking xquerydoc from XQuery')


##Commandline Usage

The *bin/xquerydoc* script can be invoked from the commandline and
generate documentation from xquery containing xqdoc comments. 

To use provide xquerydoc with a directory containing xquery or single xquery file
and the directory you wish to place generated documentation.

```bash
xquerydoc -x xquery dir -o output dir -f format
```

Currently only the HTML format is supported but hoping soon we will be
able to generate other formats (like markdown, text, docbook, etc...).


##Invoking xquerydoc from XQuery

As xquerydoc is itself written in pure XQuery v1.0  you can invoke  directly
from your own xquery applications employing the *xqdoc:xqdoc()* function to extract xqDoc comments.

####XQuery v1.0 Example (Saxon)
```xquery
xquery version "1.0" encoding "UTF-8";

import module namespace xqdoc="http://github.com/xquery/xquerydoc" at "/xquery/xquerydoc.xq";

xqdoc:xqdoc(fn:collection('/some/xquery/?select=file.xqy;unparsed=yes')) 
```
Note that we are using SAXON convention with collection to bring in
unparsed xquery file.

## xqDoc Markup

The following markup is an example of what the xqdoc:xqdoc() function outputs.

```xml
<doc:xqdoc xmlns:doc="http://www.xqdoc.org/1.0">
  <doc:control>
    <!--Generated by xquerydoc: http://github.com/xquery/xquerydoc-->
    <doc:date/>
    <doc:version>N/A
    </doc:version>
  </doc:control>
  <doc:module type="main">
    <doc:uri/>
    <doc:comment>
      <doc:description>   This main module controls the
      presentation of the home page for  xqDoc.  The home page
      will list all of the library and main modules  contained in
      the 'xqDoc' collection.  The mainline function invokes only
      the  method to generate the HTML for the xqDoc home page.
      A parameter of type   xs:boolean is passed to indicate
      whether links on the page should be constructed   to static
      HTML pages (for off-line viewing) or to XQuery scripts for
dynamic  real-time viewing. 
      </doc:description>
      <doc:author> Darin McBeath
      </doc:author>
      <doc:since> June 9, 2006
      </doc:since>
      <doc:version> 1.3
      </doc:version>
    </doc:comment>
  </doc:module>
  <doc:variables/>
  <doc:functions/>
</doc:xqdoc>
```

Its relatively easy to then take this XML and style it using provided
XSLT stylesheets provided for under *src/lib*. 

## API Docs

Yup we eat our own dog chow, view API docs here.

https://xquery.github.com/xquerydoc/api

## Distro

xquerydoc

xquerydoc - unix/mac commandline run script
xquerydoc.bat - windows commandline run script

* docs: contains api generated documentation
* ebnf: contains Extended Backus–Naur Form definitions of XQuery language

xquerydoc/src

* tests: contains tests
* lib: contains xslt and associated javascript, css, etc
* src: contains xquerydoc XQuery modules 


##Credit, Acknowledgements

Created by John Snelson, James Fuller 

Thanks to [Darin McBeath](http://xqdoc.org/history.html) for creating
the original xqDoc, which xquerydoc reuses.xqDoc is released under the
Apache License, Version 2.0

XQuery parsers were generated from EBNF using Gunther Rademacher's
excellent http://www.bottlecaps.de/rex/

Norman Walsh's xproc processor XML Calabash is
[available](http://xmlcalabash.org) under either the GPLv2 or Sun's CDDL license 

Michael Kay's [Saxon](http://www.saxonica.com) XQuery and XSLT 2.0
Processor is released under the Mozilla Public License

[Prettify](http://code.google.com/p/google-code-prettify/) (used by
api doc and testsuite)  is released under Apache License, Version 2.0

XQuery prettify 'brush' was provided by Patrick Wied (as part of a MarkLogic
bounty contest ;) ) and can be obtained [here](http://www.patrick-wied.at/static/xquery/prettify/) 


## License

xquerydoc is released under Apache License v2.0

Copyright 2011, 2012 Jim Fuller, John Snelson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and

##FAQ

*Why a pure XQuery v1.0 implementation ?*

This means you can generate api level documentation using just XQuery
! Need we say more ?

*Why use XML Calabash XProc ?*

As we are applying an XQuery process and an XSLT process on a set of
xquery documents it seemed like a good match for the commandline
invokation. You can of course use the XQuery v1.0 libraries without
XProc but you will need to apply XSLT stylesheets using your own
processors capabilities.

*xquerydoc does not seem to parse correctly !*

We are very interested in parsing as correctly as possible so please
submit issue to https://github.com/xquery/xquerydoc/issues

*Doesn't work!*

Please make an issue submission here

https://github.com/xquery/xquerydoc/issues

##More Info

https://github.com/xquery/xquerydoc


## Status

* add specific parsing options (XQueryv3.0, etc)
* create markdown output format
* create docbook output format
* create text output format
* enhance output

