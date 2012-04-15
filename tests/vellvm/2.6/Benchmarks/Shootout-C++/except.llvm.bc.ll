; ModuleID = 'except.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::Init" = type <{ i8 }>
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }

@_ZStL8__ioinit = internal global %"struct.std::ios_base::Init" zeroinitializer ; <%"struct.std::ios_base::Init"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZTI12Lo_exception = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([15 x i8]* @_ZTS12Lo_exception, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS12Lo_exception = internal constant [15 x i8] c"12Lo_exception\00" ; <[15 x i8]*> [#uses=1]
@_ZTI12Hi_exception = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([15 x i8]* @_ZTS12Hi_exception, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTS12Hi_exception = internal constant [15 x i8] c"12Hi_exception\00" ; <[15 x i8]*> [#uses=1]
@_ZSt4cerr = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=1]
@.str1 = private constant [23 x i8] c"We shouldn't get here\0A\00", align 1 ; <[23 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=8]
@.str2 = private constant [16 x i8] c"Exceptions: HI=\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str3 = private constant [4 x i8] c" / \00", align 1 ; <[4 x i8]*> [#uses=1]
@.str4 = private constant [4 x i8] c"LO=\00", align 1 ; <[4 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_HI }] ; <[1 x %0]*> [#uses=0]

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

define internal void @_GLOBAL__I_HI() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.std::ios_base::Init"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.std::ios_base::Init"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.std::ios_base::Init"*)

declare void @_ZSt19__throw_ios_failurePKc(i8*) noreturn

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

define internal fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 %__n) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  %1 = load i32 (...)*** %0, align 4              ; <i32 (...)**> [#uses=1]
  %2 = getelementptr inbounds i32 (...)** %1, i32 -3 ; <i32 (...)**> [#uses=1]
  %3 = bitcast i32 (...)** %2 to i32*             ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out to i32 ; <i32> [#uses=3]
  %6 = add i32 %4, %5                             ; <i32> [#uses=1]
  %7 = inttoptr i32 %6 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=4]
  %8 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 3 ; <i8*> [#uses=2]
  %9 = load i8* %8, align 1                       ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %9, 0                    ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb.i, label %_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit

bb.i:                                             ; preds = %entry
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %10 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32) ; <i8> [#uses=1]
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %10, i8* %11, align 4
  store i8 1, i8* %8, align 1
  br label %_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit

_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv.exit: ; preds = %bb.i, %entry
  %12 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 2 ; <i8*> [#uses=1]
  %13 = load i8* %12, align 4                     ; <i8> [#uses=2]
  %14 = zext i8 %13 to i32                        ; <i32> [#uses=2]
  br label %bb3

bb:                                               ; preds = %bb3
  %15 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %16 = getelementptr inbounds i32 (...)** %15, i32 -3 ; <i32 (...)**> [#uses=1]
  %17 = bitcast i32 (...)** %16 to i32*           ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = add i32 %18, %5                           ; <i32> [#uses=1]
  %20 = inttoptr i32 %19 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %22 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %21, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %23 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %22, i32 0, i32 5 ; <i8**> [#uses=3]
  %24 = load i8** %23, align 4                    ; <i8*> [#uses=2]
  %25 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %22, i32 0, i32 6 ; <i8**> [#uses=1]
  %26 = load i8** %25, align 4                    ; <i8*> [#uses=1]
  %27 = icmp ult i8* %24, %26                     ; <i1> [#uses=1]
  br i1 %27, label %bb.i1, label %bb1.i

bb.i1:                                            ; preds = %bb
  store i8 %13, i8* %24, align 1
  %28 = load i8** %23, align 4                    ; <i8*> [#uses=1]
  %29 = getelementptr inbounds i8* %28, i32 1     ; <i8*> [#uses=1]
  store i8* %29, i8** %23, align 4
  br label %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit

bb1.i:                                            ; preds = %bb
  %30 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %22, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %31 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %32 = getelementptr inbounds i32 (...)** %31, i32 13 ; <i32 (...)**> [#uses=1]
  %33 = load i32 (...)** %32, align 4             ; <i32 (...)*> [#uses=1]
  %34 = bitcast i32 (...)* %33 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %35 = tail call i32 %34(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %22, i32 %14) ; <i32> [#uses=1]
  br label %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit

_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit: ; preds = %bb1.i, %bb.i1
  %36 = phi i32 [ %35, %bb1.i ], [ %14, %bb.i1 ]  ; <i32> [#uses=1]
  %37 = icmp eq i32 %36, -1                       ; <i1> [#uses=1]
  br i1 %37, label %bb1, label %bb2

bb1:                                              ; preds = %_ZNSt15basic_streambufIcSt11char_traitsIcEE5sputcEc.exit
  %38 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %39 = getelementptr inbounds i32 (...)** %38, i32 -3 ; <i32 (...)**> [#uses=1]
  %40 = bitcast i32 (...)** %39 to i32*           ; <i32*> [#uses=1]
  %41 = load i32* %40, align 4                    ; <i32> [#uses=1]
  %42 = add i32 %41, %5                           ; <i32> [#uses=1]
  %43 = inttoptr i32 %42 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %44 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %43, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %45 = load i32* %44, align 4                    ; <i32> [#uses=1]
  %46 = or i32 %45, 1                             ; <i32> [#uses=2]
  store i32 %46, i32* %44
  %47 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %43, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %48 = load i32* %47, align 4                    ; <i32> [#uses=1]
  %49 = and i32 %46, %48                          ; <i32> [#uses=1]
  %50 = icmp eq i32 %49, 0                        ; <i1> [#uses=1]
  br i1 %50, label %_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit, label %bb4.i.i

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
  %51 = icmp sgt i32 %__n_addr.0, 0               ; <i1> [#uses=1]
  br i1 %51, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

declare void @__cxa_rethrow() noreturn

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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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

declare i8* @__cxa_begin_catch(i8*) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for.i32(i8*) nounwind

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

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

define internal fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i8* %__s, i32 %__n) {
entry:
  %__cerb = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %0, align 8
  %1 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %1, align 4
  %2 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 0, i32 0 ; <i32 (...)***> [#uses=9]
  %3 = load i32 (...)*** %2, align 4              ; <i32 (...)**> [#uses=3]
  %4 = getelementptr inbounds i32 (...)** %3, i32 -3 ; <i32 (...)**> [#uses=1]
  %5 = bitcast i32 (...)** %4 to i32*             ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out to i32 ; <i32> [#uses=9]
  %8 = add i32 %6, %7                             ; <i32> [#uses=1]
  %9 = inttoptr i32 %8 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %10 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %9, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %11 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %10, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %12 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %11, null ; <i1> [#uses=1]
  br i1 %12, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %13 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %9, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = icmp eq i32 %14, 0                        ; <i1> [#uses=1]
  br i1 %15, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %11)
  %.pre.i.i = load i32 (...)*** %2, align 4       ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i.i, %entry
  %16 = phi i32 (...)** [ %.pre.i.i, %bb8.i.i ], [ %3, %entry ], [ %3, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %17 = getelementptr inbounds i32 (...)** %16, i32 -3 ; <i32 (...)**> [#uses=1]
  %18 = bitcast i32 (...)** %17 to i32*           ; <i32*> [#uses=1]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  %20 = add i32 %19, %7                           ; <i32> [#uses=1]
  %21 = inttoptr i32 %20 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %22 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %23 = load i32* %22, align 4                    ; <i32> [#uses=2]
  %24 = icmp eq i32 %23, 0                        ; <i1> [#uses=1]
  br i1 %24, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %0, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %25 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %26 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %25, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %27 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %26, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %27, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %23 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %22
  %28 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %29 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %30 = and i32 %storemerge.i.i.i, %29            ; <i32> [#uses=1]
  %31 = icmp eq i32 %30, 0                        ; <i1> [#uses=1]
  br i1 %31, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %0, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb41, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %32 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %33 = getelementptr inbounds i32 (...)** %32, i32 -3 ; <i32 (...)**> [#uses=1]
  %34 = bitcast i32 (...)** %33 to i32*           ; <i32*> [#uses=1]
  %35 = load i32* %34, align 4                    ; <i32> [#uses=1]
  %36 = add i32 %35, %7                           ; <i32> [#uses=2]
  %37 = inttoptr i32 %36 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %38 = getelementptr inbounds %"struct.std::ios_base"* %37, i32 0, i32 2 ; <i32*> [#uses=1]
  %39 = load i32* %38, align 4                    ; <i32> [#uses=3]
  %40 = icmp sgt i32 %39, %__n                    ; <i1> [#uses=1]
  br i1 %40, label %bb1, label %bb30

bb1:                                              ; preds = %bb
  %41 = getelementptr inbounds %"struct.std::ios_base"* %37, i32 0, i32 3 ; <i32*> [#uses=1]
  %42 = load i32* %41, align 4                    ; <i32> [#uses=1]
  %43 = and i32 %42, 176                          ; <i32> [#uses=1]
  %44 = icmp eq i32 %43, 32                       ; <i1> [#uses=2]
  br i1 %44, label %invcont9, label %bb6

bb6:                                              ; preds = %bb1
  %45 = sub i32 %39, %__n                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 %45)
          to label %invcont9 unwind label %lpad50

invcont9:                                         ; preds = %bb6, %bb1
  %46 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %47 = getelementptr inbounds i32 (...)** %46, i32 -3 ; <i32 (...)**> [#uses=1]
  %48 = bitcast i32 (...)** %47 to i32*           ; <i32*> [#uses=1]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=1]
  %50 = add i32 %49, %7                           ; <i32> [#uses=1]
  %51 = inttoptr i32 %50 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %52 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %51, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %53 = load i32* %52, align 4                    ; <i32> [#uses=1]
  %54 = icmp eq i32 %53, 0                        ; <i1> [#uses=1]
  br i1 %54, label %bb11, label %bb13

bb11:                                             ; preds = %invcont9
  %55 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %51, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %56 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %55, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %57 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %56, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %58 = load i32 (...)*** %57, align 4            ; <i32 (...)**> [#uses=1]
  %59 = getelementptr inbounds i32 (...)** %58, i32 12 ; <i32 (...)**> [#uses=1]
  %60 = load i32 (...)** %59, align 4             ; <i32 (...)*> [#uses=1]
  %61 = bitcast i32 (...)* %60 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %62 = invoke i32 %61(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %56, i8* %__s, i32 %__n)
          to label %.noexc8 unwind label %lpad50  ; <i32> [#uses=1]

.noexc8:                                          ; preds = %bb11
  %63 = icmp eq i32 %62, %__n                     ; <i1> [#uses=1]
  br i1 %63, label %bb13, label %bb.i4

bb.i4:                                            ; preds = %.noexc8
  %64 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %65 = getelementptr inbounds i32 (...)** %64, i32 -3 ; <i32 (...)**> [#uses=1]
  %66 = bitcast i32 (...)** %65 to i32*           ; <i32*> [#uses=1]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=1]
  %68 = add i32 %67, %7                           ; <i32> [#uses=1]
  %69 = inttoptr i32 %68 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %70 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %69, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  %72 = or i32 %71, 1                             ; <i32> [#uses=2]
  store i32 %72, i32* %70
  %73 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %69, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %74 = load i32* %73, align 4                    ; <i32> [#uses=1]
  %75 = and i32 %72, %74                          ; <i32> [#uses=1]
  %76 = icmp eq i32 %75, 0                        ; <i1> [#uses=1]
  br i1 %76, label %bb13, label %bb4.i.i.i5

bb4.i.i.i5:                                       ; preds = %bb.i4
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc9 unwind label %lpad50

.noexc9:                                          ; preds = %bb4.i.i.i5
  unreachable

bb13:                                             ; preds = %bb.i4, %.noexc8, %invcont9
  br i1 %44, label %invcont19, label %bb32

invcont19:                                        ; preds = %bb13
  %77 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %78 = getelementptr inbounds i32 (...)** %77, i32 -3 ; <i32 (...)**> [#uses=1]
  %79 = bitcast i32 (...)** %78 to i32*           ; <i32*> [#uses=1]
  %80 = load i32* %79, align 4                    ; <i32> [#uses=1]
  %81 = add i32 %80, %7                           ; <i32> [#uses=1]
  %82 = inttoptr i32 %81 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %83 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %82, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %84 = load i32* %83, align 4                    ; <i32> [#uses=1]
  %85 = icmp eq i32 %84, 0                        ; <i1> [#uses=1]
  br i1 %85, label %bb28, label %bb32

bb28:                                             ; preds = %invcont19
  %86 = sub i32 %39, %__n                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 %86)
          to label %bb32 unwind label %lpad50

bb30:                                             ; preds = %bb
  %87 = inttoptr i32 %36 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %88 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %87, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %89 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %88, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %90 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %89, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %91 = load i32 (...)*** %90, align 4            ; <i32 (...)**> [#uses=1]
  %92 = getelementptr inbounds i32 (...)** %91, i32 12 ; <i32 (...)**> [#uses=1]
  %93 = load i32 (...)** %92, align 4             ; <i32 (...)*> [#uses=1]
  %94 = bitcast i32 (...)* %93 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %95 = invoke i32 %94(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %89, i8* %__s, i32 %__n)
          to label %.noexc2 unwind label %lpad50  ; <i32> [#uses=1]

.noexc2:                                          ; preds = %bb30
  %96 = icmp eq i32 %95, %__n                     ; <i1> [#uses=1]
  br i1 %96, label %bb32, label %bb.i1

bb.i1:                                            ; preds = %.noexc2
  %97 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %98 = getelementptr inbounds i32 (...)** %97, i32 -3 ; <i32 (...)**> [#uses=1]
  %99 = bitcast i32 (...)** %98 to i32*           ; <i32*> [#uses=1]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = add i32 %100, %7                         ; <i32> [#uses=1]
  %102 = inttoptr i32 %101 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %103 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %102, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %104 = load i32* %103, align 4                  ; <i32> [#uses=1]
  %105 = or i32 %104, 1                           ; <i32> [#uses=2]
  store i32 %105, i32* %103
  %106 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %102, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %107 = load i32* %106, align 4                  ; <i32> [#uses=1]
  %108 = and i32 %105, %107                       ; <i32> [#uses=1]
  %109 = icmp eq i32 %108, 0                      ; <i1> [#uses=1]
  br i1 %109, label %bb32, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i1
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc3 unwind label %lpad50

.noexc3:                                          ; preds = %bb4.i.i.i
  unreachable

bb32:                                             ; preds = %bb.i1, %.noexc2, %bb28, %invcont19, %bb13
  %110 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %111 = getelementptr inbounds i32 (...)** %110, i32 -3 ; <i32 (...)**> [#uses=1]
  %112 = bitcast i32 (...)** %111 to i32*         ; <i32*> [#uses=1]
  %113 = load i32* %112, align 4                  ; <i32> [#uses=1]
  %114 = add i32 %113, %7                         ; <i32> [#uses=1]
  %115 = inttoptr i32 %114 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %116 = getelementptr inbounds %"struct.std::ios_base"* %115, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %116, align 4
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
  %117 = call i8* @__cxa_begin_catch(i8* %eh_ptr51) nounwind ; <i8*> [#uses=0]
  %118 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %119 = getelementptr inbounds i32 (...)** %118, i32 -3 ; <i32 (...)**> [#uses=1]
  %120 = bitcast i32 (...)** %119 to i32*         ; <i32*> [#uses=1]
  %121 = load i32* %120, align 4                  ; <i32> [#uses=1]
  %122 = add i32 %121, %7                         ; <i32> [#uses=1]
  %123 = inttoptr i32 %122 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %124 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %123, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %125 = load i32* %124, align 4                  ; <i32> [#uses=1]
  %126 = or i32 %125, 1                           ; <i32> [#uses=1]
  store i32 %126, i32* %124, align 4
  %127 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %123, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %128 = load i32* %127, align 4                  ; <i32> [#uses=1]
  %129 = and i32 %128, 1                          ; <i32> [#uses=1]
  %130 = icmp eq i32 %129, 0                      ; <i1> [#uses=1]
  br i1 %130, label %bb39, label %bb.i

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

define internal fastcc void @_ZNSo9_M_insertImEERSoT_(i32 %__v) {
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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
  %62 = getelementptr inbounds i32 (...)** %61, i32 4 ; <i32 (...)**> [#uses=1]
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare void @exit(i32) noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb7.preheader, label %bb.nph

bb7.preheader:                                    ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @atoi(i8* %2) nounwind readonly ; <i32> [#uses=2]
  %phitmp = add i32 %3, -1                        ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 0                         ; <i1> [#uses=1]
  %phitmp. = select i1 %4, i32 %phitmp, i32 0     ; <i32> [#uses=2]
  %5 = icmp eq i32 %phitmp., -1                   ; <i1> [#uses=1]
  br i1 %5, label %bb8, label %bb.nph

bb.nph:                                           ; preds = %bb7.preheader, %entry
  %NUM.0.ph.reg2mem.0 = phi i32 [ %phitmp., %bb7.preheader ], [ 99999, %entry ] ; <i32> [#uses=2]
  %tmp = add i32 %NUM.0.ph.reg2mem.0, 1           ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %_Z13some_functionj.exit, %bb.nph
  %HI.1 = phi i32 [ 0, %bb.nph ], [ %HI.0, %_Z13some_functionj.exit ] ; <i32> [#uses=2]
  %LO.2 = phi i32 [ 0, %bb.nph ], [ %LO.1, %_Z13some_functionj.exit ] ; <i32> [#uses=2]
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %_Z13some_functionj.exit ] ; <i32> [#uses=2]
  %tmp3 = sub i32 %NUM.0.ph.reg2mem.0, %indvar    ; <i32> [#uses=2]
  %6 = and i32 %tmp3, 1                           ; <i32> [#uses=1]
  %toBool.i.i.i = icmp eq i32 %6, 0               ; <i1> [#uses=1]
  %7 = call i8* @__cxa_allocate_exception(i32 12) nounwind ; <i8*> [#uses=3]
  %8 = bitcast i8* %7 to i32*                     ; <i32*> [#uses=1]
  store i32 %tmp3, i32* %8, align 4
  br i1 %toBool.i.i.i, label %bb1.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb6
  invoke void @__cxa_throw(i8* %7, i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI12Lo_exception to i8*), void (i8*)* null) noreturn
          to label %.noexc.i.i unwind label %lpad.i5.i

.noexc.i.i:                                       ; preds = %bb.i.i.i
  unreachable

bb1.i.i.i:                                        ; preds = %bb6
  invoke void @__cxa_throw(i8* %7, i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI12Hi_exception to i8*), void (i8*)* null) noreturn
          to label %.noexc1.i.i unwind label %lpad.i5.i

.noexc1.i.i:                                      ; preds = %bb1.i.i.i
  unreachable

bb.i1.i:                                          ; preds = %lpad.i5.i
  %9 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i2.i) nounwind ; <i8*> [#uses=0]
  %10 = add i32 %LO.2, 1                          ; <i32> [#uses=2]
  invoke void @__cxa_end_catch()
          to label %_Z13some_functionj.exit unwind label %lpad.i.i

lpad.i5.i:                                        ; preds = %bb1.i.i.i, %bb.i.i.i
  %eh_ptr.i2.i = call i8* @llvm.eh.exception()    ; <i8*> [#uses=3]
  %eh_select.i3.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i2.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI12Lo_exception to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid.i4.i = call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI12Lo_exception to i8*)) ; <i32> [#uses=1]
  %11 = icmp eq i32 %eh_select.i3.i, %eh_typeid.i4.i ; <i1> [#uses=1]
  br i1 %11, label %bb.i1.i, label %Unwind.i6.i

Unwind.i6.i:                                      ; preds = %lpad.i5.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i2.i)
          to label %.noexc7.i unwind label %lpad.i.i

.noexc7.i:                                        ; preds = %Unwind.i6.i
  unreachable

bb.i.i:                                           ; preds = %lpad.i.i
  %12 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr.i.i) nounwind ; <i8*> [#uses=0]
  %13 = add i32 %HI.1, 1                          ; <i32> [#uses=1]
  invoke void @__cxa_end_catch()
          to label %_Z13some_functionj.exit unwind label %lpad.i

lpad.i.i:                                         ; preds = %Unwind.i6.i, %bb.i1.i
  %LO.0 = phi i32 [ %10, %bb.i1.i ], [ %LO.2, %Unwind.i6.i ] ; <i32> [#uses=1]
  %eh_ptr.i.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=3]
  %eh_select.i.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI12Hi_exception to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid.i.i = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI12Hi_exception to i8*)) ; <i32> [#uses=1]
  %14 = icmp eq i32 %eh_select.i.i, %eh_typeid.i.i ; <i1> [#uses=1]
  br i1 %14, label %bb.i.i, label %Unwind.i.i

Unwind.i.i:                                       ; preds = %lpad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %Unwind.i.i
  unreachable

invcont1.i:                                       ; preds = %lpad.i
  tail call void @exit(i32 1) noreturn nounwind
  unreachable

invcont4.i:                                       ; preds = %lpad9.i
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr10.i)
  unreachable

lpad.i:                                           ; preds = %Unwind.i.i, %bb.i.i
  %eh_ptr.i = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select8.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %15 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr.i) nounwind ; <i8*> [#uses=0]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 22)
          to label %invcont1.i unwind label %lpad9.i

lpad9.i:                                          ; preds = %lpad.i
  %eh_ptr10.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select12.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr10.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont4.i unwind label %lpad13.i

lpad13.i:                                         ; preds = %lpad9.i
  %eh_ptr14.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=1]
  %eh_select16.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr14.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_Z13some_functionj.exit:                          ; preds = %bb.i.i, %bb.i1.i
  %HI.0 = phi i32 [ %13, %bb.i.i ], [ %HI.1, %bb.i1.i ] ; <i32> [#uses=2]
  %LO.1 = phi i32 [ %LO.0, %bb.i.i ], [ %10, %bb.i1.i ] ; <i32> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %tmp      ; <i1> [#uses=1]
  br i1 %exitcond, label %bb8, label %bb6

bb8:                                              ; preds = %_Z13some_functionj.exit, %bb7.preheader
  %HI.2 = phi i32 [ 0, %bb7.preheader ], [ %HI.0, %_Z13some_functionj.exit ] ; <i32> [#uses=1]
  %LO.3 = phi i32 [ 0, %bb7.preheader ], [ %LO.1, %_Z13some_functionj.exit ] ; <i32> [#uses=1]
  tail call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0), i32 15)
  tail call fastcc void @_ZNSo9_M_insertImEERSoT_(i32 %HI.2)
  tail call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 3)
  tail call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 3)
  tail call fastcc void @_ZNSo9_M_insertImEERSoT_(i32 %LO.3)
  %16 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %17 = getelementptr inbounds i32 (...)** %16, i32 -3 ; <i32 (...)**> [#uses=1]
  %18 = bitcast i32 (...)** %17 to i32*           ; <i32*> [#uses=1]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  %20 = add i32 %19, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %21 = inttoptr i32 %20 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %22 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10) ; <i8> [#uses=3]
  %23 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %23, align 8
  %24 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %24, align 4
  %25 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %26 = getelementptr inbounds i32 (...)** %25, i32 -3 ; <i32 (...)**> [#uses=1]
  %27 = bitcast i32 (...)** %26 to i32*           ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=1]
  %29 = add i32 %28, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %30 = inttoptr i32 %29 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %31 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %30, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %32 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %31, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %33 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %32, null ; <i1> [#uses=1]
  br i1 %33, label %bb9.i.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb8
  %34 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %30, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %35 = load i32* %34, align 4                    ; <i32> [#uses=1]
  %36 = icmp eq i32 %35, 0                        ; <i1> [#uses=1]
  br i1 %36, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %32)
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %bb8.i.i.i.i, %bb.i.i.i.i, %bb8
  %37 = phi i32 (...)** [ %.pre.i.i.i.i, %bb8.i.i.i.i ], [ %25, %bb8 ], [ %25, %bb.i.i.i.i ] ; <i32 (...)**> [#uses=1]
  %38 = getelementptr inbounds i32 (...)** %37, i32 -3 ; <i32 (...)**> [#uses=1]
  %39 = bitcast i32 (...)** %38 to i32*           ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = add i32 %40, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %42 = inttoptr i32 %41 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %43 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %42, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %44 = load i32* %43, align 4                    ; <i32> [#uses=2]
  %45 = icmp eq i32 %44, 0                        ; <i1> [#uses=1]
  br i1 %45, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %23, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %46 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %42, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %47 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %46, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %48 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %47, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %48, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %44 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %43
  %49 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %42, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %50 = load i32* %49, align 4                    ; <i32> [#uses=1]
  %51 = and i32 %storemerge.i.i.i.i.i, %50        ; <i32> [#uses=1]
  %52 = icmp eq i32 %51, 0                        ; <i1> [#uses=1]
  br i1 %52, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr = load i8* %23, align 8                    ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %.pr, 0                ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %53 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %54 = getelementptr inbounds i32 (...)** %53, i32 -3 ; <i32 (...)**> [#uses=1]
  %55 = bitcast i32 (...)** %54 to i32*           ; <i32*> [#uses=1]
  %56 = load i32* %55, align 4                    ; <i32> [#uses=1]
  %57 = add i32 %56, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %58 = inttoptr i32 %57 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %59 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %58, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %60 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %59, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %61 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %60, i32 0, i32 5 ; <i8**> [#uses=3]
  %62 = load i8** %61, align 4                    ; <i8*> [#uses=2]
  %63 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %60, i32 0, i32 6 ; <i8**> [#uses=1]
  %64 = load i8** %63, align 4                    ; <i8*> [#uses=1]
  %65 = icmp ult i8* %62, %64                     ; <i1> [#uses=1]
  br i1 %65, label %bb.i2.i.i, label %bb1.i.i.i1

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %22, i8* %62, align 1
  %66 = load i8** %61, align 4                    ; <i8*> [#uses=1]
  %67 = getelementptr inbounds i8* %66, i32 1     ; <i8*> [#uses=1]
  store i8* %67, i8** %61, align 4
  %68 = zext i8 %22 to i32                        ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i1:                                       ; preds = %invcont1.i.i
  %69 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %60, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %70 = load i32 (...)*** %69, align 4            ; <i32 (...)**> [#uses=1]
  %71 = getelementptr inbounds i32 (...)** %70, i32 13 ; <i32 (...)**> [#uses=1]
  %72 = load i32 (...)** %71, align 4             ; <i32 (...)*> [#uses=1]
  %73 = zext i8 %22 to i32                        ; <i32> [#uses=1]
  %74 = bitcast i32 (...)* %72 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %75 = invoke i32 %74(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %60, i32 %73)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i1, %bb.i2.i.i
  %76 = phi i32 [ %68, %bb.i2.i.i ], [ %75, %bb1.i.i.i1 ] ; <i32> [#uses=1]
  %77 = icmp eq i32 %76, -1                       ; <i1> [#uses=1]
  br i1 %77, label %bb14.i.i, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %78 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %79 = getelementptr inbounds i32 (...)** %78, i32 -3 ; <i32 (...)**> [#uses=1]
  %80 = bitcast i32 (...)** %79 to i32*           ; <i32*> [#uses=1]
  %81 = load i32* %80, align 4                    ; <i32> [#uses=1]
  %82 = add i32 %81, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %83 = inttoptr i32 %82 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %84 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %85 = load i32* %84, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %85, 1               ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %84
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %88 = and i32 %storemerge.i.i.i, %87            ; <i32> [#uses=1]
  %89 = icmp eq i32 %88, 0                        ; <i1> [#uses=1]
  br i1 %89, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i2 unwind label %lpad.i.i4

.noexc1.i.i2:                                     ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
  unreachable

lpad.i.i4:                                        ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i3 = call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i3, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i1
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %90 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %91 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %92 = getelementptr inbounds i32 (...)** %91, i32 -3 ; <i32 (...)**> [#uses=1]
  %93 = bitcast i32 (...)** %92 to i32*           ; <i32*> [#uses=1]
  %94 = load i32* %93, align 4                    ; <i32> [#uses=1]
  %95 = add i32 %94, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %96 = inttoptr i32 %95 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %97 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %96, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %98 = load i32* %97, align 4                    ; <i32> [#uses=1]
  %99 = or i32 %98, 1                             ; <i32> [#uses=1]
  store i32 %99, i32* %97, align 4
  %100 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %96, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %101 = load i32* %100, align 4                  ; <i32> [#uses=1]
  %102 = and i32 %101, 1                          ; <i32> [#uses=1]
  %103 = icmp eq i32 %102, 0                      ; <i1> [#uses=1]
  br i1 %103, label %bb11.i.i, label %bb.i.i.i5

bb.i.i.i5:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i6 unwind label %lpad33.i.i

.noexc.i.i6:                                      ; preds = %bb.i.i.i5
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i5
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

ppad.i.i:                                         ; preds = %lpad33.i.i, %lpad29.i.i, %lpad.i.i4
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i.i3, %lpad.i.i4 ], [ %eh_ptr30.i.i, %lpad29.i.i ], [ %eh_ptr34.i.i, %lpad33.i.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
          to label %invcont20.i.i unwind label %lpad41.i.i

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %bb14.i.i, %bb11.i.i, %invcont2.i.i, %invcont.i.i
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
  tail call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
  ret i32 0
}

declare i32 @atoi(i8* nocapture) nounwind readonly

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
