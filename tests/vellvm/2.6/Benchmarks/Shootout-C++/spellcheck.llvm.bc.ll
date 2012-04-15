; ModuleID = 'spellcheck.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%struct._IO_marker = type { %struct._IO_marker*, %struct.__c_file*, i32 }
%struct.__c_file = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.__c_file*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__mbstate_t = type { i32, %struct..0._12 }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%struct.spell_checker = type { %"struct.std::map<std::pair<const char*, const char*>,int,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >" }
%"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >" = type { %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >::_Rb_tree_impl<std::less<std::pair<const char*, const char*> >,false>" }
%"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >::_Rb_tree_impl<std::less<std::pair<const char*, const char*> >,false>" = type { %"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >", %"struct.std::_Rb_tree_node_base", i32 }
%"struct.std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >" = type { %"struct.std::_Rb_tree_node_base", %"struct.std::pair<const std::pair<const char*, const char*>,int>" }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"struct.std::__basic_file<char>" = type { %struct.__c_file*, i8 }
%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>" = type { %"struct.std::basic_istream<char,std::char_traits<char> >.base" }
%"struct.std::basic_filebuf<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >", %struct.pthread_mutex_t, %"struct.std::__basic_file<char>", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i32, i8, i8, i8, i8, i8*, i8*, i8, %"struct.std::codecvt<char,char,__mbstate_t>"*, i8*, i32, i8*, i8* }
%"struct.std::basic_ifstream<char,std::char_traits<char> >" = type { %"struct.std::basic_istream<char,std::char_traits<char> >.base", %"struct.std::basic_filebuf<char,std::char_traits<char> >", %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* }
%"struct.std::basic_istream<char,std::char_traits<char> >" = type { i32 (...)**, i32, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_istream<char,std::char_traits<char> >.base" = type { i32 (...)**, i32 }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::codecvt<char,char,__mbstate_t>" = type { %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>", %struct.__locale_struct* }
%"struct.std::ctype<char>" = type { %"struct.std::basic_istream<char,std::char_traits<char> >.base", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::fpos<__mbstate_t>" = type { i64, %struct.__mbstate_t }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::basic_istream<char,std::char_traits<char> >.base"**, i32, %"struct.std::basic_istream<char,std::char_traits<char> >.base"**, i8** }
%"struct.std::map<std::pair<const char*, const char*>,int,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >" = type { %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >" }
%"struct.std::pair<const char*,const char*>" = type { i8*, i8* }
%"struct.std::pair<const std::pair<const char*, const char*>,int>" = type { %"struct.std::pair<const char*,const char*>", i32 }
%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>" = type { %"struct.std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >", i8 }

@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@_ZTVSt9basic_iosIcSt11char_traitsIcEE = external constant [4 x i32 (...)*] ; <[4 x i32 (...)*]*> [#uses=1]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external constant [16 x i32 (...)*] ; <[16 x i32 (...)*]*> [#uses=1]
@_ZNSt7codecvtIcc11__mbstate_tE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=2]
@_ZNSt5ctypeIcE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=1]
@_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=2]
@_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=2]
@_ZTVSt13basic_filebufIcSt11char_traitsIcEE = external constant [16 x i32 (...)*] ; <[16 x i32 (...)*]*> [#uses=1]
@_ZNSt8ios_base7goodbitE = external constant i32  ; <i32*> [#uses=1]
@_ZNSt8ios_base6badbitE = external constant i32   ; <i32*> [#uses=1]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE = external constant [4 x i8*] ; <[4 x i8*]*> [#uses=2]
@_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE = external constant [10 x i32 (...)*] ; <[10 x i32 (...)*]*> [#uses=2]
@.str1 = private constant [15 x i8] c"Usr.Dict.Words\00", align 1 ; <[15 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=3]
@_ZSt3cin = external global %"struct.std::basic_istream<char,std::char_traits<char> >" ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=5]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_main }] ; <[1 x %0]*> [#uses=0]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._12*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._12*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._12*)* @pthread_mutexattr_init ; <i32 (%struct..0._12*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._12*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._12*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._12*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._12*)*> [#uses=0]

define i32 @main() {
invcont:
  %__c_addr.i.i = alloca i8, align 1              ; <i8*> [#uses=2]
  %line.i9 = alloca [32 x i8], align 1            ; <[32 x i8]*> [#uses=2]
  %0 = alloca %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"*> [#uses=2]
  %1 = alloca %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"*> [#uses=2]
  %2 = alloca %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"*> [#uses=2]
  %3 = alloca %"struct.std::pair<const std::pair<const char*, const char*>,int>", align 8 ; <%"struct.std::pair<const std::pair<const char*, const char*>,int>"*> [#uses=6]
  %line.i = alloca [32 x i8], align 1             ; <[32 x i8]*> [#uses=3]
  %in.i = alloca %"struct.std::basic_ifstream<char,std::char_traits<char> >", align 8 ; <%"struct.std::basic_ifstream<char,std::char_traits<char> >"*> [#uses=45]
  %buff = alloca [4096 x i8], align 1             ; <[4096 x i8]*> [#uses=1]
  %spell = alloca %struct.spell_checker, align 8  ; <%struct.spell_checker*> [#uses=8]
  %4 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %4, align 8
  %5 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %6 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=7]
  %7 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=2]
  %8 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 1, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=3]
  %9 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32*> [#uses=16]
  store i32 0, i32* %9, align 4
  store i32 0, i32* %5, align 4
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %6, align 4
  %10 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=29]
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %7, align 4
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %8, align 4
  %11 = ptrtoint %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i to i32 ; <i32> [#uses=6]
  %12 = add i32 %11, 144                          ; <i32> [#uses=1]
  %13 = inttoptr i32 %12 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=13]
  %14 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 0 ; <%"struct.std::ios_base"*> [#uses=3]
  invoke void @_ZNSt8ios_baseC2Ev(%"struct.std::ios_base"* %14)
          to label %.noexc11.i unwind label %lpad.i

.noexc11.i:                                       ; preds = %invcont
  %15 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %15, align 8
  %16 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=2]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* null, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %16, align 8
  %17 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 2 ; <i8*> [#uses=2]
  store i8 0, i8* %17, align 4
  %18 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 3 ; <i8*> [#uses=2]
  store i8 0, i8* %18, align 1
  %19 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=2]
  store %"struct.std::basic_streambuf<char,std::char_traits<char> >"* null, %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %19, align 8
  %20 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=2]
  store %"struct.std::ctype<char>"* null, %"struct.std::ctype<char>"** %20, align 4
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 6 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"**> [#uses=2]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* null, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %21, align 8
  %22 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 7 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"**> [#uses=2]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* null, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %22, align 4
  %23 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %24 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=6]
  %.c7.i.i = bitcast i8* %23 to i32 (...)**       ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c7.i.i, i32 (...)*** %24, align 8
  %25 = getelementptr inbounds i8* %23, i32 -12   ; <i8*> [#uses=1]
  %26 = bitcast i8* %25 to i32*                   ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=1]
  %28 = add i32 %27, %11                          ; <i32> [#uses=1]
  %29 = inttoptr i32 %28 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %30 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %31 = bitcast i8* %30 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  %32 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %29, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %31, i32 (...)*** %32, align 4
  %33 = getelementptr %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 0, i32 1 ; <i32*> [#uses=3]
  store i32 0, i32* %33, align 4
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 3), i32 (...)*** %24, align 8
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 8), i32 (...)*** %15, align 8
  %34 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1 ; <%"struct.std::basic_filebuf<char,std::char_traits<char> >"*> [#uses=2]
  %35 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=6]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %35, align 8
  %36 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 1 ; <i8**> [#uses=2]
  store i8* null, i8** %36, align 4
  %37 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 2 ; <i8**> [#uses=2]
  store i8* null, i8** %37, align 8
  %38 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 3 ; <i8**> [#uses=2]
  store i8* null, i8** %38, align 4
  %39 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 4 ; <i8**> [#uses=2]
  store i8* null, i8** %39, align 8
  %40 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 5 ; <i8**> [#uses=2]
  store i8* null, i8** %40, align 4
  %41 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 6 ; <i8**> [#uses=2]
  store i8* null, i8** %41, align 8
  %42 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 7 ; <%"struct.std::locale"*> [#uses=4]
  call void @_ZNSt6localeC1Ev(%"struct.std::locale"* %42) nounwind
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt13basic_filebufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %35, align 8
  %43 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %43, align 8
  %44 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %44, align 4
  %45 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %45, align 8
  %46 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %47, align 8
  %48 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %48, align 4
  %49 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 1 ; <%struct.pthread_mutex_t*> [#uses=1]
  %50 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 2 ; <%"struct.std::__basic_file<char>"*> [#uses=6]
  invoke void @_ZNSt12__basic_fileIcEC1EP15pthread_mutex_t(%"struct.std::__basic_file<char>"* %50, %struct.pthread_mutex_t* %49)
          to label %invcont.i.i.i unwind label %lpad.i.i.i

invcont.i.i.i:                                    ; preds = %.noexc11.i
  %51 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 3 ; <i32*> [#uses=2]
  store i32 0, i32* %51, align 8
  %52 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 4, i32 0 ; <i32*> [#uses=2]
  store i32 0, i32* %52, align 4
  %53 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 4, i32 1, i32 0 ; <i32*> [#uses=2]
  store i32 0, i32* %53, align 4
  %54 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 5, i32 0 ; <i32*> [#uses=2]
  store i32 0, i32* %54, align 4
  %55 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 5, i32 1, i32 0 ; <i32*> [#uses=2]
  store i32 0, i32* %55, align 4
  %56 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 6, i32 0 ; <i32*> [#uses=2]
  store i32 0, i32* %56, align 4
  %57 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 6, i32 1, i32 0 ; <i32*> [#uses=2]
  store i32 0, i32* %57, align 4
  %58 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 7 ; <i8**> [#uses=4]
  store i8* null, i8** %58, align 4
  %59 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 8 ; <i32*> [#uses=2]
  store i32 8192, i32* %59, align 8
  %60 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 9 ; <i8*> [#uses=3]
  %61 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 13 ; <i8**> [#uses=1]
  %62 = bitcast i8* %60 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %62, align 4
  store i8* null, i8** %61, align 8
  %63 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 14 ; <i8**> [#uses=1]
  store i8* null, i8** %63, align 4
  %64 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 15 ; <i8*> [#uses=1]
  store i8 0, i8* %64, align 8
  %65 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 16 ; <%"struct.std::codecvt<char,char,__mbstate_t>"**> [#uses=2]
  store %"struct.std::codecvt<char,char,__mbstate_t>"* null, %"struct.std::codecvt<char,char,__mbstate_t>"** %65, align 4
  %66 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 17 ; <i8**> [#uses=1]
  store i8* null, i8** %66, align 8
  %67 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 18 ; <i32*> [#uses=1]
  store i32 0, i32* %67, align 4
  %68 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 19 ; <i8**> [#uses=1]
  store i8* null, i8** %68, align 8
  %69 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 20 ; <i8**> [#uses=1]
  store i8* null, i8** %69, align 4
  %70 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7codecvtIcc11__mbstate_tE2idE)
          to label %invcont.i.i.i.i unwind label %lpad.i.i.i.i ; <i32> [#uses=2]

invcont.i.i.i.i:                                  ; preds = %invcont.i.i.i
  %71 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0, i32 7, i32 0 ; <%"struct.std::locale::_Impl"**> [#uses=2]
  %72 = load %"struct.std::locale::_Impl"** %71, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %73 = getelementptr inbounds %"struct.std::locale::_Impl"* %72, i32 0, i32 2 ; <i32*> [#uses=1]
  %74 = load i32* %73, align 4                    ; <i32> [#uses=1]
  %75 = icmp ugt i32 %74, %70                     ; <i1> [#uses=1]
  br i1 %75, label %_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i.i

lpad.i.i.i.i:                                     ; preds = %invcont.i.i.i
  %eh_ptr.i.i.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i.i: ; preds = %invcont.i.i.i.i
  %76 = getelementptr inbounds %"struct.std::locale::_Impl"* %72, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %77 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %76, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %78 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %77, i32 %70 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %79 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %78, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=1]
  %phitmp.i.i1.i = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %79, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i1.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i.i, label %bb.i1.i.i

bb.i1.i.i:                                        ; preds = %_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i.i
  %80 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7codecvtIcc11__mbstate_tE2idE)
          to label %.noexc.i.i.i unwind label %lpad13.i.i.i ; <i32> [#uses=2]

.noexc.i.i.i:                                     ; preds = %bb.i1.i.i
  %81 = load %"struct.std::locale::_Impl"** %71, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %82 = getelementptr inbounds %"struct.std::locale::_Impl"* %81, i32 0, i32 2 ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=1]
  %84 = icmp ugt i32 %83, %80                     ; <i1> [#uses=1]
  br i1 %84, label %bb.i.i.i3.i, label %bb1.i.i.i4.i

bb.i.i.i3.i:                                      ; preds = %.noexc.i.i.i
  %85 = getelementptr inbounds %"struct.std::locale::_Impl"* %81, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %86 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %85, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %87 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %86, i32 %80 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %88 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %87, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=2]
  %89 = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %88, null ; <i1> [#uses=1]
  br i1 %89, label %bb1.i.i.i4.i, label %invcont1.i2.i.i

bb1.i.i.i4.i:                                     ; preds = %bb.i.i.i3.i, %.noexc.i.i.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc1.i.i.i unwind label %lpad13.i.i.i

.noexc1.i.i.i:                                    ; preds = %bb1.i.i.i4.i
  unreachable

invcont1.i2.i.i:                                  ; preds = %bb.i.i.i3.i
  %90 = bitcast %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %88 to %"struct.std::codecvt<char,char,__mbstate_t>"* ; <%"struct.std::codecvt<char,char,__mbstate_t>"*> [#uses=1]
  store %"struct.std::codecvt<char,char,__mbstate_t>"* %90, %"struct.std::codecvt<char,char,__mbstate_t>"** %65, align 4
  br label %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i.i

invcont8.i.i.i:                                   ; preds = %lpad13.i.i.i, %lpad.i.i.i
  %eh_exception.0.i.i.i = phi i8* [ %eh_ptr.i3.i.i, %lpad.i.i.i ], [ %eh_ptr14.i.i.i, %lpad13.i.i.i ] ; <i8*> [#uses=1]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %35, align 8
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %42) nounwind
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i.i)
          to label %.noexc5.i.i unwind label %lpad19.i.i

.noexc5.i.i:                                      ; preds = %invcont8.i.i.i
  unreachable

lpad.i.i.i:                                       ; preds = %.noexc11.i
  %eh_ptr.i3.i.i = call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select12.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i3.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %invcont8.i.i.i

lpad13.i.i.i:                                     ; preds = %bb1.i.i.i4.i, %bb.i1.i.i
  %eh_ptr14.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select16.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr14.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"* %50)
          to label %invcont8.i.i.i unwind label %lpad17.i.i.i

lpad17.i.i.i:                                     ; preds = %lpad13.i.i.i
  %eh_ptr18.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=1]
  %eh_select20.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr18.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i.i: ; preds = %invcont1.i2.i.i, %_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i.i, %invcont.i.i.i.i
  %91 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 0 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  invoke void @_ZNSt8ios_base7_M_initEv(%"struct.std::ios_base"* %14)
          to label %.noexc4.i.i unwind label %lpad23.i.i

.noexc4.i.i:                                      ; preds = %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i.i
  %92 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 0, i32 11 ; <%"struct.std::locale"*> [#uses=1]
  %93 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt5ctypeIcE2idE)
          to label %invcont.i.i6.i.i unwind label %lpad.i.i9.i.i ; <i32> [#uses=2]

invcont.i.i6.i.i:                                 ; preds = %.noexc4.i.i
  %94 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 0, i32 11, i32 0 ; <%"struct.std::locale::_Impl"**> [#uses=5]
  %95 = load %"struct.std::locale::_Impl"** %94, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %96 = getelementptr inbounds %"struct.std::locale::_Impl"* %95, i32 0, i32 2 ; <i32*> [#uses=1]
  %97 = load i32* %96, align 4                    ; <i32> [#uses=1]
  %98 = icmp ugt i32 %97, %93                     ; <i1> [#uses=1]
  br i1 %98, label %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i.i, label %bb2.i.i.i

lpad.i.i9.i.i:                                    ; preds = %.noexc4.i.i
  %eh_ptr.i.i7.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i8.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i7.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i7.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i.i: ; preds = %invcont.i.i6.i.i
  %99 = getelementptr inbounds %"struct.std::locale::_Impl"* %95, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %100 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %99, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %101 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %100, i32 %93 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %102 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %101, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=1]
  %phitmp23.i.i.i = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %102, null ; <i1> [#uses=1]
  br i1 %phitmp23.i.i.i, label %bb2.i.i.i, label %bb.i10.i.i

bb.i10.i.i:                                       ; preds = %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i.i
  %103 = invoke %"struct.std::ctype<char>"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"struct.std::locale"* %92)
          to label %bb2.i.i.i unwind label %lpad23.i.i ; <%"struct.std::ctype<char>"*> [#uses=1]

bb2.i.i.i:                                        ; preds = %bb.i10.i.i, %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i.i, %invcont.i.i6.i.i
  %storemerge = phi %"struct.std::ctype<char>"* [ %103, %bb.i10.i.i ], [ null, %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i.i ], [ null, %invcont.i.i6.i.i ] ; <%"struct.std::ctype<char>"*> [#uses=1]
  store %"struct.std::ctype<char>"* %storemerge, %"struct.std::ctype<char>"** %20
  %104 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %invcont.i14.i.i.i unwind label %lpad.i21.i.i.i ; <i32> [#uses=2]

invcont.i14.i.i.i:                                ; preds = %bb2.i.i.i
  %105 = load %"struct.std::locale::_Impl"** %94, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %106 = getelementptr inbounds %"struct.std::locale::_Impl"* %105, i32 0, i32 2 ; <i32*> [#uses=1]
  %107 = load i32* %106, align 4                  ; <i32> [#uses=1]
  %108 = icmp ugt i32 %107, %104                  ; <i1> [#uses=1]
  br i1 %108, label %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i, label %bb6.i.i7.i

lpad.i21.i.i.i:                                   ; preds = %bb2.i.i.i
  %eh_ptr.i19.i.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i20.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i19.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i19.i.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i: ; preds = %invcont.i14.i.i.i
  %109 = getelementptr inbounds %"struct.std::locale::_Impl"* %105, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %110 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %109, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %111 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %110, i32 %104 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %112 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %111, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=1]
  %phitmp22.i.i.i = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %112, null ; <i1> [#uses=1]
  br i1 %phitmp22.i.i.i, label %bb6.i.i7.i, label %bb4.i.i5.i

bb4.i.i5.i:                                       ; preds = %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i
  %113 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %.noexc15.i.i unwind label %lpad23.i.i ; <i32> [#uses=2]

.noexc15.i.i:                                     ; preds = %bb4.i.i5.i
  %114 = load %"struct.std::locale::_Impl"** %94, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %115 = getelementptr inbounds %"struct.std::locale::_Impl"* %114, i32 0, i32 2 ; <i32*> [#uses=1]
  %116 = load i32* %115, align 4                  ; <i32> [#uses=1]
  %117 = icmp ugt i32 %116, %113                  ; <i1> [#uses=1]
  br i1 %117, label %bb.i11.i.i.i, label %bb1.i12.i.i.i

bb.i11.i.i.i:                                     ; preds = %.noexc15.i.i
  %118 = getelementptr inbounds %"struct.std::locale::_Impl"* %114, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %119 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %118, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %120 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %119, i32 %113 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %121 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %120, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=2]
  %122 = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %121, null ; <i1> [#uses=1]
  br i1 %122, label %bb1.i12.i.i.i, label %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i

bb1.i12.i.i.i:                                    ; preds = %bb.i11.i.i.i, %.noexc15.i.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc16.i.i unwind label %lpad23.i.i

.noexc16.i.i:                                     ; preds = %bb1.i12.i.i.i
  unreachable

_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i: ; preds = %bb.i11.i.i.i
  %123 = bitcast %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %121 to %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  br label %bb6.i.i7.i

bb6.i.i7.i:                                       ; preds = %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i, %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i, %invcont.i14.i.i.i
  %storemerge65 = phi %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* [ %123, %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i ], [ null, %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i ], [ null, %invcont.i14.i.i.i ] ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %storemerge65, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %21, align 8
  %124 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %invcont.i3.i.i.i unwind label %lpad.i10.i.i.i ; <i32> [#uses=2]

invcont.i3.i.i.i:                                 ; preds = %bb6.i.i7.i
  %125 = load %"struct.std::locale::_Impl"** %94, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %126 = getelementptr inbounds %"struct.std::locale::_Impl"* %125, i32 0, i32 2 ; <i32*> [#uses=1]
  %127 = load i32* %126, align 4                  ; <i32> [#uses=1]
  %128 = icmp ugt i32 %127, %124                  ; <i1> [#uses=1]
  br i1 %128, label %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i, label %_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale.exit.i.i

lpad.i10.i.i.i:                                   ; preds = %bb6.i.i7.i
  %eh_ptr.i8.i.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i9.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i8.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i8.i.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i: ; preds = %invcont.i3.i.i.i
  %129 = getelementptr inbounds %"struct.std::locale::_Impl"* %125, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %130 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %129, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %131 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %130, i32 %124 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %132 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %131, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=1]
  %phitmp.i12.i.i = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %132, null ; <i1> [#uses=1]
  br i1 %phitmp.i12.i.i, label %_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale.exit.i.i, label %bb8.i.i8.i

bb8.i.i8.i:                                       ; preds = %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i
  %133 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %.noexc17.i.i unwind label %lpad23.i.i ; <i32> [#uses=2]

.noexc17.i.i:                                     ; preds = %bb8.i.i8.i
  %134 = load %"struct.std::locale::_Impl"** %94, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %135 = getelementptr inbounds %"struct.std::locale::_Impl"* %134, i32 0, i32 2 ; <i32*> [#uses=1]
  %136 = load i32* %135, align 4                  ; <i32> [#uses=1]
  %137 = icmp ugt i32 %136, %133                  ; <i1> [#uses=1]
  br i1 %137, label %bb.i1.i.i.i, label %bb1.i.i13.i.i

bb.i1.i.i.i:                                      ; preds = %.noexc17.i.i
  %138 = getelementptr inbounds %"struct.std::locale::_Impl"* %134, i32 0, i32 1 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"***> [#uses=1]
  %139 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"*** %138, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %140 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %139, i32 %133 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"**> [#uses=1]
  %141 = load %"struct.std::basic_istream<char,std::char_traits<char> >.base"** %140, align 4 ; <%"struct.std::basic_istream<char,std::char_traits<char> >.base"*> [#uses=2]
  %142 = icmp eq %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %141, null ; <i1> [#uses=1]
  br i1 %142, label %bb1.i.i13.i.i, label %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i

bb1.i.i13.i.i:                                    ; preds = %bb.i1.i.i.i, %.noexc17.i.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc18.i.i unwind label %lpad23.i.i

.noexc18.i.i:                                     ; preds = %bb1.i.i13.i.i
  unreachable

_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i: ; preds = %bb.i1.i.i.i
  %143 = bitcast %"struct.std::basic_istream<char,std::char_traits<char> >.base"* %141 to %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  br label %_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale.exit.i.i

_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale.exit.i.i: ; preds = %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i, %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i, %invcont.i3.i.i.i
  %storemerge66 = phi %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* [ %143, %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i.i ], [ null, %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i.i ], [ null, %invcont.i3.i.i.i ] ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %storemerge66, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %22
  store i8 0, i8* %17, align 4
  store i8 0, i8* %18, align 1
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* null, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %16, align 8
  %144 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %144, align 8
  store %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %91, %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %19, align 8
  %145 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %91, null ; <i1> [#uses=1]
  %_ZNSt8ios_base6badbitE.val.i.i.i = load i32* @_ZNSt8ios_base6badbitE ; <i32> [#uses=1]
  %_ZNSt8ios_base7goodbitE.val.i.i.i = load i32* @_ZNSt8ios_base7goodbitE ; <i32> [#uses=1]
  %iftmp.138.0.i.i.i = select i1 %145, i32 %_ZNSt8ios_base6badbitE.val.i.i.i, i32 %_ZNSt8ios_base7goodbitE.val.i.i.i ; <i32> [#uses=1]
  %146 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %13, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 %iftmp.138.0.i.i.i, i32* %146, align 4
  %147 = invoke zeroext i8 @_ZNKSt12__basic_fileIcE7is_openEv(%"struct.std::__basic_file<char>"* %50)
          to label %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit.i.i.i unwind label %lpad.i.i21.i.i ; <i8> [#uses=1]

lpad.i.i21.i.i:                                   ; preds = %_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale.exit.i.i
  %eh_ptr.i.i19.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i20.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i19.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i19.i.i) noreturn nounwind
  unreachable

_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit.i.i.i: ; preds = %_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale.exit.i.i
  %toBool.i.i.i = icmp eq i8 %147, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i.i, label %bb.i22.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i.thread

bb.i22.i.i:                                       ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit.i.i.i
  %148 = invoke %"struct.std::__basic_file<char>"* @_ZNSt12__basic_fileIcE4openEPKcSt13_Ios_Openmodei(%"struct.std::__basic_file<char>"* %50, i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 8, i32 436)
          to label %.noexc26.i.i unwind label %lpad23.i.i ; <%"struct.std::__basic_file<char>"*> [#uses=0]

.noexc26.i.i:                                     ; preds = %bb.i22.i.i
  %149 = invoke zeroext i8 @_ZNKSt12__basic_fileIcE7is_openEv(%"struct.std::__basic_file<char>"* %50)
          to label %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit4.i.i.i unwind label %lpad.i3.i.i.i ; <i8> [#uses=1]

lpad.i3.i.i.i:                                    ; preds = %.noexc26.i.i
  %eh_ptr.i1.i.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i2.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i1.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i1.i.i.i) noreturn nounwind
  unreachable

_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit4.i.i.i: ; preds = %.noexc26.i.i
  %toBool3.i.i.i = icmp eq i8 %149, 0             ; <i1> [#uses=1]
  br i1 %toBool3.i.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i.thread, label %bb4.i23.i.i

bb4.i23.i.i:                                      ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit4.i.i.i
  %150 = load i8* %60, align 4                    ; <i8> [#uses=1]
  %toBool.i.i.i.i = icmp eq i8 %150, 0            ; <i1> [#uses=1]
  br i1 %toBool.i.i.i.i, label %bb.i.i24.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i

bb.i.i24.i.i:                                     ; preds = %bb4.i23.i.i
  %151 = load i8** %58, align 4                   ; <i8*> [#uses=1]
  %152 = icmp eq i8* %151, null                   ; <i1> [#uses=1]
  br i1 %152, label %bb4.i.i25.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i

bb4.i.i25.i.i:                                    ; preds = %bb.i.i24.i.i
  %153 = load i32* %59, align 8                   ; <i32> [#uses=1]
  %154 = invoke i8* @_Znaj(i32 %153)
          to label %.noexc27.i.i unwind label %lpad23.i.i ; <i8*> [#uses=1]

.noexc27.i.i:                                     ; preds = %bb4.i.i25.i.i
  store i8* %154, i8** %58, align 4
  store i8 1, i8* %60, align 4
  br label %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i

_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i.thread: ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit4.i.i.i, %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit.i.i.i
  %155 = load i32 (...)*** %24, align 8           ; <i32 (...)**> [#uses=1]
  %156 = getelementptr inbounds i32 (...)** %155, i32 -3 ; <i32 (...)**> [#uses=1]
  %157 = bitcast i32 (...)** %156 to i32*         ; <i32*> [#uses=1]
  %158 = load i32* %157, align 4                  ; <i32> [#uses=1]
  %159 = add i32 %158, %11                        ; <i32> [#uses=1]
  %160 = inttoptr i32 %159 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  br label %bb.i.i9.i

_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i: ; preds = %.noexc27.i.i, %bb.i.i24.i.i, %bb4.i23.i.i
  store i32 8, i32* %51, align 8
  %161 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 10 ; <i8*> [#uses=1]
  store i8 0, i8* %161, align 1
  %162 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i, i32 0, i32 1, i32 11 ; <i8*> [#uses=1]
  store i8 0, i8* %162, align 2
  %163 = load i8** %58, align 4                   ; <i8*> [#uses=3]
  store i8* %163, i8** %36, align 4
  store i8* %163, i8** %37, align 8
  store i8* %163, i8** %38, align 4
  store i8* null, i8** %40, align 4
  store i8* null, i8** %39, align 8
  store i8* null, i8** %41, align 8
  %164 = load i32* %52, align 4                   ; <i32> [#uses=2]
  %165 = load i32* %53, align 4                   ; <i32> [#uses=2]
  store i32 %164, i32* %54, align 4
  store i32 %165, i32* %55, align 4
  store i32 %164, i32* %56, align 4
  store i32 %165, i32* %57, align 4
  %phitmp = icmp eq %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %34, null ; <i1> [#uses=1]
  %166 = load i32 (...)*** %24, align 8           ; <i32 (...)**> [#uses=1]
  %167 = getelementptr inbounds i32 (...)** %166, i32 -3 ; <i32 (...)**> [#uses=1]
  %168 = bitcast i32 (...)** %167 to i32*         ; <i32*> [#uses=1]
  %169 = load i32* %168, align 4                  ; <i32> [#uses=1]
  %170 = add i32 %169, %11                        ; <i32> [#uses=1]
  %171 = inttoptr i32 %170 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=4]
  br i1 %phitmp, label %bb.i.i9.i, label %bb1.i.i.i

bb.i.i9.i:                                        ; preds = %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i, %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i.thread
  %.reg2mem.0 = phi %"struct.std::basic_ios<char,std::char_traits<char> >"* [ %160, %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i.thread ], [ %171, %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i ] ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %172 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %.reg2mem.0, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %173 = load i32* %172, align 4                  ; <i32> [#uses=1]
  %174 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %.reg2mem.0, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %175 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %174, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %176 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %175, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %176, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %173 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %172
  %177 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %.reg2mem.0, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %178 = load i32* %177, align 4                  ; <i32> [#uses=1]
  %179 = and i32 %storemerge.i.i.i.i, %178        ; <i32> [#uses=1]
  %180 = icmp eq i32 %179, 0                      ; <i1> [#uses=1]
  br i1 %180, label %_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode.exit.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb.i.i9.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc2.i.i unwind label %lpad23.i.i

.noexc2.i.i:                                      ; preds = %bb4.i.i.i.i.i
  unreachable

bb1.i.i.i:                                        ; preds = %_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode.exit.i.i
  %181 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %171, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %182 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %181, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %183 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %182, null ; <i1> [#uses=1]
  %184 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %171, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %storemerge.i.i.i = zext i1 %183 to i32         ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %184
  %185 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %171, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %186 = load i32* %185, align 4                  ; <i32> [#uses=1]
  %187 = and i32 %storemerge.i.i.i, %186          ; <i32> [#uses=1]
  %188 = icmp eq i32 %187, 0                      ; <i1> [#uses=1]
  br i1 %188, label %_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode.exit.i, label %bb4.i.i.i10.i

bb4.i.i.i10.i:                                    ; preds = %bb1.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc3.i.i unwind label %lpad23.i.i

.noexc3.i.i:                                      ; preds = %bb4.i.i.i10.i
  unreachable

invcont14.i.i:                                    ; preds = %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc12.i unwind label %lpad.i

.noexc12.i:                                       ; preds = %invcont14.i.i
  unreachable

lpad19.i.i:                                       ; preds = %invcont8.i.i.i
  %eh_ptr20.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select22.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr20.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad23.i.i:                                       ; preds = %bb4.i.i.i10.i, %bb4.i.i.i.i.i, %bb4.i.i25.i.i, %bb.i22.i.i, %bb1.i.i13.i.i, %bb8.i.i8.i, %bb1.i12.i.i.i, %bb4.i.i5.i, %bb.i10.i.i, %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i.i
  %eh_ptr24.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select26.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt13basic_filebufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %35, align 8
  call fastcc void @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %34) nounwind
  invoke void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"* %50)
          to label %_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i.i unwind label %invcont1.i.i.i

invcont1.i.i.i:                                   ; preds = %lpad23.i.i
  %eh_ptr.i.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select8.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %35, align 8
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %42) nounwind
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc.i.i unwind label %lpad27.i.i

.noexc.i.i:                                       ; preds = %invcont1.i.i.i
  unreachable

_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i.i: ; preds = %lpad23.i.i
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %35, align 8
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %42) nounwind
  br label %ppad.i.i

lpad27.i.i:                                       ; preds = %invcont1.i.i.i
  %eh_ptr28.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select30.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr28.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad35.i.i:                                       ; preds = %ppad.i.i
  %eh_ptr36.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select38.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr36.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i.i:                                         ; preds = %_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i.i, %lpad19.i.i
  %eh_exception.0.i.i = phi i8* [ %eh_ptr20.i.i, %lpad19.i.i ], [ %eh_ptr24.i.i, %_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i.i ] ; <i8*> [#uses=1]
  %189 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %.c.i.i = bitcast i8* %189 to i32 (...)**       ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c.i.i, i32 (...)*** %24, align 8
  %190 = getelementptr inbounds i8* %189, i32 -12 ; <i8*> [#uses=1]
  %191 = bitcast i8* %190 to i32*                 ; <i32*> [#uses=1]
  %192 = load i32* %191, align 4                  ; <i32> [#uses=1]
  %193 = add i32 %192, %11                        ; <i32> [#uses=1]
  %194 = inttoptr i32 %193 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %195 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %196 = bitcast i8* %195 to i32 (...)**          ; <i32 (...)**> [#uses=1]
  %197 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %194, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %196, i32 (...)*** %197, align 4
  store i32 0, i32* %33, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %15, align 8
  invoke void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %14)
          to label %invcont14.i.i unwind label %lpad35.i.i

_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode.exit.i: ; preds = %bb1.i.i.i, %bb.i.i9.i
  %198 = bitcast %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i to %"struct.std::basic_istream<char,std::char_traits<char> >"* ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=1]
  %199 = getelementptr inbounds [32 x i8]* %line.i, i32 0, i32 0 ; <i8*> [#uses=6]
  %200 = ptrtoint [32 x i8]* %line.i to i32       ; <i32> [#uses=1]
  %201 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %3, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  %202 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %3, i32 0, i32 0, i32 1 ; <i8**> [#uses=11]
  %203 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %3, i32 0, i32 1 ; <i32*> [#uses=5]
  %204 = getelementptr inbounds %struct.spell_checker* %spell, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"*> [#uses=3]
  %205 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %2, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %206 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %1, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %207 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %0, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb8.i

invcont1.i:                                       ; preds = %invcont10.i
  %208 = load i32* %33, align 4                   ; <i32> [#uses=1]
  %.sum.i = add i32 %208, -1                      ; <i32> [#uses=1]
  %209 = getelementptr inbounds [32 x i8]* %line.i, i32 0, i32 %.sum.i ; <i8*> [#uses=3]
  br label %bb5.outer.i.i.i

bb5.outer.i.i.i:                                  ; preds = %bb3.i.i.i, %invcont1.i
  %__y.0.ph.in.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %10, %invcont1.i ], [ %__x.0.in.i.i.i, %bb3.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %__x.0.in.in.ph.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %6, %invcont1.i ], [ %218, %bb3.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i

bb.i.i.i:                                         ; preds = %bb5.i.i.i
  %210 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %211 = bitcast %"struct.std::_Rb_tree_node_base"* %210 to i8** ; <i8**> [#uses=1]
  %212 = load i8** %211, align 4                  ; <i8*> [#uses=2]
  %213 = icmp ult i8* %212, %199                  ; <i1> [#uses=1]
  br i1 %213, label %bb4.i.i.i, label %bb.i.i1.i.i.i

bb.i.i1.i.i.i:                                    ; preds = %bb.i.i.i
  %214 = icmp ult i8* %199, %212                  ; <i1> [#uses=1]
  br i1 %214, label %bb3.i.i.i, label %bb1.i.i3.i.i.i

bb1.i.i3.i.i.i:                                   ; preds = %bb.i.i1.i.i.i
  %215 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %216 = load %"struct.std::_Rb_tree_node_base"** %215 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %217 = bitcast %"struct.std::_Rb_tree_node_base"* %216 to i8* ; <i8*> [#uses=1]
  %phitmp6.i.i.i = icmp ult i8* %217, %209        ; <i1> [#uses=1]
  br i1 %phitmp6.i.i.i, label %bb4.i.i.i, label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb1.i.i3.i.i.i, %bb.i.i1.i.i.i
  %218 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.outer.i.i.i

bb4.i.i.i:                                        ; preds = %bb1.i.i3.i.i.i, %bb.i.i.i
  %219 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i

bb5.i.i.i:                                        ; preds = %bb4.i.i.i, %bb5.outer.i.i.i
  %__x.0.in.in.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %219, %bb4.i.i.i ], [ %__x.0.in.in.ph.i.i.i, %bb5.outer.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in.i.i.i = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.i.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]
  %220 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, null ; <i1> [#uses=1]
  br i1 %220, label %bb6.i.i.i, label %bb.i.i.i

bb6.i.i.i:                                        ; preds = %bb5.i.i.i
  %221 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, %10 ; <i1> [#uses=1]
  br i1 %221, label %invcont3.i, label %bb8.i.i.i

bb8.i.i.i:                                        ; preds = %bb6.i.i.i
  %222 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %223 = bitcast %"struct.std::_Rb_tree_node_base"* %222 to i8** ; <i8**> [#uses=1]
  %224 = load i8** %223, align 4                  ; <i8*> [#uses=2]
  %225 = icmp ult i8* %199, %224                  ; <i1> [#uses=1]
  br i1 %225, label %invcont3.i, label %bb.i.i.i.i5.i

bb.i.i.i.i5.i:                                    ; preds = %bb8.i.i.i
  %226 = icmp ult i8* %224, %199                  ; <i1> [#uses=1]
  br i1 %226, label %bb11.i.i.i, label %bb1.i.i.i.i.i

bb1.i.i.i.i.i:                                    ; preds = %bb.i.i.i.i5.i
  %227 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %228 = load %"struct.std::_Rb_tree_node_base"** %227 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %229 = bitcast %"struct.std::_Rb_tree_node_base"* %228 to i8* ; <i8*> [#uses=1]
  %phitmp.i.i.i = icmp ult i8* %209, %229         ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i, label %invcont3.i, label %bb11.i.i.i

bb11.i.i.i:                                       ; preds = %bb1.i.i.i.i.i, %bb.i.i.i.i5.i
  br label %invcont3.i

invcont3.i:                                       ; preds = %bb11.i.i.i, %bb1.i.i.i.i.i, %bb8.i.i.i, %bb6.i.i.i
  %.0.0.i = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.ph.in.i.i.i, %bb11.i.i.i ], [ %10, %bb6.i.i.i ], [ %10, %bb8.i.i.i ], [ %10, %bb1.i.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %230 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %.0.0.i ; <i1> [#uses=1]
  br i1 %230, label %bb4.i, label %bb8.i

bb4.i:                                            ; preds = %invcont3.i
  %231 = ptrtoint i8* %209 to i32                 ; <i32> [#uses=1]
  %232 = sub i32 %231, %200                       ; <i32> [#uses=3]
  %233 = invoke i8* @_Znaj(i32 %232)
          to label %invcont6.i unwind label %lpad25.i ; <i8*> [#uses=19]

invcont6.i:                                       ; preds = %bb4.i
  call void @llvm.memmove.i32(i8* %233, i8* %199, i32 %232, i32 1) nounwind
  %234 = getelementptr inbounds i8* %233, i32 %232 ; <i8*> [#uses=12]
  br label %bb5.outer.i.i.i.i

bb5.outer.i.i.i.i:                                ; preds = %bb3.i.i.i.i, %invcont6.i
  %__y.0.ph.in.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %10, %invcont6.i ], [ %__x.0.in.i.i.i.i, %bb3.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=19]
  %__x.0.in.in.ph.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %6, %invcont6.i ], [ %243, %bb3.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i.i

bb.i.i.i2.i:                                      ; preds = %bb5.i.i.i.i
  %235 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %236 = bitcast %"struct.std::_Rb_tree_node_base"* %235 to i8** ; <i8**> [#uses=1]
  %237 = load i8** %236, align 4                  ; <i8*> [#uses=2]
  %238 = icmp ult i8* %237, %233                  ; <i1> [#uses=1]
  br i1 %238, label %bb4.i.i.i.i, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb.i.i.i2.i
  %239 = icmp ult i8* %233, %237                  ; <i1> [#uses=1]
  br i1 %239, label %bb3.i.i.i.i, label %bb1.i.i.i.i.i.i

bb1.i.i.i.i.i.i:                                  ; preds = %bb.i.i.i.i.i.i
  %240 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %241 = load %"struct.std::_Rb_tree_node_base"** %240 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %242 = bitcast %"struct.std::_Rb_tree_node_base"* %241 to i8* ; <i8*> [#uses=1]
  %phitmp.i.i.i3.i = icmp ult i8* %242, %234      ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i3.i, label %bb4.i.i.i.i, label %bb3.i.i.i.i

bb3.i.i.i.i:                                      ; preds = %bb1.i.i.i.i.i.i, %bb.i.i.i.i.i.i
  %243 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.outer.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb1.i.i.i.i.i.i, %bb.i.i.i2.i
  %244 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i.i

bb5.i.i.i.i:                                      ; preds = %bb4.i.i.i.i, %bb5.outer.i.i.i.i
  %__x.0.in.in.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %244, %bb4.i.i.i.i ], [ %__x.0.in.in.ph.i.i.i.i, %bb5.outer.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in.i.i.i.i = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.i.i.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]
  %245 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i.i, null ; <i1> [#uses=1]
  br i1 %245, label %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE11lower_boundERS6_.exit.i.i, label %bb.i.i.i2.i

_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE11lower_boundERS6_.exit.i.i: ; preds = %bb5.i.i.i.i
  %246 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, %10 ; <i1> [#uses=1]
  br i1 %246, label %bb6.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE11lower_boundERS6_.exit.i.i
  %247 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %248 = bitcast %"struct.std::_Rb_tree_node_base"* %247 to i8** ; <i8**> [#uses=1]
  %249 = load i8** %248, align 4                  ; <i8*> [#uses=2]
  %250 = icmp ult i8* %233, %249                  ; <i1> [#uses=1]
  br i1 %250, label %bb6.i.i, label %bb.i.i1.i.i

bb.i.i1.i.i:                                      ; preds = %bb.i.i
  %251 = icmp ult i8* %249, %233                  ; <i1> [#uses=1]
  br i1 %251, label %invcont7.i, label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i1.i.i
  %252 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %253 = load %"struct.std::_Rb_tree_node_base"** %252 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %254 = bitcast %"struct.std::_Rb_tree_node_base"* %253 to i8* ; <i8*> [#uses=1]
  %phitmp.i.i = icmp ult i8* %234, %254           ; <i1> [#uses=1]
  br i1 %phitmp.i.i, label %bb6.i.i, label %invcont7.i

bb6.i.i:                                          ; preds = %bb1.i.i.i.i, %bb.i.i, %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE11lower_boundERS6_.exit.i.i
  store i8* %233, i8** %201, align 8
  store i8* %234, i8** %202, align 4
  store i32 0, i32* %203, align 8
  %255 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %__y.0.ph.in.i.i.i.i ; <i1> [#uses=1]
  br i1 %255, label %bb.i13.i, label %bb12.i.i

bb.i13.i:                                         ; preds = %bb6.i.i
  %256 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %257 = icmp eq i32 %256, 0                      ; <i1> [#uses=1]
  br i1 %257, label %bb7.i.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i13.i
  %258 = load %"struct.std::_Rb_tree_node_base"** %8, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %259 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %258, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %260 = bitcast %"struct.std::_Rb_tree_node_base"* %259 to i8** ; <i8**> [#uses=1]
  %261 = load i8** %260, align 4                  ; <i8*> [#uses=3]
  %262 = icmp ult i8* %261, %233                  ; <i1> [#uses=2]
  br i1 %262, label %bb10.i.i, label %bb.i.i76.i.i

bb.i.i76.i.i:                                     ; preds = %bb1.i.i
  %263 = icmp ult i8* %233, %261                  ; <i1> [#uses=1]
  br i1 %263, label %bb7.i.i, label %bb1.i.i78.i.i

bb1.i.i78.i.i:                                    ; preds = %bb.i.i76.i.i
  %264 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %258, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %265 = load %"struct.std::_Rb_tree_node_base"** %264 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %266 = bitcast %"struct.std::_Rb_tree_node_base"* %265 to i8* ; <i8*> [#uses=1]
  %phitmp.i14.i = icmp ult i8* %266, %234         ; <i1> [#uses=1]
  br i1 %phitmp.i14.i, label %bb10.i.i, label %bb7.i.i

bb7.i.i:                                          ; preds = %bb1.i.i78.i.i, %bb.i.i76.i.i, %bb.i13.i
  invoke fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE16_M_insert_uniqueERKS5_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* noalias sret %2, %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %204, %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %3)
          to label %.noexc23.i unwind label %lpad25.i

.noexc23.i:                                       ; preds = %bb7.i.i
  %267 = load %"struct.std::_Rb_tree_node_base"** %205, align 8 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %invcont7.i

bb10.i.i:                                         ; preds = %bb1.i.i78.i.i, %bb1.i.i
  %268 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %258 ; <i1> [#uses=1]
  %269 = icmp ult i8* %233, %261                  ; <i1> [#uses=1]
  %or.cond.i.i = or i1 %268, %269                 ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb4.i73.i.i, label %bb.i.i1.i68.i.i

bb.i.i1.i68.i.i:                                  ; preds = %bb10.i.i
  br i1 %262, label %bb3.i71.i.i, label %bb1.i.i.i70.i.i

bb1.i.i.i70.i.i:                                  ; preds = %bb.i.i1.i68.i.i
  %270 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %258, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %271 = load %"struct.std::_Rb_tree_node_base"** %270 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %272 = bitcast %"struct.std::_Rb_tree_node_base"* %271 to i8* ; <i8*> [#uses=1]
  %phitmp.i69.i.i = icmp ult i8* %234, %272       ; <i1> [#uses=1]
  br i1 %phitmp.i69.i.i, label %bb4.i73.i.i, label %bb3.i71.i.i

bb3.i71.i.i:                                      ; preds = %bb1.i.i.i70.i.i, %bb.i.i1.i68.i.i
  br label %bb4.i73.i.i

bb4.i73.i.i:                                      ; preds = %bb3.i71.i.i, %bb1.i.i.i70.i.i, %bb10.i.i
  %iftmp.229.0.i72.i.i = phi i8 [ 0, %bb3.i71.i.i ], [ 1, %bb10.i.i ], [ 1, %bb1.i.i.i70.i.i ] ; <i8> [#uses=1]
  %273 = invoke i8* @_Znwj(i32 28)
          to label %.noexc24.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc24.i:                                       ; preds = %bb4.i73.i.i
  %274 = getelementptr inbounds i8* %273, i32 16  ; <i8*> [#uses=2]
  %275 = icmp eq i8* %274, null                   ; <i1> [#uses=1]
  br i1 %275, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit75.i.i, label %bb.i.i.i74.i.i

bb.i.i.i74.i.i:                                   ; preds = %.noexc24.i
  %276 = bitcast i8* %274 to i8**                 ; <i8**> [#uses=1]
  store i8* %233, i8** %276
  %277 = getelementptr i8* %273, i32 20           ; <i8*> [#uses=1]
  %278 = bitcast i8* %277 to i8**                 ; <i8**> [#uses=1]
  store i8* %234, i8** %278, align 4
  %279 = getelementptr i8* %273, i32 24           ; <i8*> [#uses=1]
  %280 = bitcast i8* %279 to i32*                 ; <i32*> [#uses=1]
  store i32 0, i32* %280, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit75.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit75.i.i: ; preds = %bb.i.i.i74.i.i, %.noexc24.i
  %281 = bitcast i8* %273 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i72.i.i, %"struct.std::_Rb_tree_node_base"* %281, %"struct.std::_Rb_tree_node_base"* %258, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc25.i unwind label %lpad25.i

.noexc25.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit75.i.i
  %282 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %283 = add i32 %282, 1                          ; <i32> [#uses=1]
  store i32 %283, i32* %9, align 4
  br label %invcont7.i

bb12.i.i:                                         ; preds = %bb6.i.i
  %284 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %285 = bitcast %"struct.std::_Rb_tree_node_base"* %284 to i8** ; <i8**> [#uses=3]
  %286 = load i8** %285, align 4                  ; <i8*> [#uses=2]
  %287 = icmp ult i8* %233, %286                  ; <i1> [#uses=1]
  br i1 %287, label %bb14.i.i, label %bb.i.i61.i.i

bb.i.i61.i.i:                                     ; preds = %bb12.i.i
  %288 = icmp ult i8* %286, %233                  ; <i1> [#uses=2]
  br i1 %288, label %bb26.i.i, label %bb1.i.i63.i.i

bb1.i.i63.i.i:                                    ; preds = %bb.i.i61.i.i
  %289 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %290 = load %"struct.std::_Rb_tree_node_base"** %289 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %291 = bitcast %"struct.std::_Rb_tree_node_base"* %290 to i8* ; <i8*> [#uses=2]
  %phitmp84.i.i = icmp ult i8* %234, %291         ; <i1> [#uses=1]
  br i1 %phitmp84.i.i, label %bb14.i.i, label %bb24.i.i

bb14.i.i:                                         ; preds = %bb1.i.i63.i.i, %bb12.i.i
  %292 = load %"struct.std::_Rb_tree_node_base"** %7, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]
  %293 = icmp eq %"struct.std::_Rb_tree_node_base"* %292, %__y.0.ph.in.i.i.i.i ; <i1> [#uses=1]
  br i1 %293, label %bb16.i.i, label %bb17.i.i

bb16.i.i:                                         ; preds = %bb14.i.i
  %.not.i.i = icmp ne %"struct.std::_Rb_tree_node_base"* %292, null ; <i1> [#uses=1]
  %294 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %292 ; <i1> [#uses=1]
  %or.cond86.i.i = or i1 %294, %.not.i.i          ; <i1> [#uses=1]
  br i1 %or.cond86.i.i, label %bb4.i58.i.i, label %bb1.i52.i.i

bb1.i52.i.i:                                      ; preds = %bb16.i.i
  %295 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %292, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %296 = bitcast %"struct.std::_Rb_tree_node_base"* %295 to i8** ; <i8**> [#uses=1]
  %297 = load i8** %296, align 4                  ; <i8*> [#uses=2]
  %298 = icmp ult i8* %233, %297                  ; <i1> [#uses=1]
  br i1 %298, label %bb4.i58.i.i, label %bb.i.i1.i53.i.i

bb.i.i1.i53.i.i:                                  ; preds = %bb1.i52.i.i
  %299 = icmp ult i8* %297, %233                  ; <i1> [#uses=1]
  br i1 %299, label %bb3.i56.i.i, label %bb1.i.i.i55.i.i

bb1.i.i.i55.i.i:                                  ; preds = %bb.i.i1.i53.i.i
  %300 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %292, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %301 = load %"struct.std::_Rb_tree_node_base"** %300 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %302 = bitcast %"struct.std::_Rb_tree_node_base"* %301 to i8* ; <i8*> [#uses=1]
  %phitmp.i54.i.i = icmp ult i8* %234, %302       ; <i1> [#uses=1]
  br i1 %phitmp.i54.i.i, label %bb4.i58.i.i, label %bb3.i56.i.i

bb3.i56.i.i:                                      ; preds = %bb1.i.i.i55.i.i, %bb.i.i1.i53.i.i
  br label %bb4.i58.i.i

bb4.i58.i.i:                                      ; preds = %bb3.i56.i.i, %bb1.i.i.i55.i.i, %bb1.i52.i.i, %bb16.i.i
  %iftmp.229.0.i57.i.i = phi i8 [ 0, %bb3.i56.i.i ], [ 1, %bb16.i.i ], [ 1, %bb1.i52.i.i ], [ 1, %bb1.i.i.i55.i.i ] ; <i8> [#uses=1]
  %303 = invoke i8* @_Znwj(i32 28)
          to label %.noexc26.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc26.i:                                       ; preds = %bb4.i58.i.i
  %304 = getelementptr inbounds i8* %303, i32 16  ; <i8*> [#uses=2]
  %305 = icmp eq i8* %304, null                   ; <i1> [#uses=1]
  br i1 %305, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit60.i.i, label %bb.i.i.i59.i.i

bb.i.i.i59.i.i:                                   ; preds = %.noexc26.i
  %306 = bitcast i8* %304 to i8**                 ; <i8**> [#uses=1]
  store i8* %233, i8** %306
  %307 = getelementptr i8* %303, i32 20           ; <i8*> [#uses=1]
  %308 = bitcast i8* %307 to i8**                 ; <i8**> [#uses=1]
  store i8* %234, i8** %308, align 4
  %309 = getelementptr i8* %303, i32 24           ; <i8*> [#uses=1]
  %310 = bitcast i8* %309 to i32*                 ; <i32*> [#uses=1]
  store i32 0, i32* %310, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit60.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit60.i.i: ; preds = %bb.i.i.i59.i.i, %.noexc26.i
  %311 = bitcast i8* %303 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i57.i.i, %"struct.std::_Rb_tree_node_base"* %311, %"struct.std::_Rb_tree_node_base"* %292, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc27.i unwind label %lpad25.i

.noexc27.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit60.i.i
  %312 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %313 = add i32 %312, 1                          ; <i32> [#uses=1]
  store i32 %313, i32* %9, align 4
  br label %invcont7.i

bb17.i.i:                                         ; preds = %bb14.i.i
  %314 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i)
          to label %.noexc28.i unwind label %lpad25.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]

.noexc28.i:                                       ; preds = %bb17.i.i
  %315 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %314, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %316 = bitcast %"struct.std::_Rb_tree_node_base"* %315 to i8** ; <i8**> [#uses=1]
  %317 = load i8** %316, align 4                  ; <i8*> [#uses=3]
  %318 = load i8** %201, align 8                  ; <i8*> [#uses=7]
  %319 = icmp ult i8* %317, %318                  ; <i1> [#uses=2]
  br i1 %319, label %bb19.i.i, label %bb.i.i46.i.i

bb.i.i46.i.i:                                     ; preds = %.noexc28.i
  %320 = icmp ult i8* %318, %317                  ; <i1> [#uses=1]
  br i1 %320, label %bb23.i.i, label %bb1.i.i48.i.i

bb1.i.i48.i.i:                                    ; preds = %bb.i.i46.i.i
  %321 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %314, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %322 = load %"struct.std::_Rb_tree_node_base"** %321 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %323 = bitcast %"struct.std::_Rb_tree_node_base"* %322 to i8* ; <i8*> [#uses=1]
  %324 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  %phitmp83.i.i = icmp ult i8* %323, %324         ; <i1> [#uses=1]
  br i1 %phitmp83.i.i, label %bb19.i.i, label %bb23.i.i

bb19.i.i:                                         ; preds = %bb1.i.i48.i.i, %.noexc28.i
  %325 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %314, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %326 = load %"struct.std::_Rb_tree_node_base"** %325, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %327 = icmp eq %"struct.std::_Rb_tree_node_base"* %326, null ; <i1> [#uses=1]
  br i1 %327, label %bb21.i.i, label %bb22.i.i

bb21.i.i:                                         ; preds = %bb19.i.i
  %328 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %314 ; <i1> [#uses=1]
  %329 = icmp ult i8* %318, %317                  ; <i1> [#uses=1]
  %or.cond87.i.i = or i1 %328, %329               ; <i1> [#uses=1]
  br i1 %or.cond87.i.i, label %bb4.i43.i.i, label %bb.i.i1.i38.i.i

bb.i.i1.i38.i.i:                                  ; preds = %bb21.i.i
  br i1 %319, label %bb3.i41.i.i, label %bb1.i.i.i40.i.i

bb1.i.i.i40.i.i:                                  ; preds = %bb.i.i1.i38.i.i
  %330 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  %331 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %314, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %332 = load %"struct.std::_Rb_tree_node_base"** %331 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %333 = bitcast %"struct.std::_Rb_tree_node_base"* %332 to i8* ; <i8*> [#uses=1]
  %phitmp.i39.i.i = icmp ult i8* %330, %333       ; <i1> [#uses=1]
  br i1 %phitmp.i39.i.i, label %bb4.i43.i.i, label %bb3.i41.i.i

bb3.i41.i.i:                                      ; preds = %bb1.i.i.i40.i.i, %bb.i.i1.i38.i.i
  br label %bb4.i43.i.i

bb4.i43.i.i:                                      ; preds = %bb3.i41.i.i, %bb1.i.i.i40.i.i, %bb21.i.i
  %iftmp.229.0.i42.i.i = phi i8 [ 0, %bb3.i41.i.i ], [ 1, %bb21.i.i ], [ 1, %bb1.i.i.i40.i.i ] ; <i8> [#uses=1]
  %334 = invoke i8* @_Znwj(i32 28)
          to label %.noexc29.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc29.i:                                       ; preds = %bb4.i43.i.i
  %335 = getelementptr inbounds i8* %334, i32 16  ; <i8*> [#uses=2]
  %336 = icmp eq i8* %335, null                   ; <i1> [#uses=1]
  br i1 %336, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit45.i.i, label %bb.i.i.i44.i.i

bb.i.i.i44.i.i:                                   ; preds = %.noexc29.i
  %337 = bitcast i8* %335 to i8**                 ; <i8**> [#uses=1]
  store i8* %318, i8** %337
  %338 = getelementptr i8* %334, i32 20           ; <i8*> [#uses=1]
  %339 = bitcast i8* %338 to i8**                 ; <i8**> [#uses=1]
  %340 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  store i8* %340, i8** %339, align 4
  %341 = getelementptr i8* %334, i32 24           ; <i8*> [#uses=1]
  %342 = bitcast i8* %341 to i32*                 ; <i32*> [#uses=1]
  %343 = load i32* %203, align 8                  ; <i32> [#uses=1]
  store i32 %343, i32* %342, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit45.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit45.i.i: ; preds = %bb.i.i.i44.i.i, %.noexc29.i
  %344 = bitcast i8* %334 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i42.i.i, %"struct.std::_Rb_tree_node_base"* %344, %"struct.std::_Rb_tree_node_base"* %314, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc30.i unwind label %lpad25.i

.noexc30.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit45.i.i
  %345 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %346 = add i32 %345, 1                          ; <i32> [#uses=1]
  store i32 %346, i32* %9, align 4
  br label %invcont7.i

bb22.i.i:                                         ; preds = %bb19.i.i
  %347 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, null ; <i1> [#uses=1]
  br i1 %347, label %bb.i26.i.i, label %bb4.i33.i.i

bb.i26.i.i:                                       ; preds = %bb22.i.i
  %348 = load i8** %285, align 4                  ; <i8*> [#uses=2]
  %349 = icmp ult i8* %318, %348                  ; <i1> [#uses=1]
  br i1 %349, label %bb4.i33.i.i, label %bb.i.i1.i28.i.i

bb.i.i1.i28.i.i:                                  ; preds = %bb.i26.i.i
  %350 = icmp ult i8* %348, %318                  ; <i1> [#uses=1]
  br i1 %350, label %bb3.i31.i.i, label %bb1.i.i.i30.i.i

bb1.i.i.i30.i.i:                                  ; preds = %bb.i.i1.i28.i.i
  %351 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  %352 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %353 = load %"struct.std::_Rb_tree_node_base"** %352 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %354 = bitcast %"struct.std::_Rb_tree_node_base"* %353 to i8* ; <i8*> [#uses=1]
  %phitmp.i29.i.i = icmp ult i8* %351, %354       ; <i1> [#uses=1]
  br i1 %phitmp.i29.i.i, label %bb4.i33.i.i, label %bb3.i31.i.i

bb3.i31.i.i:                                      ; preds = %bb1.i.i.i30.i.i, %bb.i.i1.i28.i.i
  br label %bb4.i33.i.i

bb4.i33.i.i:                                      ; preds = %bb3.i31.i.i, %bb1.i.i.i30.i.i, %bb.i26.i.i, %bb22.i.i
  %iftmp.229.0.i32.i.i = phi i8 [ 0, %bb3.i31.i.i ], [ 1, %bb22.i.i ], [ 1, %bb.i26.i.i ], [ 1, %bb1.i.i.i30.i.i ] ; <i8> [#uses=1]
  %355 = invoke i8* @_Znwj(i32 28)
          to label %.noexc31.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc31.i:                                       ; preds = %bb4.i33.i.i
  %356 = getelementptr inbounds i8* %355, i32 16  ; <i8*> [#uses=2]
  %357 = icmp eq i8* %356, null                   ; <i1> [#uses=1]
  br i1 %357, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit35.i.i, label %bb.i.i.i34.i.i

bb.i.i.i34.i.i:                                   ; preds = %.noexc31.i
  %358 = bitcast i8* %356 to i8**                 ; <i8**> [#uses=1]
  store i8* %318, i8** %358
  %359 = getelementptr i8* %355, i32 20           ; <i8*> [#uses=1]
  %360 = bitcast i8* %359 to i8**                 ; <i8**> [#uses=1]
  %361 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  store i8* %361, i8** %360, align 4
  %362 = getelementptr i8* %355, i32 24           ; <i8*> [#uses=1]
  %363 = bitcast i8* %362 to i32*                 ; <i32*> [#uses=1]
  %364 = load i32* %203, align 8                  ; <i32> [#uses=1]
  store i32 %364, i32* %363, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit35.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit35.i.i: ; preds = %bb.i.i.i34.i.i, %.noexc31.i
  %365 = bitcast i8* %355 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i32.i.i, %"struct.std::_Rb_tree_node_base"* %365, %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc32.i unwind label %lpad25.i

.noexc32.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit35.i.i
  %366 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %367 = add i32 %366, 1                          ; <i32> [#uses=1]
  store i32 %367, i32* %9, align 4
  br label %invcont7.i

bb23.i.i:                                         ; preds = %bb1.i.i48.i.i, %bb.i.i46.i.i
  invoke fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE16_M_insert_uniqueERKS5_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* noalias sret %1, %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %204, %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %3)
          to label %.noexc33.i unwind label %lpad25.i

.noexc33.i:                                       ; preds = %bb23.i.i
  %368 = load %"struct.std::_Rb_tree_node_base"** %206, align 8 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %invcont7.i

bb24.i.i:                                         ; preds = %bb1.i.i63.i.i
  %phitmp82.i.i = icmp ult i8* %291, %234         ; <i1> [#uses=1]
  %or.cond = or i1 %288, %phitmp82.i.i            ; <i1> [#uses=1]
  br i1 %or.cond, label %bb26.i.i, label %invcont7.i

bb26.i.i:                                         ; preds = %bb24.i.i, %bb.i.i61.i.i
  %369 = load %"struct.std::_Rb_tree_node_base"** %8, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %370 = icmp eq %"struct.std::_Rb_tree_node_base"* %369, %__y.0.ph.in.i.i.i.i ; <i1> [#uses=1]
  br i1 %370, label %bb28.i.i, label %bb29.i.i

bb28.i.i:                                         ; preds = %bb26.i.i
  %371 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %369 ; <i1> [#uses=1]
  br i1 %371, label %bb4.i18.i.i, label %bb1.i12.i.i

bb1.i12.i.i:                                      ; preds = %bb28.i.i
  %372 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %369, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %373 = bitcast %"struct.std::_Rb_tree_node_base"* %372 to i8** ; <i8**> [#uses=1]
  %374 = load i8** %373, align 4                  ; <i8*> [#uses=2]
  %375 = icmp ult i8* %233, %374                  ; <i1> [#uses=1]
  br i1 %375, label %bb4.i18.i.i, label %bb.i.i1.i13.i.i

bb.i.i1.i13.i.i:                                  ; preds = %bb1.i12.i.i
  %376 = icmp ult i8* %374, %233                  ; <i1> [#uses=1]
  br i1 %376, label %bb3.i16.i.i, label %bb1.i.i.i15.i.i

bb1.i.i.i15.i.i:                                  ; preds = %bb.i.i1.i13.i.i
  %377 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %369, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %378 = load %"struct.std::_Rb_tree_node_base"** %377 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %379 = bitcast %"struct.std::_Rb_tree_node_base"* %378 to i8* ; <i8*> [#uses=1]
  %phitmp.i14.i.i = icmp ult i8* %234, %379       ; <i1> [#uses=1]
  br i1 %phitmp.i14.i.i, label %bb4.i18.i.i, label %bb3.i16.i.i

bb3.i16.i.i:                                      ; preds = %bb1.i.i.i15.i.i, %bb.i.i1.i13.i.i
  br label %bb4.i18.i.i

bb4.i18.i.i:                                      ; preds = %bb3.i16.i.i, %bb1.i.i.i15.i.i, %bb1.i12.i.i, %bb28.i.i
  %iftmp.229.0.i17.i.i = phi i8 [ 0, %bb3.i16.i.i ], [ 1, %bb28.i.i ], [ 1, %bb1.i12.i.i ], [ 1, %bb1.i.i.i15.i.i ] ; <i8> [#uses=1]
  %380 = invoke i8* @_Znwj(i32 28)
          to label %.noexc34.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc34.i:                                       ; preds = %bb4.i18.i.i
  %381 = getelementptr inbounds i8* %380, i32 16  ; <i8*> [#uses=2]
  %382 = icmp eq i8* %381, null                   ; <i1> [#uses=1]
  br i1 %382, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit20.i.i, label %bb.i.i.i19.i.i

bb.i.i.i19.i.i:                                   ; preds = %.noexc34.i
  %383 = bitcast i8* %381 to i8**                 ; <i8**> [#uses=1]
  store i8* %233, i8** %383
  %384 = getelementptr i8* %380, i32 20           ; <i8*> [#uses=1]
  %385 = bitcast i8* %384 to i8**                 ; <i8**> [#uses=1]
  store i8* %234, i8** %385, align 4
  %386 = getelementptr i8* %380, i32 24           ; <i8*> [#uses=1]
  %387 = bitcast i8* %386 to i32*                 ; <i32*> [#uses=1]
  store i32 0, i32* %387, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit20.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit20.i.i: ; preds = %bb.i.i.i19.i.i, %.noexc34.i
  %388 = bitcast i8* %380 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i17.i.i, %"struct.std::_Rb_tree_node_base"* %388, %"struct.std::_Rb_tree_node_base"* %369, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc35.i unwind label %lpad25.i

.noexc35.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit20.i.i
  %389 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %390 = add i32 %389, 1                          ; <i32> [#uses=1]
  store i32 %390, i32* %9, align 4
  br label %invcont7.i

bb29.i.i:                                         ; preds = %bb26.i.i
  %391 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i)
          to label %.noexc36.i unwind label %lpad25.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]

.noexc36.i:                                       ; preds = %bb29.i.i
  %392 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %391, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %393 = load i8** %201, align 8                  ; <i8*> [#uses=7]
  %394 = bitcast %"struct.std::_Rb_tree_node_base"* %392 to i8** ; <i8**> [#uses=1]
  %395 = load i8** %394, align 4                  ; <i8*> [#uses=3]
  %396 = icmp ult i8* %393, %395                  ; <i1> [#uses=2]
  br i1 %396, label %bb31.i.i, label %bb.i.i.i15.i

bb.i.i.i15.i:                                     ; preds = %.noexc36.i
  %397 = icmp ult i8* %395, %393                  ; <i1> [#uses=1]
  br i1 %397, label %bb35.i.i, label %bb1.i.i.i16.i

bb1.i.i.i16.i:                                    ; preds = %bb.i.i.i15.i
  %398 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  %399 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %391, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %400 = load %"struct.std::_Rb_tree_node_base"** %399 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %401 = bitcast %"struct.std::_Rb_tree_node_base"* %400 to i8* ; <i8*> [#uses=1]
  %phitmp81.i.i = icmp ult i8* %398, %401         ; <i1> [#uses=1]
  br i1 %phitmp81.i.i, label %bb31.i.i, label %bb35.i.i

bb31.i.i:                                         ; preds = %bb1.i.i.i16.i, %.noexc36.i
  %402 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %403 = load %"struct.std::_Rb_tree_node_base"** %402, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %404 = icmp eq %"struct.std::_Rb_tree_node_base"* %403, null ; <i1> [#uses=1]
  br i1 %404, label %bb33.i.i, label %bb34.i.i

bb33.i.i:                                         ; preds = %bb31.i.i
  %405 = load i8** %285, align 4                  ; <i8*> [#uses=2]
  %406 = icmp ult i8* %393, %405                  ; <i1> [#uses=1]
  br i1 %406, label %bb4.i8.i.i, label %bb.i.i1.i3.i.i

bb.i.i1.i3.i.i:                                   ; preds = %bb33.i.i
  %407 = icmp ult i8* %405, %393                  ; <i1> [#uses=1]
  br i1 %407, label %bb3.i6.i.i, label %bb1.i.i.i5.i.i

bb1.i.i.i5.i.i:                                   ; preds = %bb.i.i1.i3.i.i
  %408 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  %409 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %410 = load %"struct.std::_Rb_tree_node_base"** %409 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %411 = bitcast %"struct.std::_Rb_tree_node_base"* %410 to i8* ; <i8*> [#uses=1]
  %phitmp.i4.i.i = icmp ult i8* %408, %411        ; <i1> [#uses=1]
  br i1 %phitmp.i4.i.i, label %bb4.i8.i.i, label %bb3.i6.i.i

bb3.i6.i.i:                                       ; preds = %bb1.i.i.i5.i.i, %bb.i.i1.i3.i.i
  br label %bb4.i8.i.i

bb4.i8.i.i:                                       ; preds = %bb3.i6.i.i, %bb1.i.i.i5.i.i, %bb33.i.i
  %iftmp.229.0.i7.i.i = phi i8 [ 0, %bb3.i6.i.i ], [ 1, %bb33.i.i ], [ 1, %bb1.i.i.i5.i.i ] ; <i8> [#uses=1]
  %412 = invoke i8* @_Znwj(i32 28)
          to label %.noexc37.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc37.i:                                       ; preds = %bb4.i8.i.i
  %413 = getelementptr inbounds i8* %412, i32 16  ; <i8*> [#uses=2]
  %414 = icmp eq i8* %413, null                   ; <i1> [#uses=1]
  br i1 %414, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10.i.i, label %bb.i.i.i9.i.i

bb.i.i.i9.i.i:                                    ; preds = %.noexc37.i
  %415 = bitcast i8* %413 to i8**                 ; <i8**> [#uses=1]
  store i8* %393, i8** %415
  %416 = getelementptr i8* %412, i32 20           ; <i8*> [#uses=1]
  %417 = bitcast i8* %416 to i8**                 ; <i8**> [#uses=1]
  %418 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  store i8* %418, i8** %417, align 4
  %419 = getelementptr i8* %412, i32 24           ; <i8*> [#uses=1]
  %420 = bitcast i8* %419 to i32*                 ; <i32*> [#uses=1]
  %421 = load i32* %203, align 8                  ; <i32> [#uses=1]
  store i32 %421, i32* %420, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10.i.i: ; preds = %bb.i.i.i9.i.i, %.noexc37.i
  %422 = bitcast i8* %412 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i7.i.i, %"struct.std::_Rb_tree_node_base"* %422, %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i.i, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc38.i unwind label %lpad25.i

.noexc38.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10.i.i
  %423 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %424 = add i32 %423, 1                          ; <i32> [#uses=1]
  store i32 %424, i32* %9, align 4
  br label %invcont7.i

bb34.i.i:                                         ; preds = %bb31.i.i
  %.not88.i.i = icmp ne %"struct.std::_Rb_tree_node_base"* %391, null ; <i1> [#uses=1]
  %425 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %391 ; <i1> [#uses=1]
  %or.cond89.i.i = or i1 %425, %.not88.i.i        ; <i1> [#uses=1]
  %brmerge.i.i = or i1 %or.cond89.i.i, %396       ; <i1> [#uses=1]
  br i1 %brmerge.i.i, label %bb4.i.i21.i, label %bb.i.i1.i.i17.i

bb.i.i1.i.i17.i:                                  ; preds = %bb34.i.i
  %426 = icmp ult i8* %395, %393                  ; <i1> [#uses=1]
  br i1 %426, label %bb3.i.i20.i, label %bb1.i.i.i.i19.i

bb1.i.i.i.i19.i:                                  ; preds = %bb.i.i1.i.i17.i
  %427 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  %428 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %391, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %429 = load %"struct.std::_Rb_tree_node_base"** %428 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %430 = bitcast %"struct.std::_Rb_tree_node_base"* %429 to i8* ; <i8*> [#uses=1]
  %phitmp.i.i18.i = icmp ult i8* %427, %430       ; <i1> [#uses=1]
  br i1 %phitmp.i.i18.i, label %bb4.i.i21.i, label %bb3.i.i20.i

bb3.i.i20.i:                                      ; preds = %bb1.i.i.i.i19.i, %bb.i.i1.i.i17.i
  br label %bb4.i.i21.i

bb4.i.i21.i:                                      ; preds = %bb3.i.i20.i, %bb1.i.i.i.i19.i, %bb34.i.i
  %iftmp.229.0.i.i.i = phi i8 [ 0, %bb3.i.i20.i ], [ 1, %bb34.i.i ], [ 1, %bb1.i.i.i.i19.i ] ; <i8> [#uses=1]
  %431 = invoke i8* @_Znwj(i32 28)
          to label %.noexc39.i unwind label %lpad25.i ; <i8*> [#uses=4]

.noexc39.i:                                       ; preds = %bb4.i.i21.i
  %432 = getelementptr inbounds i8* %431, i32 16  ; <i8*> [#uses=2]
  %433 = icmp eq i8* %432, null                   ; <i1> [#uses=1]
  br i1 %433, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit.i.i, label %bb.i.i.i.i22.i

bb.i.i.i.i22.i:                                   ; preds = %.noexc39.i
  %434 = bitcast i8* %432 to i8**                 ; <i8**> [#uses=1]
  store i8* %393, i8** %434
  %435 = getelementptr i8* %431, i32 20           ; <i8*> [#uses=1]
  %436 = bitcast i8* %435 to i8**                 ; <i8**> [#uses=1]
  %437 = load i8** %202, align 4                  ; <i8*> [#uses=1]
  store i8* %437, i8** %436, align 4
  %438 = getelementptr i8* %431, i32 24           ; <i8*> [#uses=1]
  %439 = bitcast i8* %438 to i32*                 ; <i32*> [#uses=1]
  %440 = load i32* %203, align 8                  ; <i32> [#uses=1]
  store i32 %440, i32* %439, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit.i.i: ; preds = %bb.i.i.i.i22.i, %.noexc39.i
  %441 = bitcast i8* %431 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i.i.i, %"struct.std::_Rb_tree_node_base"* %441, %"struct.std::_Rb_tree_node_base"* %391, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc40.i unwind label %lpad25.i

.noexc40.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit.i.i
  %442 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %443 = add i32 %442, 1                          ; <i32> [#uses=1]
  store i32 %443, i32* %9, align 4
  br label %invcont7.i

bb35.i.i:                                         ; preds = %bb1.i.i.i16.i, %bb.i.i.i15.i
  invoke fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE16_M_insert_uniqueERKS5_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* noalias sret %0, %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %204, %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %3)
          to label %.noexc41.i unwind label %lpad25.i

.noexc41.i:                                       ; preds = %bb35.i.i
  %444 = load %"struct.std::_Rb_tree_node_base"** %207, align 8 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %invcont7.i

invcont7.i:                                       ; preds = %.noexc41.i, %.noexc40.i, %.noexc38.i, %.noexc35.i, %bb24.i.i, %.noexc33.i, %.noexc32.i, %.noexc30.i, %.noexc27.i, %.noexc25.i, %.noexc23.i, %bb1.i.i.i.i, %bb.i.i1.i.i
  %__i.0.0.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.ph.in.i.i.i.i, %bb.i.i1.i.i ], [ %__y.0.ph.in.i.i.i.i, %bb1.i.i.i.i ], [ %267, %.noexc23.i ], [ %281, %.noexc25.i ], [ %311, %.noexc27.i ], [ %344, %.noexc30.i ], [ %365, %.noexc32.i ], [ %368, %.noexc33.i ], [ %388, %.noexc35.i ], [ %422, %.noexc38.i ], [ %441, %.noexc40.i ], [ %444, %.noexc41.i ], [ %__y.0.ph.in.i.i.i.i, %bb24.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %445 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__i.0.0.i.i, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=2]
  %446 = bitcast %"struct.std::_Rb_tree_node_base"** %445 to i32* ; <i32*> [#uses=1]
  %447 = load i32* %446, align 4                  ; <i32> [#uses=1]
  %448 = add nsw i32 %447, 1                      ; <i32> [#uses=1]
  %.c.i = inttoptr i32 %448 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %.c.i, %"struct.std::_Rb_tree_node_base"** %445
  br label %bb8.i

bb8.i:                                            ; preds = %invcont7.i, %invcont3.i, %_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode.exit.i
  %449 = load i32 (...)*** %24, align 8           ; <i32 (...)**> [#uses=1]
  %450 = getelementptr inbounds i32 (...)** %449, i32 -3 ; <i32 (...)**> [#uses=1]
  %451 = bitcast i32 (...)** %450 to i32*         ; <i32*> [#uses=1]
  %452 = load i32* %451, align 4                  ; <i32> [#uses=1]
  %453 = add i32 %452, %11                        ; <i32> [#uses=1]
  %454 = inttoptr i32 %453 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx33 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %454, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx33.val = load %"struct.std::ctype<char>"** %.idx33 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %455 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx33.val, i8 signext 10)
          to label %.noexc.i unwind label %lpad25.i ; <i8> [#uses=1]

.noexc.i:                                         ; preds = %bb8.i
  %456 = invoke %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"* %198, i8* %199, i32 32, i8 signext %455)
          to label %invcont9.i unwind label %lpad25.i ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=2]

invcont9.i:                                       ; preds = %.noexc.i
  %457 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >"* %456, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %458 = load i32 (...)*** %457, align 4          ; <i32 (...)**> [#uses=1]
  %459 = getelementptr inbounds i32 (...)** %458, i32 -3 ; <i32 (...)**> [#uses=1]
  %460 = bitcast i32 (...)** %459 to i32*         ; <i32*> [#uses=1]
  %461 = load i32* %460, align 4                  ; <i32> [#uses=1]
  %462 = ptrtoint %"struct.std::basic_istream<char,std::char_traits<char> >"* %456 to i32 ; <i32> [#uses=1]
  %463 = add i32 %461, %462                       ; <i32> [#uses=2]
  %464 = inttoptr i32 %463 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %465 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %464, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %466 = load i32* %465, align 4                  ; <i32> [#uses=1]
  %467 = and i32 %466, 5                          ; <i32> [#uses=1]
  %468 = icmp eq i32 %467, 0                      ; <i1> [#uses=1]
  br i1 %468, label %invcont10.i, label %bb15.i

invcont10.i:                                      ; preds = %invcont9.i
  %469 = inttoptr i32 %463 to i8*                 ; <i8*> [#uses=1]
  %470 = icmp eq i8* %469, null                   ; <i1> [#uses=1]
  br i1 %470, label %bb15.i, label %invcont1.i

bb15.i:                                           ; preds = %invcont10.i, %invcont9.i
  invoke fastcc void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i)
          to label %_ZN13spell_checkerC2Ev.exit unwind label %lpad.i

invcont20.i:                                      ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i8, %ppad.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

lpad.i:                                           ; preds = %bb15.i, %invcont14.i.i, %invcont
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select24.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad25.i:                                         ; preds = %.noexc.i, %bb8.i, %bb35.i.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit.i.i, %bb4.i.i21.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10.i.i, %bb4.i8.i.i, %bb29.i.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit20.i.i, %bb4.i18.i.i, %bb23.i.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit35.i.i, %bb4.i33.i.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit45.i.i, %bb4.i43.i.i, %bb17.i.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit60.i.i, %bb4.i58.i.i, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit75.i.i, %bb4.i73.i.i, %bb7.i.i, %bb4.i
  %eh_ptr26.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select28.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke fastcc void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"struct.std::basic_ifstream<char,std::char_traits<char> >"* %in.i)
          to label %ppad.i unwind label %lpad29.i

lpad29.i:                                         ; preds = %lpad25.i
  %eh_ptr30.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select32.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i:                                           ; preds = %lpad25.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr26.i, %lpad25.i ] ; <i8*> [#uses=1]
  %471 = load %"struct.std::_Rb_tree_node_base"** %6, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %472 = icmp eq %"struct.std::_Rb_tree_node_base"* %471, null ; <i1> [#uses=1]
  br i1 %472, label %invcont20.i, label %bb.i.i.i.i3

bb.i.i.i.i3:                                      ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i8, %ppad.i
  %__x_addr.02.i.in.i.i.i2 = phi %"struct.std::_Rb_tree_node_base"* [ %483, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i8 ], [ %471, %ppad.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %473 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i2, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %474 = load %"struct.std::_Rb_tree_node_base"** %473, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %475 = icmp eq %"struct.std::_Rb_tree_node_base"* %474, null ; <i1> [#uses=1]
  br i1 %475, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i8, label %bb.i.i.i.i.i6

bb.i.i.i.i.i6:                                    ; preds = %bb.i.i.i.i.i6, %bb.i.i.i.i3
  %__x_addr.0.i1.i.i.i.i4.in = phi %"struct.std::_Rb_tree_node_base"* [ %480, %bb.i.i.i.i.i6 ], [ %474, %bb.i.i.i.i3 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %476 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i4.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %477 = load %"struct.std::_Rb_tree_node_base"** %476, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %478 = bitcast %"struct.std::_Rb_tree_node_base"* %477 to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E(%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %478) nounwind
  %479 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i4.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %480 = load %"struct.std::_Rb_tree_node_base"** %479, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %481 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i4.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %481) nounwind
  %phitmp4.i.i.i.i5 = icmp eq %"struct.std::_Rb_tree_node_base"* %480, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i.i5, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i8, label %bb.i.i.i.i.i6

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i8: ; preds = %bb.i.i.i.i.i6, %bb.i.i.i.i3
  %482 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i2, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %483 = load %"struct.std::_Rb_tree_node_base"** %482, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %484 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i2 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %484) nounwind
  %phitmp.i.i.i.i7 = icmp eq %"struct.std::_Rb_tree_node_base"* %483, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i7, label %invcont20.i, label %bb.i.i.i.i3

_ZN13spell_checkerC2Ev.exit:                      ; preds = %bb15.i
  %485 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 2, i32 4), align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %486 = getelementptr inbounds [4096 x i8]* %buff, i32 0, i32 0 ; <i8*> [#uses=1]
  %487 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %485, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %488 = load i32 (...)*** %487, align 4          ; <i32 (...)**> [#uses=1]
  %489 = getelementptr inbounds i32 (...)** %488, i32 3 ; <i32 (...)**> [#uses=1]
  %490 = load i32 (...)** %489, align 4           ; <i32 (...)*> [#uses=1]
  %491 = bitcast i32 (...)* %490 to %"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %492 = invoke %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %491(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %485, i8* %486, i32 4096)
          to label %invcont1 unwind label %lpad   ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=0]

invcont1:                                         ; preds = %_ZN13spell_checkerC2Ev.exit
  %493 = getelementptr inbounds [32 x i8]* %line.i9, i32 0, i32 0 ; <i8*> [#uses=7]
  br label %bb2.i

bb.i:                                             ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit.i
  %494 = load i32* getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 1), align 4 ; <i32> [#uses=1]
  %.sum.i10 = add i32 %494, -1                    ; <i32> [#uses=1]
  %495 = getelementptr inbounds [32 x i8]* %line.i9, i32 0, i32 %.sum.i10 ; <i8*> [#uses=2]
  br label %bb5.outer.i.i.i13

bb5.outer.i.i.i13:                                ; preds = %bb3.i.i.i18, %bb.i
  %__y.0.ph.in.i.i.i11 = phi %"struct.std::_Rb_tree_node_base"* [ %10, %bb.i ], [ %__x.0.in.i.i.i21, %bb3.i.i.i18 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %__x.0.in.in.ph.i.i.i12 = phi %"struct.std::_Rb_tree_node_base"** [ %6, %bb.i ], [ %504, %bb3.i.i.i18 ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i22

bb.i.i.i14:                                       ; preds = %bb5.i.i.i22
  %496 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i21, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %497 = bitcast %"struct.std::_Rb_tree_node_base"* %496 to i8** ; <i8**> [#uses=1]
  %498 = load i8** %497, align 4                  ; <i8*> [#uses=2]
  %499 = icmp ult i8* %498, %493                  ; <i1> [#uses=1]
  br i1 %499, label %bb4.i.i.i19, label %bb.i.i1.i.i.i15

bb.i.i1.i.i.i15:                                  ; preds = %bb.i.i.i14
  %500 = icmp ult i8* %493, %498                  ; <i1> [#uses=1]
  br i1 %500, label %bb3.i.i.i18, label %bb1.i.i3.i.i.i17

bb1.i.i3.i.i.i17:                                 ; preds = %bb.i.i1.i.i.i15
  %501 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i21, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %502 = load %"struct.std::_Rb_tree_node_base"** %501 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %503 = bitcast %"struct.std::_Rb_tree_node_base"* %502 to i8* ; <i8*> [#uses=1]
  %phitmp6.i.i.i16 = icmp ult i8* %503, %495      ; <i1> [#uses=1]
  br i1 %phitmp6.i.i.i16, label %bb4.i.i.i19, label %bb3.i.i.i18

bb3.i.i.i18:                                      ; preds = %bb1.i.i3.i.i.i17, %bb.i.i1.i.i.i15
  %504 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i21, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.outer.i.i.i13

bb4.i.i.i19:                                      ; preds = %bb1.i.i3.i.i.i17, %bb.i.i.i14
  %505 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i21, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i22

bb5.i.i.i22:                                      ; preds = %bb4.i.i.i19, %bb5.outer.i.i.i13
  %__x.0.in.in.i.i.i20 = phi %"struct.std::_Rb_tree_node_base"** [ %505, %bb4.i.i.i19 ], [ %__x.0.in.in.ph.i.i.i12, %bb5.outer.i.i.i13 ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in.i.i.i21 = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.i.i.i20 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]
  %506 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i21, null ; <i1> [#uses=1]
  br i1 %506, label %bb6.i.i.i23, label %bb.i.i.i14

bb6.i.i.i23:                                      ; preds = %bb5.i.i.i22
  %507 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i11, %10 ; <i1> [#uses=1]
  br i1 %507, label %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i, label %bb8.i.i.i24

bb8.i.i.i24:                                      ; preds = %bb6.i.i.i23
  %508 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i11, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %509 = bitcast %"struct.std::_Rb_tree_node_base"* %508 to i8** ; <i8**> [#uses=1]
  %510 = load i8** %509, align 4                  ; <i8*> [#uses=2]
  %511 = icmp ult i8* %493, %510                  ; <i1> [#uses=1]
  br i1 %511, label %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i, label %bb.i.i.i.i.i25

bb.i.i.i.i.i25:                                   ; preds = %bb8.i.i.i24
  %512 = icmp ult i8* %510, %493                  ; <i1> [#uses=1]
  br i1 %512, label %bb11.i.i.i28, label %bb1.i.i.i.i.i27

bb1.i.i.i.i.i27:                                  ; preds = %bb.i.i.i.i.i25
  %513 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i11, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %514 = load %"struct.std::_Rb_tree_node_base"** %513 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %515 = bitcast %"struct.std::_Rb_tree_node_base"* %514 to i8* ; <i8*> [#uses=1]
  %phitmp.i.i.i26 = icmp ult i8* %495, %515       ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i26, label %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i, label %bb11.i.i.i28

bb11.i.i.i28:                                     ; preds = %bb1.i.i.i.i.i27, %bb.i.i.i.i.i25
  br label %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i

_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i: ; preds = %bb11.i.i.i28, %bb1.i.i.i.i.i27, %bb8.i.i.i24, %bb6.i.i.i23
  %.0.0.i29 = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.ph.in.i.i.i11, %bb11.i.i.i28 ], [ %10, %bb6.i.i.i23 ], [ %10, %bb8.i.i.i24 ], [ %10, %bb1.i.i.i.i.i27 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %516 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %.0.0.i29 ; <i1> [#uses=1]
  br i1 %516, label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i, label %bb2.i

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i: ; preds = %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i
  %517 = call i32 @strlen(i8* %493) nounwind readonly ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %493, i32 %517)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i
  store i8 10, i8* %__c_addr.i.i
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %__c_addr.i.i, i32 1)
          to label %bb2.i unwind label %lpad

bb2.i:                                            ; preds = %.noexc, %_ZNSt3mapISt4pairIPKcS2_EiSt4lessIS3_ESaIS0_IKS3_iEEE4findERS6_.exit.i, %invcont1
  %518 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %519 = getelementptr inbounds i32 (...)** %518, i32 -3 ; <i32 (...)**> [#uses=1]
  %520 = bitcast i32 (...)** %519 to i32*         ; <i32*> [#uses=1]
  %521 = load i32* %520, align 4                  ; <i32> [#uses=1]
  %522 = add i32 %521, ptrtoint (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin to i32) ; <i32> [#uses=1]
  %523 = inttoptr i32 %522 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %523, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %524 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10)
          to label %.noexc31 unwind label %lpad   ; <i8> [#uses=1]

.noexc31:                                         ; preds = %bb2.i
  %525 = invoke %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i8* %493, i32 32, i8 signext %524)
          to label %.noexc32 unwind label %lpad   ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=2]

.noexc32:                                         ; preds = %.noexc31
  %526 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >"* %525, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %527 = load i32 (...)*** %526, align 4          ; <i32 (...)**> [#uses=1]
  %528 = getelementptr inbounds i32 (...)** %527, i32 -3 ; <i32 (...)**> [#uses=1]
  %529 = bitcast i32 (...)** %528 to i32*         ; <i32*> [#uses=1]
  %530 = load i32* %529, align 4                  ; <i32> [#uses=1]
  %531 = ptrtoint %"struct.std::basic_istream<char,std::char_traits<char> >"* %525 to i32 ; <i32> [#uses=1]
  %532 = add i32 %530, %531                       ; <i32> [#uses=2]
  %533 = inttoptr i32 %532 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %534 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %533, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %535 = load i32* %534, align 4                  ; <i32> [#uses=1]
  %536 = and i32 %535, 5                          ; <i32> [#uses=1]
  %537 = icmp eq i32 %536, 0                      ; <i1> [#uses=1]
  br i1 %537, label %_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit.i, label %bb5

_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit.i: ; preds = %.noexc32
  %538 = inttoptr i32 %532 to i8*                 ; <i8*> [#uses=1]
  %phitmp.i = icmp eq i8* %538, null              ; <i1> [#uses=1]
  br i1 %phitmp.i, label %bb5, label %bb.i

invcont3:                                         ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i, %lpad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable

bb5:                                              ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit.i, %.noexc32
  %539 = load %"struct.std::_Rb_tree_node_base"** %6, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %540 = icmp eq %"struct.std::_Rb_tree_node_base"* %539, null ; <i1> [#uses=1]
  br i1 %540, label %_ZN13spell_checkerD1Ev.exit8, label %bb.i.i.i.i2

bb.i.i.i.i2:                                      ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i7, %bb5
  %__x_addr.02.i.in.i.i.i1 = phi %"struct.std::_Rb_tree_node_base"* [ %551, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i7 ], [ %539, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %541 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i1, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %542 = load %"struct.std::_Rb_tree_node_base"** %541, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %543 = icmp eq %"struct.std::_Rb_tree_node_base"* %542, null ; <i1> [#uses=1]
  br i1 %543, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i7, label %bb.i.i.i.i.i5

bb.i.i.i.i.i5:                                    ; preds = %bb.i.i.i.i.i5, %bb.i.i.i.i2
  %__x_addr.0.i1.i.i.i.i3.in = phi %"struct.std::_Rb_tree_node_base"* [ %548, %bb.i.i.i.i.i5 ], [ %542, %bb.i.i.i.i2 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %544 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i3.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %545 = load %"struct.std::_Rb_tree_node_base"** %544, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %546 = bitcast %"struct.std::_Rb_tree_node_base"* %545 to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E(%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %546) nounwind
  %547 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i3.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %548 = load %"struct.std::_Rb_tree_node_base"** %547, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %549 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i3.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %549) nounwind
  %phitmp4.i.i.i.i4 = icmp eq %"struct.std::_Rb_tree_node_base"* %548, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i.i4, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i7, label %bb.i.i.i.i.i5

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i7: ; preds = %bb.i.i.i.i.i5, %bb.i.i.i.i2
  %550 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i1, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %551 = load %"struct.std::_Rb_tree_node_base"** %550, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %552 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i1 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %552) nounwind
  %phitmp.i.i.i.i6 = icmp eq %"struct.std::_Rb_tree_node_base"* %551, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i6, label %_ZN13spell_checkerD1Ev.exit8, label %bb.i.i.i.i2

_ZN13spell_checkerD1Ev.exit8:                     ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i7, %bb5
  ret i32 0

lpad:                                             ; preds = %.noexc31, %bb2.i, %.noexc, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i, %_ZN13spell_checkerC2Ev.exit
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select8 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %553 = load %"struct.std::_Rb_tree_node_base"** %6, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %554 = icmp eq %"struct.std::_Rb_tree_node_base"* %553, null ; <i1> [#uses=1]
  br i1 %554, label %invcont3, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i, %lpad
  %__x_addr.02.i.in.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %565, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i ], [ %553, %lpad ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %555 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %556 = load %"struct.std::_Rb_tree_node_base"** %555, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %557 = icmp eq %"struct.std::_Rb_tree_node_base"* %556, null ; <i1> [#uses=1]
  br i1 %557, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %bb.i.i.i.i
  %__x_addr.0.i1.i.i.i.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %562, %bb.i.i.i.i.i ], [ %556, %bb.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %558 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %559 = load %"struct.std::_Rb_tree_node_base"** %558, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %560 = bitcast %"struct.std::_Rb_tree_node_base"* %559 to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E(%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %560) nounwind
  %561 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %562 = load %"struct.std::_Rb_tree_node_base"** %561, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %563 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %563) nounwind
  %phitmp4.i.i.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %562, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i.i, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i, label %bb.i.i.i.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i.i.i.i: ; preds = %bb.i.i.i.i.i, %bb.i.i.i.i
  %564 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %565 = load %"struct.std::_Rb_tree_node_base"** %564, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %566 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %566) nounwind
  %phitmp.i.i.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %565, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i, label %invcont3, label %bb.i.i.i.i
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

define internal fastcc %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x.0.2.val) nounwind readnone {
entry:
  %0 = bitcast %"struct.std::_Rb_tree_node_base"* %__x.0.2.val to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  ret %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %0
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> > >"*)

declare i8* @_Znaj(i32)

declare void @_ZNSt8ios_baseC2Ev(%"struct.std::ios_base"*)

declare void @_ZNSt6localeC1Ev(%"struct.std::locale"*) nounwind

declare i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12*)

declare void @__cxa_call_unexpected(i8*) noreturn

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_ZSt16__throw_bad_castv() noreturn

declare void @_ZNSt6localeD1Ev(%"struct.std::locale"*) nounwind

declare void @_ZdlPv(i8*) nounwind

declare void @_ZNSt12__basic_fileIcEC1EP15pthread_mutex_t(%"struct.std::__basic_file<char>"*, %struct.pthread_mutex_t*)

declare void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"*)

declare void @_ZSt9terminatev() noreturn nounwind

declare void @_Unwind_Resume_or_Rethrow(i8*)

define internal fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E(%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x) nounwind {
entry:
  %0 = icmp eq %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x, null ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb

bb:                                               ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit, %entry
  %__x_addr.02 = phi %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* [ %24, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit ], [ %__x, %entry ] ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=3]
  %1 = getelementptr inbounds %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x_addr.02, i32 0, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %2 = load %"struct.std::_Rb_tree_node_base"** %1, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %3 = icmp eq %"struct.std::_Rb_tree_node_base"* %2, null ; <i1> [#uses=1]
  br i1 %3, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit, label %bb.i

bb.i:                                             ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit2, %bb
  %__x_addr.0.i1.in = phi %"struct.std::_Rb_tree_node_base"* [ %20, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit2 ], [ %2, %bb ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %4 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %5 = load %"struct.std::_Rb_tree_node_base"** %4, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %6 = icmp eq %"struct.std::_Rb_tree_node_base"* %5, null ; <i1> [#uses=1]
  br i1 %6, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit2, label %bb.i1

bb.i1:                                            ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i, %bb.i
  %__x_addr.02.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %17, %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i ], [ %5, %bb.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %7 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %8 = load %"struct.std::_Rb_tree_node_base"** %7, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %9 = bitcast %"struct.std::_Rb_tree_node_base"* %8 to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  %10 = icmp eq %"struct.std::_Rb_tree_node_base"* %8, null ; <i1> [#uses=1]
  br i1 %10, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i1
  %__x_addr.0.i1.i = phi %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* [ %14, %bb.i.i ], [ %9, %bb.i1 ] ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=3]
  %11 = getelementptr inbounds %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x_addr.0.i1.i, i32 0, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %12 = load %"struct.std::_Rb_tree_node_base"** %11, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %13 = bitcast %"struct.std::_Rb_tree_node_base"* %12 to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  tail call fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E(%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %13) nounwind
  %.idx = getelementptr %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x_addr.0.i1.i, i32 0, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %.idx.val = load %"struct.std::_Rb_tree_node_base"** %.idx ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %14 = tail call fastcc %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %.idx.val) nounwind ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=2]
  %15 = bitcast %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x_addr.0.i1.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %15) nounwind
  %phitmp4.i = icmp eq %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %14, null ; <i1> [#uses=1]
  br i1 %phitmp4.i, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i, label %bb.i.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i: ; preds = %bb.i.i, %bb.i1
  %16 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %17 = load %"struct.std::_Rb_tree_node_base"** %16, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %18 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %18) nounwind
  %phitmp.i = icmp eq %"struct.std::_Rb_tree_node_base"* %17, null ; <i1> [#uses=1]
  br i1 %phitmp.i, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit2, label %bb.i1

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit2: ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit.i, %bb.i
  %19 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %20 = load %"struct.std::_Rb_tree_node_base"** %19, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %21 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %21) nounwind
  %phitmp4 = icmp eq %"struct.std::_Rb_tree_node_base"* %20, null ; <i1> [#uses=1]
  br i1 %phitmp4, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit, label %bb.i

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit: ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit2, %bb
  %22 = getelementptr inbounds %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x_addr.02, i32 0, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %23 = load %"struct.std::_Rb_tree_node_base"** %22, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %24 = bitcast %"struct.std::_Rb_tree_node_base"* %23 to %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"*> [#uses=1]
  %25 = bitcast %"struct.std::_Rb_tree_node<std::pair<const std::pair<const char*, const char*>, int> >"* %__x_addr.02 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %25) nounwind
  %phitmp = icmp eq %"struct.std::_Rb_tree_node_base"* %23, null ; <i1> [#uses=1]
  br i1 %phitmp, label %return, label %bb

return:                                           ; preds = %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E.exit, %entry
  ret void
}

declare %"struct.std::ctype<char>"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"struct.std::locale"*)

declare void @_ZNSt8ios_base7_M_initEv(%"struct.std::ios_base"*)

declare zeroext i8 @_ZNKSt12__basic_fileIcE7is_openEv(%"struct.std::__basic_file<char>"*)

declare i32 @_ZNSt12__basic_fileIcE6xsputnEPKci(%"struct.std::__basic_file<char>"*, i8*, i32)

declare void @_ZdaPv(i8*) nounwind

define internal fastcc void @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this) nounwind {
entry:
  %__next.i = alloca i8*, align 4                 ; <i8**> [#uses=2]
  %__buf.i = alloca [128 x i8], align 1           ; <[128 x i8]*> [#uses=3]
  %0 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 2 ; <%"struct.std::__basic_file<char>"*> [#uses=3]
  %1 = invoke zeroext i8 @_ZNKSt12__basic_fileIcE7is_openEv(%"struct.std::__basic_file<char>"* %0)
          to label %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit unwind label %lpad.i ; <i8> [#uses=1]

lpad.i:                                           ; preds = %entry
  %eh_ptr.i = tail call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  tail call void @__cxa_call_unexpected(i8* %eh_ptr.i) noreturn nounwind
  unreachable

_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit: ; preds = %entry
  %toBool = icmp eq i8 %1, 0                      ; <i1> [#uses=1]
  br i1 %toBool, label %bb18, label %bb

bb:                                               ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit
  %2 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 4 ; <i8**> [#uses=2]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 5 ; <i8**> [#uses=2]
  %5 = load i8** %4, align 4                      ; <i8*> [#uses=1]
  %6 = icmp ult i8* %3, %5                        ; <i1> [#uses=1]
  br i1 %6, label %bb.i1, label %bb4.i

bb.i1:                                            ; preds = %bb
  %7 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %8 = load i32 (...)*** %7, align 4              ; <i32 (...)**> [#uses=1]
  %9 = getelementptr inbounds i32 (...)** %8, i32 13 ; <i32 (...)**> [#uses=1]
  %10 = load i32 (...)** %9, align 4              ; <i32 (...)*> [#uses=1]
  %11 = bitcast i32 (...)* %10 to i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %12 = invoke i32 %11(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 -1)
          to label %.noexc unwind label %lpad23   ; <i32> [#uses=1]

.noexc:                                           ; preds = %bb.i1
  %13 = icmp eq i32 %12, -1                       ; <i1> [#uses=1]
  br i1 %13, label %bb3.i2, label %bb4.i

bb3.i2:                                           ; preds = %.noexc
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i2, %.noexc, %bb
  %__testvalid.0.i = phi i8 [ 0, %bb3.i2 ], [ 1, %bb ], [ 1, %.noexc ] ; <i8> [#uses=2]
  %14 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 11 ; <i8*> [#uses=1]
  %15 = load i8* %14, align 2                     ; <i8> [#uses=1]
  %toBool5.i = icmp eq i8 %15, 0                  ; <i1> [#uses=1]
  br i1 %toBool5.i, label %bb7, label %bb9.i

bb9.i:                                            ; preds = %bb4.i
  %16 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 16 ; <%"struct.std::codecvt<char,char,__mbstate_t>"**> [#uses=2]
  %17 = load %"struct.std::codecvt<char,char,__mbstate_t>"** %16, align 4 ; <%"struct.std::codecvt<char,char,__mbstate_t>"*> [#uses=3]
  %18 = icmp eq %"struct.std::codecvt<char,char,__mbstate_t>"* %17, null ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i, label %_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i

bb.i.i:                                           ; preds = %bb9.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc3 unwind label %lpad23

.noexc3:                                          ; preds = %bb.i.i
  unreachable

_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i: ; preds = %bb9.i
  %19 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %17, i32 0, i32 0 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  %20 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %17, i32 0, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %21 = load i32 (...)*** %20, align 4            ; <i32 (...)**> [#uses=1]
  %22 = getelementptr inbounds i32 (...)** %21, i32 6 ; <i32 (...)**> [#uses=1]
  %23 = load i32 (...)** %22, align 4             ; <i32 (...)*> [#uses=1]
  %24 = bitcast i32 (...)* %23 to i8 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*)* ; <i8 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*)*> [#uses=1]
  %25 = invoke zeroext i8 %24(%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %19)
          to label %_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i unwind label %lpad.i.i ; <i8> [#uses=1]

lpad.i.i:                                         ; preds = %_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i) noreturn nounwind
  unreachable

_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i: ; preds = %_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i
  %toBool10.not.i = icmp ne i8 %25, 0             ; <i1> [#uses=1]
  %toBool18.i = icmp eq i8 %__testvalid.0.i, 0    ; <i1> [#uses=1]
  %or.cond.i = or i1 %toBool10.not.i, %toBool18.i ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb7, label %bb27.preheader.i

bb27.preheader.i:                                 ; preds = %_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i
  %26 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 5 ; <%struct.__mbstate_t*> [#uses=1]
  %27 = getelementptr inbounds [128 x i8]* %__buf.i, i32 0, i32 0 ; <i8*> [#uses=2]
  %28 = getelementptr inbounds [128 x i8]* %__buf.i, i32 0, i32 128 ; <i8*> [#uses=1]
  %__buf31.i = ptrtoint [128 x i8]* %__buf.i to i32 ; <i32> [#uses=1]
  br label %bb27.i

bb27.i:                                           ; preds = %bb35.i, %bb27.preheader.i
  %__ilen.1.i = phi i32 [ 0, %bb27.preheader.i ], [ %__ilen.0.i, %bb35.i ] ; <i32> [#uses=2]
  %__testvalid.2.i = phi i8 [ %__testvalid.0.i, %bb27.preheader.i ], [ %__testvalid.1.i, %bb35.i ] ; <i8> [#uses=3]
  %29 = load %"struct.std::codecvt<char,char,__mbstate_t>"** %16, align 4 ; <%"struct.std::codecvt<char,char,__mbstate_t>"*> [#uses=2]
  %30 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %29, i32 0, i32 0 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  %31 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %29, i32 0, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %32 = load i32 (...)*** %31, align 4            ; <i32 (...)**> [#uses=1]
  %33 = getelementptr inbounds i32 (...)** %32, i32 3 ; <i32 (...)**> [#uses=1]
  %34 = load i32 (...)** %33, align 4             ; <i32 (...)*> [#uses=1]
  %35 = bitcast i32 (...)* %34 to i32 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*, %struct.__mbstate_t*, i8*, i8*, i8**)* ; <i32 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*, %struct.__mbstate_t*, i8*, i8*, i8**)*> [#uses=1]
  %36 = invoke i32 %35(%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %30, %struct.__mbstate_t* %26, i8* %27, i8* %28, i8** %__next.i)
          to label %.noexc4 unwind label %lpad23  ; <i32> [#uses=3]

.noexc4:                                          ; preds = %bb27.i
  %37 = icmp eq i32 %36, 2                        ; <i1> [#uses=1]
  br i1 %37, label %bb35.i, label %bb29.i

bb29.i:                                           ; preds = %.noexc4
  %38 = icmp ugt i32 %36, 1                       ; <i1> [#uses=1]
  br i1 %38, label %bb35.i, label %bb30.i

bb30.i:                                           ; preds = %bb29.i
  %39 = load i8** %__next.i, align 4              ; <i8*> [#uses=1]
  %40 = ptrtoint i8* %39 to i32                   ; <i32> [#uses=1]
  %41 = sub i32 %40, %__buf31.i                   ; <i32> [#uses=6]
  %42 = icmp sgt i32 %41, 0                       ; <i1> [#uses=1]
  br i1 %42, label %bb33.i, label %bb35.i

bb33.i:                                           ; preds = %bb30.i
  %43 = invoke i32 @_ZNSt12__basic_fileIcE6xsputnEPKci(%"struct.std::__basic_file<char>"* %0, i8* %27, i32 %41)
          to label %.noexc5 unwind label %lpad23  ; <i32> [#uses=1]

.noexc5:                                          ; preds = %bb33.i
  %44 = icmp eq i32 %43, %41                      ; <i1> [#uses=1]
  br i1 %44, label %bb35.i, label %bb34.i

bb34.i:                                           ; preds = %.noexc5
  br label %bb35.i

bb35.i:                                           ; preds = %bb34.i, %.noexc5, %bb30.i, %bb29.i, %.noexc4
  %__ilen.0.i = phi i32 [ %41, %bb34.i ], [ %__ilen.1.i, %.noexc4 ], [ %__ilen.1.i, %bb29.i ], [ %41, %bb30.i ], [ %41, %.noexc5 ] ; <i32> [#uses=2]
  %__testvalid.1.i = phi i8 [ 0, %bb34.i ], [ 0, %.noexc4 ], [ %__testvalid.2.i, %bb29.i ], [ %__testvalid.2.i, %bb30.i ], [ %__testvalid.2.i, %.noexc5 ] ; <i8> [#uses=2]
  %45 = icmp eq i32 %36, 1                        ; <i1> [#uses=1]
  %46 = icmp sgt i32 %__ilen.0.i, 0               ; <i1> [#uses=1]
  %47 = and i1 %46, %45                           ; <i1> [#uses=1]
  %.not.i = xor i1 %47, true                      ; <i1> [#uses=1]
  %toBool43.i = icmp eq i8 %__testvalid.1.i, 0    ; <i1> [#uses=2]
  %or.cond1.i = or i1 %toBool43.i, %.not.i        ; <i1> [#uses=1]
  br i1 %or.cond1.i, label %bb44.i, label %bb27.i

bb44.i:                                           ; preds = %bb35.i
  br i1 %toBool43.i, label %bb7, label %bb46.i

bb46.i:                                           ; preds = %bb44.i
  %48 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %49 = load i32 (...)*** %48, align 4            ; <i32 (...)**> [#uses=1]
  %50 = getelementptr inbounds i32 (...)** %49, i32 13 ; <i32 (...)**> [#uses=1]
  %51 = load i32 (...)** %50, align 4             ; <i32 (...)*> [#uses=1]
  %52 = bitcast i32 (...)* %51 to i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %53 = invoke i32 %52(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 -1)
          to label %bb7 unwind label %lpad23      ; <i32> [#uses=0]

bb7:                                              ; preds = %lpad23, %bb46.i, %bb44.i, %_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i, %bb4.i
  %54 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %54, align 4
  %55 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 15 ; <i8*> [#uses=1]
  store i8 0, i8* %55, align 4
  %56 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 9 ; <i8*> [#uses=2]
  %57 = load i8* %56, align 4                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %57, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb3.i, label %bb.i

bb.i:                                             ; preds = %bb7
  %58 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 7 ; <i8**> [#uses=2]
  %59 = load i8** %58, align 4                    ; <i8*> [#uses=2]
  %60 = icmp eq i8* %59, null                     ; <i1> [#uses=1]
  br i1 %60, label %bb2.i, label %bb1.i

bb1.i:                                            ; preds = %bb.i
  tail call void @_ZdaPv(i8* %59) nounwind
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i, %bb.i
  store i8* null, i8** %58, align 4
  store i8 0, i8* %56, align 4
  br label %bb3.i

bb3.i:                                            ; preds = %bb2.i, %bb7
  %61 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 17 ; <i8**> [#uses=2]
  %62 = load i8** %61, align 4                    ; <i8*> [#uses=2]
  %63 = icmp eq i8* %62, null                     ; <i1> [#uses=1]
  br i1 %63, label %invcont8, label %bb4.i1

bb4.i1:                                           ; preds = %bb3.i
  tail call void @_ZdaPv(i8* %62) nounwind
  br label %invcont8

invcont8:                                         ; preds = %bb4.i1, %bb3.i
  store i8* null, i8** %61, align 4
  %64 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 18 ; <i32*> [#uses=1]
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 19 ; <i8**> [#uses=1]
  store i8* null, i8** %65, align 4
  %66 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 20 ; <i8**> [#uses=1]
  store i8* null, i8** %66, align 4
  %67 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 10 ; <i8*> [#uses=1]
  store i8 0, i8* %67, align 1
  %68 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 11 ; <i8*> [#uses=1]
  store i8 0, i8* %68, align 2
  %69 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 7 ; <i8**> [#uses=1]
  %70 = load i8** %69, align 4                    ; <i8*> [#uses=3]
  %71 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  store i8* %70, i8** %71, align 4
  %72 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 2 ; <i8**> [#uses=1]
  store i8* %70, i8** %72, align 4
  %73 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 3 ; <i8**> [#uses=1]
  store i8* %70, i8** %73, align 4
  store i8* null, i8** %4, align 4
  store i8* null, i8** %2, align 4
  %74 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 6 ; <i8**> [#uses=1]
  store i8* null, i8** %74, align 4
  %75 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 4, i32 0 ; <i32*> [#uses=1]
  %76 = load i32* %75, align 4                    ; <i32> [#uses=2]
  %77 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 4, i32 1, i32 0 ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=2]
  %79 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  store i32 %76, i32* %79, align 4
  %80 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 5, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 %78, i32* %80, align 4
  %81 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 6, i32 0 ; <i32*> [#uses=1]
  store i32 %76, i32* %81, align 4
  %82 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 6, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 %78, i32* %82, align 4
  %83 = invoke %"struct.std::__basic_file<char>"* @_ZNSt12__basic_fileIcE5closeEv(%"struct.std::__basic_file<char>"* %0)
          to label %invcont9 unwind label %lpad   ; <%"struct.std::__basic_file<char>"*> [#uses=0]

invcont9:                                         ; preds = %invcont8
  ret void

bb18:                                             ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit
  ret void

lpad:                                             ; preds = %invcont8
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  br label %ppad

lpad23:                                           ; preds = %bb46.i, %bb33.i, %bb27.i, %bb.i.i, %bb.i1
  %eh_ptr24 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select26 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %84 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr24) nounwind ; <i8*> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %bb7 unwind label %lpad27

lpad27:                                           ; preds = %lpad23
  %eh_ptr28 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select30 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr28, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  br label %ppad

ppad:                                             ; preds = %lpad27, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr28, %lpad27 ] ; <i8*> [#uses=1]
  tail call void @__cxa_call_unexpected(i8* %eh_exception.0) noreturn nounwind
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare %"struct.std::__basic_file<char>"* @_ZNSt12__basic_fileIcE5closeEv(%"struct.std::__basic_file<char>"*)

declare %"struct.std::__basic_file<char>"* @_ZNSt12__basic_fileIcE4openEPKcSt13_Ios_Openmodei(%"struct.std::__basic_file<char>"*, i8*, i32, i32)

declare void @_ZSt19__throw_ios_failurePKc(i8*) noreturn

declare void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"*)

define internal fastcc void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 3), i32 (...)*** %0
  %1 = ptrtoint %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this to i32 ; <i32> [#uses=3]
  %2 = add i32 %1, 144                            ; <i32> [#uses=1]
  %3 = inttoptr i32 %2 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %4 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %3, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 8), i32 (...)*** %4, align 4
  %5 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 1 ; <%"struct.std::basic_filebuf<char,std::char_traits<char> >"*> [#uses=1]
  %6 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt13basic_filebufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %6, align 4
  tail call fastcc void @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %5) nounwind
  %7 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 1, i32 2 ; <%"struct.std::__basic_file<char>"*> [#uses=1]
  invoke void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"* %7)
          to label %bb17 unwind label %invcont1.i

invcont1.i:                                       ; preds = %entry
  %eh_ptr.i = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select8.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %6, align 4
  %8 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 1, i32 0, i32 7 ; <%"struct.std::locale"*> [#uses=1]
  tail call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %8) nounwind
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
          to label %.noexc unwind label %ppad

.noexc:                                           ; preds = %invcont1.i
  unreachable

bb12:                                             ; preds = %ppad
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr30)
  unreachable

bb17:                                             ; preds = %entry
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %6, align 4
  %9 = getelementptr inbounds %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 1, i32 0, i32 7 ; <%"struct.std::locale"*> [#uses=1]
  tail call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %9) nounwind
  %10 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %.c = bitcast i8* %10 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c, i32 (...)*** %0
  %11 = getelementptr inbounds i8* %10, i32 -12   ; <i8*> [#uses=1]
  %12 = bitcast i8* %11 to i32*                   ; <i32*> [#uses=1]
  %13 = load i32* %12, align 4                    ; <i32> [#uses=1]
  %14 = add i32 %13, %1                           ; <i32> [#uses=1]
  %15 = inttoptr i32 %14 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %16 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %17 = bitcast i8* %16 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  %18 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %15, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %17, i32 (...)*** %18, align 4
  %19 = getelementptr %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %19, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  %20 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %3, i32 0, i32 0 ; <%"struct.std::ios_base"*> [#uses=1]
  tail call void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %20)
  ret void

lpad37:                                           ; preds = %ppad
  %eh_ptr38 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=1]
  %eh_select40 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr38, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad:                                             ; preds = %invcont1.i
  %eh_ptr30 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select32 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %21 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %.c2 = bitcast i8* %21 to i32 (...)**           ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c2, i32 (...)*** %0
  %22 = getelementptr inbounds i8* %21, i32 -12   ; <i8*> [#uses=1]
  %23 = bitcast i8* %22 to i32*                   ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = add i32 %24, %1                           ; <i32> [#uses=1]
  %26 = inttoptr i32 %25 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %27 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %28 = bitcast i8* %27 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  %29 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %26, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %28, i32 (...)*** %29, align 4
  %30 = getelementptr %"struct.std::basic_ifstream<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %30, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  %31 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %3, i32 0, i32 0 ; <%"struct.std::ios_base"*> [#uses=1]
  invoke void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %31)
          to label %bb12 unwind label %lpad37
}

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*)

declare %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*)

declare void @__cxa_rethrow() noreturn

declare i8* @_Znwj(i32)

declare void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*)

define internal fastcc void @_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE16_M_insert_uniqueERKS5_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* noalias nocapture sret %agg.result, %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %this, %"struct.std::pair<const std::pair<const char*, const char*>,int>"* nocapture %__v) {
entry:
  %0 = getelementptr inbounds %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %this, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %1 = getelementptr inbounds %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %this, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %__x.0.in19 = load %"struct.std::_Rb_tree_node_base"** %0 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %2 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in19, null ; <i1> [#uses=1]
  br i1 %2, label %bb7, label %bb.nph

bb.nph:                                           ; preds = %entry
  %3 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 0 ; <i8**> [#uses=1]
  %4 = load i8** %3, align 4                      ; <i8*> [#uses=2]
  %5 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb4.backedge, %bb.nph
  %__x.022.in = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in19, %bb.nph ], [ %__x.0.in, %bb4.backedge ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %__x.0.in20 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in19, %bb.nph ], [ %__x.0.in, %bb4.backedge ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %6 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in20, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %7 = bitcast %"struct.std::_Rb_tree_node_base"* %6 to i8** ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=2]
  %9 = icmp ult i8* %4, %8                        ; <i1> [#uses=1]
  br i1 %9, label %bb1, label %bb.i.i11

bb.i.i11:                                         ; preds = %bb
  %10 = icmp ult i8* %8, %4                       ; <i1> [#uses=1]
  br i1 %10, label %bb2, label %_ZNKSt4lessISt4pairIPKcS2_EEclERKS3_S6_.exit15

_ZNKSt4lessISt4pairIPKcS2_EEclERKS3_S6_.exit15:   ; preds = %bb.i.i11
  %11 = load i8** %5, align 4                     ; <i8*> [#uses=1]
  %12 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in20, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %13 = load %"struct.std::_Rb_tree_node_base"** %12 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %14 = bitcast %"struct.std::_Rb_tree_node_base"* %13 to i8* ; <i8*> [#uses=1]
  %15 = icmp ult i8* %11, %14                     ; <i1> [#uses=2]
  %retval.i.i12 = zext i1 %15 to i8               ; <i8> [#uses=2]
  br i1 %15, label %bb1, label %bb2

bb1:                                              ; preds = %_ZNKSt4lessISt4pairIPKcS2_EEclERKS3_S6_.exit15, %bb
  %.reg2mem.0 = phi i8 [ %retval.i.i12, %_ZNKSt4lessISt4pairIPKcS2_EEclERKS3_S6_.exit15 ], [ 1, %bb ] ; <i8> [#uses=1]
  %16 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in20, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge

bb2:                                              ; preds = %_ZNKSt4lessISt4pairIPKcS2_EEclERKS3_S6_.exit15, %bb.i.i11
  %.reg2mem.1 = phi i8 [ %retval.i.i12, %_ZNKSt4lessISt4pairIPKcS2_EEclERKS3_S6_.exit15 ], [ 0, %bb.i.i11 ] ; <i8> [#uses=1]
  %17 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in20, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge

bb4.backedge:                                     ; preds = %bb2, %bb1
  %.reg2mem.2 = phi i8 [ %.reg2mem.0, %bb1 ], [ %.reg2mem.1, %bb2 ] ; <i8> [#uses=1]
  %__x.0.in.in.be = phi %"struct.std::_Rb_tree_node_base"** [ %16, %bb1 ], [ %17, %bb2 ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.be ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %18 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in, null ; <i1> [#uses=1]
  br i1 %18, label %bb5, label %bb

bb5:                                              ; preds = %bb4.backedge
  %toBool6 = icmp eq i8 %.reg2mem.2, 0            ; <i1> [#uses=1]
  br i1 %toBool6, label %bb11, label %bb7

bb7:                                              ; preds = %bb5, %entry
  %__x.0.in.lcssa.reg2mem.0 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in, %bb5 ], [ %__x.0.in19, %entry ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %__y.0.lcssa.in.reg2mem.0 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.022.in, %bb5 ], [ %1, %entry ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=7]
  %19 = getelementptr inbounds %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %this, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %20 = load %"struct.std::_Rb_tree_node_base"** %19, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %21 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, %20 ; <i1> [#uses=1]
  br i1 %21, label %bb9, label %bb10

bb9:                                              ; preds = %bb7
  %.not = icmp ne %"struct.std::_Rb_tree_node_base"* %__x.0.in.lcssa.reg2mem.0, null ; <i1> [#uses=1]
  %22 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %__y.0.lcssa.in.reg2mem.0 ; <i1> [#uses=1]
  %or.cond = or i1 %22, %.not                     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb4.i8, label %bb1.i2

bb1.i2:                                           ; preds = %bb9
  %23 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %24 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 0 ; <i8**> [#uses=1]
  %25 = load i8** %24, align 4                    ; <i8*> [#uses=2]
  %26 = bitcast %"struct.std::_Rb_tree_node_base"* %23 to i8** ; <i8**> [#uses=1]
  %27 = load i8** %26, align 4                    ; <i8*> [#uses=2]
  %28 = icmp ult i8* %25, %27                     ; <i1> [#uses=1]
  br i1 %28, label %bb4.i8, label %bb.i.i1.i3

bb.i.i1.i3:                                       ; preds = %bb1.i2
  %29 = icmp ult i8* %27, %25                     ; <i1> [#uses=1]
  br i1 %29, label %bb3.i6, label %bb1.i.i.i5

bb1.i.i.i5:                                       ; preds = %bb.i.i1.i3
  %30 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  %31 = load i8** %30, align 4                    ; <i8*> [#uses=1]
  %32 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %33 = load %"struct.std::_Rb_tree_node_base"** %32 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %34 = bitcast %"struct.std::_Rb_tree_node_base"* %33 to i8* ; <i8*> [#uses=1]
  %phitmp.i4 = icmp ult i8* %31, %34              ; <i1> [#uses=1]
  br i1 %phitmp.i4, label %bb4.i8, label %bb3.i6

bb3.i6:                                           ; preds = %bb1.i.i.i5, %bb.i.i1.i3
  br label %bb4.i8

bb4.i8:                                           ; preds = %bb3.i6, %bb1.i.i.i5, %bb1.i2, %bb9
  %iftmp.229.0.i7 = phi i8 [ 0, %bb3.i6 ], [ 1, %bb9 ], [ 1, %bb1.i2 ], [ 1, %bb1.i.i.i5 ] ; <i8> [#uses=1]
  %35 = tail call i8* @_Znwj(i32 28)              ; <i8*> [#uses=4]
  %36 = getelementptr inbounds i8* %35, i32 16    ; <i8*> [#uses=2]
  %37 = icmp eq i8* %36, null                     ; <i1> [#uses=1]
  br i1 %37, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10, label %bb.i.i.i9

bb.i.i.i9:                                        ; preds = %bb4.i8
  %38 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 0 ; <i8**> [#uses=1]
  %39 = load i8** %38, align 4                    ; <i8*> [#uses=1]
  %40 = bitcast i8* %36 to i8**                   ; <i8**> [#uses=1]
  store i8* %39, i8** %40
  %41 = getelementptr i8* %35, i32 20             ; <i8*> [#uses=1]
  %42 = bitcast i8* %41 to i8**                   ; <i8**> [#uses=1]
  %43 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  %44 = load i8** %43, align 4                    ; <i8*> [#uses=1]
  store i8* %44, i8** %42, align 4
  %45 = getelementptr i8* %35, i32 24             ; <i8*> [#uses=1]
  %46 = bitcast i8* %45 to i32*                   ; <i32*> [#uses=1]
  %47 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 1 ; <i32*> [#uses=1]
  %48 = load i32* %47, align 4                    ; <i32> [#uses=1]
  store i32 %48, i32* %46, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit10: ; preds = %bb.i.i.i9, %bb4.i8
  %49 = bitcast i8* %35 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  tail call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i7, %"struct.std::_Rb_tree_node_base"* %49, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, %"struct.std::_Rb_tree_node_base"* %1)
  %50 = getelementptr inbounds %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %this, i32 0, i32 0, i32 2 ; <i32*> [#uses=2]
  %51 = load i32* %50, align 4                    ; <i32> [#uses=1]
  %52 = add i32 %51, 1                            ; <i32> [#uses=1]
  store i32 %52, i32* %50, align 4
  %53 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %49, %"struct.std::_Rb_tree_node_base"** %53, align 4
  %54 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 1, i8* %54, align 4
  ret void

bb10:                                             ; preds = %bb7
  %55 = tail call %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0) ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb10, %bb5
  %__x.0.in.lcssa.reg2mem.1 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in.lcssa.reg2mem.0, %bb10 ], [ %__x.0.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %__y.0.lcssa.in.reg2mem.1 = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.lcssa.in.reg2mem.0, %bb10 ], [ %__x.022.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %__j.0.0 = phi %"struct.std::_Rb_tree_node_base"* [ %55, %bb10 ], [ %__x.022.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %56 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__j.0.0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %57 = bitcast %"struct.std::_Rb_tree_node_base"* %56 to i8** ; <i8**> [#uses=1]
  %58 = load i8** %57, align 4                    ; <i8*> [#uses=2]
  %59 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 0 ; <i8**> [#uses=2]
  %60 = load i8** %59, align 4                    ; <i8*> [#uses=4]
  %61 = icmp ult i8* %58, %60                     ; <i1> [#uses=1]
  br i1 %61, label %bb13, label %bb.i.i

bb.i.i:                                           ; preds = %bb11
  %62 = icmp ult i8* %60, %58                     ; <i1> [#uses=1]
  br i1 %62, label %bb14, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i.i
  %63 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__j.0.0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %64 = load %"struct.std::_Rb_tree_node_base"** %63 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %65 = bitcast %"struct.std::_Rb_tree_node_base"* %64 to i8* ; <i8*> [#uses=1]
  %66 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  %67 = load i8** %66, align 4                    ; <i8*> [#uses=1]
  %phitmp = icmp ult i8* %65, %67                 ; <i1> [#uses=1]
  br i1 %phitmp, label %bb13, label %bb14

bb13:                                             ; preds = %bb1.i.i, %bb11
  %.not27 = icmp ne %"struct.std::_Rb_tree_node_base"* %__x.0.in.lcssa.reg2mem.1, null ; <i1> [#uses=1]
  %68 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %__y.0.lcssa.in.reg2mem.1 ; <i1> [#uses=1]
  %or.cond28 = or i1 %68, %.not27                 ; <i1> [#uses=1]
  br i1 %or.cond28, label %bb4.i, label %bb1.i

bb1.i:                                            ; preds = %bb13
  %69 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %70 = bitcast %"struct.std::_Rb_tree_node_base"* %69 to i8** ; <i8**> [#uses=1]
  %71 = load i8** %70, align 4                    ; <i8*> [#uses=2]
  %72 = icmp ult i8* %60, %71                     ; <i1> [#uses=1]
  br i1 %72, label %bb4.i, label %bb.i.i1.i

bb.i.i1.i:                                        ; preds = %bb1.i
  %73 = icmp ult i8* %71, %60                     ; <i1> [#uses=1]
  br i1 %73, label %bb3.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i1.i
  %74 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  %75 = load i8** %74, align 4                    ; <i8*> [#uses=1]
  %76 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %77 = load %"struct.std::_Rb_tree_node_base"** %76 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %78 = bitcast %"struct.std::_Rb_tree_node_base"* %77 to i8* ; <i8*> [#uses=1]
  %phitmp.i = icmp ult i8* %75, %78               ; <i1> [#uses=1]
  br i1 %phitmp.i, label %bb4.i, label %bb3.i

bb3.i:                                            ; preds = %bb1.i.i.i, %bb.i.i1.i
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %bb1.i.i.i, %bb1.i, %bb13
  %iftmp.229.0.i = phi i8 [ 0, %bb3.i ], [ 1, %bb13 ], [ 1, %bb1.i ], [ 1, %bb1.i.i.i ] ; <i8> [#uses=1]
  %79 = tail call i8* @_Znwj(i32 28)              ; <i8*> [#uses=4]
  %80 = getelementptr inbounds i8* %79, i32 16    ; <i8*> [#uses=2]
  %81 = icmp eq i8* %80, null                     ; <i1> [#uses=1]
  br i1 %81, label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb4.i
  %82 = load i8** %59, align 4                    ; <i8*> [#uses=1]
  %83 = bitcast i8* %80 to i8**                   ; <i8**> [#uses=1]
  store i8* %82, i8** %83
  %84 = getelementptr i8* %79, i32 20             ; <i8*> [#uses=1]
  %85 = bitcast i8* %84 to i8**                   ; <i8**> [#uses=1]
  %86 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  %87 = load i8** %86, align 4                    ; <i8*> [#uses=1]
  store i8* %87, i8** %85, align 4
  %88 = getelementptr i8* %79, i32 24             ; <i8*> [#uses=1]
  %89 = bitcast i8* %88 to i32*                   ; <i32*> [#uses=1]
  %90 = getelementptr inbounds %"struct.std::pair<const std::pair<const char*, const char*>,int>"* %__v, i32 0, i32 1 ; <i32*> [#uses=1]
  %91 = load i32* %90, align 4                    ; <i32> [#uses=1]
  store i32 %91, i32* %89, align 4
  br label %_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit

_ZNSt8_Rb_treeISt4pairIPKcS2_ES0_IKS3_iESt10_Select1stIS5_ESt4lessIS3_ESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_.exit: ; preds = %bb.i.i.i, %bb4.i
  %92 = bitcast i8* %79 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  tail call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.229.0.i, %"struct.std::_Rb_tree_node_base"* %92, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, %"struct.std::_Rb_tree_node_base"* %1)
  %93 = getelementptr inbounds %"struct.std::_Rb_tree<std::pair<const char*, const char*>,std::pair<const std::pair<const char*, const char*>, int>,std::_Select1st<std::pair<const std::pair<const char*, const char*>, int> >,std::less<std::pair<const char*, const char*> >,std::allocator<std::pair<const std::pair<const char*, const char*>, int> > >"* %this, i32 0, i32 0, i32 2 ; <i32*> [#uses=2]
  %94 = load i32* %93, align 4                    ; <i32> [#uses=1]
  %95 = add i32 %94, 1                            ; <i32> [#uses=1]
  store i32 %95, i32* %93, align 4
  %96 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %92, %"struct.std::_Rb_tree_node_base"** %96, align 4
  %97 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 1, i8* %97, align 4
  ret void

bb14:                                             ; preds = %bb1.i.i, %bb.i.i
  %98 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %__j.0.0, %"struct.std::_Rb_tree_node_base"** %98, align 4
  %99 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const std::pair<const char*, const char*>, int> >,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 0, i8* %99, align 4
  ret void
}

declare i32 @memcmp(i8* nocapture, i8* nocapture, i32) nounwind readonly

define internal fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %this.0.5.val, i8 signext %__c) {
entry:
  %__tmp.i.i = alloca [256 x i8], align 1         ; <[256 x i8]*> [#uses=3]
  %0 = icmp eq %"struct.std::ctype<char>"* %this.0.5.val, null ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

bb.i:                                             ; preds = %entry
  call void @_ZSt16__throw_bad_castv() noreturn
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 6 ; <i8*> [#uses=3]
  %2 = load i8* %1, align 4                       ; <i8> [#uses=1]
  %3 = icmp eq i8 %2, 0                           ; <i1> [#uses=1]
  br i1 %3, label %bb.i.i, label %bb.i1

bb.i1:                                            ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %4 = zext i8 %__c to i32                        ; <i32> [#uses=1]
  %5 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 7, i32 %4 ; <i8*> [#uses=1]
  %6 = load i8* %5, align 1                       ; <i8> [#uses=1]
  ret i8 %6

bb.i.i:                                           ; preds = %bb.i.i, %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %__i.01.i.i = phi i32 [ %7, %bb.i.i ], [ 0, %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit ] ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr [256 x i8]* %__tmp.i.i, i32 0, i32 %__i.01.i.i ; <i8*> [#uses=1]
  %tmp.i.i = trunc i32 %__i.01.i.i to i8          ; <i8> [#uses=1]
  store i8 %tmp.i.i, i8* %scevgep.i.i, align 1
  %7 = add i32 %__i.01.i.i, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %7, 256                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2.i.i, label %bb.i.i

bb2.i.i:                                          ; preds = %bb.i.i
  %8 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=2]
  %9 = load i32 (...)*** %8, align 4              ; <i32 (...)**> [#uses=1]
  %10 = getelementptr inbounds i32 (...)** %9, i32 7 ; <i32 (...)**> [#uses=1]
  %11 = load i32 (...)** %10, align 4             ; <i32 (...)*> [#uses=1]
  %12 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 7, i32 0 ; <i8*> [#uses=2]
  %13 = bitcast i32 (...)* %11 to i8* (%"struct.std::ctype<char>"*, i8*, i8*, i8*)* ; <i8* (%"struct.std::ctype<char>"*, i8*, i8*, i8*)*> [#uses=1]
  %14 = getelementptr inbounds [256 x i8]* %__tmp.i.i, i32 0, i32 0 ; <i8*> [#uses=2]
  %15 = getelementptr inbounds [256 x i8]* %__tmp.i.i, i32 0, i32 256 ; <i8*> [#uses=1]
  %16 = call i8* %13(%"struct.std::ctype<char>"* %this.0.5.val, i8* %14, i8* %15, i8* %12) ; <i8*> [#uses=0]
  store i8 1, i8* %1, align 4
  %17 = call i32 @memcmp(i8* %14, i8* %12, i32 256) nounwind readonly ; <i32> [#uses=1]
  %18 = icmp eq i32 %17, 0                        ; <i1> [#uses=1]
  br i1 %18, label %_ZNKSt5ctypeIcE13_M_widen_initEv.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb2.i.i
  store i8 2, i8* %1, align 4
  br label %_ZNKSt5ctypeIcE13_M_widen_initEv.exit.i

_ZNKSt5ctypeIcE13_M_widen_initEv.exit.i:          ; preds = %bb3.i.i, %bb2.i.i
  %19 = load i32 (...)*** %8, align 4             ; <i32 (...)**> [#uses=1]
  %20 = getelementptr inbounds i32 (...)** %19, i32 6 ; <i32 (...)**> [#uses=1]
  %21 = load i32 (...)** %20, align 4             ; <i32 (...)*> [#uses=1]
  %22 = bitcast i32 (...)* %21 to i8 (%"struct.std::ctype<char>"*, i8)* ; <i8 (%"struct.std::ctype<char>"*, i8)*> [#uses=1]
  %23 = call signext i8 %22(%"struct.std::ctype<char>"* %this.0.5.val, i8 signext %__c) ; <i8> [#uses=1]
  ret i8 %23
}

declare %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"*, i8*, i32, i8 signext)

define internal fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %__n) {
entry:
  %0 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %1 = getelementptr inbounds i32 (...)** %0, i32 -3 ; <i32 (...)**> [#uses=1]
  %2 = bitcast i32 (...)** %1 to i32*             ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=1]
  %4 = add i32 %3, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %5 = inttoptr i32 %4 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=4]
  %6 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %5, i32 0, i32 3 ; <i8*> [#uses=2]
  %7 = load i8* %6, align 1                       ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %7, 0                    ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb.i, label %_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit

bb.i:                                             ; preds = %entry
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %5, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %8 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32) ; <i8> [#uses=1]
  %9 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %5, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %8, i8* %9, align 4
  store i8 1, i8* %6, align 1
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit

_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit: ; preds = %bb.i, %entry
  %10 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %5, i32 0, i32 2 ; <i8*> [#uses=1]
  %11 = load i8* %10, align 4                     ; <i8> [#uses=2]
  %12 = zext i8 %11 to i32                        ; <i32> [#uses=2]
  br label %bb3

bb:                                               ; preds = %bb3
  %13 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %14 = getelementptr inbounds i32 (...)** %13, i32 -3 ; <i32 (...)**> [#uses=1]
  %15 = bitcast i32 (...)** %14 to i32*           ; <i32*> [#uses=1]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = add i32 %16, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %18 = inttoptr i32 %17 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %19 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %18, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %20 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %19, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %21 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %20, i32 0, i32 5 ; <i8**> [#uses=3]
  %22 = load i8** %21, align 4                    ; <i8*> [#uses=2]
  %23 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %20, i32 0, i32 6 ; <i8**> [#uses=1]
  %24 = load i8** %23, align 4                    ; <i8*> [#uses=1]
  %25 = icmp ult i8* %22, %24                     ; <i1> [#uses=1]
  br i1 %25, label %bb.i1, label %bb1.i

bb.i1:                                            ; preds = %bb
  store i8 %11, i8* %22, align 1
  %26 = load i8** %21, align 4                    ; <i8*> [#uses=1]
  %27 = getelementptr inbounds i8* %26, i32 1     ; <i8*> [#uses=1]
  store i8* %27, i8** %21, align 4
  br label %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit

bb1.i:                                            ; preds = %bb
  %28 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %20, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %29 = load i32 (...)*** %28, align 4            ; <i32 (...)**> [#uses=1]
  %30 = getelementptr inbounds i32 (...)** %29, i32 13 ; <i32 (...)**> [#uses=1]
  %31 = load i32 (...)** %30, align 4             ; <i32 (...)*> [#uses=1]
  %32 = bitcast i32 (...)* %31 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %33 = tail call i32 %32(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %20, i32 %12) ; <i32> [#uses=1]
  br label %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit

_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit: ; preds = %bb1.i, %bb.i1
  %34 = phi i32 [ %33, %bb1.i ], [ %12, %bb.i1 ]  ; <i32> [#uses=1]
  %35 = icmp eq i32 %34, -1                       ; <i1> [#uses=1]
  br i1 %35, label %bb1, label %bb2

bb1:                                              ; preds = %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit
  %36 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %37 = getelementptr inbounds i32 (...)** %36, i32 -3 ; <i32 (...)**> [#uses=1]
  %38 = bitcast i32 (...)** %37 to i32*           ; <i32*> [#uses=1]
  %39 = load i32* %38, align 4                    ; <i32> [#uses=1]
  %40 = add i32 %39, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %41 = inttoptr i32 %40 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %42 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %41, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %43 = load i32* %42, align 4                    ; <i32> [#uses=1]
  %44 = or i32 %43, 1                             ; <i32> [#uses=2]
  store i32 %44, i32* %42
  %45 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %41, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %46 = load i32* %45, align 4                    ; <i32> [#uses=1]
  %47 = and i32 %44, %46                          ; <i32> [#uses=1]
  %48 = icmp eq i32 %47, 0                        ; <i1> [#uses=1]
  br i1 %48, label %_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb1
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit: ; preds = %bb1
  ret void

bb2:                                              ; preds = %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb2, %_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit
  %indvar = phi i32 [ 0, %_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit ], [ %indvar.next, %bb2 ] ; <i32> [#uses=2]
  %__n_addr.0 = sub i32 %__n, %indvar             ; <i32> [#uses=1]
  %49 = icmp sgt i32 %__n_addr.0, 0               ; <i1> [#uses=1]
  br i1 %49, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

declare i32 @strlen(i8* nocapture) nounwind readonly

define internal fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* nocapture %this) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %this, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=3]
  %1 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %0, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %2 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %1, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %3 = load i32 (...)*** %2, align 4              ; <i32 (...)**> [#uses=1]
  %4 = getelementptr inbounds i32 (...)** %3, i32 -3 ; <i32 (...)**> [#uses=1]
  %5 = bitcast i32 (...)** %4 to i32*             ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %1 to i32 ; <i32> [#uses=1]
  %8 = add i32 %6, %7                             ; <i32> [#uses=1]
  %9 = inttoptr i32 %8 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %10 = getelementptr inbounds %"struct.std::ios_base"* %9, i32 0, i32 3 ; <i32*> [#uses=1]
  %11 = load i32* %10, align 4                    ; <i32> [#uses=1]
  %12 = and i32 %11, 8192                         ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb8, label %bb

bb:                                               ; preds = %entry
  %14 = tail call zeroext i8 @_ZSt18uncaught_exceptionv() nounwind ; <i8> [#uses=1]
  %toBool = icmp eq i8 %14, 0                     ; <i1> [#uses=1]
  br i1 %toBool, label %bb11, label %bb8

bb8:                                              ; preds = %bb, %entry
  ret void

bb11:                                             ; preds = %bb
  %15 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %0, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %16 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %15, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %17 = load i32 (...)*** %16, align 4            ; <i32 (...)**> [#uses=1]
  %18 = getelementptr inbounds i32 (...)** %17, i32 -3 ; <i32 (...)**> [#uses=1]
  %19 = bitcast i32 (...)** %18 to i32*           ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  %21 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %15 to i32 ; <i32> [#uses=1]
  %22 = add i32 %20, %21                          ; <i32> [#uses=1]
  %23 = inttoptr i32 %22 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %24 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %23, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %25 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %24, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=3]
  %26 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25, null ; <i1> [#uses=1]
  br i1 %26, label %bb14, label %bb12

bb12:                                             ; preds = %bb11
  %27 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %28 = load i32 (...)*** %27, align 4            ; <i32 (...)**> [#uses=1]
  %29 = getelementptr inbounds i32 (...)** %28, i32 6 ; <i32 (...)**> [#uses=1]
  %30 = load i32 (...)** %29, align 4             ; <i32 (...)*> [#uses=1]
  %31 = bitcast i32 (...)* %30 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)*> [#uses=1]
  %32 = tail call i32 %31(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25) ; <i32> [#uses=1]
  %33 = icmp eq i32 %32, -1                       ; <i1> [#uses=1]
  br i1 %33, label %bb17, label %bb14

bb14:                                             ; preds = %bb12, %bb11
  ret void

bb17:                                             ; preds = %bb12
  %34 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %0, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %35 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %34, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %36 = load i32 (...)*** %35, align 4            ; <i32 (...)**> [#uses=1]
  %37 = getelementptr inbounds i32 (...)** %36, i32 -3 ; <i32 (...)**> [#uses=1]
  %38 = bitcast i32 (...)** %37 to i32*           ; <i32*> [#uses=1]
  %39 = load i32* %38, align 4                    ; <i32> [#uses=1]
  %40 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %34 to i32 ; <i32> [#uses=1]
  %41 = add i32 %39, %40                          ; <i32> [#uses=1]
  %42 = inttoptr i32 %41 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %43 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %42, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %44 = load i32* %43, align 4                    ; <i32> [#uses=1]
  %45 = or i32 %44, 1                             ; <i32> [#uses=2]
  store i32 %45, i32* %43
  %46 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %42, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %47 = load i32* %46, align 4                    ; <i32> [#uses=1]
  %48 = and i32 %45, %47                          ; <i32> [#uses=1]
  %49 = icmp eq i32 %48, 0                        ; <i1> [#uses=1]
  br i1 %49, label %_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb17
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit: ; preds = %bb17
  ret void
}

declare zeroext i8 @_ZSt18uncaught_exceptionv() nounwind

define internal fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %__s, i32 %__n) {
entry:
  %__cerb = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %0, align 8
  %1 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %1, align 4
  %2 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %3 = getelementptr inbounds i32 (...)** %2, i32 -3 ; <i32 (...)**> [#uses=1]
  %4 = bitcast i32 (...)** %3 to i32*             ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4                      ; <i32> [#uses=1]
  %6 = add i32 %5, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %7 = inttoptr i32 %6 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %8 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %9 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %8, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=3]
  %10 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %9, null ; <i1> [#uses=1]
  br i1 %10, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  %14 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %9, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  %15 = load i32 (...)*** %14, align 4            ; <i32 (...)**> [#uses=1]
  %16 = getelementptr inbounds i32 (...)** %15, i32 -3 ; <i32 (...)**> [#uses=1]
  %17 = bitcast i32 (...)** %16 to i32*           ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %9 to i32 ; <i32> [#uses=3]
  %20 = add i32 %18, %19                          ; <i32> [#uses=1]
  %21 = inttoptr i32 %20 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %22 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %23 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %22, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=3]
  %24 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %23, null ; <i1> [#uses=1]
  br i1 %24, label %_ZNSo5flushEv.exit, label %invcont1.i

invcont1.i:                                       ; preds = %bb8.i.i
  %25 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %23, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %26 = load i32 (...)*** %25, align 4            ; <i32 (...)**> [#uses=1]
  %27 = getelementptr inbounds i32 (...)** %26, i32 6 ; <i32 (...)**> [#uses=1]
  %28 = load i32 (...)** %27, align 4             ; <i32 (...)*> [#uses=1]
  %29 = bitcast i32 (...)* %28 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)*> [#uses=1]
  %30 = invoke i32 %29(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %23)
          to label %invcont2.i unwind label %lpad.i ; <i32> [#uses=1]

invcont2.i:                                       ; preds = %invcont1.i
  %31 = icmp eq i32 %30, -1                       ; <i1> [#uses=1]
  br i1 %31, label %bb15.i, label %_ZNSo5flushEv.exit

invcont11.i:                                      ; preds = %lpad20.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr21.i)
  unreachable

bb13.i:                                           ; preds = %lpad.i
  call void @__cxa_end_catch()
  br label %_ZNSo5flushEv.exit

bb15.i:                                           ; preds = %invcont2.i
  %32 = load i32 (...)*** %14, align 4            ; <i32 (...)**> [#uses=1]
  %33 = getelementptr inbounds i32 (...)** %32, i32 -3 ; <i32 (...)**> [#uses=1]
  %34 = bitcast i32 (...)** %33 to i32*           ; <i32*> [#uses=1]
  %35 = load i32* %34, align 4                    ; <i32> [#uses=1]
  %36 = add i32 %35, %19                          ; <i32> [#uses=1]
  %37 = inttoptr i32 %36 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %38 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %37, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %39 = load i32* %38, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %39, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %38
  %40 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %37, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %41 = load i32* %40, align 4                    ; <i32> [#uses=1]
  %42 = and i32 %storemerge.i.i, %41              ; <i32> [#uses=1]
  %43 = icmp eq i32 %42, 0                        ; <i1> [#uses=1]
  br i1 %43, label %_ZNSo5flushEv.exit, label %bb4.i.i.i1

bb4.i.i.i1:                                       ; preds = %bb15.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

lpad.i:                                           ; preds = %invcont1.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select19.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %44 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i) nounwind ; <i8*> [#uses=0]
  %45 = load i32 (...)*** %14, align 4            ; <i32 (...)**> [#uses=1]
  %46 = getelementptr inbounds i32 (...)** %45, i32 -3 ; <i32 (...)**> [#uses=1]
  %47 = bitcast i32 (...)** %46 to i32*           ; <i32*> [#uses=1]
  %48 = load i32* %47, align 4                    ; <i32> [#uses=1]
  %49 = add i32 %48, %19                          ; <i32> [#uses=1]
  %50 = inttoptr i32 %49 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %51 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %50, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %52 = load i32* %51, align 4                    ; <i32> [#uses=1]
  %53 = or i32 %52, 1                             ; <i32> [#uses=1]
  store i32 %53, i32* %51, align 4
  %54 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %50, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %55 = load i32* %54, align 4                    ; <i32> [#uses=1]
  %56 = and i32 %55, 1                            ; <i32> [#uses=1]
  %57 = icmp eq i32 %56, 0                        ; <i1> [#uses=1]
  br i1 %57, label %bb13.i, label %bb.i.i2

bb.i.i2:                                          ; preds = %lpad.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i unwind label %lpad20.i

.noexc.i:                                         ; preds = %bb.i.i2
  unreachable

lpad20.i:                                         ; preds = %bb.i.i2
  %eh_ptr21.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select23.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr21.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont11.i unwind label %lpad24.i

lpad24.i:                                         ; preds = %lpad20.i
  %eh_ptr25.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select27.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr25.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_ZNSo5flushEv.exit:                               ; preds = %bb15.i, %bb13.i, %invcont2.i, %bb8.i.i
  %.pre.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %_ZNSo5flushEv.exit, %bb.i.i, %entry
  %58 = phi i32 (...)** [ %.pre.i.i, %_ZNSo5flushEv.exit ], [ %2, %entry ], [ %2, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %59 = getelementptr inbounds i32 (...)** %58, i32 -3 ; <i32 (...)**> [#uses=1]
  %60 = bitcast i32 (...)** %59 to i32*           ; <i32*> [#uses=1]
  %61 = load i32* %60, align 4                    ; <i32> [#uses=1]
  %62 = add i32 %61, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %63 = inttoptr i32 %62 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %64 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %65 = load i32* %64, align 4                    ; <i32> [#uses=2]
  %66 = icmp eq i32 %65, 0                        ; <i1> [#uses=1]
  br i1 %66, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %0, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %67 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %68 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %67, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %69 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %68, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %69, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %65 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %64
  %70 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  %72 = and i32 %storemerge.i.i.i, %71            ; <i32> [#uses=1]
  %73 = icmp eq i32 %72, 0                        ; <i1> [#uses=1]
  br i1 %73, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %0, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb41, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %74 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %75 = getelementptr inbounds i32 (...)** %74, i32 -3 ; <i32 (...)**> [#uses=1]
  %76 = bitcast i32 (...)** %75 to i32*           ; <i32*> [#uses=1]
  %77 = load i32* %76, align 4                    ; <i32> [#uses=1]
  %78 = add i32 %77, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %79 = inttoptr i32 %78 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %80 = getelementptr inbounds %"struct.std::ios_base"* %79, i32 0, i32 2 ; <i32*> [#uses=1]
  %81 = load i32* %80, align 4                    ; <i32> [#uses=3]
  %82 = icmp sgt i32 %81, %__n                    ; <i1> [#uses=1]
  br i1 %82, label %bb1, label %bb30

bb1:                                              ; preds = %bb
  %83 = getelementptr inbounds %"struct.std::ios_base"* %79, i32 0, i32 3 ; <i32*> [#uses=1]
  %84 = load i32* %83, align 4                    ; <i32> [#uses=1]
  %85 = and i32 %84, 176                          ; <i32> [#uses=1]
  %86 = icmp eq i32 %85, 32                       ; <i1> [#uses=2]
  br i1 %86, label %invcont9, label %bb6

bb6:                                              ; preds = %bb1
  %87 = sub i32 %81, %__n                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %87)
          to label %invcont9 unwind label %lpad50

invcont9:                                         ; preds = %bb6, %bb1
  %88 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %89 = getelementptr inbounds i32 (...)** %88, i32 -3 ; <i32 (...)**> [#uses=1]
  %90 = bitcast i32 (...)** %89 to i32*           ; <i32*> [#uses=1]
  %91 = load i32* %90, align 4                    ; <i32> [#uses=1]
  %92 = add i32 %91, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %93 = inttoptr i32 %92 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %94 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %93, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4                    ; <i32> [#uses=1]
  %96 = icmp eq i32 %95, 0                        ; <i1> [#uses=1]
  br i1 %96, label %bb11, label %bb13

bb11:                                             ; preds = %invcont9
  %97 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %93, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %98 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %97, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %99 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %98, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %100 = load i32 (...)*** %99, align 4           ; <i32 (...)**> [#uses=1]
  %101 = getelementptr inbounds i32 (...)** %100, i32 12 ; <i32 (...)**> [#uses=1]
  %102 = load i32 (...)** %101, align 4           ; <i32 (...)*> [#uses=1]
  %103 = bitcast i32 (...)* %102 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %104 = invoke i32 %103(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %98, i8* %__s, i32 %__n)
          to label %.noexc8 unwind label %lpad50  ; <i32> [#uses=1]

.noexc8:                                          ; preds = %bb11
  %105 = icmp eq i32 %104, %__n                   ; <i1> [#uses=1]
  br i1 %105, label %bb13, label %bb.i4

bb.i4:                                            ; preds = %.noexc8
  %106 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %107 = getelementptr inbounds i32 (...)** %106, i32 -3 ; <i32 (...)**> [#uses=1]
  %108 = bitcast i32 (...)** %107 to i32*         ; <i32*> [#uses=1]
  %109 = load i32* %108, align 4                  ; <i32> [#uses=1]
  %110 = add i32 %109, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %111 = inttoptr i32 %110 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %112 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %111, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %113 = load i32* %112, align 4                  ; <i32> [#uses=1]
  %114 = or i32 %113, 1                           ; <i32> [#uses=2]
  store i32 %114, i32* %112
  %115 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %111, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %116 = load i32* %115, align 4                  ; <i32> [#uses=1]
  %117 = and i32 %114, %116                       ; <i32> [#uses=1]
  %118 = icmp eq i32 %117, 0                      ; <i1> [#uses=1]
  br i1 %118, label %bb13, label %bb4.i.i.i5

bb4.i.i.i5:                                       ; preds = %bb.i4
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc9 unwind label %lpad50

.noexc9:                                          ; preds = %bb4.i.i.i5
  unreachable

bb13:                                             ; preds = %bb.i4, %.noexc8, %invcont9
  br i1 %86, label %invcont19, label %bb32

invcont19:                                        ; preds = %bb13
  %119 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %120 = getelementptr inbounds i32 (...)** %119, i32 -3 ; <i32 (...)**> [#uses=1]
  %121 = bitcast i32 (...)** %120 to i32*         ; <i32*> [#uses=1]
  %122 = load i32* %121, align 4                  ; <i32> [#uses=1]
  %123 = add i32 %122, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %124 = inttoptr i32 %123 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %125 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %124, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %126 = load i32* %125, align 4                  ; <i32> [#uses=1]
  %127 = icmp eq i32 %126, 0                      ; <i1> [#uses=1]
  br i1 %127, label %bb28, label %bb32

bb28:                                             ; preds = %invcont19
  %128 = sub i32 %81, %__n                        ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %128)
          to label %bb32 unwind label %lpad50

bb30:                                             ; preds = %bb
  %129 = inttoptr i32 %78 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %130 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %129, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %131 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %130, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %132 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %131, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %133 = load i32 (...)*** %132, align 4          ; <i32 (...)**> [#uses=1]
  %134 = getelementptr inbounds i32 (...)** %133, i32 12 ; <i32 (...)**> [#uses=1]
  %135 = load i32 (...)** %134, align 4           ; <i32 (...)*> [#uses=1]
  %136 = bitcast i32 (...)* %135 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %137 = invoke i32 %136(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %131, i8* %__s, i32 %__n)
          to label %.noexc2 unwind label %lpad50  ; <i32> [#uses=1]

.noexc2:                                          ; preds = %bb30
  %138 = icmp eq i32 %137, %__n                   ; <i1> [#uses=1]
  br i1 %138, label %bb32, label %bb.i1

bb.i1:                                            ; preds = %.noexc2
  %139 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %140 = getelementptr inbounds i32 (...)** %139, i32 -3 ; <i32 (...)**> [#uses=1]
  %141 = bitcast i32 (...)** %140 to i32*         ; <i32*> [#uses=1]
  %142 = load i32* %141, align 4                  ; <i32> [#uses=1]
  %143 = add i32 %142, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %144 = inttoptr i32 %143 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %145 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %144, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %146 = load i32* %145, align 4                  ; <i32> [#uses=1]
  %147 = or i32 %146, 1                           ; <i32> [#uses=2]
  store i32 %147, i32* %145
  %148 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %144, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %149 = load i32* %148, align 4                  ; <i32> [#uses=1]
  %150 = and i32 %147, %149                       ; <i32> [#uses=1]
  %151 = icmp eq i32 %150, 0                      ; <i1> [#uses=1]
  br i1 %151, label %bb32, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i1
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc3 unwind label %lpad50

.noexc3:                                          ; preds = %bb4.i.i.i
  unreachable

bb32:                                             ; preds = %bb.i1, %.noexc2, %bb28, %invcont19, %bb13
  %152 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %153 = getelementptr inbounds i32 (...)** %152, i32 -3 ; <i32 (...)**> [#uses=1]
  %154 = bitcast i32 (...)** %153 to i32*         ; <i32*> [#uses=1]
  %155 = load i32* %154, align 4                  ; <i32> [#uses=1]
  %156 = add i32 %155, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %157 = inttoptr i32 %156 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %158 = getelementptr inbounds %"struct.std::ios_base"* %157, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %158, align 4
  br label %bb41

bb39:                                             ; preds = %lpad50
  invoke void @__cxa_end_catch()
          to label %bb41 unwind label %lpad54

bb41:                                             ; preds = %bb39, %bb32, %invcont
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb)
  ret void

invcont45:                                        ; preds = %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

lpad50:                                           ; preds = %bb4.i.i.i, %bb30, %bb28, %bb4.i.i.i5, %bb11, %bb6
  %eh_ptr51 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select53 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr51, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %159 = call i8* @__cxa_begin_catch(i8* %eh_ptr51) nounwind ; <i8*> [#uses=0]
  %160 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %161 = getelementptr inbounds i32 (...)** %160, i32 -3 ; <i32 (...)**> [#uses=1]
  %162 = bitcast i32 (...)** %161 to i32*         ; <i32*> [#uses=1]
  %163 = load i32* %162, align 4                  ; <i32> [#uses=1]
  %164 = add i32 %163, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %165 = inttoptr i32 %164 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %166 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %165, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %167 = load i32* %166, align 4                  ; <i32> [#uses=1]
  %168 = or i32 %167, 1                           ; <i32> [#uses=1]
  store i32 %168, i32* %166, align 4
  %169 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %165, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %170 = load i32* %169, align 4                  ; <i32> [#uses=1]
  %171 = and i32 %170, 1                          ; <i32> [#uses=1]
  %172 = icmp eq i32 %171, 0                      ; <i1> [#uses=1]
  br i1 %172, label %bb39, label %bb.i

bb.i:                                             ; preds = %lpad50
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc unwind label %lpad58

.noexc:                                           ; preds = %bb.i
  unreachable

lpad54:                                           ; preds = %bb39
  %eh_ptr55 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select57 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr55, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad58:                                           ; preds = %bb.i
  %eh_ptr59 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select61 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr59, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad unwind label %lpad62

lpad62:                                           ; preds = %lpad58
  %eh_ptr63 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select65 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr63, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad66:                                           ; preds = %ppad
  %eh_ptr67 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select69 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr67, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad:                                             ; preds = %lpad58, %lpad54
  %eh_exception.0 = phi i8* [ %eh_ptr55, %lpad54 ], [ %eh_ptr59, %lpad58 ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb)
          to label %invcont45 unwind label %lpad66
}

declare extern_weak i32 @pthread_once(i32*, void ()*)

declare extern_weak i8* @pthread_getspecific(i32)

declare extern_weak i32 @pthread_setspecific(i32, i8*)

declare extern_weak i32 @pthread_create(i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)

declare extern_weak i32 @pthread_cancel(i32)

declare extern_weak i32 @pthread_mutex_lock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_trylock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._12*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._12*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._12*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._12*)
