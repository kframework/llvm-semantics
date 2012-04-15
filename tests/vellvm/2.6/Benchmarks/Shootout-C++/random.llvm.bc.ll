; ModuleID = 'random.llvm.bc'
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
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=7]
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
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %1 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %1, label %bb4.preheader, label %bb.nph

bb4.preheader:                                    ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = tail call i32 @atoi(i8* %3) nounwind readonly ; <i32> [#uses=1]
  %phitmp = add i32 %4, -1                        ; <i32> [#uses=2]
  %5 = icmp eq i32 %phitmp, -1                    ; <i1> [#uses=1]
  br i1 %5, label %bb5, label %bb.nph

bb.nph:                                           ; preds = %bb4.preheader, %entry
  %N.0.ph.reg2mem.0 = phi i32 [ %phitmp, %bb4.preheader ], [ 399999999, %entry ] ; <i32> [#uses=1]
  %tmp = add i32 %N.0.ph.reg2mem.0, 1             ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb3, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb3 ] ; <i32> [#uses=1]
  %_ZZ10gen_randomdE4last.tmp.0 = phi i32 [ 42, %bb.nph ], [ %8, %bb3 ] ; <i32> [#uses=1]
  %6 = mul i32 %_ZZ10gen_randomdE4last.tmp.0, 3877 ; <i32> [#uses=1]
  %7 = add nsw i32 %6, 29573                      ; <i32> [#uses=1]
  %8 = srem i32 %7, 139968                        ; <i32> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %tmp      ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4.bb5_crit_edge, label %bb3

bb4.bb5_crit_edge:                                ; preds = %bb3
  %9 = sitofp i32 %8 to double                    ; <double> [#uses=1]
  %10 = fmul double %9, 1.000000e+02              ; <double> [#uses=1]
  %11 = fdiv double %10, 1.399680e+05             ; <double> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb4.bb5_crit_edge, %bb4.preheader
  %result.0.lcssa = phi double [ %11, %bb4.bb5_crit_edge ], [ 0.000000e+00, %bb4.preheader ] ; <double> [#uses=1]
  store i32 9, i32* getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 1, i32 0, i32 1), align 4
  %12 = load i32* getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 1, i32 0, i32 3), align 4 ; <i32> [#uses=1]
  %13 = or i32 %12, 4                             ; <i32> [#uses=1]
  store i32 %13, i32* getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 1, i32 0, i32 3), align 4
  %14 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %14, align 8
  %15 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %15, align 4
  %16 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %17 = getelementptr inbounds i32 (...)** %16, i32 -3 ; <i32 (...)**> [#uses=1]
  %18 = bitcast i32 (...)** %17 to i32*           ; <i32*> [#uses=1]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  %20 = add i32 %19, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %21 = inttoptr i32 %20 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %22 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %23 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %22, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %24 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %23, null ; <i1> [#uses=1]
  br i1 %24, label %bb9.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb5
  %25 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %21, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %26 = load i32* %25, align 4                    ; <i32> [#uses=1]
  %27 = icmp eq i32 %26, 0                        ; <i1> [#uses=1]
  br i1 %27, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %23)
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i, %bb.i.i.i, %bb5
  %28 = phi i32 (...)** [ %.pre.i.i.i, %bb8.i.i.i ], [ %16, %bb5 ], [ %16, %bb.i.i.i ] ; <i32 (...)**> [#uses=1]
  %29 = getelementptr inbounds i32 (...)** %28, i32 -3 ; <i32 (...)**> [#uses=1]
  %30 = bitcast i32 (...)** %29 to i32*           ; <i32*> [#uses=1]
  %31 = load i32* %30, align 4                    ; <i32> [#uses=1]
  %32 = add i32 %31, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %33 = inttoptr i32 %32 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %34 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %33, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %35 = load i32* %34, align 4                    ; <i32> [#uses=2]
  %36 = icmp eq i32 %35, 0                        ; <i1> [#uses=1]
  br i1 %36, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %14, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %37 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %33, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %38 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %37, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %39 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %38, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %39, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %35 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %34
  %40 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %33, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %41 = load i32* %40, align 4                    ; <i32> [#uses=1]
  %42 = and i32 %storemerge.i.i.i.i, %41          ; <i32> [#uses=1]
  %43 = icmp eq i32 %42, 0                        ; <i1> [#uses=1]
  br i1 %43, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %14, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %_ZNSo9_M_insertIdEERSoT_.exit, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %44 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %45 = getelementptr inbounds i32 (...)** %44, i32 -3 ; <i32 (...)**> [#uses=1]
  %46 = bitcast i32 (...)** %45 to i32*           ; <i32*> [#uses=1]
  %47 = load i32* %46, align 4                    ; <i32> [#uses=1]
  %48 = add i32 %47, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %49 = inttoptr i32 %48 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %50 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %51 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %50, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %52 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %51, null ; <i1> [#uses=1]
  br i1 %52, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 3 ; <i8*> [#uses=2]
  %54 = load i8* %53, align 1                     ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %54, 0                 ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx3 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx3.val = load %"struct.std::ctype<char>"** %.idx3 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %55 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx3.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %56 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %55, i8* %56, align 4
  store i8 1, i8* %53, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %57 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %44, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %58 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 2 ; <i8*> [#uses=1]
  %59 = load i8* %58, align 4                     ; <i8> [#uses=1]
  %60 = getelementptr inbounds i32 (...)** %57, i32 -3 ; <i32 (...)**> [#uses=1]
  %61 = bitcast i32 (...)** %60 to i32*           ; <i32*> [#uses=1]
  %62 = load i32* %61, align 4                    ; <i32> [#uses=1]
  %63 = add i32 %62, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %64 = inttoptr i32 %63 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %65 = inttoptr i32 %63 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %66 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %65, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %67 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %66, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %67 to i32 ; <i32> [#uses=1]
  %68 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %67, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %69 = zext i32 %tmp.i to i64                    ; <i64> [#uses=1]
  %70 = zext i1 %68 to i64                        ; <i64> [#uses=1]
  %71 = shl i64 %70, 32                           ; <i64> [#uses=1]
  %72 = or i64 %71, %69                           ; <i64> [#uses=1]
  store i64 %72, i64* %tmp9.i, align 8
  %73 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %51, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %74 = load i32 (...)*** %73, align 4            ; <i32 (...)**> [#uses=1]
  %75 = getelementptr inbounds i32 (...)** %74, i32 7 ; <i32 (...)**> [#uses=1]
  %76 = load i32 (...)** %75, align 4             ; <i32 (...)*> [#uses=1]
  %77 = bitcast i32 (...)* %76 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, double)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, double)*> [#uses=1]
  invoke void %77(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %51, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %64, i8 signext %59, double %result.0.lcssa)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %78 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %79 = load i8* %78, align 4                     ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %79, 0                  ; <i1> [#uses=1]
  br i1 %toBool4.i, label %_ZNSo9_M_insertIdEERSoT_.exit, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo9_M_insertIdEERSoT_.exit unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %80 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %81 = getelementptr inbounds i32 (...)** %80, i32 -3 ; <i32 (...)**> [#uses=1]
  %82 = bitcast i32 (...)** %81 to i32*           ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=1]
  %84 = add i32 %83, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %85 = inttoptr i32 %84 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %87, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %86
  %88 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %89 = load i32* %88, align 4                    ; <i32> [#uses=1]
  %90 = and i32 %storemerge.i.i, %89              ; <i32> [#uses=1]
  %91 = icmp eq i32 %90, 0                        ; <i1> [#uses=1]
  br i1 %91, label %_ZNSo9_M_insertIdEERSoT_.exit, label %bb4.i.i.i

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
  %92 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %93 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %94 = getelementptr inbounds i32 (...)** %93, i32 -3 ; <i32 (...)**> [#uses=1]
  %95 = bitcast i32 (...)** %94 to i32*           ; <i32*> [#uses=1]
  %96 = load i32* %95, align 4                    ; <i32> [#uses=1]
  %97 = add i32 %96, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %98 = inttoptr i32 %97 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %99 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %98, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = or i32 %100, 1                           ; <i32> [#uses=1]
  store i32 %101, i32* %99, align 4
  %102 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %98, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %103 = load i32* %102, align 4                  ; <i32> [#uses=1]
  %104 = and i32 %103, 1                          ; <i32> [#uses=1]
  %105 = icmp eq i32 %104, 0                      ; <i1> [#uses=1]
  br i1 %105, label %bb12.i, label %bb.i.i

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

_ZNSo9_M_insertIdEERSoT_.exit:                    ; preds = %bb15.i, %bb12.i, %invcont3.i, %invcont.i
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
  %106 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %107 = getelementptr inbounds i32 (...)** %106, i32 -3 ; <i32 (...)**> [#uses=1]
  %108 = bitcast i32 (...)** %107 to i32*         ; <i32*> [#uses=1]
  %109 = load i32* %108, align 4                  ; <i32> [#uses=1]
  %110 = add i32 %109, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %111 = inttoptr i32 %110 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %111, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %112 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10) ; <i8> [#uses=3]
  %113 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %113, align 8
  %114 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %114, align 4
  %115 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %116 = getelementptr inbounds i32 (...)** %115, i32 -3 ; <i32 (...)**> [#uses=1]
  %117 = bitcast i32 (...)** %116 to i32*         ; <i32*> [#uses=1]
  %118 = load i32* %117, align 4                  ; <i32> [#uses=1]
  %119 = add i32 %118, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %120 = inttoptr i32 %119 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %121 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %120, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %122 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %121, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %123 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %122, null ; <i1> [#uses=1]
  br i1 %123, label %bb9.i.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %_ZNSo9_M_insertIdEERSoT_.exit
  %124 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %120, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %125 = load i32* %124, align 4                  ; <i32> [#uses=1]
  %126 = icmp eq i32 %125, 0                      ; <i1> [#uses=1]
  br i1 %126, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %122)
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %bb8.i.i.i.i, %bb.i.i.i.i, %_ZNSo9_M_insertIdEERSoT_.exit
  %127 = phi i32 (...)** [ %.pre.i.i.i.i, %bb8.i.i.i.i ], [ %115, %_ZNSo9_M_insertIdEERSoT_.exit ], [ %115, %bb.i.i.i.i ] ; <i32 (...)**> [#uses=1]
  %128 = getelementptr inbounds i32 (...)** %127, i32 -3 ; <i32 (...)**> [#uses=1]
  %129 = bitcast i32 (...)** %128 to i32*         ; <i32*> [#uses=1]
  %130 = load i32* %129, align 4                  ; <i32> [#uses=1]
  %131 = add i32 %130, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %132 = inttoptr i32 %131 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %133 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %134 = load i32* %133, align 4                  ; <i32> [#uses=2]
  %135 = icmp eq i32 %134, 0                      ; <i1> [#uses=1]
  br i1 %135, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %113, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %136 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %137 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %136, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %138 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %137, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %138, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %134 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %133
  %139 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %140 = load i32* %139, align 4                  ; <i32> [#uses=1]
  %141 = and i32 %storemerge.i.i.i.i.i, %140      ; <i32> [#uses=1]
  %142 = icmp eq i32 %141, 0                      ; <i1> [#uses=1]
  br i1 %142, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr7 = load i8* %113, align 8                  ; <i8> [#uses=1]
  %toBool.i.i1 = icmp eq i8 %.pr7, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i1, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %143 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %144 = getelementptr inbounds i32 (...)** %143, i32 -3 ; <i32 (...)**> [#uses=1]
  %145 = bitcast i32 (...)** %144 to i32*         ; <i32*> [#uses=1]
  %146 = load i32* %145, align 4                  ; <i32> [#uses=1]
  %147 = add i32 %146, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %148 = inttoptr i32 %147 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %149 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %148, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %150 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %149, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %151 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %150, i32 0, i32 5 ; <i8**> [#uses=3]
  %152 = load i8** %151, align 4                  ; <i8*> [#uses=2]
  %153 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %150, i32 0, i32 6 ; <i8**> [#uses=1]
  %154 = load i8** %153, align 4                  ; <i8*> [#uses=1]
  %155 = icmp ult i8* %152, %154                  ; <i1> [#uses=1]
  br i1 %155, label %bb.i2.i.i, label %bb1.i.i.i

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %112, i8* %152, align 1
  %156 = load i8** %151, align 4                  ; <i8*> [#uses=1]
  %157 = getelementptr inbounds i8* %156, i32 1   ; <i8*> [#uses=1]
  store i8* %157, i8** %151, align 4
  %158 = zext i8 %112 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i:                                        ; preds = %invcont1.i.i
  %159 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %150, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %160 = load i32 (...)*** %159, align 4          ; <i32 (...)**> [#uses=1]
  %161 = getelementptr inbounds i32 (...)** %160, i32 13 ; <i32 (...)**> [#uses=1]
  %162 = load i32 (...)** %161, align 4           ; <i32 (...)*> [#uses=1]
  %163 = zext i8 %112 to i32                      ; <i32> [#uses=1]
  %164 = bitcast i32 (...)* %162 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %165 = invoke i32 %164(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %150, i32 %163)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i, %bb.i2.i.i
  %166 = phi i32 [ %158, %bb.i2.i.i ], [ %165, %bb1.i.i.i ] ; <i32> [#uses=1]
  %167 = icmp eq i32 %166, -1                     ; <i1> [#uses=1]
  br i1 %167, label %bb14.i.i, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %168 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %169 = getelementptr inbounds i32 (...)** %168, i32 -3 ; <i32 (...)**> [#uses=1]
  %170 = bitcast i32 (...)** %169 to i32*         ; <i32*> [#uses=1]
  %171 = load i32* %170, align 4                  ; <i32> [#uses=1]
  %172 = add i32 %171, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %173 = inttoptr i32 %172 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %174 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %173, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %175 = load i32* %174, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %175, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %174
  %176 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %173, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %177 = load i32* %176, align 4                  ; <i32> [#uses=1]
  %178 = and i32 %storemerge.i.i.i, %177          ; <i32> [#uses=1]
  %179 = icmp eq i32 %178, 0                      ; <i1> [#uses=1]
  br i1 %179, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
  unreachable

lpad.i.i:                                         ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %180 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %181 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %182 = getelementptr inbounds i32 (...)** %181, i32 -3 ; <i32 (...)**> [#uses=1]
  %183 = bitcast i32 (...)** %182 to i32*         ; <i32*> [#uses=1]
  %184 = load i32* %183, align 4                  ; <i32> [#uses=1]
  %185 = add i32 %184, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %186 = inttoptr i32 %185 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %187 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %186, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %188 = load i32* %187, align 4                  ; <i32> [#uses=1]
  %189 = or i32 %188, 1                           ; <i32> [#uses=1]
  store i32 %189, i32* %187, align 4
  %190 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %186, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %191 = load i32* %190, align 4                  ; <i32> [#uses=1]
  %192 = and i32 %191, 1                          ; <i32> [#uses=1]
  %193 = icmp eq i32 %192, 0                      ; <i1> [#uses=1]
  br i1 %193, label %bb11.i.i, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i unwind label %lpad33.i.i

.noexc.i.i:                                       ; preds = %bb.i.i.i2
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i2
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

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %bb14.i.i, %bb11.i.i, %invcont2.i.i, %invcont.i.i
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
  tail call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
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
