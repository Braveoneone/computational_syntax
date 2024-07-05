--# -path=.:../abstract
concrete MicroLangZh of MicroLang = open MicroResZh, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Str} ; ---s special case of Mini
    Comp = {s : Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; n : Number} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    Adv = {s : Str} ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb.s ! agr2vform np.a ++ vp.compl
      } ;
      
    UseV v = {
      verb = v ;
      compl = [] ;
      } ;
      
    ComplV2 v2 np = {
      verb = v2 ;
      compl = v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseComp comp = {
      verb = be_Verb ;     -- the verb is the copula "be"
      compl = comp.s
      } ;
      
    CompAP ap = ap ;
      
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;
      
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ;
      a = Agr det.n ;
      } ;
      
    UsePron p = p ;
    --- different Chinese words with different determinent for animals the det should be "一只" instead of "一个"        
    a_Det = {s = pre {  "马"|"猫"|"牛"|"动物"|"狗" => "一只" ; 
                        "船"=> "一艘"; 
                        "星星"=> "一颗"; 
                        "树木"=> "一棵"; 
                        "计算机"=> "一台"; 
                        "水"|"大海" => "一片";
                        "啤酒"|"红酒"|"牛奶"=> "一罐"; 
                        "自行车"|"火车"|"车"=> "一辆"; 
                        "宝宝"|"苹果"|"语言"|"大海"|"女人"|"男人"|"朋友"|"男孩"|"女孩"|"面包"|"音乐"|"语法" => "一个";
                        "云" => "一朵";
                        "城市"|"房子" => "一座";
                        "书" => "一个"  } ; n = Sg} ; aPl_Det = {s = "" ; n = Pl} ;
    
    the_Det = {s = "这个" ; n = Sg} ;
    thePl_Det = {s = "这些" ; n = Pl} ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    in_Prep = {s = "在里面"} ;
    on_Prep = {s = "在上面"} ;
    with_Prep = {s = "和"} ;

    he_Pron = {
      s = table {Nom => "他" ; Acc => "他"} ;
      a = Agr Sg ;
      } ;
    she_Pron = {
      s = table {Nom => "她" ; Acc => "她"} ;
      a = Agr Sg ;
      } ;
    they_Pron = {
      s = table {Nom => "他们" ; Acc => "他们"} ;
      a = Agr Pl ;
      } ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin already_Adv = mkAdv " " ;
lin animal_N = mkN "动物" ;
lin apple_N = mkN "苹果" ;
lin baby_N = mkN "宝宝" ;
lin bad_A = mkA "坏的" ;
lin beer_N = mkN "啤酒" ;
lin big_A = mkA "大的" ;
lin bike_N = mkN "自行车" ;
lin bird_N = mkN "鸟" ;
lin black_A = mkA "黑色的" ;
lin blood_N = mkN "血液" ;
lin blue_A = mkA "蓝色的" ;
lin boat_N = mkN "船" ;
lin book_N = mkN "书" ;
lin boy_N = mkN "男孩" ;
lin bread_N = mkN "面包" ;
lin brea_V2 = mkV2 (mkV "打破") ;
lin buy_V2 = mkV2 (mkV "购买") ;
lin car_N = mkN "车" ;
lin cat_N = mkN "猫" ;
lin child_N = mkN "孩子" "孩子们" ;
lin city_N = mkN "城市" ;
lin clean_A = mkA "干净的" ;
lin clever_A = mkA "聪明的" ;
lin cloud_N = mkN "云" ;
lin cold_A = mkA "寒冷的" ;
lin come_V = mkV "来" ;
lin computer_N = mkN "计算机" ;
lin cow_N = mkN "牛" ;
lin dirty_A = mkA "脏的" ;
lin dog_N = mkN "狗" ;
lin drink_V2 = mkV2 (mkV "喝" ) ;
lin eat_V2 = mkV2 (mkV "吃" ) ;
lin find_V2 = mkV2 (mkV "找到") ;
lin fire_N = mkN "火" ;
lin fish_N = mkN "鱼" ;
lin flower_N = mkN "花" ;
lin friend_N = mkN "朋友" ;
lin girl_N = mkN "女孩" ;
lin good_A = mkA "好的" ;
lin go_V = mkV "走" ;
lin grammar_N = mkN "语法" ;
lin green_A = mkA "绿色的" ;
lin heavy_A = mkA "重的" ;
lin horse_N = mkN "马" ;
lin hot_A = mkA "热的" ;
lin house_N = mkN "房子" ;
lin john_PN = mkPN "约翰" ;
lin jump_V = mkV "跳" ;
lin kill_V2 = mkV2 "杀" ;
lin language_N = mkN "语言" ;
lin live_V = mkV "活着" ;
lin love_V2 = mkV2 (mkV "爱") ;
lin man_N = mkN "男人" ;
lin milk_N = mkN "牛奶" ;
lin music_N = mkN "音乐" ;
lin new_A = mkA "新的" ;
lin now_Adv = mkAdv " " ;
lin old_A = mkA "老的" ;
lin paris_PN = mkPN "巴黎" ;
lin play_V = mkV "玩" ;
lin read_V2 = mkV2 (mkV "读") ;
lin ready_A = mkA "准备好的" ;
lin red_A = mkA "红色的" ;
lin river_N = mkN "河" ;
lin run_V = mkV "跑"  ;
lin sea_N = mkN "大海" ;
lin see_V2 = mkV2 (mkV "看" ) ;
lin ship_N = mkN "船" ;
lin sleep_V = mkV "睡觉" ;
lin small_A = mkA "小的" ;
lin star_N = mkN "星星" ;
lin swim_V = mkV "游泳" ;
lin teach_V2 = mkV2 (mkV "教") ;
lin train_N = mkN "火车" ;
lin travel_V = mkV "旅行" ;
lin tree_N = mkN "树木" ;
lin understand_V2 = mkV2 (mkV "理解") ;
lin wait_V2 = mkV2 "等待" "着" ;
lin walk_V = mkV "走" ;
lin warm_A = mkA "温暖的" ;
lin water_N = mkN "水" ;
lin white_A = mkA "白色的" ;
lin wine_N = mkN "红酒" ;
lin woman_N = mkN "女人" ;
lin yellow_A = mkA "黄色的" ;
lin young_A = mkA "年轻的" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> lin A {s = s} ;
  
  mkPN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    --    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
    --      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}
