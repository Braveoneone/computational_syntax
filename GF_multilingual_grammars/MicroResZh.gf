resource MicroResZh = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;


  Agreement = Agr Number ; ---s Person to be added

  -- all forms of normal Eng verbs, although not yet used in MiniGrammar
  VForm = Inf | PresSg3 | Past | PastPart
   | PresPart ; 

oper
  Noun : Type = {s : Number => Str} ;

  mkNoun : Str -> Str -> Noun = \sg,pl -> {
    s = table {Sg => sg ; Pl => pl}
    } ;

  regNoun : Str -> Noun = \sg -> mkNoun sg (sg + "们") ;

  -- smart paradigm
  smartNoun : Str -> Noun = \sg -> case sg of {
    _ + _ => regNoun sg ;
    x + "y" => mkNoun sg (x + "们") ;
    _ + _  => mkNoun sg (sg + "们") ;
    _ => regNoun sg
    } ;

  Adjective : Type = {s : Str} ;

  Verb : Type = {s : VForm => Str} ;

  mkVerb : (inf,pres,past,pastpart,prespart : Str) -> Verb
    = \inf,pres,past,pastpart,prespart -> {
    s = table {
      Inf => inf ;
      PresSg3 => pres ;
      Past => past ;
      PastPart => pastpart ;
      PresPart => prespart
      }
    } ;

  regVerb : (inf : Str) -> Verb = \inf ->
    mkVerb inf ("在" + inf) ("之前" + inf ) (inf + "了") ("正在" + inf) ; --他正在

  -- regular verbs 
  smartVerb : Str -> Verb = \inf -> case inf of {
     _ => mkVerb inf (inf + " ") (inf + " ") (inf + " ") (inf + " ") ;
     _ => regVerb inf
     } ;

  Verb2 : Type = Verb ** {c : Str} ;

  be_Verb : Verb = mkVerb "是" "是" "曾经是" "已经是" "正在是" ; ---s to be generalized


---s a very simplified verb agreement function for Micro
  agr2vform : Agreement -> VForm = \a -> case a of {
    Agr Sg => PresSg3 ;
    Agr Pl => Inf
    } ;

}
