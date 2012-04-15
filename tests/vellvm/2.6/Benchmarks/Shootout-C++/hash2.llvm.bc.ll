; ModuleID = 'hash2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%"struct.__gnu_cxx::_Hashtable_iterator<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >" = type { %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*, %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* }
%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >" = type { %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*, %"struct.std::ios_base::_Words" }
%"struct.__gnu_cxx::hash<const char*>" = type <{ i8 }>
%"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >" = type { %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >" }
%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >" = type { %"struct.__gnu_cxx::hash<const char*>", %"struct.__gnu_cxx::hash<const char*>", %"struct.__gnu_cxx::hash<const char*>", %"struct.__gnu_cxx::hash<const char*>", %"struct.std::vector<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*,std::allocator<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*> >", i32 }
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Vector_base<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*,std::allocator<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*> >" = type { %"struct.std::_Vector_base<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*,std::allocator<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*> >::_Vector_impl" }
%"struct.std::_Vector_base<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*,std::allocator<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*> >::_Vector_impl" = type { %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }
%"struct.std::vector<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*,std::allocator<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*> >" = type { %"struct.std::_Vector_base<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*,std::allocator<__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >*> >" }

@_ZN9__gnu_cxxL16__stl_prime_listE = internal constant [28 x i32] [i32 53, i32 97, i32 193, i32 389, i32 769, i32 1543, i32 3079, i32 6151, i32 12289, i32 24593, i32 49157, i32 98317, i32 196613, i32 393241, i32 786433, i32 1572869, i32 3145739, i32 6291469, i32 12582917, i32 25165843, i32 50331653, i32 100663319, i32 201326611, i32 402653189, i32 805306457, i32 1610612741, i32 -1073741823, i32 -5], align 32 ; <[28 x i32]*> [#uses=2]
@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::hash<const char*>" zeroinitializer ; <%"struct.__gnu_cxx::hash<const char*>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [16 x i8] c"vector::reserve\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str1 = private constant [23 x i8] c"vector::_M_fill_insert\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str2 = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str3 = private constant [7 x i8] c"foo_%d\00", align 1 ; <[7 x i8]*> [#uses=1]
@.str4 = private constant [9 x i8] c"foo_9999\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str5 = private constant [6 x i8] c"foo_1\00", align 1 ; <[6 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=6]
@.str6 = private constant [2 x i8] c" \00", align 1 ; <[2 x i8]*> [#uses=1]
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

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %1 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %2 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %3 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %4 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %5 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %6 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %hash2 = alloca %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >", align 8 ; <%"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"*> [#uses=7]
  %hash1 = alloca %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >", align 8 ; <%"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"*> [#uses=9]
  %buf = alloca [16 x i8], align 1                ; <[16 x i8]*> [#uses=1]
  %7 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %7, label %bb, label %bb3

bb:                                               ; preds = %entry
  %8 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %9 = load i8** %8, align 4                      ; <i8*> [#uses=1]
  %10 = call i32 @atoi(i8* %9) nounwind readonly  ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb, %entry
  %iftmp.99.0 = phi i32 [ %10, %bb ], [ 2000, %entry ] ; <i32> [#uses=1]
  %11 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0 ; <%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"*> [#uses=5]
  %12 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 1, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %12, align 1
  %13 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 2, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %13, align 2
  %14 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=9]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4
  %15 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=6]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %15, align 4
  %16 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 2 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %16, align 4
  %17 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 5 ; <i32*> [#uses=3]
  store i32 0, i32* %17, align 8
  invoke fastcc void @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE21_M_initialize_bucketsEj(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %11)
          to label %_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEEC1Ev.exit unwind label %lpad14.i.i.i

lpad14.i.i.i:                                     ; preds = %bb3
  %eh_ptr15.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select17.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %18 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %19 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %18, null ; <i1> [#uses=1]
  br i1 %19, label %ppad.i.i.i, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %lpad14.i.i.i
  %20 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %18 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %20) nounwind
  br label %ppad.i.i.i

ppad.i.i.i:                                       ; preds = %bb.i.i.i.i.i.i, %lpad14.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr15.i.i.i)
          to label %.noexc.i unwind label %lpad.i

.noexc.i:                                         ; preds = %ppad.i.i.i
  unreachable

lpad.i:                                           ; preds = %ppad.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select3.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
  unreachable

_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEEC1Ev.exit: ; preds = %bb3
  %21 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0 ; <%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"*> [#uses=4]
  %22 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0, i32 1, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %22, align 1
  %23 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0, i32 2, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %23, align 2
  %24 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=8]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4
  %25 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=5]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %25, align 4
  %26 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0, i32 4, i32 0, i32 0, i32 2 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %26, align 4
  %27 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash2, i32 0, i32 0, i32 5 ; <i32*> [#uses=3]
  store i32 0, i32* %27, align 8
  invoke fastcc void @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE21_M_initialize_bucketsEj(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %21)
          to label %bb6.preheader unwind label %lpad14.i.i.i56

bb6.preheader:                                    ; preds = %_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEEC1Ev.exit
  %28 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0 ; <i8*> [#uses=2]
  %29 = getelementptr inbounds %"struct.std::ios_base::_Words"* %0, i32 0, i32 0 ; <i8**> [#uses=1]
  %30 = getelementptr inbounds %"struct.std::ios_base::_Words"* %0, i32 0, i32 1 ; <i32*> [#uses=1]
  br label %bb6

lpad14.i.i.i56:                                   ; preds = %_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEEC1Ev.exit
  %eh_ptr15.i.i.i54 = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select17.i.i.i55 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i.i54, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %31 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %32 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %31, null ; <i1> [#uses=1]
  br i1 %32, label %ppad.i.i.i58, label %bb.i.i.i.i.i.i57

bb.i.i.i.i.i.i57:                                 ; preds = %lpad14.i.i.i56
  %33 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %31 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %33) nounwind
  br label %ppad.i.i.i58

ppad.i.i.i58:                                     ; preds = %bb.i.i.i.i.i.i57, %lpad14.i.i.i56
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr15.i.i.i54)
          to label %.noexc.i59 unwind label %lpad.i62

.noexc.i59:                                       ; preds = %ppad.i.i.i58
  unreachable

lpad.i62:                                         ; preds = %ppad.i.i.i58
  %eh_ptr.i60 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select3.i61 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i60, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i60)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %lpad.i62
  unreachable

bb4:                                              ; preds = %bb6
  %34 = call i32 (i8*, i8*, ...)* @sprintf(i8* noalias %28, i8* noalias getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i32 %39) nounwind ; <i32> [#uses=0]
  %35 = call noalias i8* @strdup(i8* %28) nounwind ; <i8*> [#uses=1]
  store i8* %35, i8** %29, align 8
  store i32 0, i32* %30, align 4
  %36 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %11, %"struct.std::ios_base::_Words"* %0)
          to label %invcont5 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont5:                                         ; preds = %bb4
  %37 = getelementptr inbounds %"struct.std::ios_base::_Words"* %36, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %39, i32* %37, align 4
  %38 = add i32 %39, 1                            ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %invcont5, %bb6.preheader
  %39 = phi i32 [ %38, %invcont5 ], [ 0, %bb6.preheader ] ; <i32> [#uses=4]
  %40 = icmp sgt i32 %39, 9999                    ; <i1> [#uses=1]
  br i1 %40, label %bb17.loopexit, label %bb4

bb8:                                              ; preds = %bb17
  %41 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %15, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %42 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %41 to i32 ; <i32> [#uses=1]
  %43 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %44 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %43 to i32 ; <i32> [#uses=1]
  %45 = sub i32 %42, %44                          ; <i32> [#uses=1]
  %46 = ashr i32 %45, 2                           ; <i32> [#uses=1]
  br label %bb3.i.i68

bb.i.i:                                           ; preds = %bb3.i.i68
  %scevgep.i.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %43, i32 %50 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %47 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=3]
  %48 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %47, null ; <i1> [#uses=1]
  br i1 %48, label %bb2.i.i, label %invcont15

bb2.i.i:                                          ; preds = %bb.i.i
  %49 = add i32 %50, 1                            ; <i32> [#uses=1]
  br label %bb3.i.i68

bb3.i.i68:                                        ; preds = %bb2.i.i, %bb8
  %50 = phi i32 [ 0, %bb8 ], [ %49, %bb2.i.i ]    ; <i32> [#uses=3]
  %51 = icmp ugt i32 %46, %50                     ; <i1> [#uses=1]
  br i1 %51, label %bb.i.i, label %invcont15

bb10:                                             ; preds = %invcont15
  %52 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %k.0.2, i32 0, i32 1, i32 0 ; <i8**> [#uses=3]
  %53 = load i8** %52, align 4                    ; <i8*> [#uses=1]
  store i8* %53, i8** %88, align 8
  store i32 0, i32* %89, align 4
  %54 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %21, %"struct.std::ios_base::_Words"* %1)
          to label %invcont11 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont11:                                        ; preds = %bb10
  %55 = getelementptr inbounds %"struct.std::ios_base::_Words"* %54, i32 0, i32 1 ; <i32*> [#uses=2]
  %56 = load i32* %55, align 4                    ; <i32> [#uses=1]
  %57 = load i8** %52, align 4                    ; <i8*> [#uses=1]
  store i8* %57, i8** %90, align 8
  store i32 0, i32* %91, align 4
  %58 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %11, %"struct.std::ios_base::_Words"* %2)
          to label %invcont12 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont12:                                        ; preds = %invcont11
  %59 = getelementptr inbounds %"struct.std::ios_base::_Words"* %58, i32 0, i32 1 ; <i32*> [#uses=1]
  %60 = load i32* %59, align 4                    ; <i32> [#uses=1]
  %61 = add nsw i32 %60, %56                      ; <i32> [#uses=1]
  store i32 %61, i32* %55, align 4
  %62 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %k.0.2, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %63 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %62, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=5]
  %64 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %63, null ; <i1> [#uses=1]
  br i1 %64, label %bb.i, label %invcont15

bb.i:                                             ; preds = %invcont12
  %65 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %92, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %66 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %65 to i32 ; <i32> [#uses=1]
  %67 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %93, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %68 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %67 to i32 ; <i32> [#uses=1]
  %69 = sub i32 %66, %68                          ; <i32> [#uses=1]
  %70 = ashr i32 %69, 2                           ; <i32> [#uses=2]
  %71 = load i8** %52, align 4                    ; <i8*> [#uses=3]
  %72 = load i8* %71, align 1                     ; <i8> [#uses=1]
  %73 = icmp eq i8 %72, 0                         ; <i1> [#uses=1]
  br i1 %73, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i, label %bb.i.i.i.i.i.i1

bb.i.i.i.i.i.i1:                                  ; preds = %bb.i.i.i.i.i.i1, %bb.i
  %indvar.i.i.i.i.i.i = phi i32 [ %tmp.i, %bb.i.i.i.i.i.i1 ], [ 0, %bb.i ] ; <i32> [#uses=2]
  %__h.01.i.i.i.i.i.i = phi i32 [ %77, %bb.i.i.i.i.i.i1 ], [ 0, %bb.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i.i.i.i.i.i, 1         ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i.i = getelementptr i8* %71, i32 %tmp.i ; <i8*> [#uses=1]
  %__s_addr.02.i.i.i.i.i.i = getelementptr i8* %71, i32 %indvar.i.i.i.i.i.i ; <i8*> [#uses=1]
  %74 = mul i32 %__h.01.i.i.i.i.i.i, 5            ; <i32> [#uses=1]
  %75 = load i8* %__s_addr.02.i.i.i.i.i.i, align 1 ; <i8> [#uses=1]
  %76 = sext i8 %75 to i32                        ; <i32> [#uses=1]
  %77 = add i32 %76, %74                          ; <i32> [#uses=2]
  %78 = load i8* %scevgep.i.i.i.i.i.i, align 1    ; <i8> [#uses=1]
  %79 = icmp eq i8 %78, 0                         ; <i1> [#uses=1]
  br i1 %79, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i, label %bb.i.i.i.i.i.i1

_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i: ; preds = %bb.i.i.i.i.i.i1, %bb.i
  %__h.0.lcssa.i.i.i.i.i.i = phi i32 [ 0, %bb.i ], [ %77, %bb.i.i.i.i.i.i1 ] ; <i32> [#uses=1]
  %80 = urem i32 %__h.0.lcssa.i.i.i.i.i.i, %70    ; <i32> [#uses=1]
  %tmp2.i = add i32 %80, 1                        ; <i32> [#uses=1]
  br label %bb2.i

bb1.i:                                            ; preds = %bb2.i
  %scevgep.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %67, i32 %tmp3.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %81 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i
  %k.0.0 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %63, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i ], [ %81, %bb1.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %82 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %81, %bb1.i ], [ %63, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=1]
  %indvar.i = phi i32 [ 0, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit.i ], [ %indvar.next.i, %bb1.i ] ; <i32> [#uses=2]
  %tmp3.i = add i32 %indvar.i, %tmp2.i            ; <i32> [#uses=2]
  %83 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %82, null ; <i1> [#uses=1]
  %84 = icmp ult i32 %tmp3.i, %70                 ; <i1> [#uses=1]
  %or.cond = and i1 %83, %84                      ; <i1> [#uses=1]
  br i1 %or.cond, label %bb1.i, label %invcont15

invcont15:                                        ; preds = %bb2.i, %invcont12, %bb3.i.i68, %bb.i.i
  %k.0.2 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %47, %bb.i.i ], [ null, %bb3.i.i68 ], [ %k.0.0, %bb2.i ], [ %63, %invcont12 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %85 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %47, %bb.i.i ], [ null, %bb3.i.i68 ], [ %k.0.0, %bb2.i ], [ %63, %invcont12 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=1]
  %86 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %85, null ; <i1> [#uses=1]
  br i1 %86, label %bb16, label %bb10

bb16:                                             ; preds = %invcont15
  %87 = add i32 %94, 1                            ; <i32> [#uses=1]
  br label %bb17

bb17.loopexit:                                    ; preds = %bb6
  %88 = getelementptr inbounds %"struct.std::ios_base::_Words"* %1, i32 0, i32 0 ; <i8**> [#uses=1]
  %89 = getelementptr inbounds %"struct.std::ios_base::_Words"* %1, i32 0, i32 1 ; <i32*> [#uses=1]
  %90 = getelementptr inbounds %"struct.std::ios_base::_Words"* %2, i32 0, i32 0 ; <i8**> [#uses=1]
  %91 = getelementptr inbounds %"struct.std::ios_base::_Words"* %2, i32 0, i32 1 ; <i32*> [#uses=1]
  %92 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=1]
  %93 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %hash1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=1]
  br label %bb17

bb17:                                             ; preds = %bb17.loopexit, %bb16
  %94 = phi i32 [ %87, %bb16 ], [ 0, %bb17.loopexit ] ; <i32> [#uses=2]
  %95 = icmp slt i32 %94, %iftmp.99.0             ; <i1> [#uses=1]
  br i1 %95, label %bb8, label %bb18

bb18:                                             ; preds = %bb17
  %96 = getelementptr inbounds %"struct.std::ios_base::_Words"* %3, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i8** %96, align 8
  %97 = getelementptr inbounds %"struct.std::ios_base::_Words"* %3, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %97, align 4
  %98 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %21, %"struct.std::ios_base::_Words"* %3)
          to label %invcont19 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont19:                                        ; preds = %bb18
  %99 = getelementptr inbounds %"struct.std::ios_base::_Words"* %98, i32 0, i32 1 ; <i32*> [#uses=1]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = getelementptr inbounds %"struct.std::ios_base::_Words"* %4, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i8** %101, align 8
  %102 = getelementptr inbounds %"struct.std::ios_base::_Words"* %4, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %102, align 4
  %103 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %21, %"struct.std::ios_base::_Words"* %4)
          to label %invcont20 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont20:                                        ; preds = %invcont19
  %104 = getelementptr inbounds %"struct.std::ios_base::_Words"* %103, i32 0, i32 1 ; <i32*> [#uses=1]
  %105 = load i32* %104, align 4                  ; <i32> [#uses=1]
  %106 = getelementptr inbounds %"struct.std::ios_base::_Words"* %5, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i8** %106, align 8
  %107 = getelementptr inbounds %"struct.std::ios_base::_Words"* %5, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %107, align 4
  %108 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %11, %"struct.std::ios_base::_Words"* %5)
          to label %invcont21 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont21:                                        ; preds = %invcont20
  %109 = getelementptr inbounds %"struct.std::ios_base::_Words"* %108, i32 0, i32 1 ; <i32*> [#uses=1]
  %110 = load i32* %109, align 4                  ; <i32> [#uses=1]
  %111 = getelementptr inbounds %"struct.std::ios_base::_Words"* %6, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i8** %111, align 8
  %112 = getelementptr inbounds %"struct.std::ios_base::_Words"* %6, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %112, align 4
  %113 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %11, %"struct.std::ios_base::_Words"* %6)
          to label %invcont22 unwind label %lpad45 ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont22:                                        ; preds = %invcont21
  %114 = getelementptr inbounds %"struct.std::ios_base::_Words"* %113, i32 0, i32 1 ; <i32*> [#uses=1]
  %115 = load i32* %114, align 4                  ; <i32> [#uses=1]
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %115)
          to label %invcont23 unwind label %lpad45

invcont23:                                        ; preds = %invcont22
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i()
          to label %invcont24 unwind label %lpad45

invcont24:                                        ; preds = %invcont23
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %110)
          to label %invcont25 unwind label %lpad45

invcont25:                                        ; preds = %invcont24
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i()
          to label %invcont26 unwind label %lpad45

invcont26:                                        ; preds = %invcont25
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %105)
          to label %invcont27 unwind label %lpad45

invcont27:                                        ; preds = %invcont26
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i()
          to label %invcont28 unwind label %lpad45

invcont28:                                        ; preds = %invcont27
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %100)
          to label %invcont29 unwind label %lpad45

invcont29:                                        ; preds = %invcont28
  %116 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %117 = getelementptr inbounds i32 (...)** %116, i32 -3 ; <i32 (...)**> [#uses=1]
  %118 = bitcast i32 (...)** %117 to i32*         ; <i32*> [#uses=1]
  %119 = load i32* %118, align 4                  ; <i32> [#uses=1]
  %120 = add i32 %119, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %121 = inttoptr i32 %120 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %121, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %122 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10)
          to label %.noexc4 unwind label %lpad45  ; <i8> [#uses=3]

.noexc4:                                          ; preds = %invcont29
  %123 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %123, align 8
  %124 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %124, align 4
  %125 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %126 = getelementptr inbounds i32 (...)** %125, i32 -3 ; <i32 (...)**> [#uses=1]
  %127 = bitcast i32 (...)** %126 to i32*         ; <i32*> [#uses=1]
  %128 = load i32* %127, align 4                  ; <i32> [#uses=1]
  %129 = add i32 %128, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %130 = inttoptr i32 %129 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %131 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %130, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %132 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %131, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %133 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %132, null ; <i1> [#uses=1]
  br i1 %133, label %bb9.i.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %.noexc4
  %134 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %130, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %135 = load i32* %134, align 4                  ; <i32> [#uses=1]
  %136 = icmp eq i32 %135, 0                      ; <i1> [#uses=1]
  br i1 %136, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %132)
          to label %.noexc5 unwind label %lpad45

.noexc5:                                          ; preds = %bb8.i.i.i.i
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %.noexc5, %bb.i.i.i.i, %.noexc4
  %137 = phi i32 (...)** [ %.pre.i.i.i.i, %.noexc5 ], [ %125, %.noexc4 ], [ %125, %bb.i.i.i.i ] ; <i32 (...)**> [#uses=1]
  %138 = getelementptr inbounds i32 (...)** %137, i32 -3 ; <i32 (...)**> [#uses=1]
  %139 = bitcast i32 (...)** %138 to i32*         ; <i32*> [#uses=1]
  %140 = load i32* %139, align 4                  ; <i32> [#uses=1]
  %141 = add i32 %140, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %142 = inttoptr i32 %141 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %143 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %142, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %144 = load i32* %143, align 4                  ; <i32> [#uses=2]
  %145 = icmp eq i32 %144, 0                      ; <i1> [#uses=1]
  br i1 %145, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %123, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %146 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %142, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %147 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %146, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %148 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %147, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %148, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %144 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %143
  %149 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %142, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %150 = load i32* %149, align 4                  ; <i32> [#uses=1]
  %151 = and i32 %storemerge.i.i.i.i.i, %150      ; <i32> [#uses=1]
  %152 = icmp eq i32 %151, 0                      ; <i1> [#uses=1]
  br i1 %152, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc6 unwind label %lpad45

.noexc6:                                          ; preds = %bb4.i.i.i.i.i.i
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr = load i8* %123, align 8                   ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %.pr, 0                ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %_ZNSo3putEc.exit.i, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %153 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %154 = getelementptr inbounds i32 (...)** %153, i32 -3 ; <i32 (...)**> [#uses=1]
  %155 = bitcast i32 (...)** %154 to i32*         ; <i32*> [#uses=1]
  %156 = load i32* %155, align 4                  ; <i32> [#uses=1]
  %157 = add i32 %156, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %158 = inttoptr i32 %157 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %159 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %158, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %160 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %159, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %161 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %160, i32 0, i32 5 ; <i8**> [#uses=3]
  %162 = load i8** %161, align 4                  ; <i8*> [#uses=2]
  %163 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %160, i32 0, i32 6 ; <i8**> [#uses=1]
  %164 = load i8** %163, align 4                  ; <i8*> [#uses=1]
  %165 = icmp ult i8* %162, %164                  ; <i1> [#uses=1]
  br i1 %165, label %bb.i2.i.i, label %bb1.i.i.i2

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %122, i8* %162, align 1
  %166 = load i8** %161, align 4                  ; <i8*> [#uses=1]
  %167 = getelementptr inbounds i8* %166, i32 1   ; <i8*> [#uses=1]
  store i8* %167, i8** %161, align 4
  %168 = zext i8 %122 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i2:                                       ; preds = %invcont1.i.i
  %169 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %160, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %170 = load i32 (...)*** %169, align 4          ; <i32 (...)**> [#uses=1]
  %171 = getelementptr inbounds i32 (...)** %170, i32 13 ; <i32 (...)**> [#uses=1]
  %172 = load i32 (...)** %171, align 4           ; <i32 (...)*> [#uses=1]
  %173 = zext i8 %122 to i32                      ; <i32> [#uses=1]
  %174 = bitcast i32 (...)* %172 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %175 = invoke i32 %174(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %160, i32 %173)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i2, %bb.i2.i.i
  %176 = phi i32 [ %168, %bb.i2.i.i ], [ %175, %bb1.i.i.i2 ] ; <i32> [#uses=1]
  %177 = icmp eq i32 %176, -1                     ; <i1> [#uses=1]
  br i1 %177, label %bb14.i.i, label %_ZNSo3putEc.exit.i

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit.i unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %178 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %179 = getelementptr inbounds i32 (...)** %178, i32 -3 ; <i32 (...)**> [#uses=1]
  %180 = bitcast i32 (...)** %179 to i32*         ; <i32*> [#uses=1]
  %181 = load i32* %180, align 4                  ; <i32> [#uses=1]
  %182 = add i32 %181, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %183 = inttoptr i32 %182 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %184 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %183, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %185 = load i32* %184, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %185, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %184
  %186 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %183, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %187 = load i32* %186, align 4                  ; <i32> [#uses=1]
  %188 = and i32 %storemerge.i.i.i, %187          ; <i32> [#uses=1]
  %189 = icmp eq i32 %188, 0                      ; <i1> [#uses=1]
  br i1 %189, label %_ZNSo3putEc.exit.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc7 unwind label %lpad45

.noexc7:                                          ; preds = %invcont20.i.i
  unreachable

lpad.i.i:                                         ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i2
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %190 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %191 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %192 = getelementptr inbounds i32 (...)** %191, i32 -3 ; <i32 (...)**> [#uses=1]
  %193 = bitcast i32 (...)** %192 to i32*         ; <i32*> [#uses=1]
  %194 = load i32* %193, align 4                  ; <i32> [#uses=1]
  %195 = add i32 %194, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %196 = inttoptr i32 %195 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %197 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %196, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %198 = load i32* %197, align 4                  ; <i32> [#uses=1]
  %199 = or i32 %198, 1                           ; <i32> [#uses=1]
  store i32 %199, i32* %197, align 4
  %200 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %196, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %201 = load i32* %200, align 4                  ; <i32> [#uses=1]
  %202 = and i32 %201, 1                          ; <i32> [#uses=1]
  %203 = icmp eq i32 %202, 0                      ; <i1> [#uses=1]
  br i1 %203, label %bb11.i.i, label %bb.i.i.i3

bb.i.i.i3:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i unwind label %lpad33.i.i

.noexc.i.i:                                       ; preds = %bb.i.i.i3
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i3
  %eh_ptr34.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select36.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr34.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad.i.i unwind label %lpad37.i.i

lpad37.i.i:                                       ; preds = %lpad33.i.i
  %eh_ptr38.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select40.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr38.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad41.i.i:                                       ; preds = %ppad.i.i
  %eh_ptr42.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select44.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr42.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i.i:                                         ; preds = %lpad33.i.i, %lpad29.i.i, %lpad.i.i
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i.i, %lpad.i.i ], [ %eh_ptr30.i.i, %lpad29.i.i ], [ %eh_ptr34.i.i, %lpad33.i.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
          to label %invcont20.i.i unwind label %lpad41.i.i

_ZNSo3putEc.exit.i:                               ; preds = %bb14.i.i, %bb11.i.i, %invcont2.i.i, %invcont.i.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
          to label %.noexc8 unwind label %lpad45

.noexc8:                                          ; preds = %_ZNSo3putEc.exit.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
          to label %bb34 unwind label %lpad45

bb34:                                             ; preds = %.noexc8
  %204 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %25, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %205 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %204 to i32 ; <i32> [#uses=1]
  %206 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %207 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %206 to i32 ; <i32> [#uses=1]
  %208 = sub i32 %205, %207                       ; <i32> [#uses=1]
  %209 = icmp ult i32 %208, 4                     ; <i1> [#uses=1]
  br i1 %209, label %bb3.i.i42, label %bb.i.i.i34

bb.i.i.i34:                                       ; preds = %bb3.i.i.i41, %bb34
  %210 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %219, %bb3.i.i.i41 ], [ %206, %bb34 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__i.02.i.i.i31 = phi i32 [ %tmp.i.i.i32, %bb3.i.i.i41 ], [ 0, %bb34 ] ; <i32> [#uses=3]
  %tmp.i.i.i32 = add i32 %__i.02.i.i.i31, 1       ; <i32> [#uses=2]
  %scevgep.i.i.i33 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %210, i32 %__i.02.i.i.i31 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %211 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i.i33, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %212 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %211, null ; <i1> [#uses=1]
  br i1 %212, label %bb3.i.i.i41, label %bb1.i.i.i37

bb1.i.i.i37:                                      ; preds = %bb1.i.i.i37, %bb.i.i.i34
  %__cur.01.i.i.i35 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %214, %bb1.i.i.i37 ], [ %211, %bb.i.i.i34 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %213 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i35, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %214 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %213, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %215 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i35 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %215) nounwind
  %phitmp.i.i.i36 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %214, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i36, label %bb2.bb3_crit_edge.i.i.i39, label %bb1.i.i.i37

bb2.bb3_crit_edge.i.i.i39:                        ; preds = %bb1.i.i.i37
  %.pre.i.i.i38 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %bb3.i.i.i41

bb3.i.i.i41:                                      ; preds = %bb2.bb3_crit_edge.i.i.i39, %bb.i.i.i34
  %216 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i.i38, %bb2.bb3_crit_edge.i.i.i39 ], [ %210, %bb.i.i.i34 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %scevgep4.i.i.i40 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %216, i32 %__i.02.i.i.i31 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep4.i.i.i40, align 4
  %217 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %25, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %218 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %217 to i32 ; <i32> [#uses=1]
  %219 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %220 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %219 to i32 ; <i32> [#uses=1]
  %221 = sub i32 %218, %220                       ; <i32> [#uses=1]
  %222 = ashr i32 %221, 2                         ; <i32> [#uses=1]
  %223 = icmp ugt i32 %222, %tmp.i.i.i32          ; <i1> [#uses=1]
  br i1 %223, label %bb.i.i.i34, label %bb3.i.i42

bb3.i.i42:                                        ; preds = %bb3.i.i.i41, %bb34
  %224 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %206, %bb34 ], [ %219, %bb3.i.i.i41 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store i32 0, i32* %27, align 8
  %225 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %224, null ; <i1> [#uses=1]
  br i1 %225, label %bb41, label %bb.i.i.i.i.i43

bb.i.i.i.i.i43:                                   ; preds = %bb3.i.i42
  %226 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %224 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %226) nounwind
  br label %bb41

invcont39:                                        ; preds = %bb.i.i.i.i.i, %bb3.i.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

bb41:                                             ; preds = %bb.i.i.i.i.i43, %bb3.i.i42
  %227 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %15, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %228 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %227 to i32 ; <i32> [#uses=1]
  %229 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %230 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %229 to i32 ; <i32> [#uses=1]
  %231 = sub i32 %228, %230                       ; <i32> [#uses=1]
  %232 = icmp ult i32 %231, 4                     ; <i1> [#uses=1]
  br i1 %232, label %bb3.i.i27, label %bb.i.i.i19

bb.i.i.i19:                                       ; preds = %bb3.i.i.i26, %bb41
  %233 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %242, %bb3.i.i.i26 ], [ %229, %bb41 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__i.02.i.i.i16 = phi i32 [ %tmp.i.i.i17, %bb3.i.i.i26 ], [ 0, %bb41 ] ; <i32> [#uses=3]
  %tmp.i.i.i17 = add i32 %__i.02.i.i.i16, 1       ; <i32> [#uses=2]
  %scevgep.i.i.i18 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %233, i32 %__i.02.i.i.i16 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %234 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i.i18, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %235 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %234, null ; <i1> [#uses=1]
  br i1 %235, label %bb3.i.i.i26, label %bb1.i.i.i22

bb1.i.i.i22:                                      ; preds = %bb1.i.i.i22, %bb.i.i.i19
  %__cur.01.i.i.i20 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %237, %bb1.i.i.i22 ], [ %234, %bb.i.i.i19 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %236 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i20, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %237 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %236, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %238 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i20 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %238) nounwind
  %phitmp.i.i.i21 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %237, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i21, label %bb2.bb3_crit_edge.i.i.i24, label %bb1.i.i.i22

bb2.bb3_crit_edge.i.i.i24:                        ; preds = %bb1.i.i.i22
  %.pre.i.i.i23 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %bb3.i.i.i26

bb3.i.i.i26:                                      ; preds = %bb2.bb3_crit_edge.i.i.i24, %bb.i.i.i19
  %239 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i.i23, %bb2.bb3_crit_edge.i.i.i24 ], [ %233, %bb.i.i.i19 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %scevgep4.i.i.i25 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %239, i32 %__i.02.i.i.i16 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep4.i.i.i25, align 4
  %240 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %15, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %241 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %240 to i32 ; <i32> [#uses=1]
  %242 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %243 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %242 to i32 ; <i32> [#uses=1]
  %244 = sub i32 %241, %243                       ; <i32> [#uses=1]
  %245 = ashr i32 %244, 2                         ; <i32> [#uses=1]
  %246 = icmp ugt i32 %245, %tmp.i.i.i17          ; <i1> [#uses=1]
  br i1 %246, label %bb.i.i.i19, label %bb3.i.i27

bb3.i.i27:                                        ; preds = %bb3.i.i.i26, %bb41
  %247 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %229, %bb41 ], [ %242, %bb3.i.i.i26 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store i32 0, i32* %17, align 8
  %248 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %247, null ; <i1> [#uses=1]
  br i1 %248, label %_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEED1Ev.exit30, label %bb.i.i.i.i.i28

bb.i.i.i.i.i28:                                   ; preds = %bb3.i.i27
  %249 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %247 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %249) nounwind
  ret i32 0

_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEED1Ev.exit30: ; preds = %bb3.i.i27
  ret i32 0

lpad:                                             ; preds = %lpad.i62
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select44 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad45:                                           ; preds = %.noexc8, %_ZNSo3putEc.exit.i, %invcont20.i.i, %bb4.i.i.i.i.i.i, %bb8.i.i.i.i, %invcont29, %invcont28, %invcont27, %invcont26, %invcont25, %invcont24, %invcont23, %invcont22, %invcont21, %invcont20, %invcont19, %bb18, %invcont11, %bb10, %bb4
  %eh_ptr46 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select48 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr46, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %250 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %25, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %251 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %250 to i32 ; <i32> [#uses=1]
  %252 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %253 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %252 to i32 ; <i32> [#uses=1]
  %254 = sub i32 %251, %253                       ; <i32> [#uses=1]
  %255 = icmp ult i32 %254, 4                     ; <i1> [#uses=1]
  br i1 %255, label %bb3.i.i12, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb3.i.i.i11, %lpad45
  %256 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %265, %bb3.i.i.i11 ], [ %252, %lpad45 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__i.02.i.i.i1 = phi i32 [ %tmp.i.i.i2, %bb3.i.i.i11 ], [ 0, %lpad45 ] ; <i32> [#uses=3]
  %tmp.i.i.i2 = add i32 %__i.02.i.i.i1, 1         ; <i32> [#uses=2]
  %scevgep.i.i.i3 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %256, i32 %__i.02.i.i.i1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %257 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i.i3, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %258 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %257, null ; <i1> [#uses=1]
  br i1 %258, label %bb3.i.i.i11, label %bb1.i.i.i7

bb1.i.i.i7:                                       ; preds = %bb1.i.i.i7, %bb.i.i.i4
  %__cur.01.i.i.i5 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %260, %bb1.i.i.i7 ], [ %257, %bb.i.i.i4 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %259 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i5, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %260 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %259, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %261 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i5 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %261) nounwind
  %phitmp.i.i.i6 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %260, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i6, label %bb2.bb3_crit_edge.i.i.i9, label %bb1.i.i.i7

bb2.bb3_crit_edge.i.i.i9:                         ; preds = %bb1.i.i.i7
  %.pre.i.i.i8 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %bb3.i.i.i11

bb3.i.i.i11:                                      ; preds = %bb2.bb3_crit_edge.i.i.i9, %bb.i.i.i4
  %262 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i.i8, %bb2.bb3_crit_edge.i.i.i9 ], [ %256, %bb.i.i.i4 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %scevgep4.i.i.i10 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %262, i32 %__i.02.i.i.i1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep4.i.i.i10, align 4
  %263 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %25, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %264 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %263 to i32 ; <i32> [#uses=1]
  %265 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %24, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %266 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %265 to i32 ; <i32> [#uses=1]
  %267 = sub i32 %264, %266                       ; <i32> [#uses=1]
  %268 = ashr i32 %267, 2                         ; <i32> [#uses=1]
  %269 = icmp ugt i32 %268, %tmp.i.i.i2           ; <i1> [#uses=1]
  br i1 %269, label %bb.i.i.i4, label %bb3.i.i12

bb3.i.i12:                                        ; preds = %bb3.i.i.i11, %lpad45
  %270 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %252, %lpad45 ], [ %265, %bb3.i.i.i11 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store i32 0, i32* %27, align 8
  %271 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %270, null ; <i1> [#uses=1]
  br i1 %271, label %ppad, label %bb.i.i.i.i.i13

bb.i.i.i.i.i13:                                   ; preds = %bb3.i.i12
  %272 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %270 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %272) nounwind
  br label %ppad

ppad:                                             ; preds = %bb.i.i.i.i.i13, %bb3.i.i12, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr46, %bb.i.i.i.i.i13 ], [ %eh_ptr46, %bb3.i.i12 ] ; <i8*> [#uses=1]
  %273 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %15, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %274 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %273 to i32 ; <i32> [#uses=1]
  %275 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %276 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %275 to i32 ; <i32> [#uses=1]
  %277 = sub i32 %274, %276                       ; <i32> [#uses=1]
  %278 = icmp ult i32 %277, 4                     ; <i1> [#uses=1]
  br i1 %278, label %bb3.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb3.i.i.i, %ppad
  %279 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %288, %bb3.i.i.i ], [ %275, %ppad ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__i.02.i.i.i = phi i32 [ %tmp.i.i.i, %bb3.i.i.i ], [ 0, %ppad ] ; <i32> [#uses=3]
  %tmp.i.i.i = add i32 %__i.02.i.i.i, 1           ; <i32> [#uses=2]
  %scevgep.i.i.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %279, i32 %__i.02.i.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %280 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i.i, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %281 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %280, null ; <i1> [#uses=1]
  br i1 %281, label %bb3.i.i.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb1.i.i.i, %bb.i.i.i
  %__cur.01.i.i.i = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %283, %bb1.i.i.i ], [ %280, %bb.i.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %282 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %283 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %282, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %284 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %284) nounwind
  %phitmp.i.i.i = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %283, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i, label %bb2.bb3_crit_edge.i.i.i, label %bb1.i.i.i

bb2.bb3_crit_edge.i.i.i:                          ; preds = %bb1.i.i.i
  %.pre.i.i.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb2.bb3_crit_edge.i.i.i, %bb.i.i.i
  %285 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i.i, %bb2.bb3_crit_edge.i.i.i ], [ %279, %bb.i.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %scevgep4.i.i.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %285, i32 %__i.02.i.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep4.i.i.i, align 4
  %286 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %15, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %287 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %286 to i32 ; <i32> [#uses=1]
  %288 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %289 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %288 to i32 ; <i32> [#uses=1]
  %290 = sub i32 %287, %289                       ; <i32> [#uses=1]
  %291 = ashr i32 %290, 2                         ; <i32> [#uses=1]
  %292 = icmp ugt i32 %291, %tmp.i.i.i            ; <i1> [#uses=1]
  br i1 %292, label %bb.i.i.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb3.i.i.i, %ppad
  %293 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %275, %ppad ], [ %288, %bb3.i.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store i32 0, i32* %17, align 8
  %294 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %293, null ; <i1> [#uses=1]
  br i1 %294, label %invcont39, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb3.i.i
  %295 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %293 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %295) nounwind
  br label %invcont39
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::hash<const char*>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::hash<const char*>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::hash<const char*>"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::hash<const char*>"*)

declare void @__cxa_rethrow() noreturn

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @_ZdlPv(i8*) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

define internal fastcc void @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE21_M_initialize_bucketsEj(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* nocapture %this) {
entry:
  br label %bb3.outer.i.i.i

bb.i.i.i:                                         ; preds = %bb3.i.i.i
  %0 = ashr i32 %__len.0.i.i.i, 1                 ; <i32> [#uses=4]
  %1 = getelementptr inbounds i32* %__first_addr.0.ph.i.i.i, i32 %0 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4                      ; <i32> [#uses=1]
  %3 = icmp ult i32 %2, 100                       ; <i1> [#uses=1]
  br i1 %3, label %bb1.i.i.i, label %bb3.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i
  %.sum.i.i.i = add i32 %0, 1                     ; <i32> [#uses=1]
  %4 = getelementptr inbounds i32* %__first_addr.0.ph.i.i.i, i32 %.sum.i.i.i ; <i32*> [#uses=1]
  %5 = add i32 %__len.0.i.i.i, -1                 ; <i32> [#uses=1]
  %6 = sub i32 %5, %0                             ; <i32> [#uses=1]
  br label %bb3.outer.i.i.i

bb3.outer.i.i.i:                                  ; preds = %bb1.i.i.i, %entry
  %__len.0.ph.i.i.i = phi i32 [ 28, %entry ], [ %6, %bb1.i.i.i ] ; <i32> [#uses=1]
  %__first_addr.0.ph.i.i.i = phi i32* [ getelementptr inbounds ([28 x i32]* @_ZN9__gnu_cxxL16__stl_prime_listE, i32 0, i32 0), %entry ], [ %4, %bb1.i.i.i ] ; <i32*> [#uses=4]
  br label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb3.outer.i.i.i, %bb.i.i.i
  %__len.0.i.i.i = phi i32 [ %__len.0.ph.i.i.i, %bb3.outer.i.i.i ], [ %0, %bb.i.i.i ] ; <i32> [#uses=3]
  %7 = icmp sgt i32 %__len.0.i.i.i, 0             ; <i1> [#uses=1]
  br i1 %7, label %bb.i.i.i, label %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i

_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i:    ; preds = %bb3.i.i.i
  %8 = icmp eq i32* %__first_addr.0.ph.i.i.i, getelementptr ([28 x i32]* @_ZN9__gnu_cxxL16__stl_prime_listE, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %8, label %bb.i, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit

_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit: ; preds = %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i
  %9 = load i32* %__first_addr.0.ph.i.i.i, align 4 ; <i32> [#uses=14]
  %10 = icmp ugt i32 %9, 1073741823               ; <i1> [#uses=1]
  br i1 %10, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit, %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i
  call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

bb1.i:                                            ; preds = %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit
  %11 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 2 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=3]
  %12 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %13 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %12 to i32 ; <i32> [#uses=1]
  %14 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=6]
  %15 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %16 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %15 to i32 ; <i32> [#uses=2]
  %17 = sub i32 %13, %16                          ; <i32> [#uses=1]
  %18 = ashr i32 %17, 2                           ; <i32> [#uses=1]
  %19 = icmp ult i32 %18, %9                      ; <i1> [#uses=1]
  br i1 %19, label %bb3.i, label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit

bb3.i:                                            ; preds = %bb1.i
  %20 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=2]
  %21 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %20, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %22 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %21 to i32 ; <i32> [#uses=1]
  %23 = sub i32 %22, %16                          ; <i32> [#uses=2]
  %24 = ashr i32 %23, 2                           ; <i32> [#uses=1]
  %25 = shl i32 %9, 2                             ; <i32> [#uses=1]
  %26 = call i8* @_Znwj(i32 %25)                  ; <i8*> [#uses=2]
  %27 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %15 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %26, i8* %27, i32 %23, i32 4) nounwind
  %28 = bitcast i8* %26 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=4]
  %29 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %30 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %29, null ; <i1> [#uses=1]
  br i1 %30, label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb3.i
  %31 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %29 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %31) nounwind
  br label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i

_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i: ; preds = %bb.i.i, %bb3.i
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4
  %32 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, i32 %24 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %32, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %20, align 4
  %33 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, i32 %9 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %33, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4
  br label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit

_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit: ; preds = %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i, %bb1.i
  %34 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %28, %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i ], [ %15, %bb1.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %35 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %33, %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i ], [ %12, %bb1.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %36 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=5]
  %37 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %36, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=4]
  %38 = icmp eq i32 %9, 0                         ; <i1> [#uses=1]
  br i1 %38, label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE14_M_fill_insertENS0_17__normal_iteratorIPS8_SA_EEjRKS8_.exit, label %bb.i1

bb.i1:                                            ; preds = %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit
  %39 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %35 to i32 ; <i32> [#uses=1]
  %40 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %37 to i32 ; <i32> [#uses=4]
  %41 = sub i32 %39, %40                          ; <i32> [#uses=1]
  %42 = ashr i32 %41, 2                           ; <i32> [#uses=1]
  %43 = icmp ult i32 %42, %9                      ; <i1> [#uses=1]
  br i1 %43, label %bb16.i, label %bb5.i

bb5.i:                                            ; preds = %bb.i1
  %44 = icmp eq i32 %9, 0                         ; <i1> [#uses=1]
  br i1 %44, label %_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i, label %bb.i.i.i.i.i9.i

bb.i.i.i.i.i9.i:                                  ; preds = %bb.i.i.i.i.i9.i, %bb5.i
  %indvar.i.i.i.i.i5.i = phi i32 [ %indvar.next.i.i.i.i.i7.i, %bb.i.i.i.i.i9.i ], [ 0, %bb5.i ] ; <i32> [#uses=2]
  %__first_addr.02.i.i.i.i.i6.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %37, i32 %indvar.i.i.i.i.i5.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first_addr.02.i.i.i.i.i6.i, align 4
  %indvar.next.i.i.i.i.i7.i = add i32 %indvar.i.i.i.i.i5.i, 1 ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i.i.i.i7.i, %9 ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb15.loopexit.i, label %bb.i.i.i.i.i9.i

bb15.loopexit.i:                                  ; preds = %bb.i.i.i.i.i9.i
  %.pre.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %36, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i

_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i: ; preds = %bb15.loopexit.i, %bb5.i
  %45 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i, %bb15.loopexit.i ], [ %37, %bb5.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %46 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %45, i32 %9 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %46, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %36, align 4
  br label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE14_M_fill_insertENS0_17__normal_iteratorIPS8_SA_EEjRKS8_.exit

bb16.i:                                           ; preds = %bb.i1
  %47 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %34 to i32 ; <i32> [#uses=1]
  %48 = sub i32 %40, %47                          ; <i32> [#uses=1]
  %49 = ashr i32 %48, 2                           ; <i32> [#uses=5]
  %50 = sub i32 1073741823, %49                   ; <i32> [#uses=1]
  %51 = icmp ult i32 %50, %9                      ; <i1> [#uses=1]
  br i1 %51, label %bb17.i, label %bb18.i

bb17.i:                                           ; preds = %bb16.i
  call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0)) noreturn
  unreachable

bb18.i:                                           ; preds = %bb16.i
  %52 = icmp ult i32 %49, %9                      ; <i1> [#uses=1]
  %53 = select i1 %52, i32 %9, i32 %49            ; <i32> [#uses=1]
  %54 = add i32 %53, %49                          ; <i32> [#uses=3]
  %55 = icmp ult i32 %54, %49                     ; <i1> [#uses=1]
  br i1 %55, label %invcont21.i, label %bb20.i

bb20.i:                                           ; preds = %bb18.i
  %56 = icmp ugt i32 %54, 1073741823              ; <i1> [#uses=1]
  br i1 %56, label %bb.i.i.i3, label %invcont21.i

bb.i.i.i3:                                        ; preds = %bb20.i
  call void @_ZSt17__throw_bad_allocv() noreturn
  unreachable

invcont21.i:                                      ; preds = %bb20.i, %bb18.i
  %__len.0.reg2mem.0.i = phi i32 [ 1073741823, %bb18.i ], [ %54, %bb20.i ] ; <i32> [#uses=2]
  %57 = shl i32 %__len.0.reg2mem.0.i, 2           ; <i32> [#uses=1]
  %58 = call i8* @_Znwj(i32 %57)                  ; <i8*> [#uses=3]
  %59 = bitcast i8* %58 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=4]
  %60 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %61 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %60 to i32 ; <i32> [#uses=1]
  %62 = sub i32 %40, %61                          ; <i32> [#uses=2]
  %63 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %60 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %58, i8* %63, i32 %62, i32 4) nounwind
  %64 = ashr i32 %62, 2                           ; <i32> [#uses=2]
  br label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i.i, %invcont21.i
  %indvar.i.i.i.i.i.i = phi i32 [ 0, %invcont21.i ], [ %indvar.next.i.i.i.i.i.i, %bb.i.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp2630.i = add i32 %indvar.i.i.i.i.i.i, %64   ; <i32> [#uses=1]
  %tmp28.i = shl i32 %tmp2630.i, 2                ; <i32> [#uses=1]
  %scevgep.i = getelementptr i8* %58, i32 %tmp28.i ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i = bitcast i8* %scevgep.i to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first_addr.02.i.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i.i = add i32 %indvar.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond25.i = icmp eq i32 %indvar.next.i.i.i.i.i.i, %9 ; <i1> [#uses=1]
  br i1 %exitcond25.i, label %bb52.i, label %bb.i.i.i.i.i.i

bb52.i:                                           ; preds = %bb.i.i.i.i.i.i
  %.sum.i = add i32 %64, %9                       ; <i32> [#uses=2]
  %65 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %59, i32 %.sum.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %66 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %36, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %67 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %66 to i32 ; <i32> [#uses=1]
  %68 = sub i32 %67, %40                          ; <i32> [#uses=2]
  %69 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %65 to i8* ; <i8*> [#uses=1]
  %70 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %37 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %69, i8* %70, i32 %68, i32 4) nounwind
  %71 = ashr i32 %68, 2                           ; <i32> [#uses=1]
  %.sum17.i = add i32 %71, %.sum.i                ; <i32> [#uses=1]
  %72 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %59, i32 %.sum17.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %73 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %74 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %73, null ; <i1> [#uses=1]
  br i1 %74, label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5, label %bb.i.i4

bb.i.i4:                                          ; preds = %bb52.i
  %75 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %73 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %75) nounwind
  br label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5

_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5: ; preds = %bb.i.i4, %bb52.i
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %59, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %14, align 4
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %72, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %36, align 4
  %76 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %59, i32 %__len.0.reg2mem.0.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %76, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4
  br label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE14_M_fill_insertENS0_17__normal_iteratorIPS8_SA_EEjRKS8_.exit

_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE14_M_fill_insertENS0_17__normal_iteratorIPS8_SA_EEjRKS8_.exit: ; preds = %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5, %_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i, %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit
  %77 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 0, i32* %77, align 4
  ret void
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define internal fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* nocapture %this, %"struct.std::ios_base::_Words"* nocapture %__obj) {
entry:
  %0 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 5 ; <i32*> [#uses=3]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=1]
  %2 = add i32 %1, 1                              ; <i32> [#uses=2]
  %3 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=3]
  %4 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %3, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %5 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %4 to i32 ; <i32> [#uses=1]
  %6 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=7]
  %7 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %8 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %7 to i32 ; <i32> [#uses=1]
  %9 = sub i32 %5, %8                             ; <i32> [#uses=1]
  %10 = ashr i32 %9, 2                            ; <i32> [#uses=4]
  %11 = icmp ult i32 %10, %2                      ; <i1> [#uses=1]
  br i1 %11, label %bb3.outer.i.i.i.i, label %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit

bb.i.i.i5.i:                                      ; preds = %bb3.i.i.i.i
  %12 = ashr i32 %__len.0.i.i.i.i, 1              ; <i32> [#uses=4]
  %13 = getelementptr inbounds i32* %__first_addr.0.ph.i.i.i.i, i32 %12 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = icmp ult i32 %14, %2                      ; <i1> [#uses=1]
  br i1 %15, label %bb1.i.i.i.i, label %bb3.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i5.i
  %.sum.i.i.i.i = add i32 %12, 1                  ; <i32> [#uses=1]
  %16 = getelementptr inbounds i32* %__first_addr.0.ph.i.i.i.i, i32 %.sum.i.i.i.i ; <i32*> [#uses=1]
  %17 = add i32 %__len.0.i.i.i.i, -1              ; <i32> [#uses=1]
  %18 = sub i32 %17, %12                          ; <i32> [#uses=1]
  br label %bb3.outer.i.i.i.i

bb3.outer.i.i.i.i:                                ; preds = %bb1.i.i.i.i, %entry
  %__len.0.ph.i.i.i.i = phi i32 [ %18, %bb1.i.i.i.i ], [ 28, %entry ] ; <i32> [#uses=1]
  %__first_addr.0.ph.i.i.i.i = phi i32* [ %16, %bb1.i.i.i.i ], [ getelementptr inbounds ([28 x i32]* @_ZN9__gnu_cxxL16__stl_prime_listE, i32 0, i32 0), %entry ] ; <i32*> [#uses=4]
  br label %bb3.i.i.i.i

bb3.i.i.i.i:                                      ; preds = %bb3.outer.i.i.i.i, %bb.i.i.i5.i
  %__len.0.i.i.i.i = phi i32 [ %__len.0.ph.i.i.i.i, %bb3.outer.i.i.i.i ], [ %12, %bb.i.i.i5.i ] ; <i32> [#uses=3]
  %19 = icmp sgt i32 %__len.0.i.i.i.i, 0          ; <i1> [#uses=1]
  br i1 %19, label %bb.i.i.i5.i, label %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i

_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i:  ; preds = %bb3.i.i.i.i
  %20 = icmp eq i32* %__first_addr.0.ph.i.i.i.i, getelementptr ([28 x i32]* @_ZN9__gnu_cxxL16__stl_prime_listE, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %20, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i
  %21 = load i32* %__first_addr.0.ph.i.i.i.i, align 4 ; <i32> [#uses=1]
  br label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i

_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i: ; preds = %bb1.i.i.i, %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i
  %22 = phi i32 [ %21, %bb1.i.i.i ], [ -5, %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i ] ; <i32> [#uses=7]
  %23 = icmp ugt i32 %22, %10                     ; <i1> [#uses=1]
  br i1 %23, label %bb2.i, label %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit

bb2.i:                                            ; preds = %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i
  %24 = icmp ugt i32 %22, 1073741823              ; <i1> [#uses=1]
  br i1 %24, label %bb.i.i.i.i.i.i, label %_ZN9__gnu_cxx13new_allocatorIPNS_15_Hashtable_nodeISt4pairIKPKciEEEE8allocateEjPKv.exit.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb2.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i unwind label %lpad.i.i.i.i

.noexc.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i.i
  unreachable

_ZN9__gnu_cxx13new_allocatorIPNS_15_Hashtable_nodeISt4pairIKPKciEEEE8allocateEjPKv.exit.i.i.i.i.i: ; preds = %bb2.i
  %25 = shl i32 %22, 2                            ; <i32> [#uses=1]
  %26 = invoke i8* @_Znwj(i32 %25)
          to label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EEC2EjRKS9_.exit.i.i.i unwind label %lpad.i.i.i.i ; <i8*> [#uses=2]

lpad.i.i.i.i:                                     ; preds = %_ZN9__gnu_cxx13new_allocatorIPNS_15_Hashtable_nodeISt4pairIKPKciEEEE8allocateEjPKv.exit.i.i.i.i.i, %bb.i.i.i.i.i.i
  %eh_ptr.i.i.i.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i)
          to label %.noexc.i unwind label %Unwind.i

.noexc.i:                                         ; preds = %lpad.i.i.i.i
  unreachable

_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EEC2EjRKS9_.exit.i.i.i: ; preds = %_ZN9__gnu_cxx13new_allocatorIPNS_15_Hashtable_nodeISt4pairIKPKciEEEE8allocateEjPKv.exit.i.i.i.i.i
  %27 = bitcast i8* %26 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=4]
  %28 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %27, i32 %22 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %29 = icmp eq i32 %22, 0                        ; <i1> [#uses=1]
  br i1 %29, label %bb4.i, label %bb.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %bb.i.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EEC2EjRKS9_.exit.i.i.i
  %indvar.i.i.i.i.i.i.i.i = phi i32 [ %indvar.next.i.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i.i ], [ 0, %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EEC2EjRKS9_.exit.i.i.i ] ; <i32> [#uses=2]
  %tmp.i = shl i32 %indvar.i.i.i.i.i.i.i.i, 2     ; <i32> [#uses=1]
  %scevgep.i = getelementptr i8* %26, i32 %tmp.i  ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i.i = bitcast i8* %scevgep.i to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first_addr.02.i.i.i.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i.i.i.i = add i32 %indvar.i.i.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i.i.i.i.i.i.i, %22 ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb4.i, label %bb.i.i.i.i.i.i.i.i

bb4.i:                                            ; preds = %bb.i.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EEC2EjRKS9_.exit.i.i.i
  %30 = icmp eq i32 %10, 0                        ; <i1> [#uses=1]
  br i1 %30, label %bb33.i, label %bb8.preheader.i

bb6.i:                                            ; preds = %bb8.preheader.i, %invcont7.i
  %31 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pn.i, %invcont7.i ], [ %.pn7.i, %bb8.preheader.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %__first.010.i = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %__first.0.i, %invcont7.i ], [ %__first.09.i, %bb8.preheader.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=3]
  %32 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__first.010.i, i32 0, i32 1, i32 0 ; <i8**> [#uses=1]
  %33 = load i8** %32, align 4                    ; <i8*> [#uses=3]
  %34 = load i8* %33, align 1                     ; <i8> [#uses=1]
  %35 = icmp eq i8 %34, 0                         ; <i1> [#uses=1]
  br i1 %35, label %invcont7.i, label %bb.i.i.i.i.i5

bb.i.i.i.i.i5:                                    ; preds = %bb.i.i.i.i.i5, %bb6.i
  %indvar.i.i.i.i.i1 = phi i32 [ %tmp16.i, %bb.i.i.i.i.i5 ], [ 0, %bb6.i ] ; <i32> [#uses=2]
  %__h.01.i.i.i.i.i2 = phi i32 [ %39, %bb.i.i.i.i.i5 ], [ 0, %bb6.i ] ; <i32> [#uses=1]
  %tmp16.i = add i32 %indvar.i.i.i.i.i1, 1        ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i3 = getelementptr i8* %33, i32 %tmp16.i ; <i8*> [#uses=1]
  %__s_addr.02.i.i.i.i.i4 = getelementptr i8* %33, i32 %indvar.i.i.i.i.i1 ; <i8*> [#uses=1]
  %36 = mul i32 %__h.01.i.i.i.i.i2, 5             ; <i32> [#uses=1]
  %37 = load i8* %__s_addr.02.i.i.i.i.i4, align 1 ; <i8> [#uses=1]
  %38 = sext i8 %37 to i32                        ; <i32> [#uses=1]
  %39 = add i32 %38, %36                          ; <i32> [#uses=2]
  %40 = load i8* %scevgep.i.i.i.i.i3, align 1     ; <i8> [#uses=1]
  %41 = icmp eq i8 %40, 0                         ; <i1> [#uses=1]
  br i1 %41, label %invcont7.i, label %bb.i.i.i.i.i5

invcont7.i:                                       ; preds = %bb.i.i.i.i.i5, %bb6.i
  %__h.0.lcssa.i.i.i.i.i6 = phi i32 [ 0, %bb6.i ], [ %39, %bb.i.i.i.i.i5 ] ; <i32> [#uses=1]
  %42 = urem i32 %__h.0.lcssa.i.i.i.i.i6, %22     ; <i32> [#uses=1]
  %43 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__first.010.i, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %44 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %43, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=1]
  %scevgep20.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %31, i32 %__bucket1.011.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %44, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep20.i, align 4
  %45 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %27, i32 %42 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %46 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %45, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %46, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %43, align 4
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__first.010.i, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %45, align 4
  %.pn.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__first.0.in.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %.pn.i, i32 %__bucket1.011.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %__first.0.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first.0.in.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %47 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__first.0.i, null ; <i1> [#uses=1]
  br i1 %47, label %bb9.i, label %bb6.i

bb9.i:                                            ; preds = %bb8.preheader.i, %invcont7.i
  %48 = add i32 %__bucket1.011.i, 1               ; <i32> [#uses=2]
  %exitcond19.i = icmp eq i32 %48, %10            ; <i1> [#uses=1]
  br i1 %exitcond19.i, label %bb33.i, label %bb8.preheader.i

bb8.preheader.i:                                  ; preds = %bb9.i, %bb4.i
  %__bucket1.011.i = phi i32 [ %48, %bb9.i ], [ 0, %bb4.i ] ; <i32> [#uses=4]
  %.pn7.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__first.0.in8.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %.pn7.i, i32 %__bucket1.011.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %__first.09.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first.0.in8.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %49 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__first.09.i, null ; <i1> [#uses=1]
  br i1 %49, label %bb9.i, label %bb6.i

bb33.i:                                           ; preds = %bb9.i, %bb4.i
  %50 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %27, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6, align 4
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %3, align 4
  %51 = getelementptr inbounds %"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %this, i32 0, i32 4, i32 0, i32 0, i32 2 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %51, align 4
  %52 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %50, null ; <i1> [#uses=1]
  br i1 %52, label %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb33.i
  %53 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %50 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %53) nounwind
  %.pre = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %3, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %.pre11 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit

Unwind.i:                                         ; preds = %lpad.i.i.i.i
  %eh_ptr.i = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select36.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
  unreachable

_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit: ; preds = %bb.i.i.i.i, %bb33.i, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i, %entry
  %54 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre11, %bb.i.i.i.i ], [ %27, %bb33.i ], [ %7, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i ], [ %7, %entry ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %55 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre, %bb.i.i.i.i ], [ %28, %bb33.i ], [ %4, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i ], [ %4, %entry ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %56 = getelementptr inbounds %"struct.std::ios_base::_Words"* %__obj, i32 0, i32 0 ; <i8**> [#uses=2]
  %57 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %55 to i32 ; <i32> [#uses=1]
  %58 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %54 to i32 ; <i32> [#uses=1]
  %59 = sub i32 %57, %58                          ; <i32> [#uses=1]
  %60 = ashr i32 %59, 2                           ; <i32> [#uses=1]
  %61 = load i8** %56, align 4                    ; <i8*> [#uses=4]
  %62 = load i8* %61, align 1                     ; <i8> [#uses=1]
  %63 = icmp eq i8 %62, 0                         ; <i1> [#uses=1]
  br i1 %63, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit
  %indvar.i.i.i.i.i = phi i32 [ %tmp, %bb.i.i.i.i.i ], [ 0, %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit ] ; <i32> [#uses=2]
  %__h.01.i.i.i.i.i = phi i32 [ %67, %bb.i.i.i.i.i ], [ 0, %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar.i.i.i.i.i, 1             ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i = getelementptr i8* %61, i32 %tmp ; <i8*> [#uses=1]
  %__s_addr.02.i.i.i.i.i = getelementptr i8* %61, i32 %indvar.i.i.i.i.i ; <i8*> [#uses=1]
  %64 = mul i32 %__h.01.i.i.i.i.i, 5              ; <i32> [#uses=1]
  %65 = load i8* %__s_addr.02.i.i.i.i.i, align 1  ; <i8> [#uses=1]
  %66 = sext i8 %65 to i32                        ; <i32> [#uses=1]
  %67 = add i32 %66, %64                          ; <i32> [#uses=2]
  %68 = load i8* %scevgep.i.i.i.i.i, align 1      ; <i8> [#uses=1]
  %69 = icmp eq i8 %68, 0                         ; <i1> [#uses=1]
  br i1 %69, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit, label %bb.i.i.i.i.i

_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit: ; preds = %bb.i.i.i.i.i, %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit
  %__h.0.lcssa.i.i.i.i.i = phi i32 [ 0, %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE6resizeEj.exit ], [ %67, %bb.i.i.i.i.i ] ; <i32> [#uses=1]
  %70 = urem i32 %__h.0.lcssa.i.i.i.i.i, %60      ; <i32> [#uses=2]
  %71 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %54, i32 %70 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %72 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %71, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  br label %bb3

bb:                                               ; preds = %bb3
  %73 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.0, i32 0, i32 1, i32 0 ; <i8**> [#uses=1]
  %74 = load i8** %73, align 4                    ; <i8*> [#uses=1]
  %75 = tail call i32 @strcmp(i8* %74, i8* %61) nounwind readonly ; <i32> [#uses=1]
  %76 = icmp eq i32 %75, 0                        ; <i1> [#uses=1]
  br i1 %76, label %bb5, label %bb2

bb2:                                              ; preds = %bb
  %77 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %78 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %77, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb2, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit
  %__cur.0 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %72, %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE10_M_bkt_numERKS5_.exit ], [ %78, %bb2 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=4]
  %79 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.0, null ; <i1> [#uses=1]
  br i1 %79, label %bb4, label %bb

bb4:                                              ; preds = %bb3
  %80 = tail call i8* @_Znwj(i32 12)              ; <i8*> [#uses=4]
  %81 = bitcast i8* %80 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %82 = bitcast i8* %80 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %82, align 4
  %83 = getelementptr inbounds i8* %80, i32 4     ; <i8*> [#uses=2]
  %84 = icmp eq i8* %83, null                     ; <i1> [#uses=1]
  br i1 %84, label %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE11_M_new_nodeERKS5_.exit, label %bb.i.i

bb.i.i:                                           ; preds = %bb4
  %85 = load i8** %56, align 4                    ; <i8*> [#uses=1]
  %86 = getelementptr inbounds %"struct.std::ios_base::_Words"* %__obj, i32 0, i32 1 ; <i32*> [#uses=1]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %88 = bitcast i8* %83 to i8**                   ; <i8**> [#uses=1]
  store i8* %85, i8** %88
  %89 = getelementptr i8* %80, i32 8              ; <i8*> [#uses=1]
  %90 = bitcast i8* %89 to i32*                   ; <i32*> [#uses=1]
  store i32 %87, i32* %90, align 4
  br label %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE11_M_new_nodeERKS5_.exit

_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE11_M_new_nodeERKS5_.exit: ; preds = %bb.i.i, %bb4
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %72, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %82, align 4
  %91 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %6, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %92 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %91, i32 %70 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %81, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %92, align 4
  %93 = load i32* %0, align 4                     ; <i32> [#uses=1]
  %94 = add i32 %93, 1                            ; <i32> [#uses=1]
  store i32 %94, i32* %0, align 4
  br label %bb5

bb5:                                              ; preds = %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE11_M_new_nodeERKS5_.exit, %bb
  %__cur.0.pn = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %81, %_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE11_M_new_nodeERKS5_.exit ], [ %__cur.0, %bb ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=1]
  %.0 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.0.pn, i32 0, i32 1 ; <%"struct.std::ios_base::_Words"*> [#uses=1]
  ret %"struct.std::ios_base::_Words"* %.0
}

declare void @_ZSt19__throw_ios_failurePKc(i8*) noreturn

define internal fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %this) {
invcont:
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  %1 = load i32 (...)*** %0, align 4              ; <i32 (...)**> [#uses=1]
  %2 = getelementptr inbounds i32 (...)** %1, i32 -3 ; <i32 (...)**> [#uses=1]
  %3 = bitcast i32 (...)** %2 to i32*             ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %this to i32 ; <i32> [#uses=3]
  %6 = add i32 %4, %5                             ; <i32> [#uses=1]
  %7 = inttoptr i32 %6 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %8 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %9 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %8, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=3]
  %10 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %9, null ; <i1> [#uses=1]
  br i1 %10, label %bb16, label %invcont1

invcont1:                                         ; preds = %invcont
  %11 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %9, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %12 = load i32 (...)*** %11, align 4            ; <i32 (...)**> [#uses=1]
  %13 = getelementptr inbounds i32 (...)** %12, i32 6 ; <i32 (...)**> [#uses=1]
  %14 = load i32 (...)** %13, align 4             ; <i32 (...)*> [#uses=1]
  %15 = bitcast i32 (...)* %14 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)*> [#uses=1]
  %16 = invoke i32 %15(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %9)
          to label %invcont2 unwind label %lpad   ; <i32> [#uses=1]

invcont2:                                         ; preds = %invcont1
  %17 = icmp eq i32 %16, -1                       ; <i1> [#uses=1]
  br i1 %17, label %bb15, label %bb16

invcont11:                                        ; preds = %lpad20
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr21)
  unreachable

bb13:                                             ; preds = %lpad
  tail call void @__cxa_end_catch()
  ret void

bb15:                                             ; preds = %invcont2
  %18 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %19 = getelementptr inbounds i32 (...)** %18, i32 -3 ; <i32 (...)**> [#uses=1]
  %20 = bitcast i32 (...)** %19 to i32*           ; <i32*> [#uses=1]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=1]
  %22 = add i32 %21, %5                           ; <i32> [#uses=1]
  %23 = inttoptr i32 %22 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %24 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %23, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %25 = load i32* %24, align 4                    ; <i32> [#uses=1]
  %storemerge.i = or i32 %25, 1                   ; <i32> [#uses=2]
  store i32 %storemerge.i, i32* %24
  %26 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %23, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=1]
  %28 = and i32 %storemerge.i, %27                ; <i32> [#uses=1]
  %29 = icmp eq i32 %28, 0                        ; <i1> [#uses=1]
  br i1 %29, label %_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb15
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit: ; preds = %bb15
  ret void

bb16:                                             ; preds = %invcont2, %invcont
  ret void

lpad:                                             ; preds = %invcont1
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select19 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %30 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %31 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %32 = getelementptr inbounds i32 (...)** %31, i32 -3 ; <i32 (...)**> [#uses=1]
  %33 = bitcast i32 (...)** %32 to i32*           ; <i32*> [#uses=1]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  %35 = add i32 %34, %5                           ; <i32> [#uses=1]
  %36 = inttoptr i32 %35 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %37 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %38 = load i32* %37, align 4                    ; <i32> [#uses=1]
  %39 = or i32 %38, 1                             ; <i32> [#uses=1]
  store i32 %39, i32* %37, align 4
  %40 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %41 = load i32* %40, align 4                    ; <i32> [#uses=1]
  %42 = and i32 %41, 1                            ; <i32> [#uses=1]
  %43 = icmp eq i32 %42, 0                        ; <i1> [#uses=1]
  br i1 %43, label %bb13, label %bb.i

bb.i:                                             ; preds = %lpad
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc unwind label %lpad20

.noexc:                                           ; preds = %bb.i
  unreachable

lpad20:                                           ; preds = %bb.i
  %eh_ptr21 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select23 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr21, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont11 unwind label %lpad24

lpad24:                                           ; preds = %lpad20
  %eh_ptr25 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=1]
  %eh_select27 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr25, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable
}

declare void @_ZSt16__throw_bad_castv() noreturn

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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit: ; preds = %bb17
  ret void
}

declare zeroext i8 @_ZSt18uncaught_exceptionv() nounwind

define internal fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i() {
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
  %9 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %8, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %10 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %9, null ; <i1> [#uses=1]
  br i1 %10, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %9)
  %.pre.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i.i, %entry
  %14 = phi i32 (...)** [ %.pre.i.i, %bb8.i.i ], [ %2, %entry ], [ %2, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %15 = getelementptr inbounds i32 (...)** %14, i32 -3 ; <i32 (...)**> [#uses=1]
  %16 = bitcast i32 (...)** %15 to i32*           ; <i32*> [#uses=1]
  %17 = load i32* %16, align 4                    ; <i32> [#uses=1]
  %18 = add i32 %17, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %19 = inttoptr i32 %18 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %20 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %19, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=2]
  %22 = icmp eq i32 %21, 0                        ; <i1> [#uses=1]
  br i1 %22, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %0, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %23 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %19, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %24 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %23, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %25 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %24, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %25, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %21 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %20
  %26 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %19, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=1]
  %28 = and i32 %storemerge.i.i.i, %27            ; <i32> [#uses=1]
  %29 = icmp eq i32 %28, 0                        ; <i1> [#uses=1]
  br i1 %29, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %0, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb41, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %30 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %31 = getelementptr inbounds i32 (...)** %30, i32 -3 ; <i32 (...)**> [#uses=1]
  %32 = bitcast i32 (...)** %31 to i32*           ; <i32*> [#uses=1]
  %33 = load i32* %32, align 4                    ; <i32> [#uses=1]
  %34 = add i32 %33, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %35 = inttoptr i32 %34 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %36 = getelementptr inbounds %"struct.std::ios_base"* %35, i32 0, i32 2 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4                    ; <i32> [#uses=3]
  %38 = icmp sgt i32 %37, 1                       ; <i1> [#uses=1]
  br i1 %38, label %bb1, label %bb30

bb1:                                              ; preds = %bb
  %39 = getelementptr inbounds %"struct.std::ios_base"* %35, i32 0, i32 3 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = and i32 %40, 176                          ; <i32> [#uses=1]
  %42 = icmp eq i32 %41, 32                       ; <i1> [#uses=2]
  br i1 %42, label %invcont9, label %bb6

bb6:                                              ; preds = %bb1
  %43 = add i32 %37, -1                           ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %43)
          to label %invcont9 unwind label %lpad50

invcont9:                                         ; preds = %bb6, %bb1
  %44 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %45 = getelementptr inbounds i32 (...)** %44, i32 -3 ; <i32 (...)**> [#uses=1]
  %46 = bitcast i32 (...)** %45 to i32*           ; <i32*> [#uses=1]
  %47 = load i32* %46, align 4                    ; <i32> [#uses=1]
  %48 = add i32 %47, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %49 = inttoptr i32 %48 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %50 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %51 = load i32* %50, align 4                    ; <i32> [#uses=1]
  %52 = icmp eq i32 %51, 0                        ; <i1> [#uses=1]
  br i1 %52, label %bb11, label %bb13

bb11:                                             ; preds = %invcont9
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %54 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %53, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %55 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %56 = load i32 (...)*** %55, align 4            ; <i32 (...)**> [#uses=1]
  %57 = getelementptr inbounds i32 (...)** %56, i32 12 ; <i32 (...)**> [#uses=1]
  %58 = load i32 (...)** %57, align 4             ; <i32 (...)*> [#uses=1]
  %59 = bitcast i32 (...)* %58 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %60 = invoke i32 %59(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54, i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i32 1)
          to label %.noexc8 unwind label %lpad50  ; <i32> [#uses=1]

.noexc8:                                          ; preds = %bb11
  %61 = icmp eq i32 %60, 1                        ; <i1> [#uses=1]
  br i1 %61, label %bb13, label %bb.i4

bb.i4:                                            ; preds = %.noexc8
  %62 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %63 = getelementptr inbounds i32 (...)** %62, i32 -3 ; <i32 (...)**> [#uses=1]
  %64 = bitcast i32 (...)** %63 to i32*           ; <i32*> [#uses=1]
  %65 = load i32* %64, align 4                    ; <i32> [#uses=1]
  %66 = add i32 %65, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %67 = inttoptr i32 %66 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %68 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %69 = load i32* %68, align 4                    ; <i32> [#uses=1]
  %70 = or i32 %69, 1                             ; <i32> [#uses=2]
  store i32 %70, i32* %68
  %71 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %72 = load i32* %71, align 4                    ; <i32> [#uses=1]
  %73 = and i32 %70, %72                          ; <i32> [#uses=1]
  %74 = icmp eq i32 %73, 0                        ; <i1> [#uses=1]
  br i1 %74, label %bb13, label %bb4.i.i.i5

bb4.i.i.i5:                                       ; preds = %bb.i4
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc9 unwind label %lpad50

.noexc9:                                          ; preds = %bb4.i.i.i5
  unreachable

bb13:                                             ; preds = %bb.i4, %.noexc8, %invcont9
  br i1 %42, label %invcont19, label %bb32

invcont19:                                        ; preds = %bb13
  %75 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %76 = getelementptr inbounds i32 (...)** %75, i32 -3 ; <i32 (...)**> [#uses=1]
  %77 = bitcast i32 (...)** %76 to i32*           ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=1]
  %79 = add i32 %78, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %80 = inttoptr i32 %79 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %81 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %80, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %82 = load i32* %81, align 4                    ; <i32> [#uses=1]
  %83 = icmp eq i32 %82, 0                        ; <i1> [#uses=1]
  br i1 %83, label %bb28, label %bb32

bb28:                                             ; preds = %invcont19
  %84 = add i32 %37, -1                           ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %84)
          to label %bb32 unwind label %lpad50

bb30:                                             ; preds = %bb
  %85 = inttoptr i32 %34 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %87 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %86, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %88 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %87, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %89 = load i32 (...)*** %88, align 4            ; <i32 (...)**> [#uses=1]
  %90 = getelementptr inbounds i32 (...)** %89, i32 12 ; <i32 (...)**> [#uses=1]
  %91 = load i32 (...)** %90, align 4             ; <i32 (...)*> [#uses=1]
  %92 = bitcast i32 (...)* %91 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %93 = invoke i32 %92(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %87, i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i32 1)
          to label %.noexc2 unwind label %lpad50  ; <i32> [#uses=1]

.noexc2:                                          ; preds = %bb30
  %94 = icmp eq i32 %93, 1                        ; <i1> [#uses=1]
  br i1 %94, label %bb32, label %bb.i1

bb.i1:                                            ; preds = %.noexc2
  %95 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %96 = getelementptr inbounds i32 (...)** %95, i32 -3 ; <i32 (...)**> [#uses=1]
  %97 = bitcast i32 (...)** %96 to i32*           ; <i32*> [#uses=1]
  %98 = load i32* %97, align 4                    ; <i32> [#uses=1]
  %99 = add i32 %98, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %100 = inttoptr i32 %99 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %101 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %100, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = or i32 %102, 1                           ; <i32> [#uses=2]
  store i32 %103, i32* %101
  %104 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %100, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %105 = load i32* %104, align 4                  ; <i32> [#uses=1]
  %106 = and i32 %103, %105                       ; <i32> [#uses=1]
  %107 = icmp eq i32 %106, 0                      ; <i1> [#uses=1]
  br i1 %107, label %bb32, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i1
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc3 unwind label %lpad50

.noexc3:                                          ; preds = %bb4.i.i.i
  unreachable

bb32:                                             ; preds = %bb.i1, %.noexc2, %bb28, %invcont19, %bb13
  %108 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %109 = getelementptr inbounds i32 (...)** %108, i32 -3 ; <i32 (...)**> [#uses=1]
  %110 = bitcast i32 (...)** %109 to i32*         ; <i32*> [#uses=1]
  %111 = load i32* %110, align 4                  ; <i32> [#uses=1]
  %112 = add i32 %111, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %113 = inttoptr i32 %112 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %114 = getelementptr inbounds %"struct.std::ios_base"* %113, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %114, align 4
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
  %115 = call i8* @__cxa_begin_catch(i8* %eh_ptr51) nounwind ; <i8*> [#uses=0]
  %116 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %117 = getelementptr inbounds i32 (...)** %116, i32 -3 ; <i32 (...)**> [#uses=1]
  %118 = bitcast i32 (...)** %117 to i32*         ; <i32*> [#uses=1]
  %119 = load i32* %118, align 4                  ; <i32> [#uses=1]
  %120 = add i32 %119, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %121 = inttoptr i32 %120 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %122 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %121, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %123 = load i32* %122, align 4                  ; <i32> [#uses=1]
  %124 = or i32 %123, 1                           ; <i32> [#uses=1]
  store i32 %124, i32* %122, align 4
  %125 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %121, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %126 = load i32* %125, align 4                  ; <i32> [#uses=1]
  %127 = and i32 %126, 1                          ; <i32> [#uses=1]
  %128 = icmp eq i32 %127, 0                      ; <i1> [#uses=1]
  br i1 %128, label %bb39, label %bb.i

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

define internal fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %__v) {
entry:
  %__s = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %1 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %1, align 8
  %2 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %2, align 4
  %3 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %4 = getelementptr inbounds i32 (...)** %3, i32 -3 ; <i32 (...)**> [#uses=1]
  %5 = bitcast i32 (...)** %4 to i32*             ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = add i32 %6, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %8 = inttoptr i32 %7 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %9 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %8, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %10 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %9, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %11 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %10, null ; <i1> [#uses=1]
  br i1 %11, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %12 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %8, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %13 = load i32* %12, align 4                    ; <i32> [#uses=1]
  %14 = icmp eq i32 %13, 0                        ; <i1> [#uses=1]
  br i1 %14, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %10)
  %.pre.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i.i, %entry
  %15 = phi i32 (...)** [ %.pre.i.i, %bb8.i.i ], [ %3, %entry ], [ %3, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %16 = getelementptr inbounds i32 (...)** %15, i32 -3 ; <i32 (...)**> [#uses=1]
  %17 = bitcast i32 (...)** %16 to i32*           ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = add i32 %18, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %20 = inttoptr i32 %19 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %22 = load i32* %21, align 4                    ; <i32> [#uses=2]
  %23 = icmp eq i32 %22, 0                        ; <i1> [#uses=1]
  br i1 %23, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %1, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %24 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %25 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %24, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %26 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %26, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %22 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %21
  %27 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=1]
  %29 = and i32 %storemerge.i.i.i, %28            ; <i32> [#uses=1]
  %30 = icmp eq i32 %29, 0                        ; <i1> [#uses=1]
  br i1 %30, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %1, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb17, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %31 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %32 = getelementptr inbounds i32 (...)** %31, i32 -3 ; <i32 (...)**> [#uses=1]
  %33 = bitcast i32 (...)** %32 to i32*           ; <i32*> [#uses=1]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  %35 = add i32 %34, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %36 = inttoptr i32 %35 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %37 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %38 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %37, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %39 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, null ; <i1> [#uses=1]
  br i1 %39, label %bb.i6, label %invcont1

bb.i6:                                            ; preds = %bb
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7 unwind label %lpad26

.noexc7:                                          ; preds = %bb.i6
  unreachable

invcont1:                                         ; preds = %bb
  %40 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 3 ; <i8*> [#uses=2]
  %41 = load i8* %40, align 1                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %41, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb.i4, label %invcont2

bb.i4:                                            ; preds = %invcont1
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %42 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5 unwind label %lpad26  ; <i8> [#uses=1]

.noexc5:                                          ; preds = %bb.i4
  %43 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %42, i8* %43, align 4
  store i8 1, i8* %40, align 1
  %.pre = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2

invcont2:                                         ; preds = %.noexc5, %invcont1
  %44 = phi i32 (...)** [ %.pre, %.noexc5 ], [ %31, %invcont1 ] ; <i32 (...)**> [#uses=1]
  %45 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 2 ; <i8*> [#uses=1]
  %46 = load i8* %45, align 4                     ; <i8> [#uses=1]
  %47 = getelementptr inbounds i32 (...)** %44, i32 -3 ; <i32 (...)**> [#uses=1]
  %48 = bitcast i32 (...)** %47 to i32*           ; <i32*> [#uses=1]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=1]
  %50 = add i32 %49, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %51 = inttoptr i32 %50 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %52 = inttoptr i32 %50 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %54 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %53, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54 to i32 ; <i32> [#uses=1]
  %55 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54, null ; <i1> [#uses=1]
  %tmp9 = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s to i64* ; <i64*> [#uses=1]
  %56 = zext i32 %tmp to i64                      ; <i64> [#uses=1]
  %57 = zext i1 %55 to i64                        ; <i64> [#uses=1]
  %58 = shl i64 %57, 32                           ; <i64> [#uses=1]
  %59 = or i64 %58, %56                           ; <i64> [#uses=1]
  store i64 %59, i64* %tmp9, align 8
  %60 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %61 = load i32 (...)*** %60, align 4            ; <i32 (...)**> [#uses=1]
  %62 = getelementptr inbounds i32 (...)** %61, i32 3 ; <i32 (...)**> [#uses=1]
  %63 = load i32 (...)** %62, align 4             ; <i32 (...)*> [#uses=1]
  %64 = bitcast i32 (...)* %63 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %64(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s, %"struct.std::ios_base"* %51, i8 signext %46, i32 %__v)
          to label %invcont3 unwind label %lpad26

invcont3:                                         ; preds = %invcont2
  %65 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %66 = load i8* %65, align 4                     ; <i8> [#uses=1]
  %toBool4 = icmp eq i8 %66, 0                    ; <i1> [#uses=1]
  br i1 %toBool4, label %bb17, label %bb15

bb12:                                             ; preds = %lpad26
  invoke void @__cxa_end_catch()
          to label %bb17 unwind label %lpad30

bb15:                                             ; preds = %invcont3
  %67 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %68 = getelementptr inbounds i32 (...)** %67, i32 -3 ; <i32 (...)**> [#uses=1]
  %69 = bitcast i32 (...)** %68 to i32*           ; <i32*> [#uses=1]
  %70 = load i32* %69, align 4                    ; <i32> [#uses=1]
  %71 = add i32 %70, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %72 = inttoptr i32 %71 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %73 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %72, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %74 = load i32* %73, align 4                    ; <i32> [#uses=1]
  %storemerge.i = or i32 %74, 1                   ; <i32> [#uses=2]
  store i32 %storemerge.i, i32* %73
  %75 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %72, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %76 = load i32* %75, align 4                    ; <i32> [#uses=1]
  %77 = and i32 %storemerge.i, %76                ; <i32> [#uses=1]
  %78 = icmp eq i32 %77, 0                        ; <i1> [#uses=1]
  br i1 %78, label %bb17, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb15
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc1 unwind label %lpad

.noexc1:                                          ; preds = %bb4.i.i
  unreachable

bb17:                                             ; preds = %bb15, %bb12, %invcont3, %invcont
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb)
  ret void

invcont21:                                        ; preds = %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

lpad:                                             ; preds = %bb4.i.i
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select25 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad26:                                           ; preds = %invcont2, %bb.i4, %bb.i6
  %eh_ptr27 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select29 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %79 = call i8* @__cxa_begin_catch(i8* %eh_ptr27) nounwind ; <i8*> [#uses=0]
  %80 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %81 = getelementptr inbounds i32 (...)** %80, i32 -3 ; <i32 (...)**> [#uses=1]
  %82 = bitcast i32 (...)** %81 to i32*           ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=1]
  %84 = add i32 %83, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %85 = inttoptr i32 %84 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %88 = or i32 %87, 1                             ; <i32> [#uses=1]
  store i32 %88, i32* %86, align 4
  %89 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %90 = load i32* %89, align 4                    ; <i32> [#uses=1]
  %91 = and i32 %90, 1                            ; <i32> [#uses=1]
  %92 = icmp eq i32 %91, 0                        ; <i1> [#uses=1]
  br i1 %92, label %bb12, label %bb.i

bb.i:                                             ; preds = %lpad26
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc unwind label %lpad34

.noexc:                                           ; preds = %bb.i
  unreachable

lpad30:                                           ; preds = %bb12
  %eh_ptr31 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select33 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad34:                                           ; preds = %bb.i
  %eh_ptr35 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select37 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr35, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad unwind label %lpad38

lpad38:                                           ; preds = %lpad34
  %eh_ptr39 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select41 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr39, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad42:                                           ; preds = %ppad
  %eh_ptr43 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select45 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr43, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad:                                             ; preds = %lpad34, %lpad30, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr31, %lpad30 ], [ %eh_ptr35, %lpad34 ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb)
          to label %invcont21 unwind label %lpad42
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare i32 @sprintf(i8* noalias nocapture, i8* noalias nocapture, ...) nounwind

declare noalias i8* @strdup(i8* nocapture) nounwind

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
