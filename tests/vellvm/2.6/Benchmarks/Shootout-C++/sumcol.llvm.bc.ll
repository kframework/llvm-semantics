; ModuleID = 'sumcol.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_istream<char,std::char_traits<char> >" = type { i32 (...)**, i32, %"struct.std::basic_ios<char,std::char_traits<char> >" }
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
@_ZSt3cin = external global %"struct.std::basic_istream<char,std::char_traits<char> >" ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=4]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=4]
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
  %__cerb.i1 = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__c_addr.i = alloca i8, align 1                ; <i8*> [#uses=3]
  %buff = alloca [4096 x i8], align 1             ; <[4096 x i8]*> [#uses=1]
  %line = alloca [128 x i8], align 1              ; <[128 x i8]*> [#uses=1]
  %1 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 2, i32 4), align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %2 = getelementptr inbounds [4096 x i8]* %buff, i32 0, i32 0 ; <i8*> [#uses=1]
  %3 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %1, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %4 = load i32 (...)*** %3, align 4              ; <i32 (...)**> [#uses=1]
  %5 = getelementptr inbounds i32 (...)** %4, i32 3 ; <i32 (...)**> [#uses=1]
  %6 = load i32 (...)** %5, align 4               ; <i32 (...)*> [#uses=1]
  %7 = bitcast i32 (...)* %6 to %"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %8 = call %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %7(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %1, i8* %2, i32 4096) ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=0]
  %9 = getelementptr inbounds [128 x i8]* %line, i32 0, i32 0 ; <i8*> [#uses=2]
  br label %bb1

bb:                                               ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit
  %10 = call i32 @atoi(i8* %9) nounwind readonly  ; <i32> [#uses=1]
  %11 = add nsw i32 %10, %sum.0                   ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %11, %bb ]    ; <i32> [#uses=2]
  %12 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %13 = getelementptr inbounds i32 (...)** %12, i32 -3 ; <i32 (...)**> [#uses=1]
  %14 = bitcast i32 (...)** %13 to i32*           ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = add i32 %15, ptrtoint (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin to i32) ; <i32> [#uses=1]
  %17 = inttoptr i32 %16 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx19 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %17, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx19.val = load %"struct.std::ctype<char>"** %.idx19 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %18 = call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx19.val, i8 signext 10) ; <i8> [#uses=1]
  %19 = call %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i8* %9, i32 128, i8 signext %18) ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=2]
  %20 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >"* %19, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %21 = load i32 (...)*** %20, align 4            ; <i32 (...)**> [#uses=1]
  %22 = getelementptr inbounds i32 (...)** %21, i32 -3 ; <i32 (...)**> [#uses=1]
  %23 = bitcast i32 (...)** %22 to i32*           ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = ptrtoint %"struct.std::basic_istream<char,std::char_traits<char> >"* %19 to i32 ; <i32> [#uses=1]
  %26 = add i32 %24, %25                          ; <i32> [#uses=2]
  %27 = inttoptr i32 %26 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %28 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %27, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %29 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %30 = and i32 %29, 5                            ; <i32> [#uses=1]
  %31 = icmp eq i32 %30, 0                        ; <i1> [#uses=1]
  br i1 %31, label %_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit, label %bb2

_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit: ; preds = %bb1
  %32 = inttoptr i32 %26 to i8*                   ; <i8*> [#uses=1]
  %phitmp = icmp eq i8* %32, null                 ; <i1> [#uses=1]
  br i1 %phitmp, label %bb2, label %bb

bb2:                                              ; preds = %_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv.exit, %bb1
  %33 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %33, align 8
  %34 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %34, align 4
  %35 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %36 = getelementptr inbounds i32 (...)** %35, i32 -3 ; <i32 (...)**> [#uses=1]
  %37 = bitcast i32 (...)** %36 to i32*           ; <i32*> [#uses=1]
  %38 = load i32* %37, align 4                    ; <i32> [#uses=1]
  %39 = add i32 %38, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %40 = inttoptr i32 %39 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %41 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %40, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %42 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %41, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %43 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %42, null ; <i1> [#uses=1]
  br i1 %43, label %bb9.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb2
  %44 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %40, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %45 = load i32* %44, align 4                    ; <i32> [#uses=1]
  %46 = icmp eq i32 %45, 0                        ; <i1> [#uses=1]
  br i1 %46, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %42)
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i, %bb.i.i.i, %bb2
  %47 = phi i32 (...)** [ %.pre.i.i.i, %bb8.i.i.i ], [ %35, %bb2 ], [ %35, %bb.i.i.i ] ; <i32 (...)**> [#uses=1]
  %48 = getelementptr inbounds i32 (...)** %47, i32 -3 ; <i32 (...)**> [#uses=1]
  %49 = bitcast i32 (...)** %48 to i32*           ; <i32*> [#uses=1]
  %50 = load i32* %49, align 4                    ; <i32> [#uses=1]
  %51 = add i32 %50, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %52 = inttoptr i32 %51 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %54 = load i32* %53, align 4                    ; <i32> [#uses=2]
  %55 = icmp eq i32 %54, 0                        ; <i1> [#uses=1]
  br i1 %55, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %33, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %56 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %57 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %56, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %58 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %57, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %58, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %54 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %53
  %59 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %60 = load i32* %59, align 4                    ; <i32> [#uses=1]
  %61 = and i32 %storemerge.i.i.i.i, %60          ; <i32> [#uses=1]
  %62 = icmp eq i32 %61, 0                        ; <i1> [#uses=1]
  br i1 %62, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %33, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %_ZNSo9_M_insertIlEERSoT_.exit, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %63 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %64 = getelementptr inbounds i32 (...)** %63, i32 -3 ; <i32 (...)**> [#uses=1]
  %65 = bitcast i32 (...)** %64 to i32*           ; <i32*> [#uses=1]
  %66 = load i32* %65, align 4                    ; <i32> [#uses=1]
  %67 = add i32 %66, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %68 = inttoptr i32 %67 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %69 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %68, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %70 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %69, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %71 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %70, null ; <i1> [#uses=1]
  br i1 %71, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %72 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %68, i32 0, i32 3 ; <i8*> [#uses=2]
  %73 = load i8* %72, align 1                     ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %73, 0                 ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %68, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %74 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %75 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %68, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %74, i8* %75, align 4
  store i8 1, i8* %72, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %76 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %63, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %77 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %68, i32 0, i32 2 ; <i8*> [#uses=1]
  %78 = load i8* %77, align 4                     ; <i8> [#uses=1]
  %79 = getelementptr inbounds i32 (...)** %76, i32 -3 ; <i32 (...)**> [#uses=1]
  %80 = bitcast i32 (...)** %79 to i32*           ; <i32*> [#uses=1]
  %81 = load i32* %80, align 4                    ; <i32> [#uses=1]
  %82 = add i32 %81, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %83 = inttoptr i32 %82 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %84 = inttoptr i32 %82 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %85 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %84, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %86 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %85, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %86 to i32 ; <i32> [#uses=1]
  %87 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %86, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %88 = zext i32 %tmp.i to i64                    ; <i64> [#uses=1]
  %89 = zext i1 %87 to i64                        ; <i64> [#uses=1]
  %90 = shl i64 %89, 32                           ; <i64> [#uses=1]
  %91 = or i64 %90, %88                           ; <i64> [#uses=1]
  store i64 %91, i64* %tmp9.i, align 8
  %92 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %70, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %93 = load i32 (...)*** %92, align 4            ; <i32 (...)**> [#uses=1]
  %94 = getelementptr inbounds i32 (...)** %93, i32 3 ; <i32 (...)**> [#uses=1]
  %95 = load i32 (...)** %94, align 4             ; <i32 (...)*> [#uses=1]
  %96 = bitcast i32 (...)* %95 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %96(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %70, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %83, i8 signext %78, i32 %sum.0)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %97 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %98 = load i8* %97, align 4                     ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %98, 0                  ; <i1> [#uses=1]
  br i1 %toBool4.i, label %_ZNSo9_M_insertIlEERSoT_.exit, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo9_M_insertIlEERSoT_.exit unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %99 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %100 = getelementptr inbounds i32 (...)** %99, i32 -3 ; <i32 (...)**> [#uses=1]
  %101 = bitcast i32 (...)** %100 to i32*         ; <i32*> [#uses=1]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = add i32 %102, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %104 = inttoptr i32 %103 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %105 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %104, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %106 = load i32* %105, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %106, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %105
  %107 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %104, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %108 = load i32* %107, align 4                  ; <i32> [#uses=1]
  %109 = and i32 %storemerge.i.i, %108            ; <i32> [#uses=1]
  %110 = icmp eq i32 %109, 0                      ; <i1> [#uses=1]
  br i1 %110, label %_ZNSo9_M_insertIlEERSoT_.exit, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb15.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

invcont21.i:                                      ; preds = %ppad.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

lpad.i:                                           ; preds = %bb4.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %111 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %112 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %113 = getelementptr inbounds i32 (...)** %112, i32 -3 ; <i32 (...)**> [#uses=1]
  %114 = bitcast i32 (...)** %113 to i32*         ; <i32*> [#uses=1]
  %115 = load i32* %114, align 4                  ; <i32> [#uses=1]
  %116 = add i32 %115, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %117 = inttoptr i32 %116 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %118 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %117, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %119 = load i32* %118, align 4                  ; <i32> [#uses=1]
  %120 = or i32 %119, 1                           ; <i32> [#uses=1]
  store i32 %120, i32* %118, align 4
  %121 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %117, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %122 = load i32* %121, align 4                  ; <i32> [#uses=1]
  %123 = and i32 %122, 1                          ; <i32> [#uses=1]
  %124 = icmp eq i32 %123, 0                      ; <i1> [#uses=1]
  br i1 %124, label %bb12.i, label %bb.i.i

bb.i.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i unwind label %lpad34.i

.noexc.i:                                         ; preds = %bb.i.i
  unreachable

lpad30.i:                                         ; preds = %bb12.i
  %eh_ptr31.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select33.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad34.i:                                         ; preds = %bb.i.i
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

ppad.i:                                           ; preds = %lpad34.i, %lpad30.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr31.i, %lpad30.i ], [ %eh_ptr35.i, %lpad34.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont21.i unwind label %lpad42.i

_ZNSo9_M_insertIlEERSoT_.exit:                    ; preds = %bb15.i, %bb12.i, %invcont3.i, %invcont.i
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
  store i8 10, i8* %__c_addr.i
  %125 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i1, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %125, align 8
  %126 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i1, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %126, align 4
  %127 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %128 = getelementptr inbounds i32 (...)** %127, i32 -3 ; <i32 (...)**> [#uses=1]
  %129 = bitcast i32 (...)** %128 to i32*         ; <i32*> [#uses=1]
  %130 = load i32* %129, align 4                  ; <i32> [#uses=1]
  %131 = add i32 %130, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %132 = inttoptr i32 %131 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %133 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %134 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %133, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %135 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %134, null ; <i1> [#uses=1]
  br i1 %135, label %bb9.i.i.i5, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %_ZNSo9_M_insertIlEERSoT_.exit
  %136 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %137 = load i32* %136, align 4                  ; <i32> [#uses=1]
  %138 = icmp eq i32 %137, 0                      ; <i1> [#uses=1]
  br i1 %138, label %bb8.i.i.i4, label %bb9.i.i.i5

bb8.i.i.i4:                                       ; preds = %bb.i.i.i2
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %134)
  %.pre.i.i.i3 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i5

bb9.i.i.i5:                                       ; preds = %bb8.i.i.i4, %bb.i.i.i2, %_ZNSo9_M_insertIlEERSoT_.exit
  %139 = phi i32 (...)** [ %.pre.i.i.i3, %bb8.i.i.i4 ], [ %127, %_ZNSo9_M_insertIlEERSoT_.exit ], [ %127, %bb.i.i.i2 ] ; <i32 (...)**> [#uses=1]
  %140 = getelementptr inbounds i32 (...)** %139, i32 -3 ; <i32 (...)**> [#uses=1]
  %141 = bitcast i32 (...)** %140 to i32*         ; <i32*> [#uses=1]
  %142 = load i32* %141, align 4                  ; <i32> [#uses=1]
  %143 = add i32 %142, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %144 = inttoptr i32 %143 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %145 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %144, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %146 = load i32* %145, align 4                  ; <i32> [#uses=2]
  %147 = icmp eq i32 %146, 0                      ; <i1> [#uses=1]
  br i1 %147, label %invcont.i12.thread, label %bb12.i.i.i9

invcont.i12.thread:                               ; preds = %bb9.i.i.i5
  store i8 1, i8* %125, align 8
  br label %bb.i13

bb12.i.i.i9:                                      ; preds = %bb9.i.i.i5
  %148 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %144, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %149 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %148, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %150 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %149, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i7 = select i1 %150, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i8 = or i32 %storemerge.i.v.i.i.i7, %146 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i8, i32* %145
  %151 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %144, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %152 = load i32* %151, align 4                  ; <i32> [#uses=1]
  %153 = and i32 %storemerge.i.i.i.i8, %152       ; <i32> [#uses=1]
  %154 = icmp eq i32 %153, 0                      ; <i1> [#uses=1]
  br i1 %154, label %invcont.i12, label %bb4.i.i.i.i.i10

bb4.i.i.i.i.i10:                                  ; preds = %bb12.i.i.i9
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i12:                                      ; preds = %bb12.i.i.i9
  %.pr21 = load i8* %125, align 8                 ; <i8> [#uses=1]
  %toBool.i11 = icmp eq i8 %.pr21, 0              ; <i1> [#uses=1]
  br i1 %toBool.i11, label %_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i.exit, label %bb.i13

bb.i13:                                           ; preds = %invcont.i12, %invcont.i12.thread
  %155 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %156 = getelementptr inbounds i32 (...)** %155, i32 -3 ; <i32 (...)**> [#uses=1]
  %157 = bitcast i32 (...)** %156 to i32*         ; <i32*> [#uses=1]
  %158 = load i32* %157, align 4                  ; <i32> [#uses=1]
  %159 = add i32 %158, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %160 = inttoptr i32 %159 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %161 = getelementptr inbounds %"struct.std::ios_base"* %160, i32 0, i32 2 ; <i32*> [#uses=1]
  %162 = load i32* %161, align 4                  ; <i32> [#uses=3]
  %163 = icmp sgt i32 %162, 1                     ; <i1> [#uses=1]
  br i1 %163, label %bb1.i, label %bb30.i

bb1.i:                                            ; preds = %bb.i13
  %164 = getelementptr inbounds %"struct.std::ios_base"* %160, i32 0, i32 3 ; <i32*> [#uses=1]
  %165 = load i32* %164, align 4                  ; <i32> [#uses=1]
  %166 = and i32 %165, 176                        ; <i32> [#uses=1]
  %167 = icmp eq i32 %166, 32                     ; <i1> [#uses=2]
  br i1 %167, label %invcont9.i, label %bb6.i

bb6.i:                                            ; preds = %bb1.i
  %168 = add i32 %162, -1                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %168)
          to label %invcont9.i unwind label %lpad50.i

invcont9.i:                                       ; preds = %bb6.i, %bb1.i
  %169 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %170 = getelementptr inbounds i32 (...)** %169, i32 -3 ; <i32 (...)**> [#uses=1]
  %171 = bitcast i32 (...)** %170 to i32*         ; <i32*> [#uses=1]
  %172 = load i32* %171, align 4                  ; <i32> [#uses=1]
  %173 = add i32 %172, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %174 = inttoptr i32 %173 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %175 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %174, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %176 = load i32* %175, align 4                  ; <i32> [#uses=1]
  %177 = icmp eq i32 %176, 0                      ; <i1> [#uses=1]
  br i1 %177, label %bb11.i, label %bb13.i

bb11.i:                                           ; preds = %invcont9.i
  %178 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %174, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %179 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %178, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %180 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %179, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %181 = load i32 (...)*** %180, align 4          ; <i32 (...)**> [#uses=1]
  %182 = getelementptr inbounds i32 (...)** %181, i32 12 ; <i32 (...)**> [#uses=1]
  %183 = load i32 (...)** %182, align 4           ; <i32 (...)*> [#uses=1]
  %184 = bitcast i32 (...)* %183 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %185 = invoke i32 %184(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %179, i8* %__c_addr.i, i32 1)
          to label %.noexc8.i unwind label %lpad50.i ; <i32> [#uses=1]

.noexc8.i:                                        ; preds = %bb11.i
  %186 = icmp eq i32 %185, 1                      ; <i1> [#uses=1]
  br i1 %186, label %bb13.i, label %bb.i4.i14

bb.i4.i14:                                        ; preds = %.noexc8.i
  %187 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %188 = getelementptr inbounds i32 (...)** %187, i32 -3 ; <i32 (...)**> [#uses=1]
  %189 = bitcast i32 (...)** %188 to i32*         ; <i32*> [#uses=1]
  %190 = load i32* %189, align 4                  ; <i32> [#uses=1]
  %191 = add i32 %190, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %192 = inttoptr i32 %191 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %193 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %192, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %194 = load i32* %193, align 4                  ; <i32> [#uses=1]
  %195 = or i32 %194, 1                           ; <i32> [#uses=2]
  store i32 %195, i32* %193
  %196 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %192, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %197 = load i32* %196, align 4                  ; <i32> [#uses=1]
  %198 = and i32 %195, %197                       ; <i32> [#uses=1]
  %199 = icmp eq i32 %198, 0                      ; <i1> [#uses=1]
  br i1 %199, label %bb13.i, label %bb4.i.i.i5.i

bb4.i.i.i5.i:                                     ; preds = %bb.i4.i14
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc9.i unwind label %lpad50.i

.noexc9.i:                                        ; preds = %bb4.i.i.i5.i
  unreachable

bb13.i:                                           ; preds = %bb.i4.i14, %.noexc8.i, %invcont9.i
  br i1 %167, label %invcont19.i, label %bb32.i

invcont19.i:                                      ; preds = %bb13.i
  %200 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %201 = getelementptr inbounds i32 (...)** %200, i32 -3 ; <i32 (...)**> [#uses=1]
  %202 = bitcast i32 (...)** %201 to i32*         ; <i32*> [#uses=1]
  %203 = load i32* %202, align 4                  ; <i32> [#uses=1]
  %204 = add i32 %203, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %205 = inttoptr i32 %204 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %206 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %205, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %207 = load i32* %206, align 4                  ; <i32> [#uses=1]
  %208 = icmp eq i32 %207, 0                      ; <i1> [#uses=1]
  br i1 %208, label %bb28.i, label %bb32.i

bb28.i:                                           ; preds = %invcont19.i
  %209 = add i32 %162, -1                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %209)
          to label %bb32.i unwind label %lpad50.i

bb30.i:                                           ; preds = %bb.i13
  %210 = inttoptr i32 %159 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %211 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %210, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %212 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %211, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %213 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %212, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %214 = load i32 (...)*** %213, align 4          ; <i32 (...)**> [#uses=1]
  %215 = getelementptr inbounds i32 (...)** %214, i32 12 ; <i32 (...)**> [#uses=1]
  %216 = load i32 (...)** %215, align 4           ; <i32 (...)*> [#uses=1]
  %217 = bitcast i32 (...)* %216 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %218 = invoke i32 %217(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %212, i8* %__c_addr.i, i32 1)
          to label %.noexc2.i unwind label %lpad50.i ; <i32> [#uses=1]

.noexc2.i:                                        ; preds = %bb30.i
  %219 = icmp eq i32 %218, 1                      ; <i1> [#uses=1]
  br i1 %219, label %bb32.i, label %bb.i1.i

bb.i1.i:                                          ; preds = %.noexc2.i
  %220 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %221 = getelementptr inbounds i32 (...)** %220, i32 -3 ; <i32 (...)**> [#uses=1]
  %222 = bitcast i32 (...)** %221 to i32*         ; <i32*> [#uses=1]
  %223 = load i32* %222, align 4                  ; <i32> [#uses=1]
  %224 = add i32 %223, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %225 = inttoptr i32 %224 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %226 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %225, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %227 = load i32* %226, align 4                  ; <i32> [#uses=1]
  %228 = or i32 %227, 1                           ; <i32> [#uses=2]
  store i32 %228, i32* %226
  %229 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %225, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %230 = load i32* %229, align 4                  ; <i32> [#uses=1]
  %231 = and i32 %228, %230                       ; <i32> [#uses=1]
  %232 = icmp eq i32 %231, 0                      ; <i1> [#uses=1]
  br i1 %232, label %bb32.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb.i1.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc3.i unwind label %lpad50.i

.noexc3.i:                                        ; preds = %bb4.i.i.i.i
  unreachable

bb32.i:                                           ; preds = %bb.i1.i, %.noexc2.i, %bb28.i, %invcont19.i, %bb13.i
  %233 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %234 = getelementptr inbounds i32 (...)** %233, i32 -3 ; <i32 (...)**> [#uses=1]
  %235 = bitcast i32 (...)** %234 to i32*         ; <i32*> [#uses=1]
  %236 = load i32* %235, align 4                  ; <i32> [#uses=1]
  %237 = add i32 %236, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %238 = inttoptr i32 %237 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %239 = getelementptr inbounds %"struct.std::ios_base"* %238, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %239, align 4
  br label %_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i.exit

bb39.i:                                           ; preds = %lpad50.i
  invoke void @__cxa_end_catch()
          to label %_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i.exit unwind label %lpad54.i

invcont45.i:                                      ; preds = %ppad.i18
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i17)
  unreachable

lpad50.i:                                         ; preds = %bb4.i.i.i.i, %bb30.i, %bb28.i, %bb4.i.i.i5.i, %bb11.i, %bb6.i
  %eh_ptr51.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select53.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr51.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %240 = call i8* @__cxa_begin_catch(i8* %eh_ptr51.i) nounwind ; <i8*> [#uses=0]
  %241 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %242 = getelementptr inbounds i32 (...)** %241, i32 -3 ; <i32 (...)**> [#uses=1]
  %243 = bitcast i32 (...)** %242 to i32*         ; <i32*> [#uses=1]
  %244 = load i32* %243, align 4                  ; <i32> [#uses=1]
  %245 = add i32 %244, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %246 = inttoptr i32 %245 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %247 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %246, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %248 = load i32* %247, align 4                  ; <i32> [#uses=1]
  %249 = or i32 %248, 1                           ; <i32> [#uses=1]
  store i32 %249, i32* %247, align 4
  %250 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %246, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %251 = load i32* %250, align 4                  ; <i32> [#uses=1]
  %252 = and i32 %251, 1                          ; <i32> [#uses=1]
  %253 = icmp eq i32 %252, 0                      ; <i1> [#uses=1]
  br i1 %253, label %bb39.i, label %bb.i.i15

bb.i.i15:                                         ; preds = %lpad50.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i16 unwind label %lpad58.i

.noexc.i16:                                       ; preds = %bb.i.i15
  unreachable

lpad54.i:                                         ; preds = %bb39.i
  %eh_ptr55.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select57.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr55.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i18

lpad58.i:                                         ; preds = %bb.i.i15
  %eh_ptr59.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select61.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr59.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad.i18 unwind label %lpad62.i

lpad62.i:                                         ; preds = %lpad58.i
  %eh_ptr63.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select65.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr63.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad66.i:                                         ; preds = %ppad.i18
  %eh_ptr67.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select69.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr67.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i18:                                         ; preds = %lpad58.i, %lpad54.i
  %eh_exception.0.i17 = phi i8* [ %eh_ptr55.i, %lpad54.i ], [ %eh_ptr59.i, %lpad58.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i1)
          to label %invcont45.i unwind label %lpad66.i

_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i.exit: ; preds = %bb39.i, %bb32.i, %invcont.i12
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i1)
  ret i32 0
}

define internal void @_GLOBAL__I_main() {
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

declare %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"*, i8*, i32, i8 signext)

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @__cxa_rethrow() noreturn

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

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

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
