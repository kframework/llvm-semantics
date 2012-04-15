; ModuleID = 'hash.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
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
@.str3 = private constant [3 x i8] c"%x\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str4 = private constant [3 x i8] c"%d\00", align 1 ; <[3 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
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
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %1 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %2 = alloca %"struct.std::ios_base::_Words", align 8 ; <%"struct.std::ios_base::_Words"*> [#uses=3]
  %X = alloca %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >", align 8 ; <%"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"*> [#uses=7]
  %buf = alloca [16 x i8], align 1                ; <[16 x i8]*> [#uses=1]
  %3 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %3, label %bb, label %bb3

bb:                                               ; preds = %entry
  %4 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %5 = load i8** %4, align 4                      ; <i8*> [#uses=1]
  %6 = call i32 @atoi(i8* %5) nounwind readonly   ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb, %entry
  %iftmp.99.0 = phi i32 [ %6, %bb ], [ 500000, %entry ] ; <i32> [#uses=2]
  %7 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0 ; <%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"*> [#uses=2]
  %8 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0, i32 1, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %8, align 1
  %9 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0, i32 2, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %9, align 2
  %10 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=11]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4
  %11 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0, i32 4, i32 0, i32 0, i32 1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=10]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4
  %12 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0, i32 4, i32 0, i32 0, i32 2 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"***> [#uses=3]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %12, align 4
  %13 = getelementptr inbounds %"struct.__gnu_cxx::hash_map<const char*,int,__gnu_cxx::hash<const char*>,eqstr,std::allocator<int> >"* %X, i32 0, i32 0, i32 5 ; <i32*> [#uses=4]
  store i32 0, i32* %13, align 8
  br label %bb3.outer.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb3.i.i.i.i
  %14 = ashr i32 %__len.0.i.i.i.i, 1              ; <i32> [#uses=4]
  %15 = getelementptr inbounds i32* %__first_addr.0.ph.i.i.i.i, i32 %14 ; <i32*> [#uses=1]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = icmp ult i32 %16, 100                     ; <i1> [#uses=1]
  br i1 %17, label %bb1.i.i.i.i, label %bb3.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  %.sum.i.i.i.i = add i32 %14, 1                  ; <i32> [#uses=1]
  %18 = getelementptr inbounds i32* %__first_addr.0.ph.i.i.i.i, i32 %.sum.i.i.i.i ; <i32*> [#uses=1]
  %19 = add i32 %__len.0.i.i.i.i, -1              ; <i32> [#uses=1]
  %20 = sub i32 %19, %14                          ; <i32> [#uses=1]
  br label %bb3.outer.i.i.i.i

bb3.outer.i.i.i.i:                                ; preds = %bb1.i.i.i.i, %bb3
  %__len.0.ph.i.i.i.i = phi i32 [ 28, %bb3 ], [ %20, %bb1.i.i.i.i ] ; <i32> [#uses=1]
  %__first_addr.0.ph.i.i.i.i = phi i32* [ getelementptr inbounds ([28 x i32]* @_ZN9__gnu_cxxL16__stl_prime_listE, i32 0, i32 0), %bb3 ], [ %18, %bb1.i.i.i.i ] ; <i32*> [#uses=4]
  br label %bb3.i.i.i.i

bb3.i.i.i.i:                                      ; preds = %bb3.outer.i.i.i.i, %bb.i.i.i.i
  %__len.0.i.i.i.i = phi i32 [ %__len.0.ph.i.i.i.i, %bb3.outer.i.i.i.i ], [ %14, %bb.i.i.i.i ] ; <i32> [#uses=3]
  %21 = icmp sgt i32 %__len.0.i.i.i.i, 0          ; <i1> [#uses=1]
  br i1 %21, label %bb.i.i.i.i, label %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i

_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i:  ; preds = %bb3.i.i.i.i
  %22 = icmp eq i32* %__first_addr.0.ph.i.i.i.i, getelementptr ([28 x i32]* @_ZN9__gnu_cxxL16__stl_prime_listE, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %22, label %bb.i.i, label %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i

_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i: ; preds = %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i
  %23 = load i32* %__first_addr.0.ph.i.i.i.i, align 4 ; <i32> [#uses=14]
  %24 = icmp ugt i32 %23, 1073741823              ; <i1> [#uses=1]
  br i1 %24, label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i, %_ZSt11lower_boundIPKmmET_S2_S2_RKT0_.exit.i.i.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc unwind label %lpad14.i.i.i.thread

.noexc:                                           ; preds = %bb.i.i
  unreachable

bb1.i.i:                                          ; preds = %_ZNK9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE12_M_next_sizeEj.exit.i
  %25 = icmp eq i32 %23, 0                        ; <i1> [#uses=1]
  br i1 %25, label %bb5.preheader, label %bb3.i.i1

bb3.i.i1:                                         ; preds = %bb1.i.i
  %26 = shl i32 %23, 2                            ; <i32> [#uses=1]
  %27 = invoke i8* @_Znwj(i32 %26)
          to label %.noexc3 unwind label %lpad14.i.i.i.thread ; <i8*> [#uses=7]

.noexc3:                                          ; preds = %bb3.i.i1
  %28 = bitcast i8* %27 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=5]
  %29 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %30 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %29, null ; <i1> [#uses=1]
  br i1 %30, label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit.i, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %.noexc3
  %31 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %29 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %31) nounwind
  br label %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit.i

_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit.i: ; preds = %bb.i.i.i2, %.noexc3
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4
  %32 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, i32 %23 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %32, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %12, align 4
  %33 = icmp eq i32 %23, 0                        ; <i1> [#uses=1]
  br i1 %33, label %bb5.preheader, label %bb.i1.i

bb.i1.i:                                          ; preds = %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit.i
  %phitmp38 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %32 to i32 ; <i32> [#uses=1]
  %34 = ptrtoint i8* %27 to i32                   ; <i32> [#uses=3]
  %35 = sub i32 %phitmp38, %34                    ; <i32> [#uses=1]
  %36 = ashr i32 %35, 2                           ; <i32> [#uses=1]
  %37 = icmp ult i32 %36, %23                     ; <i1> [#uses=1]
  br i1 %37, label %bb16.i.i, label %bb5.i.i

bb5.i.i:                                          ; preds = %bb.i1.i
  %38 = icmp eq i32 %23, 0                        ; <i1> [#uses=1]
  br i1 %38, label %_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i.i, label %bb.i.i.i.i.i9.i.i

bb.i.i.i.i.i9.i.i:                                ; preds = %bb.i.i.i.i.i9.i.i, %bb5.i.i
  %indvar.i.i.i.i.i5.i.i = phi i32 [ %indvar.next.i.i.i.i.i7.i.i, %bb.i.i.i.i.i9.i.i ], [ 0, %bb5.i.i ] ; <i32> [#uses=2]
  %__first_addr.02.i.i.i.i.i6.i.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %28, i32 %indvar.i.i.i.i.i5.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first_addr.02.i.i.i.i.i6.i.i, align 4
  %indvar.next.i.i.i.i.i7.i.i = add i32 %indvar.i.i.i.i.i5.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i.i = icmp eq i32 %indvar.next.i.i.i.i.i7.i.i, %23 ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %bb15.loopexit.i.i, label %bb.i.i.i.i.i9.i.i

bb15.loopexit.i.i:                                ; preds = %bb.i.i.i.i.i9.i.i
  %.pre.i.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i.i

_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i.i: ; preds = %bb15.loopexit.i.i, %bb5.i.i
  %39 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i, %bb15.loopexit.i.i ], [ %28, %bb5.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %40 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %39, i32 %23 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %40, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4
  br label %bb5.preheader

bb16.i.i:                                         ; preds = %bb.i1.i
  %41 = ptrtoint i8* %27 to i32                   ; <i32> [#uses=1]
  %42 = sub i32 %34, %41                          ; <i32> [#uses=2]
  %43 = ashr i32 %42, 2                           ; <i32> [#uses=7]
  %44 = sub i32 1073741823, %43                   ; <i32> [#uses=1]
  %45 = icmp ult i32 %44, %23                     ; <i1> [#uses=1]
  br i1 %45, label %bb17.i.i, label %bb18.i.i

bb17.i.i:                                         ; preds = %bb16.i.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc4 unwind label %lpad14.i.i.i

.noexc4:                                          ; preds = %bb17.i.i
  unreachable

bb18.i.i:                                         ; preds = %bb16.i.i
  %46 = icmp ult i32 %43, %23                     ; <i1> [#uses=1]
  %47 = select i1 %46, i32 %23, i32 %43           ; <i32> [#uses=1]
  %48 = add i32 %47, %43                          ; <i32> [#uses=3]
  %49 = icmp ult i32 %48, %43                     ; <i1> [#uses=1]
  br i1 %49, label %invcont21.i.i, label %bb20.i.i

bb20.i.i:                                         ; preds = %bb18.i.i
  %50 = icmp ugt i32 %48, 1073741823              ; <i1> [#uses=1]
  br i1 %50, label %bb.i.i.i3.i, label %invcont21.i.i

bb.i.i.i3.i:                                      ; preds = %bb20.i.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc5 unwind label %lpad14.i.i.i

.noexc5:                                          ; preds = %bb.i.i.i3.i
  unreachable

invcont21.i.i:                                    ; preds = %bb20.i.i, %bb18.i.i
  %__len.0.reg2mem.0.i.i = phi i32 [ 1073741823, %bb18.i.i ], [ %48, %bb20.i.i ] ; <i32> [#uses=2]
  %51 = shl i32 %__len.0.reg2mem.0.i.i, 2         ; <i32> [#uses=1]
  %52 = invoke i8* @_Znwj(i32 %51)
          to label %.noexc6 unwind label %lpad14.i.i.i ; <i8*> [#uses=3]

.noexc6:                                          ; preds = %invcont21.i.i
  %53 = bitcast i8* %52 to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=4]
  call void @llvm.memmove.i32(i8* %52, i8* %27, i32 %42, i32 4) nounwind
  br label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i.i.i.i, %.noexc6
  %indvar.i.i.i.i.i.i.i = phi i32 [ 0, %.noexc6 ], [ %indvar.next.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp2630.i.i = add i32 %indvar.i.i.i.i.i.i.i, %43 ; <i32> [#uses=1]
  %tmp28.i.i = shl i32 %tmp2630.i.i, 2            ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr i8* %52, i32 %tmp28.i.i ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i = bitcast i8* %scevgep.i.i to %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %__first_addr.02.i.i.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i.i.i = add i32 %indvar.i.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond25.i.i = icmp eq i32 %indvar.next.i.i.i.i.i.i.i, %23 ; <i1> [#uses=1]
  br i1 %exitcond25.i.i, label %bb52.i.i, label %bb.i.i.i.i.i.i.i

bb52.i.i:                                         ; preds = %bb.i.i.i.i.i.i.i
  %.sum.i.i = add i32 %43, %23                    ; <i32> [#uses=2]
  %54 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %53, i32 %.sum.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %55 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %56 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %55 to i32 ; <i32> [#uses=1]
  %57 = sub i32 %56, %34                          ; <i32> [#uses=2]
  %58 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %54 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %58, i8* %27, i32 %57, i32 4) nounwind
  %59 = ashr i32 %57, 2                           ; <i32> [#uses=1]
  %.sum17.i.i = add i32 %59, %.sum.i.i            ; <i32> [#uses=1]
  %60 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %53, i32 %.sum17.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %61 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %62 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %61, null ; <i1> [#uses=1]
  br i1 %62, label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5.i, label %bb.i.i4.i

bb.i.i4.i:                                        ; preds = %bb52.i.i
  %63 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %61 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %63) nounwind
  br label %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5.i

_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5.i: ; preds = %bb.i.i4.i, %bb52.i.i
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %53, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %60, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4
  %64 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %53, i32 %__len.0.reg2mem.0.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %64, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %12, align 4
  br label %bb5.preheader

bb5.preheader:                                    ; preds = %_ZNSt12_Vector_baseIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE13_M_deallocateEPS8_j.exit.i5.i, %_ZSt4fillIPPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEES8_EvT_SA_RKT0_.exit.i.i, %_ZNSt6vectorIPN9__gnu_cxx15_Hashtable_nodeISt4pairIKPKciEEESaIS8_EE7reserveEj.exit.i, %bb1.i.i
  store i32 0, i32* %13, align 8
  %65 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0 ; <i8*> [#uses=4]
  %66 = getelementptr inbounds %"struct.std::ios_base::_Words"* %1, i32 0, i32 0 ; <i8**> [#uses=1]
  %67 = getelementptr inbounds %"struct.std::ios_base::_Words"* %1, i32 0, i32 1 ; <i32*> [#uses=1]
  br label %bb5

lpad14.i.i.i.thread:                              ; preds = %bb3.i.i1, %bb.i.i
  %eh_ptr15.i.i.i54 = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select17.i.i.i56 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i.i54, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i.i

lpad14.i.i.i:                                     ; preds = %invcont21.i.i, %bb.i.i.i3.i, %bb17.i.i
  %eh_ptr15.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=3]
  %eh_select17.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %68 = icmp eq i8* %27, null                     ; <i1> [#uses=1]
  br i1 %68, label %ppad.i.i.i, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %lpad14.i.i.i
  call void @_ZdlPv(i8* %27) nounwind
  br label %ppad.i.i.i

ppad.i.i.i:                                       ; preds = %bb.i.i.i.i.i.i, %lpad14.i.i.i, %lpad14.i.i.i.thread
  %eh_ptr15.i.i.i.reg2mem.0 = phi i8* [ %eh_ptr15.i.i.i54, %lpad14.i.i.i.thread ], [ %eh_ptr15.i.i.i, %lpad14.i.i.i ], [ %eh_ptr15.i.i.i, %bb.i.i.i.i.i.i ] ; <i8*> [#uses=1]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr15.i.i.i.reg2mem.0)
          to label %.noexc.i unwind label %lpad.i

.noexc.i:                                         ; preds = %ppad.i.i.i
  unreachable

lpad.i:                                           ; preds = %ppad.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select3.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
  unreachable

bb4:                                              ; preds = %bb5
  %69 = call i32 (i8*, i8*, ...)* @sprintf(i8* noalias %65, i8* noalias getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 %indvar23) nounwind ; <i32> [#uses=0]
  %70 = call noalias i8* @strdup(i8* %65) nounwind ; <i8*> [#uses=1]
  store i8* %70, i8** %66, align 8
  store i32 0, i32* %67, align 4
  %71 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %7, %"struct.std::ios_base::_Words"* %1)
          to label %invcont unwind label %lpad    ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont:                                          ; preds = %bb4
  %72 = getelementptr inbounds %"struct.std::ios_base::_Words"* %71, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %indvar23, i32* %72, align 4
  %phitmp = add i32 %indvar23, 1                  ; <i32> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %invcont, %bb5.preheader
  %indvar23 = phi i32 [ 1, %bb5.preheader ], [ %phitmp, %invcont ] ; <i32> [#uses=4]
  %73 = icmp sgt i32 %indvar23, %iftmp.99.0       ; <i1> [#uses=1]
  br i1 %73, label %bb11.loopexit, label %bb4

bb7:                                              ; preds = %bb11
  %74 = call i32 (i8*, i8*, ...)* @sprintf(i8* noalias %65, i8* noalias getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 %i.0) nounwind ; <i32> [#uses=0]
  %75 = call noalias i8* @strdup(i8* %65) nounwind ; <i8*> [#uses=1]
  store i8* %75, i8** %80, align 8
  store i32 0, i32* %81, align 4
  %76 = invoke fastcc %"struct.std::ios_base::_Words"* @_ZN9__gnu_cxx9hashtableISt4pairIKPKciES3_NS_4hashIS3_EESt10_Select1stIS5_E5eqstrSaIiEE14find_or_insertERKS5_(%"struct.__gnu_cxx::hashtable<std::pair<const char* const, int>,const char*,__gnu_cxx::hash<const char*>,std::_Select1st<std::pair<const char* const, int> >,eqstr,std::allocator<int> >"* %7, %"struct.std::ios_base::_Words"* %2)
          to label %invcont8 unwind label %lpad   ; <%"struct.std::ios_base::_Words"*> [#uses=1]

invcont8:                                         ; preds = %bb7
  %77 = getelementptr inbounds %"struct.std::ios_base::_Words"* %76, i32 0, i32 1 ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=1]
  %not. = icmp ne i32 %78, 0                      ; <i1> [#uses=1]
  %79 = zext i1 %not. to i32                      ; <i32> [#uses=1]
  %c.1. = add i32 %79, %c.1                       ; <i32> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb11

bb11.loopexit:                                    ; preds = %bb5
  %80 = getelementptr inbounds %"struct.std::ios_base::_Words"* %2, i32 0, i32 0 ; <i8**> [#uses=1]
  %81 = getelementptr inbounds %"struct.std::ios_base::_Words"* %2, i32 0, i32 1 ; <i32*> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb11.loopexit, %invcont8
  %indvar = phi i32 [ 0, %bb11.loopexit ], [ %indvar.next, %invcont8 ] ; <i32> [#uses=2]
  %c.1 = phi i32 [ %c.1., %invcont8 ], [ 0, %bb11.loopexit ] ; <i32> [#uses=2]
  %i.0 = sub i32 %iftmp.99.0, %indvar             ; <i32> [#uses=2]
  %82 = icmp sgt i32 %i.0, 0                      ; <i1> [#uses=1]
  br i1 %82, label %bb7, label %bb12

bb12:                                             ; preds = %bb11
  %83 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %83, align 8
  %84 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %84, align 4
  %85 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %86 = getelementptr inbounds i32 (...)** %85, i32 -3 ; <i32 (...)**> [#uses=1]
  %87 = bitcast i32 (...)** %86 to i32*           ; <i32*> [#uses=1]
  %88 = load i32* %87, align 4                    ; <i32> [#uses=1]
  %89 = add i32 %88, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %90 = inttoptr i32 %89 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %91 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %90, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %92 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %91, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %93 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %92, null ; <i1> [#uses=1]
  br i1 %93, label %bb9.i.i.i, label %bb.i.i.i16

bb.i.i.i16:                                       ; preds = %bb12
  %94 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %90, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4                    ; <i32> [#uses=1]
  %96 = icmp eq i32 %95, 0                        ; <i1> [#uses=1]
  br i1 %96, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i16
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %92)
          to label %.noexc23 unwind label %lpad

.noexc23:                                         ; preds = %bb8.i.i.i
  %.pre.i.i.i17 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %.noexc23, %bb.i.i.i16, %bb12
  %97 = phi i32 (...)** [ %.pre.i.i.i17, %.noexc23 ], [ %85, %bb12 ], [ %85, %bb.i.i.i16 ] ; <i32 (...)**> [#uses=1]
  %98 = getelementptr inbounds i32 (...)** %97, i32 -3 ; <i32 (...)**> [#uses=1]
  %99 = bitcast i32 (...)** %98 to i32*           ; <i32*> [#uses=1]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = add i32 %100, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %102 = inttoptr i32 %101 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %103 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %102, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %104 = load i32* %103, align 4                  ; <i32> [#uses=2]
  %105 = icmp eq i32 %104, 0                      ; <i1> [#uses=1]
  br i1 %105, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %83, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %106 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %102, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %107 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %106, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %108 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %107, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %108, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %104 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %103
  %109 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %102, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %110 = load i32* %109, align 4                  ; <i32> [#uses=1]
  %111 = and i32 %storemerge.i.i.i.i, %110        ; <i32> [#uses=1]
  %112 = icmp eq i32 %111, 0                      ; <i1> [#uses=1]
  br i1 %112, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc24 unwind label %lpad

.noexc24:                                         ; preds = %bb4.i.i.i.i.i
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %83, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb17.i, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %113 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %114 = getelementptr inbounds i32 (...)** %113, i32 -3 ; <i32 (...)**> [#uses=1]
  %115 = bitcast i32 (...)** %114 to i32*         ; <i32*> [#uses=1]
  %116 = load i32* %115, align 4                  ; <i32> [#uses=1]
  %117 = add i32 %116, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %118 = inttoptr i32 %117 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %119 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %118, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %120 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %119, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %121 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %120, null ; <i1> [#uses=1]
  br i1 %121, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %122 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %118, i32 0, i32 3 ; <i8*> [#uses=2]
  %123 = load i8* %122, align 1                   ; <i8> [#uses=1]
  %toBool.i.i18 = icmp eq i8 %123, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i18, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %118, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %124 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %125 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %118, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %124, i8* %125, align 4
  store i8 1, i8* %122, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %126 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %113, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %127 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %118, i32 0, i32 2 ; <i8*> [#uses=1]
  %128 = load i8* %127, align 4                   ; <i8> [#uses=1]
  %129 = getelementptr inbounds i32 (...)** %126, i32 -3 ; <i32 (...)**> [#uses=1]
  %130 = bitcast i32 (...)** %129 to i32*         ; <i32*> [#uses=1]
  %131 = load i32* %130, align 4                  ; <i32> [#uses=1]
  %132 = add i32 %131, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %133 = inttoptr i32 %132 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %134 = inttoptr i32 %132 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %135 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %134, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %136 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %135, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %136 to i32 ; <i32> [#uses=1]
  %137 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %136, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %138 = zext i32 %tmp.i to i64                   ; <i64> [#uses=1]
  %139 = zext i1 %137 to i64                      ; <i64> [#uses=1]
  %140 = shl i64 %139, 32                         ; <i64> [#uses=1]
  %141 = or i64 %140, %138                        ; <i64> [#uses=1]
  store i64 %141, i64* %tmp9.i, align 8
  %142 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %120, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %143 = load i32 (...)*** %142, align 4          ; <i32 (...)**> [#uses=1]
  %144 = getelementptr inbounds i32 (...)** %143, i32 3 ; <i32 (...)**> [#uses=1]
  %145 = load i32 (...)** %144, align 4           ; <i32 (...)*> [#uses=1]
  %146 = bitcast i32 (...)* %145 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %146(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %120, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %133, i8 signext %128, i32 %c.1)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %147 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %148 = load i8* %147, align 4                   ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %148, 0                 ; <i1> [#uses=1]
  br i1 %toBool4.i, label %bb17.i, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %bb17.i unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %149 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %150 = getelementptr inbounds i32 (...)** %149, i32 -3 ; <i32 (...)**> [#uses=1]
  %151 = bitcast i32 (...)** %150 to i32*         ; <i32*> [#uses=1]
  %152 = load i32* %151, align 4                  ; <i32> [#uses=1]
  %153 = add i32 %152, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %154 = inttoptr i32 %153 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %155 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %154, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %156 = load i32* %155, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %156, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %155
  %157 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %154, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %158 = load i32* %157, align 4                  ; <i32> [#uses=1]
  %159 = and i32 %storemerge.i.i, %158            ; <i32> [#uses=1]
  %160 = icmp eq i32 %159, 0                      ; <i1> [#uses=1]
  br i1 %160, label %bb17.i, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb15.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i20

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

bb17.i:                                           ; preds = %bb15.i, %bb12.i, %invcont3.i, %invcont.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont13 unwind label %lpad

invcont21.i:                                      ; preds = %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
          to label %.noexc26 unwind label %lpad

.noexc26:                                         ; preds = %invcont21.i
  unreachable

lpad.i20:                                         ; preds = %bb4.i.i.i
  %eh_ptr.i19 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i19, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %161 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %162 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %163 = getelementptr inbounds i32 (...)** %162, i32 -3 ; <i32 (...)**> [#uses=1]
  %164 = bitcast i32 (...)** %163 to i32*         ; <i32*> [#uses=1]
  %165 = load i32* %164, align 4                  ; <i32> [#uses=1]
  %166 = add i32 %165, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %167 = inttoptr i32 %166 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %168 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %167, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %169 = load i32* %168, align 4                  ; <i32> [#uses=1]
  %170 = or i32 %169, 1                           ; <i32> [#uses=1]
  store i32 %170, i32* %168, align 4
  %171 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %167, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %172 = load i32* %171, align 4                  ; <i32> [#uses=1]
  %173 = and i32 %172, 1                          ; <i32> [#uses=1]
  %174 = icmp eq i32 %173, 0                      ; <i1> [#uses=1]
  br i1 %174, label %bb12.i, label %bb.i.i21

bb.i.i21:                                         ; preds = %lpad26.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i22 unwind label %lpad34.i

.noexc.i22:                                       ; preds = %bb.i.i21
  unreachable

lpad30.i:                                         ; preds = %bb12.i
  %eh_ptr31.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select33.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad34.i:                                         ; preds = %bb.i.i21
  %eh_ptr35.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select37.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr35.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad.i unwind label %lpad38.i

lpad38.i:                                         ; preds = %lpad34.i
  %eh_ptr39.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select41.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr39.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad42.i:                                         ; preds = %ppad.i
  %eh_ptr43.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select45.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr43.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i:                                           ; preds = %lpad34.i, %lpad30.i, %lpad.i20
  %eh_exception.0.i = phi i8* [ %eh_ptr.i19, %lpad.i20 ], [ %eh_ptr31.i, %lpad30.i ], [ %eh_ptr35.i, %lpad34.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont21.i unwind label %lpad42.i

invcont13:                                        ; preds = %bb17.i
  %175 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %176 = getelementptr inbounds i32 (...)** %175, i32 -3 ; <i32 (...)**> [#uses=1]
  %177 = bitcast i32 (...)** %176 to i32*         ; <i32*> [#uses=1]
  %178 = load i32* %177, align 4                  ; <i32> [#uses=1]
  %179 = add i32 %178, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %180 = inttoptr i32 %179 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx27 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %180, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx27.val = load %"struct.std::ctype<char>"** %.idx27 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %181 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx27.val, i8 signext 10)
          to label %.noexc10 unwind label %lpad   ; <i8> [#uses=3]

.noexc10:                                         ; preds = %invcont13
  %182 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %182, align 8
  %183 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %183, align 4
  %184 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %185 = getelementptr inbounds i32 (...)** %184, i32 -3 ; <i32 (...)**> [#uses=1]
  %186 = bitcast i32 (...)** %185 to i32*         ; <i32*> [#uses=1]
  %187 = load i32* %186, align 4                  ; <i32> [#uses=1]
  %188 = add i32 %187, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %189 = inttoptr i32 %188 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %190 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %189, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %191 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %190, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %192 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %191, null ; <i1> [#uses=1]
  br i1 %192, label %bb9.i.i.i.i, label %bb.i.i.i.i7

bb.i.i.i.i7:                                      ; preds = %.noexc10
  %193 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %189, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %194 = load i32* %193, align 4                  ; <i32> [#uses=1]
  %195 = icmp eq i32 %194, 0                      ; <i1> [#uses=1]
  br i1 %195, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i7
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %191)
          to label %.noexc11 unwind label %lpad

.noexc11:                                         ; preds = %bb8.i.i.i.i
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %.noexc11, %bb.i.i.i.i7, %.noexc10
  %196 = phi i32 (...)** [ %.pre.i.i.i.i, %.noexc11 ], [ %184, %.noexc10 ], [ %184, %bb.i.i.i.i7 ] ; <i32 (...)**> [#uses=1]
  %197 = getelementptr inbounds i32 (...)** %196, i32 -3 ; <i32 (...)**> [#uses=1]
  %198 = bitcast i32 (...)** %197 to i32*         ; <i32*> [#uses=1]
  %199 = load i32* %198, align 4                  ; <i32> [#uses=1]
  %200 = add i32 %199, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %201 = inttoptr i32 %200 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %202 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %201, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %203 = load i32* %202, align 4                  ; <i32> [#uses=2]
  %204 = icmp eq i32 %203, 0                      ; <i1> [#uses=1]
  br i1 %204, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %182, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %205 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %201, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %206 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %205, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %207 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %206, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %207, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %203 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %202
  %208 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %201, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %209 = load i32* %208, align 4                  ; <i32> [#uses=1]
  %210 = and i32 %storemerge.i.i.i.i.i, %209      ; <i32> [#uses=1]
  %211 = icmp eq i32 %210, 0                      ; <i1> [#uses=1]
  br i1 %211, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc12 unwind label %lpad

.noexc12:                                         ; preds = %bb4.i.i.i.i.i.i
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr29 = load i8* %182, align 8                 ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %.pr29, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %_ZNSo3putEc.exit.i, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %212 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %213 = getelementptr inbounds i32 (...)** %212, i32 -3 ; <i32 (...)**> [#uses=1]
  %214 = bitcast i32 (...)** %213 to i32*         ; <i32*> [#uses=1]
  %215 = load i32* %214, align 4                  ; <i32> [#uses=1]
  %216 = add i32 %215, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %217 = inttoptr i32 %216 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %218 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %217, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %219 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %218, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %220 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %219, i32 0, i32 5 ; <i8**> [#uses=3]
  %221 = load i8** %220, align 4                  ; <i8*> [#uses=2]
  %222 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %219, i32 0, i32 6 ; <i8**> [#uses=1]
  %223 = load i8** %222, align 4                  ; <i8*> [#uses=1]
  %224 = icmp ult i8* %221, %223                  ; <i1> [#uses=1]
  br i1 %224, label %bb.i2.i.i, label %bb1.i.i.i8

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %181, i8* %221, align 1
  %225 = load i8** %220, align 4                  ; <i8*> [#uses=1]
  %226 = getelementptr inbounds i8* %225, i32 1   ; <i8*> [#uses=1]
  store i8* %226, i8** %220, align 4
  %227 = zext i8 %181 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i8:                                       ; preds = %invcont1.i.i
  %228 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %219, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %229 = load i32 (...)*** %228, align 4          ; <i32 (...)**> [#uses=1]
  %230 = getelementptr inbounds i32 (...)** %229, i32 13 ; <i32 (...)**> [#uses=1]
  %231 = load i32 (...)** %230, align 4           ; <i32 (...)*> [#uses=1]
  %232 = zext i8 %181 to i32                      ; <i32> [#uses=1]
  %233 = bitcast i32 (...)* %231 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %234 = invoke i32 %233(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %219, i32 %232)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i8, %bb.i2.i.i
  %235 = phi i32 [ %227, %bb.i2.i.i ], [ %234, %bb1.i.i.i8 ] ; <i32> [#uses=1]
  %236 = icmp eq i32 %235, -1                     ; <i1> [#uses=1]
  br i1 %236, label %bb14.i.i, label %_ZNSo3putEc.exit.i

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit.i unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %237 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %238 = getelementptr inbounds i32 (...)** %237, i32 -3 ; <i32 (...)**> [#uses=1]
  %239 = bitcast i32 (...)** %238 to i32*         ; <i32*> [#uses=1]
  %240 = load i32* %239, align 4                  ; <i32> [#uses=1]
  %241 = add i32 %240, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %242 = inttoptr i32 %241 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %243 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %242, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %244 = load i32* %243, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %244, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %243
  %245 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %242, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %246 = load i32* %245, align 4                  ; <i32> [#uses=1]
  %247 = and i32 %storemerge.i.i.i, %246          ; <i32> [#uses=1]
  %248 = icmp eq i32 %247, 0                      ; <i1> [#uses=1]
  br i1 %248, label %_ZNSo3putEc.exit.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc13 unwind label %lpad

.noexc13:                                         ; preds = %invcont20.i.i
  unreachable

lpad.i.i:                                         ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i8
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %249 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %250 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %251 = getelementptr inbounds i32 (...)** %250, i32 -3 ; <i32 (...)**> [#uses=1]
  %252 = bitcast i32 (...)** %251 to i32*         ; <i32*> [#uses=1]
  %253 = load i32* %252, align 4                  ; <i32> [#uses=1]
  %254 = add i32 %253, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %255 = inttoptr i32 %254 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %256 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %255, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %257 = load i32* %256, align 4                  ; <i32> [#uses=1]
  %258 = or i32 %257, 1                           ; <i32> [#uses=1]
  store i32 %258, i32* %256, align 4
  %259 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %255, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %260 = load i32* %259, align 4                  ; <i32> [#uses=1]
  %261 = and i32 %260, 1                          ; <i32> [#uses=1]
  %262 = icmp eq i32 %261, 0                      ; <i1> [#uses=1]
  br i1 %262, label %bb11.i.i, label %bb.i.i.i9

bb.i.i.i9:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i unwind label %lpad33.i.i

.noexc.i.i:                                       ; preds = %bb.i.i.i9
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i9
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
          to label %.noexc14 unwind label %lpad

.noexc14:                                         ; preds = %_ZNSo3putEc.exit.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
          to label %bb18 unwind label %lpad

invcont16:                                        ; preds = %bb.i.i.i.i.i, %bb3.i.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable

bb18:                                             ; preds = %.noexc14
  %263 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %264 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %263 to i32 ; <i32> [#uses=1]
  %265 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %266 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %265 to i32 ; <i32> [#uses=1]
  %267 = sub i32 %264, %266                       ; <i32> [#uses=1]
  %268 = icmp ult i32 %267, 4                     ; <i1> [#uses=1]
  br i1 %268, label %bb3.i.i12, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb3.i.i.i11, %bb18
  %269 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %278, %bb3.i.i.i11 ], [ %265, %bb18 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__i.02.i.i.i1 = phi i32 [ %tmp.i.i.i2, %bb3.i.i.i11 ], [ 0, %bb18 ] ; <i32> [#uses=3]
  %tmp.i.i.i2 = add i32 %__i.02.i.i.i1, 1         ; <i32> [#uses=2]
  %scevgep.i.i.i3 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %269, i32 %__i.02.i.i.i1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %270 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i.i3, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %271 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %270, null ; <i1> [#uses=1]
  br i1 %271, label %bb3.i.i.i11, label %bb1.i.i.i7

bb1.i.i.i7:                                       ; preds = %bb1.i.i.i7, %bb.i.i.i4
  %__cur.01.i.i.i5 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %273, %bb1.i.i.i7 ], [ %270, %bb.i.i.i4 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %272 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i5, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %273 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %272, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %274 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i5 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %274) nounwind
  %phitmp.i.i.i6 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %273, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i6, label %bb2.bb3_crit_edge.i.i.i9, label %bb1.i.i.i7

bb2.bb3_crit_edge.i.i.i9:                         ; preds = %bb1.i.i.i7
  %.pre.i.i.i8 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %bb3.i.i.i11

bb3.i.i.i11:                                      ; preds = %bb2.bb3_crit_edge.i.i.i9, %bb.i.i.i4
  %275 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i.i8, %bb2.bb3_crit_edge.i.i.i9 ], [ %269, %bb.i.i.i4 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %scevgep4.i.i.i10 = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %275, i32 %__i.02.i.i.i1 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep4.i.i.i10, align 4
  %276 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %277 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %276 to i32 ; <i32> [#uses=1]
  %278 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %279 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %278 to i32 ; <i32> [#uses=1]
  %280 = sub i32 %277, %279                       ; <i32> [#uses=1]
  %281 = ashr i32 %280, 2                         ; <i32> [#uses=1]
  %282 = icmp ugt i32 %281, %tmp.i.i.i2           ; <i1> [#uses=1]
  br i1 %282, label %bb.i.i.i4, label %bb3.i.i12

bb3.i.i12:                                        ; preds = %bb3.i.i.i11, %bb18
  %283 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %265, %bb18 ], [ %278, %bb3.i.i.i11 ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store i32 0, i32* %13, align 8
  %284 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %283, null ; <i1> [#uses=1]
  br i1 %284, label %_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEED1Ev.exit15, label %bb.i.i.i.i.i13

bb.i.i.i.i.i13:                                   ; preds = %bb3.i.i12
  %285 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %283 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %285) nounwind
  ret i32 0

_ZN9__gnu_cxx8hash_mapIPKciNS_4hashIS2_EE5eqstrSaIiEED1Ev.exit15: ; preds = %bb3.i.i12
  ret i32 0

lpad:                                             ; preds = %.noexc14, %_ZNSo3putEc.exit.i, %invcont20.i.i, %bb4.i.i.i.i.i.i, %bb8.i.i.i.i, %invcont13, %invcont21.i, %bb17.i, %bb4.i.i.i.i.i, %bb8.i.i.i, %bb7, %bb4
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select21 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %286 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %287 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %286 to i32 ; <i32> [#uses=1]
  %288 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %289 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %288 to i32 ; <i32> [#uses=1]
  %290 = sub i32 %287, %289                       ; <i32> [#uses=1]
  %291 = icmp ult i32 %290, 4                     ; <i1> [#uses=1]
  br i1 %291, label %bb3.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb3.i.i.i, %lpad
  %292 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %301, %bb3.i.i.i ], [ %288, %lpad ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  %__i.02.i.i.i = phi i32 [ %tmp.i.i.i, %bb3.i.i.i ], [ 0, %lpad ] ; <i32> [#uses=3]
  %tmp.i.i.i = add i32 %__i.02.i.i.i, 1           ; <i32> [#uses=2]
  %scevgep.i.i.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %292, i32 %__i.02.i.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %293 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep.i.i.i, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %294 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %293, null ; <i1> [#uses=1]
  br i1 %294, label %bb3.i.i.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb1.i.i.i, %bb.i.i.i
  %__cur.01.i.i.i = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* [ %296, %bb1.i.i.i ], [ %293, %bb.i.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %295 = getelementptr inbounds %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i, i32 0, i32 0 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %296 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %295, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*> [#uses=2]
  %297 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %__cur.01.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %297) nounwind
  %phitmp.i.i.i = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* %296, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i, label %bb2.bb3_crit_edge.i.i.i, label %bb1.i.i.i

bb2.bb3_crit_edge.i.i.i:                          ; preds = %bb1.i.i.i
  %.pre.i.i.i = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  br label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb2.bb3_crit_edge.i.i.i, %bb.i.i.i
  %298 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %.pre.i.i.i, %bb2.bb3_crit_edge.i.i.i ], [ %292, %bb.i.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %scevgep4.i.i.i = getelementptr %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %298, i32 %__i.02.i.i.i ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  store %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"* null, %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %scevgep4.i.i.i, align 4
  %299 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %11, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=1]
  %300 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %299 to i32 ; <i32> [#uses=1]
  %301 = load %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"*** %10, align 4 ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=3]
  %302 = ptrtoint %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %301 to i32 ; <i32> [#uses=1]
  %303 = sub i32 %300, %302                       ; <i32> [#uses=1]
  %304 = ashr i32 %303, 2                         ; <i32> [#uses=1]
  %305 = icmp ugt i32 %304, %tmp.i.i.i            ; <i1> [#uses=1]
  br i1 %305, label %bb.i.i.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb3.i.i.i, %lpad
  %306 = phi %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** [ %288, %lpad ], [ %301, %bb3.i.i.i ] ; <%"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"**> [#uses=2]
  store i32 0, i32* %13, align 8
  %307 = icmp eq %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %306, null ; <i1> [#uses=1]
  br i1 %307, label %invcont16, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb3.i.i
  %308 = bitcast %"struct.__gnu_cxx::_Hashtable_node<std::pair<const char* const, int> >"** %306 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %308) nounwind
  br label %invcont16
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
