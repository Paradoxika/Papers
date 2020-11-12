%% This is file `ios2-nameyear.bst'
%%
%% Please submit bugs or your comments to vtex@vtex.lt
%%
%% You are free to use this style file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.

% BibTeX programming: Linas Stonys, VTeX, Lithuania, lstonys@vtex.lt 
%


ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    fjournal
    editor
    howpublished
    institution
    isbn
    journal
    key
    month
    note
    number
    organization
    pages   
    publisher
    school
    series
    title
    type
    volume
    year
    url
    info
    options
  }
  {}
   { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence
           after.block after.authors between.elements bother slen set.settings default.info middle.edt tmp
           organization.outputed done
           }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.authors :=
  #5 'between.elements :=
}

STRINGS { s t  element}
STRINGS { longest.label last.label list.string temp.str}
STRINGS { v l f j b }

FUNCTION {output.nonnull}{ 
  's :=
  output.state mid.sentence =
    { " " * write$ newline$}
    { output.state after.block =
        { add.period$ write$
          newline$
         % "\newblock " write$
        }
        {
          output.state after.authors =
          { ". " * write$
            newline$
          }
          { output.state between.elements =
              { ", " * write$ newline$}
              { output.state before.all =
                   'write$
                  { add.period$ " " * write$ newline$}
                  	
                  	
                  if$
              }
              if$
          }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}{ 
  duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output2}
{% stack$ top$ 
 duplicate$ empty$
    'pop$
    {
    write$
    }
  if$
}

FUNCTION {output.check}{ 
  't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {stupid.colon}{ 
  after.authors 'output.state := 
}


FUNCTION {insert.comma}{ 
  output.state before.all =
    'skip$
    { between.elements 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}


INTEGERS {sk}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {make.tag}
{ 't :=
  duplicate$ empty$
    { pop$ "" }
    { bother #0 =
    	{	t "volume" =
    		t "jtitle" =
    		t "btitle" =
    		type$ "phdthesis" = 
    		type$ "mastersthesis" = or
    		t "ctitle" = and
    		or or or
    			{"\textit{"  swap$ * "}" * }
    			'skip$
    		if$
    	}
	    { "\b" t * "{" * swap$ * "}" * }
	  if$
    }
  if$
}

FUNCTION {sort.format.month}
{ 't :=
 	 t #1 #2 substring$ "01" =
 	 t	#1 #1 substring$ "1" =
 	 t	#2 #2 substring$ "" =
 	 and or
 	 { "January" }
    { t #1 #2 substring$ "02" =
			t	#1 #1 substring$ "2" =
			t	#2 #2 substring$ "" =
			and or
      { "February" }
      { t #1 #2 substring$ "03" =
 		    t #1 #1 substring$ "3" =
 		    t	#2 #2 substring$ "" =
 		    and or
        { "March" }
        { t #1 #2 substring$ "04" =
        	t #1 #1 substring$ "4" =
        	or
          { "April" }
          { t #1 #2 substring$ "05" =
           	t #1 #1 substring$ "5" =
           	or
            { "May" }
            { t #1 #2 substring$ "06" =
  	          t #1 #1 substring$ "6" =
  	          or
              { "June" }
              { t #1 #2 substring$ "07" =
              	t #1 #1 substring$ "7" =
              	or
                { "July" }
                { t #1 #2 substring$ "08" =
 		              t #1 #1 substring$ "8" =
 		              or
                  { "August" }
                  { t #1 #2 substring$ "09" =
                    t #1 #1 substring$ "9" =
                    or
                    { "September" }
                    { t #1 #2 substring$ "10" =
                      { "October" }
                      { t #1 #2 substring$ "11" =
                        { "November" }
                        { t #1 #2 substring$ "12" =
                          { "December" }
                          { t } % No match
                        if$
                        }
                      if$
                      }
                    if$
                    }
                  if$
                  }
                if$
                }
              if$
              }
            if$
            }
          if$
          }
        if$
        }
      if$
      }
    if$
    }
  if$
 
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {byear}
{ duplicate$ empty$
    { pop$ "" }
    {	't :=
    	
    	#0 bother =
			{""}
		    { "\byear{" }
		if$	
    	
    	t text.length$ 'sk :=
		#5 sk =
			{t #1 #4 substring$ 's :=
			 t #5 #1 substring$ 'longest.label :=
		  	 longest.label is.num not	
				{ s * 
	    		  #0 bother =
					'skip$
			    	{ "}" *}
				  if$	
				  longest.label * }
				{ 
				  t * 
	    		  #0 bother =
					'skip$
			    	{ "}" *}
				  if$	
				}
			 if$
			}
			{ t * 
    		  #0 bother =
				'skip$
		    	{ "}" *}
			  if$	
				 
			 extra.label *
			}
		if$
    }
  if$
}

FUNCTION {format.date}
{ year empty$
    { "" }
    { "(" year byear * ")" * }
  if$
}
FUNCTION {fformat.date}
{ year empty$
    'skip$
    { year byear output}
  if$
}

FUNCTION {f.date}
{ year empty$
    'skip$
    { ", "  year  byear }
  if$
}

FUNCTION {is.letter}
{ chr.to.int$
  duplicate$ "a" chr.to.int$  #1 - < not
  swap$ "z" chr.to.int$ #1 + > not and
}

INTEGERS { multiresult char.num k int int2}
INTEGERS {str.length str.length2 count return save.num1 save.num2}

FUNCTION {is.in.list}{
	'f :=
	%%%% save original "s" an "t"
	s 'j :=
	f 's :=
	t 'f :=  
  list.string text.length$ 'str.length :=
  list.string 't :=
%  s text.length$ 'slen :=
  int   'save.num1 :=
  count 'save.num2 :=
  #1 'int :=
  #1 'count :=
  #0 'return :=
    
    { count str.length = not 
      #0 str.length = not
      and
    }
    {
			count #1 + 'count :=
		  t int #1 substring$ "," =
      	{
      	  t #1 int substring$ s "," * =
      	    {
		  		   #1 'return :=
  			      str.length 'count :=
			   	  }
	    			'skip$
         if$
	        
	        int #1 + 'int :=
   		    t int global.max$ substring$ 't :=
				  #0 'int :=
      	}
      	'skip$
      if$	
      int #1 + 'int :=
    }
  while$

  save.num1 'int   :=
  save.num2 'count :=
  
  #0 return =
  	{ s t =
		    {#1 'return :=}
		    'skip$
		  if$
  	}
  	'skip$
  if$
	%%%% restore "s" and "t"
	j 's :=
	f 't :=  
	
	return		
}

FUNCTION {USA.states}{"AL,AK,AZ,AR,CA,CO,CT,DE,DC,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,RI,SC,SD,TN,TX,UT,VT,VA,WA,WV,WI,WY"}

FUNCTION {remove.state}{
	'f :=
	%%%% save original "s" an "t"
	"" 'l :=
	s 'j :=
	f 's :=
	t 'f :=  
  s text.length$ 'str.length2 :=
  USA.states text.length$ 'str.length :=
  USA.states 't :=
%  s text.length$ 'slen :=
  int   'save.num1 :=
  count 'save.num2 :=
  #1 'int :=
  #1 'count :=
    
    { count str.length = not 
      #0 str.length = not
      and
    }
    {
 	  count #1 + 'count :=
	  t int #1 substring$ "," =
      	{
      		t #1 int #1 - substring$ 'l :=
			#1 'int2 :=
			
      	 	{int2 str.length2 = not}
    		{
    			s int2 #4 substring$ ", " l * =
    				{ s int2 #4 + #1 substring$ ""  =
    					{s #1 int2 #1 - substring$ 
    						s int2 #4 + global.max$ substring$ 
    						*
    						's :=
    						str.length 'count :=
    					}
    					{
    						s int2 #4 + #1 substring$ is.letter
    							'skip$
    							{
    								s #1 int2 #1 - substring$ 
    								s int2 #4 + global.max$ substring$ 
    								*
    								's :=
    								str.length 'count :=
    							}
    						if$
    					}
    				  if$	
    				}
    				'skip$
    			if$
    			int2 #1 + 'int2 :=

    		}
  			while$
	        
	        int #1 + 'int :=
   		    t int global.max$ substring$ 't :=
				  #0 'int :=
      	}
      	'skip$
      if$	
      int #1 + 'int :=
    }
  while$

  save.num1 'int   :=
  save.num2 'count :=
  
	s
	%%%% restore "s" and "t"
	j 's :=
	f 't :=  
	
}

FUNCTION {format.organization}
{ organization empty$
    { "" }
    { #1 'organization.outputed :=
      organization 
    }
  if$
}

FUNCTION {format.pub.address}
{ 
    address empty$
   		{""}
   		{	address 
   			"nostates" is.in.list
   				'remove.state
   				'skip$
   			if$
   			publisher empty$
   			type$ "inproceedings" =
   			type$ "conference" = or
   			and
   				{"conflocation"}
   				{"location"}
   			if$
   			make.tag
   		}
   	if$
   	
   	address empty$ publisher empty$ or
		'skip$
		{":" *}
	if$
	output

	publisher empty$
    	{organization empty$
    		'skip$
	    	{ author empty$ editor empty$ and
    			'skip$
    			{new.sentence format.organization "institute" make.tag output}
    		if$
    		}
    	if$	
    	
    	type$ "booklet" = 
    		{
		     howpublished empty$
    				'skip$
    				{new.sentence howpublished "publisher" make.tag output }
   			 if$
    		}	
    		{
		     howpublished empty$
    				'skip$
    				{new.sentence howpublished "institute" make.tag output }
   			 if$
    		}
    	if$		
    	}
    	{ publisher "publisher" make.tag  output }
    if$
   		    
}
INTEGERS { nameptr namesleft numnames}

FUNCTION {mk.tag}
{ 'temp.str :=
  duplicate$ empty$
    { pop$ "" }
    { 
    	b "nothing" =
    		'skip$
			{"\b" temp.str * "{" * swap$ * "}" * }
		if$
	}
  if$
}

FUNCTION {space.after.dot}
{'j :=
	t 'f :=
	j 't := 
	s 'j :=
	"" 'l :=
	"" 's :=
  { t empty$ not }
  {   
    t #1 #3 substring$ "{-}" =
	     {l  " {q}. " * 'l :=
	  	  t #4 global.max$ substring$ 't :=
	     }
   		 'skip$ 	
    if$

  	t #1 #1 substring$ 's :=
		  l  s * 'l := 

      s "." = 
		{ 

    	  	t #2 #1 substring$ " " =
    	      'skip$
		 	  {
		  	   l  " " * 'l := 
			   t #2 #4 substring$ "{\,}" =
		 	  		{
				  	  t #5 global.max$ substring$ 't :=
		 	  		}
    	     	  'skip$
      	  	   if$ 
		      } 
      	  	if$  
		} 
		'skip$
      if$

  	  t #2 global.max$ substring$ 't :=
    }
  while$
  f 't :=
  j 's :=
  l 
}

FUNCTION {fix.inits}{
	't :=
	 "" 'element :=
  	{ t empty$ not }
  	{  

	  t #1 #3 substring$ ".q." =
	     {element  ".-" * 'element :=
  	  	  t #3 global.max$ substring$ 't :=
	     }
	     {element  t #1 #1 substring$ * 'element :=}
   	  if$
		
  	  t #2 global.max$ substring$ 't :=
    }
  while$
	element
}

FUNCTION {fix.snm}{
	't :=
	 "" 'element :=
  	{ t empty$ not }
  	{  

	  t #1 #3 substring$ "{-}" =
	     {element  "-" * 'element :=
  	  	  t #3 global.max$ substring$ 't :=
	     }
	     {element  t #1 #1 substring$ * 'element :=}
   	  if$
		
  	  t #2 global.max$ substring$ 't :=
    }
  while$
	element
}

FUNCTION {enbrace.dash}{
	't :=
	 "" 'element :=
  	{ t empty$ not }
  	{  
	  t #1 #1 substring$ "-" =
	    {element  "{-}" * 'element :=}
     	{element  t #1 #1 substring$ * 'element :=}
  	  if$
  	  t #2 global.max$ substring$ 't :=
    }
  while$
	element
}

FUNCTION {fix.name}{	
  enbrace.dash 's :=
  "" 'l :=
  "" 't :=

  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    {
      s nameptr "{vv~}{ll}{, jj}" format.name$
      s nameptr "{, ff}"          format.name$ space.after.dot * 'l :=
  		#1 nameptr = 
        {l 't :=}
        {t " and " * l * 't := }
      if$
      nameptr #1 + 'nameptr := 
      namesleft #1 - 'namesleft :=
    }
  while$
  t 
}

FUNCTION {name.separator}{
	namesleft #1 >
    { namesleft #2 =
        { tmp #1 = 
            { middle.edt #1 =
                {" "}
                {", "}
              if$
            }
            {
              middle.edt #1 =
                {" and "}
                {" \& "}
              if$
            }
          if$
        }
        {", "}
      if$
      *  
		}
    'skip$
  if$
}

FUNCTION {fmt.front.names}{
			v empty$
				'skip$
				{v * " " *}
			if$
			
		   	l empty$
			    'skip$
				{ l *} 		
			if$			

		   	f empty$
				'skip$
				{", " * f *} 		
			if$

		   	j empty$
			    'skip$
				{" "  * j *} 		
			if$
}
FUNCTION {fmt.middle.names}{
		   	f empty$
				'skip$
				{ f * " " * } 		
			if$

		   	j empty$
			    'skip$
				{ j * " " *} 		
			if$

			v empty$
				'skip$
				{ v * " " *}
			if$
			
		   	l empty$
			    'skip$
				{ l *} 		
			if$			
}

FUNCTION {format.author.editor}
{ 'b :=

  bother #1 =
  b "nothing" =
  or
    'skip$
    {"b" b * 'b :=}
	if$

   	b "editor"  =
   	b "beditor" =
   	b "nothing" =
   	or or
      {editor 's :=}
      {author 's :=}
    if$
	
    s fix.name 's :=

  "" 't :=	
 
	#1 'nameptr :=
  	s num.names$ 'numnames :=
  	numnames 'namesleft :=
  	
  	s numnames "{ll}" format.name$ 'l :=
  	l  "others" =
   	l  "{others}" =
   	l  "et al." =
   	l  "{et al.}" =
   	or or or
   		{#1 'tmp :=}
   		{#0 'tmp :=}
  	if$
  	
    { namesleft #0 > }
    {	""    'v := 
      s nameptr "{vv }{ll}" 	format.name$ fix.snm   "snm"      mk.tag  'l :=   
    	s nameptr "{f{.}.}"     format.name$ fix.inits "inits"    mk.tag  'f := 
     	s nameptr "{jj}" 	      format.name$           "suffix"   mk.tag  'j := 
		
		
   		namesleft #1 =
   		tmp #1 = 
   		and
   		{	"\betal\ "
  			#1 'tmp :=
      }
   		{

   			b "bauthor" =
   			b "beditor" =
   			or
	  			{ "\oauthor{" fmt.front.names }
	  			{
   					b "nothing" =
   						{"" fmt.middle.names}
	  					{"\b" b * "{" *
	  						middle.edt #1 = 
	  							'fmt.middle.names
	  							'fmt.front.names
	  						if$
	  					}
					if$


	  			}
			if$			

      b "nothing" =
        {""}
				{"}"}  
			if$
			
			* "" 't :=

		 } 
		if$
    name.separator
    write$ 
      	
    namesleft #1 >
    b "nothing" = not
    and
      {namesleft #2 =
       tmp #1 =
       and
        'skip$
        'newline$
       if$
      }
      'skip$
	  if$

      	nameptr #1 + 'nameptr := 
      	namesleft #1 - 'namesleft :=
    }
  while$
  
}
FUNCTION {format.editors}
{ editor empty$
    'skip$
    {
		author empty$
			{"editor"}
			{#1 'middle.edt := 
    		  bother #0 =
   				{"nothing"}
   		  		{"editor"}
   		 	  if$
			}
		if$  
	  	format.author.editor
      editor num.names$ #1 >
        { " (Eds.)" }
        { " (Ed.)" }
      if$
      write$ 
		author empty$
			'newline$
			'skip$
		if$
    }
  if$
}

FUNCTION {format.authors}
{ #0 'middle.edt :=
  author empty$
    'skip$
    {"author"  format.author.editor}
  if$
}


FUNCTION {format.middle.editors}
{ editor empty$
  author empty$
  or
    'skip$
    { write$
      "."  write$
      newline$
    	#1 'middle.edt :=
      "In "  write$
         
      format.editors 
      ""
	  	#0 'middle.edt :=
    }
  if$
}


FUNCTION {cite.author.editor}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ 
  #2 >
    {  " et~al." * }
    {s num.names$ #2 =
    	  { s #2 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
      			{ " et~al."  * }
     				{ " and "  s #2 "{vv~}{ll}" format.name$ * *}
     			if$
     		}
     		'skip$
     if$
    }
  if$
}

FUNCTION {check.auth.edit.org}
{author empty$
		{
			editor empty$
					'format.organization
					{editor cite.author.editor}
			if$		
		}
		{author cite.author.editor}
 if$	
}


FUNCTION {check.year}
{year empty$
		{""}
		{year extra.label *
		}
	if$	
}



FUNCTION {output.bibitem}
{ newline$
  "\bibitem"
  "nameyear" is.in.list
     {
 	    "[\protect\citeauthoryear{" * write$
	   			check.auth.edit.org write$ 
	   	"}{" write$ 
	   			check.year write$ 
	   	"}]" 
    }
    'skip$
  if$
  "alpha" is.in.list
     {
 	    "[" * write$
  	  label write$
	    "]" 
    }
    'skip$
  if$

  "{" * write$  
  cite$ write$
  "}" write$

  newline$
  "" before.all 'output.state :=
}

FUNCTION {string.to.integer}
{ 't :=
  t text.length$ 'k :=
  #1 'char.num :=
      { t char.num #1 substring$ 's :=
	 	  s is.num
	 	  s "." =
	 	  or 
	 	  char.num k = not
	 	  and
	 	 	}
	 	 {char.num #1 + 'char.num :=}
  while$
  t #1 char.num substring$ 
}
FUNCTION {check.chapter}
{ #0 'char.num :=
      chapter text.length$ #10 >
				  {#1 'char.num :=}
				  'skip$
			if$
		char.num
}

 
FUNCTION {find.integer}
{ 't :=
  #0 'int :=
    { int not
      t empty$ not
      and
    }
    { t #1 #1 substring$ 's :=
    	s is.num 
        {#1 'int :=}
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  int 
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title }
  if$
}

FUNCTION {note.presented}
{note #1 #9 substring$ "presented" = 
 	note #1 #9 substring$ "Presented" = 
  or
}
 
FUNCTION {n.filter}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "," =
      t #1 #1 substring$ "\" =
      or
            {  "" *
                  t #2 global.max$ substring$ 't :=
            }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}


FUNCTION {format.month}
{ month empty$
'skip$
{month sort.format.month}
if$
}
FUNCTION {formatpatent.date}
{ year empty$
    'skip$
    { month empty$
       { year }
        {format.month " " * year *}
      if$
    }
  if$
}

FUNCTION {bcomment}
{ "comment" make.tag}


FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {format.volume}
{ volume empty$
    { "book" type$ =
    		{number empty$
    			{""}
    			{"Vol.~" 
    				#0 bother =
						{number}
						{"\bseriesno{" number * "}" *}
    				if$
    				*
    			}
    			if$
    		}
    		{""} 
      if$
    }
	{"Vol.~" 
    	#0 bother =
			{volume}
			{"\bseriesno{" volume * "}" *}
    	if$
    	*
    }
  if$
}



FUNCTION {format.series}
{ series empty$
		{""} 
    { #0 bother =
			{"\textit{"}
		    {"\bsertitle{"}
    	if$
    	series * "}" *
    }
  if$
}

FUNCTION {format.series.vol.booktitle}{
			
		series empty$ not booktitle empty$ not or  
		 editor empty$ not author empty$ not
		 and and
			{insert.comma}
			{series empty$ not booktitle empty$ not or 
				'new.sentence
				'skip$
			 if$
			}
		 if$
			
			booktitle empty$
				'skip$
				{
          editor empty$  
          author empty$ not
          and 
            {"In " booktitle "btitle" make.tag *}
            {booktitle "btitle" make.tag} 
          if$
          output
          series empty$ 
            'skip$
            'new.sentence
          if$
        }
			if$			
			format.series output
}


FUNCTION {format.edition}
{ edition empty$
    { "" }
    { "" 'v :=
			"" 'l :=    
			"" 'f :=    
    	edition "l" change.case$ 's :=
 				"1" s =
 				"first" s =  			
   			or
   				{
   					"1" 'v :=
						"st" 'l :=  
   				}
   				{
 						"2" s =
 						"second" s =  			
   					or
   						{
   							"2" 'v :=
								"nd" 'l :=  
   						}
   						{
 								"3" s =
 								"third" s =  			
   							or
   								{
   									"3" 'v :=
										"rd" 'l :=  
   								}
   								{
 										"4" s =
 										"fourth" s =  			
   									or
   										{
   											"4" 'v :=
												"th" 'l :=  
   										}
   										{
 												"5" s =
 												"fifth" s =  			
   											or
   												{
   													"5" 'v :=
														"th" 'l :=  
   												}
   												{
 														"6" s =
 														"sixth" s =  			
										   			or
   														{
   															"6" 'v :=
																"th" 'l :=  
										   				}
										   				{
												 				"7" s =
												 				"seventh" s =  			
												   			or
												   				{
												   					"7" 'v :=
																		"th" 'l :=  
												   				}
												   				{
														 				"8" s =
														 				"eighth" s =  			
														   			or
														   				{
														   					"8" 'v :=
																				"th" 'l :=  
														   				}
														   				{
																 				"9" s =
																 				"nineth" s =  			
																   			or
																   				{
																   					"9" 'v :=
																						"th" 'l :=  
																   				}
																   				{
   																						edition "t" change.case$ 'f :=
  																 				}
																   			if$	 
														   				}
														   			if$	 
												   				}
												   			if$	 
										   				}
   													if$	 
								   				}
								   			if$	 
						   				}
						   			if$	 
				   				}
				   			if$	 
   						}
   					if$	 
   				}
   			if$	 
   		 #0 bother =		
   				{	f "" =
   						{ v l *	'f :=}
   						'skip$
   					if$
   				}
   				{	f "" =
   						{ "\bedition{" v * "}" * l *	'f :=}
   						{ "\bedition{" f * "}" *	'f :=}
   					if$
   				}
   		if$
   		f " ed." *
    }
  if$
}
FUNCTION {format.isbn}
{ isbn empty$
    { "" }
    { "ISBN "
      #0 bother =
          {isbn}
          {"\bisbn{"  isbn * "}" *}
      if$
      *
		}	
  if$
}


FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
	"" 'l :=

    {t empty$ not}
    { t #1 #1 substring$  's :=
    	
      s is.num not
        { "" l = not
        		{t find.integer 
								{#1 'multiresult := }
								{#0 'multiresult := }
       		 		if$
       		 		"" 't :=
       			}
       			{
       			t #2 global.max$ substring$ 't :=
       			}
       		if$	
        }
        { l  s * 'l :=
        	t #2 global.max$ substring$ 't := 
        }
      if$
    }
  while$
  multiresult 
}
FUNCTION {clearpage}
{ 't :=
	"" 's :=
	"" 'l :=
	
    { t empty$ not }
    {
    	t #1 #1 substring$ 's :=
      s is.num not
				'skip$
        {	l  s * 'l := 	}
      if$
      t #2 global.max$ substring$ 't :=
		}
  while$
  l
       
}
FUNCTION {do.pages}
{'t :=
	"" 'j :=
	"" 'v :=
    {t empty$ not}
    { t #1 #1 substring$  's :=
      s is.num not
      s "-" = 
      and
        {"" j = 
       			{
       				t #2 global.max$ substring$ 't :=
       			}
        		{t find.integer 
								{ t   'v := }
								'skip$
       		 		if$
       		 		"" 't := 
       			}
       		if$	
        }
        {	j  s * 'j :=
          	t #2 global.max$ substring$ 't := 
        }
      if$
    }
  while$
  j   'j :=
  j  "fpage" make.tag "--"  * v "lpage" make.tag *
}


FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        {type$ "article" =
        	{""}
        	{"pp. "} 
         if$	
        	pages do.pages *
        }
        {type$ "article" =
        	{""}
        	{"p." } 
         if$	
        	pages clearpage "fpage" make.tag *
        }

      if$
    }
  if$
}

FUNCTION {format.edn.vol.pages}{
	volume empty$ edition empty$ pages empty$
	and and
	edition empty$ pages empty$ series empty$ not booktitle empty$ not
	and and and 
	or
		'skip$
		{	"(" 
			format.edition *
      edition empty$ 
      volume empty$
      or
        'skip$
        { ", " * }
      if$
      format.volume *
      volume empty$ edition empty$ and
      pages empty$
      or
        'skip$
        {", " *}
      if$
      format.pages *
      ")" * output
		}
	if$
}

FUNCTION {format.art.vol}
{ 
 volume empty$
	{""}
	{volume n.filter "volume" make.tag}
  if$
	number empty$
    'skip$
    { "(" number "issue" make.tag * ")" * * }
  if$
}

FUNCTION {replace.tilde}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "~" =
            {   { t #1 #1 substring$ "~" = }
                { "\texttildelow " *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {string.in.url}{
  'temp.str :=
  url 't :=
  #0 'return :=
  #0 'done :=
  temp.str text.length$ 'str.length :=
  str.length #0 >
  	{ 
	    { done not
	      t empty$ not
	      and
	    }
	    { t #1 str.length substring$ temp.str =
	        { #1 'return := 
	          #1 'done := 
	        }
	        { t text.length$ str.length = 
	        	  {#1 'done := }
	            {t #2 global.max$ substring$ 't := }
	          if$
	        }
	      if$
	    }
	  while$
		}
		'skip$
	if$	  
  return 
}

FUNCTION {doi.in.url}{
  doi empty$
	  {#0}
	  {doi string.in.url}
  if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
		{doi.in.url #1 =
		   {""}
			 {"\url{" url replace.tilde * "}" * }
		 if$
		} 
  if$
}

FUNCTION {format.doi}
{ doi empty$
	{""}
	{
	 "nodoi" is.in.list
    	{""}
      {"doi:\doiurl{" doi * "}" *}
   if$
	}
  if$
}

FUNCTION {format.in.ed.booktitle}
{   
	booktitle empty$
		'skip$
		{booktitle "btitle" make.tag  output}
	if$

   	editor empty$
   		'new.sentence
   		'insert.comma
   	if$
   	%stack$ top$
   	
	format.middle.editors 
   	new.sentence
}


FUNCTION {format.tr.number}
{ type empty$
    { "Technical report" }
    'type
  if$
  
  number empty$
    'skip$
    { number tie.or.space.connect }
  if$
  output
}

FUNCTION {patent.number}
{ number empty$
		 'skip$
    { number }
  if$
}
INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}   
 
FUNCTION {format.inpres}
{ "l" change.case$ 't :=
      "in press: " #10
       "in press. " #10
        "in press " #9 t chop.word
      chop.word
     chop.word
  #1 global.max$ substring$
}

FUNCTION {bcomment.note}
{note empty$
'skip$
 {note format.inpres bcomment output}
 if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type 
    }
  if$
}

FUNCTION {format.chapter.and.note}
{note empty$ chapter empty$ organization empty$ and and
	'skip$
	{	chapter empty$
		"notnumber" last.label =
		or
			{organization.outputed #1 = 
       organization empty$ 
       or
          {note}
					{ organization 
            note empty$
              'skip$
              { ". " * note * }
            if$
          }
			 if$
       bcomment output
			}
			{
        "Chapter~" chapter *
        note empty$
          'skip$
          { ". " * note * }
        if$
        bcomment  output
      }
    if$
	}
	if$
		
}

FUNCTION {item.pabaiga}
{
  new.sentence
  type$ "unpublished" =
  		{	note empty$
  				'skip$
  				{note.presented
  						'skip$
  						{note output}
  				 if$		
  				}
  			if$	
  		}
		{
		  type$ "proceedings" =
				{author empty$ editor empty$ and
					'bcomment.note
		 			'format.chapter.and.note 
				 if$	
				}
	 			'format.chapter.and.note 
		 	if$		
 		}
	if$
  % new.sentence
  % format.isbn output
  new.sentence
  format.doi  output
	new.sentence 
  format.url output
  "." * write$ newline$
}

FUNCTION {insert.element}
{	element
	#0 bother =
  		{"{botherref}"}
  		{
	   	 type$ "article" =
			{"{barticle}"}
			'skip$
		 if$
		 type$ "book" =
		 type$ "proceedings" =
         type$ "manual" =
         type$ "booklet" =
         or or or 
			{"{bbook}"}
			'skip$
		 if$
		   
		 type$ "inbook" =
				{	"notnumber" last.label =
					{
						author empty$
						  	{"{bbook}"}
							{"{bchapter}"}
						if$	
					}
					{ 	author empty$ editor empty$ or
					  		{"{bbook}"}
							{"{bchapter}"}
						if$	
				  	}
				    if$	
			    }
				'skip$
		 if$
		
		 type$ "incollection" =
		 type$ "inproceedings" =
		 type$ "conference" =
		 or or
		    {"{bchapter}"}
			'skip$
		 if$

   		}
  if$
   * write$ newline$
}


FUNCTION {end.element}
{	"\end" 'element :=
	item.pabaiga
  insert.element
  "\endbibitem" write$ newline$
}
FUNCTION {begin.element}
{ "\begin" 'element :=
  #0 'organization.outputed :=
  insert.element
}
FUNCTION {assign.global.values}{

	%%%%%%%%%% base settings: #1->on, #0->off  
  info empty$
    'skip$
    { info "1" =
      	{#1 'default.info :=} 
      	{#0 'default.info :=}
      if$
		}
	if$
}
FUNCTION {print.info}{
	default.info
		{
			"%style="
			"alpha" is.in.list
				{"alpha"}
				{
					"nameyear" is.in.list
						{"nameyear"}
						{"number"}
					if$
				}
			if$
			*
			", sorted="
			*	
			"unsort" is.in.list
				{"no"}
				{"yes"}
			if$
			*

			"nodoi" is.in.list
				{", other options=nodoi" *}
				'skip$
			if$
			write$ newline$
		}
		'skip$
	if$	
}

FUNCTION {format.same.end}{
	format.edn.vol.pages
	new.sentence
  format.pub.address
	end.element      
}

FUNCTION {settings}
{
  	set.settings not
		{ 
		  assign.global.values
		  #1 'set.settings :=
		  print.info
		}
		'skip$
	if$
}

function{after.names}{ 	

	add.period$ 
	after.block  'output.state :=
}

FUNCTION {article}
{ output.bibitem
	author empty$
	institution empty$ 
	editor empty$
	and and
	journal empty$ 
  	year empty$ 
 	or or 
		{#0 'bother :=} 
		{ 
		  volume empty$ pages  empty$ %doi empty$ not
          or %and
			  {
  			  volume empty$ pages  empty$ doi empty$ not
  			  and and   
    			  {#1 'bother :=}
		   	    {#0 'bother :=}
			    if$ 
			  } 
			  {#1 'bother :=}
        if$ 			
			} 
	if$		
	begin.element
	author empty$
    	{ editor empty$
    		'skip$
     		'format.editors
    	  if$
    	}
    	{ format.authors after.names}
  	if$

	format.date output
  	year empty$
		'skip$
		'new.sentence
	if$
	format.title "atitle" make.tag output
	new.sentence
	journal empty$
		{fjournal empty$
			'skip$
			{fjournal "jtitle" make.tag output}
		 if$	
		}
    	{journal "jtitle" make.tag output}
	if$
	insert.comma
    volume empty$
    	'skip$
		{format.art.vol output }
		if$
	insert.comma
    format.pages output
	end.element
}

FUNCTION {patent}
{ output.bibitem
	#0 'bother :=
	begin.element
	author empty$
    	'skip$
    	{ format.authors after.names}
  	if$
	format.date output
	new.sentence
  format.title "title" output.check
	patent.number output
	insert.comma
  formatpatent.date output
	end.element
}

FUNCTION { other } { patent }

FUNCTION {book}
{ output.bibitem
	author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	title empty$ 
  year empty$ 
 	or or 
		{#0 'bother :=} 
		{
			publisher empty$ address empty$ not and
				{#0 'bother :=} 
				{#1 'bother :=}
			if$
		} 
	if$	
	begin.element
	author empty$
    	{ editor empty$
    		'skip$
     		'format.editors
    	  if$
    	}
    	{ format.authors after.names}
  	if$
	format.date output
  new.sentence
 	format.title "btitle" make.tag output
  series empty$
    'skip$
    'new.sentence
  if$
	format.series output 
	format.same.end
}

FUNCTION {booklet}
{output.bibitem
	author empty$
	title empty$ 
  	year empty$ 
 	howpublished empty$  
   	or or or
		{#0 'bother :=} 
		{#1 'bother :=} 
	if$	

	begin.element
  	author empty$
 		 'skip$
  		{format.authors after.names}
  	if$
	format.date output
	new.sentence
  	format.title "btitle" make.tag output
  	format.same.end
}
FUNCTION {misc}
{output.bibitem
 	#0 'bother :=
	begin.element
  author empty$
    'skip$
    {format.authors after.names}
  if$
	format.date output
	new.sentence
  format.title "title" output.check
  format.same.end
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	series empty$
	chapter empty$
	and
  year empty$ 
 	or or
		{#0 'bother :=} 
		{
			publisher empty$ address empty$ not and
				{#0 'bother :=} 
				{#1 'bother :=}
			if$
		} 
	if$	

	chapter empty$
		{	"" 'last.label :=}
  		{chapter text.length$ #10 <
  			{	"" 'last.label :=}
        {	"notnumber" 'last.label :=}
			 if$
  		}
  	if$
	begin.element
	author empty$
    	{ editor empty$
    		'skip$
     		'format.editors
    	  if$
    	}
    	{ format.authors after.names}
  	if$
	format.date output
	new.sentence
    
    title empty$
  		{
  		 chapter empty$
  		 	'skip$
        {"notnumber" last.label =
            {chapter "btitle" make.tag output}
            'skip$
           if$
        }
      if$  		
  		}
  		{format.title "ctitle" make.tag output}
   	if$
	%new.sentence
	format.middle.editors
  format.series.vol.booktitle
	format.same.end
}

FUNCTION {incollection}
{ output.bibitem
  author empty$
	editor empty$
	organization empty$ 
	and and
	booktitle empty$ 
	title empty$
  year empty$ 
 	or or or
		{#0 'bother :=} 
		{
			publisher empty$ address empty$ not and
			type$ "incollection" = 
			and
				{#0 'bother :=} 
				{#1 'bother :=}
			if$
		} 
	if$	
	begin.element
  	author empty$
    	{ editor empty$
    		{
    			organization empty$
        			'skip$
        			{ format.organization "institute" make.tag output stupid.colon}
      	  		if$
      	    }
      	    'format.editors
      	    if$
    	}
    	{ format.authors after.names}
	if$
	format.date output
	new.sentence
  format.title "ctitle" make.tag output
	%new.sentence
	format.middle.editors
  format.series.vol.booktitle
  format.same.end
}

FUNCTION {inproceedings}{incollection}

FUNCTION {conference}{incollection}

FUNCTION {manual}
{ output.bibitem
	author empty$
	organization empty$ 
	title empty$ 
  year empty$ 
 	address  empty$ 
   	or or or or
		{#0 'bother :=} 
		{#1 'bother :=} 
	if$	
	begin.element

  author empty$
    	{ organization empty$
        	'skip$
        	{ format.organization "institute" make.tag output stupid.colon}
      	  if$
    	}
    	{ format.authors after.names}
	if$
	format.date output
	new.sentence
  		
	title empty$
    'skip$
    {format.title "btitle" make.tag output}
  if$
  format.same.end
}


FUNCTION {phdthesis}
{output.bibitem
	#0 'bother :=

	begin.element
  	author empty$
 		 'skip$
  		{format.authors after.names}
  	if$
	format.date output
	new.sentence
  
    format.title output
	new.sentence
  type$ "mastersthesis"  =
    {"Master's thesis" format.thesis.type output.nonnull}
    {"PhD thesis" format.thesis.type output.nonnull}
  if$		
  school empty$
    'skip$
    { insert.comma }
  if$
  school "school" output.check
  address empty$
    'skip$
    { insert.comma address output}
  if$
	end.element
}
FUNCTION {mastersthesis}{phdthesis}


FUNCTION {proceedings}
{ output.bibitem
	author empty$
	institution empty$ 
	organization empty$ 
	editor empty$
	and and and
	booktitle empty$ 
	title empty$
	and 
  year empty$ 
 	or or 
		{#0 'bother :=} 
		{#1 'bother :=}
	if$	
	begin.element
  author empty$
    { editor empty$
        {format.organization "institute" make.tag output stupid.colon}
        'format.editors
      if$ 
    }
    { format.authors after.names}
  if$
  
	format.date output
	new.sentence
  format.title "btitle" make.tag output
  format.series.vol.booktitle
	format.same.end
}	

FUNCTION {techreport}
{output.bibitem
	#0 'bother :=

	begin.element
  	author empty$
      'skip$
  		{format.authors after.names}
  	if$
    format.date output
    new.sentence
    
  	format.title output
    new.sentence
  	format.tr.number
  	address empty$
    	'new.sentence
     	{insert.comma address output}
  	if$
  	
  	institution empty$
  	address empty$
  	and
    	'skip$
     	{ insert.comma }
  	if$
  	institution output
	end.element
}

FUNCTION {unpublished}
{output.bibitem
	#0 'bother :=

	begin.element
  	author empty$
      'skip$
  		{format.authors after.names}
  	if$
  	format.date output
    new.sentence
  	format.title "title" output.check
  	title empty$
  		'skip$
  		{new.sentence}
  	if$
  	note empty$
    	'skip$
  		{note.presented 
  			{note output}
    		'skip$
  		 if$
  		}
  	if$
	end.element
}

FUNCTION {default.type} { unpublished }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { et.al.char.used }

FUNCTION {initialize.et.al.char.used}{ 
  #0 'et.al.char.used :=
}

FUNCTION {assign.opt}{  
  "settings" type$ =
  	{options empty$
		'skip$
  		{options 'list.string :=}
  	 if$
  	}
  	'skip$
  if$
}

FUNCTION {set.default.opt}{	
  "unsort,nameyear" 'list.string :=
}

EXECUTE {set.default.opt}

ITERATE {assign.opt}
EXECUTE {initialize.et.al.char.used}

FUNCTION {alpha.format.lab.names}
{ 's :=
  s num.names$ 'numnames :=
  numnames #1 >
    { numnames #4 >
        { #3 'namesleft := }
        { numnames 'namesleft := }
            if$
            #1 'nameptr :=
            ""
        { namesleft #0 > }
        { nameptr numnames =
            { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
          { "+" *
            #1 'et.al.char.used :=
          }
          { s nameptr "{v{}}{l{}}" format.name$ * }
              if$
            }
            { s nameptr "{v{}}{l{}}" format.name$ * }
          if$
          nameptr #1 + 'nameptr :=
          namesleft #1 - 'namesleft :=
        }
      while$
      numnames #4 >
        { "+" *
          #1 'et.al.char.used :=
        }
        'skip$
      if$
    }
    { s #1 "{v{}}{l{}}" format.name$
      duplicate$ text.length$ #2 <
        { pop$ s #1 "{ll}" format.name$ #3 text.prefix$ }
        'skip$
      if$
    }
  if$
}

FUNCTION {standart.format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { " and " * s #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.lab.names}{
	"alpha" is.in.list
		'alpha.format.lab.names
	  'standart.format.lab.names
	if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
%	    { cite$ #1 #3 substring$ }
	    { "zzz" }
	    { key #3 text.prefix$ }
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
	{ organization empty$
%	    { cite$ #1 #3 substring$ }
	    { "zzz" }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
	{ organization empty$
%	    { cite$ #1 #3 substring$ }
	    { "zzz" }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list

  "alpha" is.in.list
  {
    duplicate$
    year field.or.null purify$ #-1 #2 substring$
    *
    'label :=
    year field.or.null purify$ #-1 #4 substring$
    *
    sortify 'sort.label :=
  }
  {
    "("
    *
    year duplicate$ empty$
    short.list key field.or.null = or
      { pop$ "" }
      'skip$
    if$
    *
    'label :=
    label 'sort.label :=
  } 
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * 
          "alpha" is.in.list
            'skip$
            {numnames int.to.str$ * "   " *}
          if$
        }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = 
      t "others" = 
      and
        { "et al" * }
        { t sortify * }
      if$
		#3 numnames  <
		"alpha" is.in.list not
		and
  			{#0 'namesleft :=
  				 	" zzz   " *
  			}    
	      {
	     	  nameptr #1 + 'nameptr :=
  	    	namesleft #1 - 'namesleft :=
  	    }
  	  if$  	
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "zzz" }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "z" }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "z" }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "z" }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  sort.label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
 		{author empty$
   		'editor.organization.sort
      'author.organization.sort
     if$
    }
    { type$ "proceedings" =
      type$ "incollection" =
       or
    		{author empty$
        		'editor.organization.sort
            'author.organization.sort
        if$
        }
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$ 'sort.label :=
  sort.label *
  #1 entry.max$ substring$ 'sort.key$ :=
  
  "settings" type$ =
  	{"aaa"}
  	{"unsort" is.in.list
    	{"bb"}
    	{"alpha" is.in.list
    		{sort.key$}
    		{sort.label}
      	if$  
   		}
  	 if$
  	}
  	if$
  'sort.key$ :=
}


ITERATE {presort}

SORT

INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'j :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ j "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'j :=
  label extra.label * 'label :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {write.preamble}
{ "\begin{thebibliography}{" number.label int.to.str$ * "}" * write$ newline$
	"% BibTex style file: ios2-nameyear.bst, 2016-09-16" write$ newline$
	"\ifx \bisbn   \undefined \def \bisbn  #1{ISBN #1}\fi" write$ newline$
	"\ifx \binits  \undefined \def \binits#1{#1} \fi" write$ newline$
	"\ifx \bauthor  \undefined \def \bauthor#1{#1} \fi" write$ newline$
	"\ifx \bjtitle  \undefined \def \bjtitle#1{\textit{#1}}\fi" write$ newline$
	"\ifx \batitle  \undefined \def \batitle#1{#1} \fi" write$ newline$
	"\ifx \bctitle  \undefined \def \bctitle#1{#1} \fi" write$ newline$
	"\ifx \bvolume  \undefined \def \bvolume#1{#1}\fi" write$ newline$
	"\ifx \byear  \undefined \def \byear#1{#1} \fi" write$ newline$
	"\ifx \bissue  \undefined \def \bissue#1{#1} \fi" write$ newline$
	"\ifx \bfpage  \undefined \def \bfpage#1{#1} \fi" write$ newline$
	"\ifx \blpage  \undefined \def \blpage #1{#1} \fi" write$ newline$
	"\ifx \url  \undefined \def \url#1{#1} \fi" write$ newline$
	"\ifx \doiurl  \undefined \def \doiurl#1{#1} \fi" write$ newline$
	"\ifx \betal  \undefined \def \betal{et al.} \fi" write$ newline$
	"\ifx \binstitute  \undefined \def \binstitute#1{#1} \fi" write$ newline$
	"\ifx \beditor  \undefined \def \beditor#1{#1} \fi" write$ newline$
	"\ifx \bpublisher  \undefined \def \bpublisher#1{#1} \fi" write$ newline$
	"\ifx \bbtitle  \undefined \def \bbtitle#1{\textit{#1}} \fi" write$ newline$
	"\ifx \bedition  \undefined \def \bedition#1{#1} \fi" write$ newline$
	"\ifx \bseriesno  \undefined \def \bseriesno#1{\textit{#1}} \fi" write$ newline$
	"\ifx \blocation  \undefined \def \blocation#1{#1} \fi" write$ newline$
	"\ifx \bsertitle  \undefined \def \bsertitle#1{\textit{#1}} \fi" write$ newline$
	"\ifx \bsnm \undefined \def \bsnm#1{#1} \fi" write$ newline$
	"\ifx \bsuffix \undefined \def \bsuffix#1{#1} \fi" write$ newline$
	"\ifx \bparticle \undefined \def \bparticle#1{#1} \fi" write$ newline$
	"\ifx \barticle \undefined \def \barticle#1{#1} \fi" write$ newline$
	
}


FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { 
    	preamble$ write$ newline$ 
    }
  if$
  
  write.preamble
  "\ifx \botherref \undefined \def \botherref #1{#1} \fi" write$ newline$
  "\ifx \url \undefined \def \url#1{#1} \fi" write$ newline$
	"\ifx \bchapter \undefined \def \bchapter#1{#1} \fi" write$ newline$
	"\ifx \bbook \undefined \def \bbook#1{#1} \fi" write$ newline$
	"\ifx \bcomment \undefined \def \bcomment#1{#1} \fi" write$ newline$
	"\ifx \oauthor \undefined \def \oauthor#1{#1} \fi" write$ newline$
	"\ifx \citeauthoryear \undefined \def \citeauthoryear#1{#1} \fi" write$ newline$
	"\ifx \bconflocation \undefined \def \bconflocation#1{#1} \fi" write$ newline$
	"\ifx \texttildelow  \undefined \def \texttildelow{\symbol{126}} \fi" write$ newline$
	"\def \endbibitem {}" write$ newline$
}
EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
 "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}




