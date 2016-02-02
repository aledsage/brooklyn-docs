#!/usr/bin/env bash
#
# this generates A PDF from a HTML file

if [ ! -x _build/build.sh ] ; then
  echo "ERROR: script must be run in root of docs dir"
  exit 1
fi

if [ "$#" -lt 2 ] ; then
	echo "Usage: buildPDF.sh <source html> <target PDF>"
	exit 1
fi

command -v wkhtmltopdf >/dev/null 2>&1 || { 
	echo "ERROR: script requires wkhtmltopdf but it's not installed." >&2; exit 1;
	}
	
# run the PDF build with wkhtmltopdf
wkhtmltopdf --page-size Letter --margin-top 0.75in --margin-right 0.75in --margin-bottom 0.75in --margin-left 0.75in --encoding UTF-8 $1 $2
if [ $? -eq 1 ] ; then
	echo "Note that ContentNotFoundError is usually because of the invalid relational path of a local resource such as an image"
else	
	echo "PDF Built successfully."
fi