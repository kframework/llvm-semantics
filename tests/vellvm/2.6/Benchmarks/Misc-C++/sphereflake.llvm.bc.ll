; ModuleID = 'sphereflake.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._44 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._44 }
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.basis_t = type { %struct.v_t, %struct.v_t, %struct.v_t }
%struct.hit_t = type { %struct.v_t, double }
%struct.locale_data = type opaque
%struct.node_t = type { %struct.hit_t, %struct.hit_t, i32 }
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%struct.ray_t = type { %struct.v_t, %struct.v_t }
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
%struct.v_t = type { double, double, double }

@_ZStL8__ioinit = internal global %"struct.std::ios_base::Init" zeroinitializer ; <%"struct.std::ios_base::Init"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@_ZL5light.0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@_ZL5light.1 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@_ZL5light.2 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=8]
@.str1 = private constant [2 x i8] c" \00", align 1 ; <[2 x i8]*> [#uses=1]
@_ZSt4cerr = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=7]
@.str2 = private constant [19 x i8] c" spheres,claiming \00", align 1 ; <[19 x i8]*> [#uses=1]
@.str3 = private constant [5 x i8] c" MB.\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str4 = private constant [4 x i8] c"P2\0A\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str5 = private constant [6 x i8] c"\0A256\0A\00", align 1 ; <[6 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_main }] ; <[1 x %0]*> [#uses=0]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._44*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._44*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._44*)* @pthread_mutexattr_init ; <i32 (%struct..0._44*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._44*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._44*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._44*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._44*)*> [#uses=0]

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %rgss.i = alloca [4 x %struct.v_t], align 8     ; <[4 x %struct.v_t]*> [#uses=15]
  %1 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb2

bb:                                               ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = call i32 @atoi(i8* %3) nounwind readonly   ; <i32> [#uses=2]
  %5 = icmp slt i32 %4, 2                         ; <i1> [#uses=1]
  %6 = select i1 %5, i32 2, i32 %4                ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.102.0 = phi i32 [ %6, %bb ], [ 6, %entry ] ; <i32> [#uses=3]
  %7 = add i32 %iftmp.102.0, -1                   ; <i32> [#uses=1]
  %8 = icmp sgt i32 %7, 1                         ; <i1> [#uses=1]
  br i1 %8, label %bb.nph, label %bb5

bb.nph:                                           ; preds = %bb2
  %tmp22 = add i32 %iftmp.102.0, -2               ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb3, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb3 ] ; <i32> [#uses=1]
  %count.015 = phi i32 [ 10, %bb.nph ], [ %phitmp, %bb3 ] ; <i32> [#uses=1]
  %9 = mul i32 %count.015, 9                      ; <i32> [#uses=1]
  %phitmp = add i32 %9, 1                         ; <i32> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond23 = icmp eq i32 %indvar.next, %tmp22  ; <i1> [#uses=1]
  br i1 %exitcond23, label %bb5, label %bb3

bb5:                                              ; preds = %bb3, %bb2
  %count.0.lcssa = phi i32 [ 10, %bb2 ], [ %phitmp, %bb3 ] ; <i32> [#uses=4]
  %10 = mul i32 %count.0.lcssa, 68                ; <i32> [#uses=2]
  %11 = uitofp i32 %10 to double                  ; <double> [#uses=1]
  %12 = fmul double %11, 0x3EB0000000000000       ; <double> [#uses=1]
  call fastcc void @_ZNSo9_M_insertIlEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 %count.0.lcssa)
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 18)
  %13 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %13, align 8
  %14 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %14, align 4
  %15 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %16 = getelementptr inbounds i32 (...)** %15, i32 -3 ; <i32 (...)**> [#uses=1]
  %17 = bitcast i32 (...)** %16 to i32*           ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = add i32 %18, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr to i32) ; <i32> [#uses=1]
  %20 = inttoptr i32 %19 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %22 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %21, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %23 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %22, null ; <i1> [#uses=1]
  br i1 %23, label %bb9.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb5
  %24 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %25 = load i32* %24, align 4                    ; <i32> [#uses=1]
  %26 = icmp eq i32 %25, 0                        ; <i1> [#uses=1]
  br i1 %26, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %22)
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i, %bb.i.i.i, %bb5
  %27 = phi i32 (...)** [ %.pre.i.i.i, %bb8.i.i.i ], [ %15, %bb5 ], [ %15, %bb.i.i.i ] ; <i32 (...)**> [#uses=1]
  %28 = getelementptr inbounds i32 (...)** %27, i32 -3 ; <i32 (...)**> [#uses=1]
  %29 = bitcast i32 (...)** %28 to i32*           ; <i32*> [#uses=1]
  %30 = load i32* %29, align 4                    ; <i32> [#uses=1]
  %31 = add i32 %30, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr to i32) ; <i32> [#uses=1]
  %32 = inttoptr i32 %31 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %33 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %32, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=2]
  %35 = icmp eq i32 %34, 0                        ; <i1> [#uses=1]
  br i1 %35, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %13, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %36 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %32, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %37 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %36, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %38 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %37, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %38, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %34 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %33
  %39 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %32, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = and i32 %storemerge.i.i.i.i, %40          ; <i32> [#uses=1]
  %42 = icmp eq i32 %41, 0                        ; <i1> [#uses=1]
  br i1 %42, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %13, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %_ZNSo9_M_insertIdEERSoT_.exit, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %43 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %44 = getelementptr inbounds i32 (...)** %43, i32 -3 ; <i32 (...)**> [#uses=1]
  %45 = bitcast i32 (...)** %44 to i32*           ; <i32*> [#uses=1]
  %46 = load i32* %45, align 4                    ; <i32> [#uses=1]
  %47 = add i32 %46, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr to i32) ; <i32> [#uses=1]
  %48 = inttoptr i32 %47 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %49 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %48, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %50 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %49, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %51 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %50, null ; <i1> [#uses=1]
  br i1 %51, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %52 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %48, i32 0, i32 3 ; <i8*> [#uses=2]
  %53 = load i8* %52, align 1                     ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %53, 0                 ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %48, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %54 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %55 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %48, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %54, i8* %55, align 4
  store i8 1, i8* %52, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %56 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %43, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %57 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %48, i32 0, i32 2 ; <i8*> [#uses=1]
  %58 = load i8* %57, align 4                     ; <i8> [#uses=1]
  %59 = getelementptr inbounds i32 (...)** %56, i32 -3 ; <i32 (...)**> [#uses=1]
  %60 = bitcast i32 (...)** %59 to i32*           ; <i32*> [#uses=1]
  %61 = load i32* %60, align 4                    ; <i32> [#uses=1]
  %62 = add i32 %61, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr to i32) ; <i32> [#uses=2]
  %63 = inttoptr i32 %62 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %64 = inttoptr i32 %62 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %65 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %64, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %66 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %65, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %66 to i32 ; <i32> [#uses=1]
  %67 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %66, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %68 = zext i32 %tmp.i to i64                    ; <i64> [#uses=1]
  %69 = zext i1 %67 to i64                        ; <i64> [#uses=1]
  %70 = shl i64 %69, 32                           ; <i64> [#uses=1]
  %71 = or i64 %70, %68                           ; <i64> [#uses=1]
  store i64 %71, i64* %tmp9.i, align 8
  %72 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %50, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %73 = load i32 (...)*** %72, align 4            ; <i32 (...)**> [#uses=1]
  %74 = getelementptr inbounds i32 (...)** %73, i32 7 ; <i32 (...)**> [#uses=1]
  %75 = load i32 (...)** %74, align 4             ; <i32 (...)*> [#uses=1]
  %76 = bitcast i32 (...)* %75 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, double)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, double)*> [#uses=1]
  invoke void %76(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %50, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %63, i8 signext %58, double %12)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %77 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %78 = load i8* %77, align 4                     ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %78, 0                  ; <i1> [#uses=1]
  br i1 %toBool4.i, label %_ZNSo9_M_insertIdEERSoT_.exit, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo9_M_insertIdEERSoT_.exit unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %79 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %80 = getelementptr inbounds i32 (...)** %79, i32 -3 ; <i32 (...)**> [#uses=1]
  %81 = bitcast i32 (...)** %80 to i32*           ; <i32*> [#uses=1]
  %82 = load i32* %81, align 4                    ; <i32> [#uses=1]
  %83 = add i32 %82, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr to i32) ; <i32> [#uses=1]
  %84 = inttoptr i32 %83 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %85 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %84, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %86 = load i32* %85, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %86, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %85
  %87 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %84, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %88 = load i32* %87, align 4                    ; <i32> [#uses=1]
  %89 = and i32 %storemerge.i.i, %88              ; <i32> [#uses=1]
  %90 = icmp eq i32 %89, 0                        ; <i1> [#uses=1]
  br i1 %90, label %_ZNSo9_M_insertIdEERSoT_.exit, label %bb4.i.i.i

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
  %91 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %92 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %93 = getelementptr inbounds i32 (...)** %92, i32 -3 ; <i32 (...)**> [#uses=1]
  %94 = bitcast i32 (...)** %93 to i32*           ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4                    ; <i32> [#uses=1]
  %96 = add i32 %95, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr to i32) ; <i32> [#uses=1]
  %97 = inttoptr i32 %96 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %98 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %97, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %99 = load i32* %98, align 4                    ; <i32> [#uses=1]
  %100 = or i32 %99, 1                            ; <i32> [#uses=1]
  store i32 %100, i32* %98, align 4
  %101 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %97, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = and i32 %102, 1                          ; <i32> [#uses=1]
  %104 = icmp eq i32 %103, 0                      ; <i1> [#uses=1]
  br i1 %104, label %bb12.i, label %bb.i.i

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
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr, i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i32 4)
  call fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cerr)
  %105 = call i8* @_Znaj(i32 %10)                 ; <i8*> [#uses=2]
  %106 = bitcast i8* %105 to [0 x %struct.node_t]* ; <[0 x %struct.node_t]*> [#uses=1]
  %107 = bitcast i8* %105 to %struct.node_t*      ; <%struct.node_t*> [#uses=4]
  %108 = getelementptr inbounds [0 x %struct.node_t]* %106, i32 0, i32 %count.0.lcssa ; <%struct.node_t*> [#uses=3]
  %109 = call fastcc %struct.node_t* @_ZL6createP6node_tii3v_tS1_d(%struct.node_t* %107, i32 %iftmp.102.0, i32 %count.0.lcssa, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x3FCBEE9056FB9C39, double 0x3FEBEE9056FB9C39, double 0xBFDBEE9056FB9C39, double 1.000000e+00) ; <%struct.node_t*> [#uses=0]
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 3)
  call fastcc void @_ZNSo9_M_insertIlEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 1024)
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), i32 1)
  call fastcc void @_ZNSo9_M_insertIlEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 1024)
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i32 5)
  %scevgep35.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  %scevgep36.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %scevgep3738.i = getelementptr inbounds [4 x %struct.v_t]* %rgss.i, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double -5.125000e+02, double* %scevgep3738.i, align 8
  store double 0xC080015555555555, double* %scevgep36.i, align 8
  store double 0.000000e+00, double* %scevgep35.i, align 8
  %scevgep35.1.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %scevgep36.1.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %scevgep3738.1.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  store double 0xC07FFD5555555555, double* %scevgep3738.1.i, align 8
  store double -5.125000e+02, double* %scevgep36.1.i, align 8
  store double 0.000000e+00, double* %scevgep35.1.i, align 8
  %scevgep35.2.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 2, i32 2 ; <double*> [#uses=1]
  %scevgep36.2.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 2, i32 1 ; <double*> [#uses=1]
  %scevgep3738.2.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 2, i32 0 ; <double*> [#uses=1]
  store double 0xC080015555555555, double* %scevgep3738.2.i, align 8
  store double -5.115000e+02, double* %scevgep36.2.i, align 8
  store double 0.000000e+00, double* %scevgep35.2.i, align 8
  %scevgep35.3.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 3, i32 2 ; <double*> [#uses=1]
  %scevgep36.3.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 3, i32 1 ; <double*> [#uses=1]
  %scevgep3738.3.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 3, i32 0 ; <double*> [#uses=1]
  store double -5.115000e+02, double* %scevgep3738.3.i, align 8
  store double 0xC07FFD5555555555, double* %scevgep36.3.i, align 8
  store double 0.000000e+00, double* %scevgep35.3.i, align 8
  %110 = icmp ult %struct.node_t* %107, %108      ; <i1> [#uses=1]
  br label %bb12.preheader.i

bb9.i:                                            ; preds = %bb10.preheader.i, %_ZL9ray_tracePK6node_tRK5ray_t.exit.i
  %idx.09.i = phi i32 [ 0, %bb10.preheader.i ], [ %298, %_ZL9ray_tracePK6node_tRK5ray_t.exit.i ] ; <i32> [#uses=4]
  %g.08.i = phi double [ 0.000000e+00, %bb10.preheader.i ], [ %297, %_ZL9ray_tracePK6node_tRK5ray_t.exit.i ] ; <double> [#uses=1]
  %scevgep29.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 %idx.09.i, i32 2 ; <double*> [#uses=1]
  %scevgep28.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 %idx.09.i, i32 1 ; <double*> [#uses=1]
  %scevgep27.i = getelementptr [4 x %struct.v_t]* %rgss.i, i32 0, i32 %idx.09.i, i32 0 ; <double*> [#uses=1]
  %111 = load double* %scevgep29.i, align 8       ; <double> [#uses=1]
  %112 = fadd double %111, 1.024000e+03           ; <double> [#uses=3]
  %113 = load double* %scevgep28.i, align 8       ; <double> [#uses=1]
  %114 = fadd double %scan.1.014.i, %113          ; <double> [#uses=3]
  %115 = load double* %scevgep27.i, align 8       ; <double> [#uses=1]
  %116 = fadd double %scan.0.111.i, %115          ; <double> [#uses=3]
  %117 = fmul double %116, %116                   ; <double> [#uses=1]
  %118 = fmul double %114, %114                   ; <double> [#uses=1]
  %119 = fadd double %117, %118                   ; <double> [#uses=1]
  %120 = fmul double %112, %112                   ; <double> [#uses=1]
  %121 = fadd double %119, %120                   ; <double> [#uses=1]
  %122 = call double @llvm.sqrt.f64(double %121) nounwind ; <double> [#uses=1]
  %123 = fdiv double 1.000000e+00, %122           ; <double> [#uses=3]
  %124 = fmul double %112, %123                   ; <double> [#uses=4]
  %125 = fmul double %114, %123                   ; <double> [#uses=4]
  %126 = fmul double %116, %123                   ; <double> [#uses=4]
  br i1 %110, label %bb.i1, label %_ZL9ray_tracePK6node_tRK5ray_t.exit.i

bb.i1:                                            ; preds = %bb5.backedge.i, %bb9.i
  %hit.i.i.0.0.2 = phi double [ %hit.i.i.0.0.1, %bb5.backedge.i ], [ 0.000000e+00, %bb9.i ] ; <double> [#uses=2]
  %hit.i.i.0.1.2 = phi double [ %hit.i.i.0.1.1, %bb5.backedge.i ], [ 0.000000e+00, %bb9.i ] ; <double> [#uses=2]
  %hit.i.i.0.2.2 = phi double [ %hit.i.i.0.2.1, %bb5.backedge.i ], [ 0.000000e+00, %bb9.i ] ; <double> [#uses=2]
  %hit.i.i.1.2 = phi double [ %hit.i.i.1.1, %bb5.backedge.i ], [ 0x7FF0000000000000, %bb9.i ] ; <double> [#uses=4]
  %p.09.i = phi %struct.node_t* [ %p.0.be.i, %bb5.backedge.i ], [ %107, %bb9.i ] ; <%struct.node_t*> [#uses=11]
  %127 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  %128 = load double* %127, align 4               ; <double> [#uses=1]
  %129 = fadd double %128, 4.500000e+00           ; <double> [#uses=3]
  %130 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %131 = load double* %130, align 4               ; <double> [#uses=3]
  %132 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %133 = load double* %132, align 4               ; <double> [#uses=3]
  %134 = fmul double %126, %133                   ; <double> [#uses=1]
  %135 = fmul double %125, %131                   ; <double> [#uses=1]
  %136 = fadd double %134, %135                   ; <double> [#uses=1]
  %137 = fmul double %124, %129                   ; <double> [#uses=1]
  %138 = fadd double %136, %137                   ; <double> [#uses=4]
  %139 = fmul double %138, %138                   ; <double> [#uses=1]
  %140 = fmul double %133, %133                   ; <double> [#uses=1]
  %141 = fmul double %131, %131                   ; <double> [#uses=1]
  %142 = fadd double %140, %141                   ; <double> [#uses=1]
  %143 = fmul double %129, %129                   ; <double> [#uses=1]
  %144 = fadd double %142, %143                   ; <double> [#uses=1]
  %145 = fsub double %139, %144                   ; <double> [#uses=1]
  %146 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %147 = load double* %146, align 4               ; <double> [#uses=2]
  %148 = fmul double %147, %147                   ; <double> [#uses=1]
  %149 = fadd double %145, %148                   ; <double> [#uses=2]
  %150 = fcmp olt double %149, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %150, label %_ZNK8sphere_t9intersectERK5ray_t.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i1
  %151 = call double @llvm.sqrt.f64(double %149) nounwind ; <double> [#uses=2]
  %152 = fadd double %138, %151                   ; <double> [#uses=2]
  %153 = fsub double %138, %151                   ; <double> [#uses=2]
  %154 = fcmp olt double %152, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %154, label %_ZNK8sphere_t9intersectERK5ray_t.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %155 = fcmp ogt double %153, 0.000000e+00       ; <i1> [#uses=1]
  %iftmp.88.0.i.i = select i1 %155, double %153, double %152 ; <double> [#uses=1]
  br label %_ZNK8sphere_t9intersectERK5ray_t.exit.i

_ZNK8sphere_t9intersectERK5ray_t.exit.i:          ; preds = %bb3.i.i, %bb1.i.i, %bb.i1
  %156 = phi double [ %iftmp.88.0.i.i, %bb3.i.i ], [ 0x7FF0000000000000, %bb.i1 ], [ 0x7FF0000000000000, %bb1.i.i ] ; <double> [#uses=1]
  %157 = fcmp ult double %156, %hit.i.i.1.2       ; <i1> [#uses=1]
  br i1 %157, label %bb2.i, label %bb1.i

bb1.i:                                            ; preds = %_ZNK8sphere_t9intersectERK5ray_t.exit.i
  %158 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 2 ; <i32*> [#uses=1]
  %159 = load i32* %158, align 4                  ; <i32> [#uses=1]
  %160 = getelementptr inbounds %struct.node_t* %p.09.i, i32 %159 ; <%struct.node_t*> [#uses=1]
  br label %bb5.backedge.i

bb5.backedge.i:                                   ; preds = %bb4.i, %bb1.i
  %hit.i.i.0.0.1 = phi double [ %hit.i.i.0.0.0, %bb4.i ], [ %hit.i.i.0.0.2, %bb1.i ] ; <double> [#uses=3]
  %hit.i.i.0.1.1 = phi double [ %hit.i.i.0.1.0, %bb4.i ], [ %hit.i.i.0.1.2, %bb1.i ] ; <double> [#uses=3]
  %hit.i.i.0.2.1 = phi double [ %hit.i.i.0.2.0, %bb4.i ], [ %hit.i.i.0.2.2, %bb1.i ] ; <double> [#uses=3]
  %hit.i.i.1.1 = phi double [ %hit.i.i.1.0, %bb4.i ], [ %hit.i.i.1.2, %bb1.i ] ; <double> [#uses=5]
  %p.0.be.i = phi %struct.node_t* [ %160, %bb1.i ], [ %206, %bb4.i ] ; <%struct.node_t*> [#uses=2]
  %161 = icmp ult %struct.node_t* %p.0.be.i, %108 ; <i1> [#uses=1]
  br i1 %161, label %bb.i1, label %_ZN6node_t9intersectILb0EEEvRK5ray_tR5hit_t.exit

bb2.i:                                            ; preds = %_ZNK8sphere_t9intersectERK5ray_t.exit.i
  %162 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 1, i32 0, i32 2 ; <double*> [#uses=1]
  %163 = load double* %162, align 4               ; <double> [#uses=2]
  %164 = fadd double %163, 4.500000e+00           ; <double> [#uses=3]
  %165 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 1, i32 0, i32 1 ; <double*> [#uses=1]
  %166 = load double* %165, align 4               ; <double> [#uses=4]
  %167 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 1, i32 0, i32 0 ; <double*> [#uses=1]
  %168 = load double* %167, align 4               ; <double> [#uses=4]
  %169 = fmul double %126, %168                   ; <double> [#uses=1]
  %170 = fmul double %125, %166                   ; <double> [#uses=1]
  %171 = fadd double %169, %170                   ; <double> [#uses=1]
  %172 = fmul double %124, %164                   ; <double> [#uses=1]
  %173 = fadd double %171, %172                   ; <double> [#uses=4]
  %174 = fmul double %173, %173                   ; <double> [#uses=1]
  %175 = fmul double %168, %168                   ; <double> [#uses=1]
  %176 = fmul double %166, %166                   ; <double> [#uses=1]
  %177 = fadd double %175, %176                   ; <double> [#uses=1]
  %178 = fmul double %164, %164                   ; <double> [#uses=1]
  %179 = fadd double %177, %178                   ; <double> [#uses=1]
  %180 = fsub double %174, %179                   ; <double> [#uses=1]
  %181 = getelementptr inbounds %struct.node_t* %p.09.i, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %182 = load double* %181, align 4               ; <double> [#uses=3]
  %183 = fmul double %182, %182                   ; <double> [#uses=1]
  %184 = fadd double %180, %183                   ; <double> [#uses=2]
  %185 = fcmp olt double %184, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %185, label %_ZNK8sphere_t9intersectERK5ray_t.exit5.i, label %bb1.i1.i

bb1.i1.i:                                         ; preds = %bb2.i
  %186 = call double @llvm.sqrt.f64(double %184) nounwind ; <double> [#uses=2]
  %187 = fadd double %173, %186                   ; <double> [#uses=2]
  %188 = fsub double %173, %186                   ; <double> [#uses=2]
  %189 = fcmp olt double %187, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %189, label %_ZNK8sphere_t9intersectERK5ray_t.exit5.i, label %bb3.i3.i

bb3.i3.i:                                         ; preds = %bb1.i1.i
  %190 = fcmp ogt double %188, 0.000000e+00       ; <i1> [#uses=1]
  %iftmp.88.0.i2.i = select i1 %190, double %188, double %187 ; <double> [#uses=1]
  br label %_ZNK8sphere_t9intersectERK5ray_t.exit5.i

_ZNK8sphere_t9intersectERK5ray_t.exit5.i:         ; preds = %bb3.i3.i, %bb1.i1.i, %bb2.i
  %191 = phi double [ %iftmp.88.0.i2.i, %bb3.i3.i ], [ 0x7FF0000000000000, %bb2.i ], [ 0x7FF0000000000000, %bb1.i1.i ] ; <double> [#uses=5]
  %192 = fcmp ogt double %hit.i.i.1.2, %191       ; <i1> [#uses=1]
  br i1 %192, label %bb3.i, label %bb4.i

bb3.i:                                            ; preds = %_ZNK8sphere_t9intersectERK5ray_t.exit5.i
  %193 = fmul double %124, %191                   ; <double> [#uses=1]
  %194 = fmul double %125, %191                   ; <double> [#uses=1]
  %195 = fmul double %126, %191                   ; <double> [#uses=1]
  %196 = fadd double %193, -4.500000e+00          ; <double> [#uses=1]
  %197 = fadd double %194, 0.000000e+00           ; <double> [#uses=1]
  %198 = fadd double %195, 0.000000e+00           ; <double> [#uses=1]
  %199 = fdiv double 1.000000e+00, %182           ; <double> [#uses=3]
  %200 = fsub double %196, %163                   ; <double> [#uses=1]
  %201 = fsub double %197, %166                   ; <double> [#uses=1]
  %202 = fsub double %198, %168                   ; <double> [#uses=1]
  %203 = fmul double %200, %199                   ; <double> [#uses=1]
  %204 = fmul double %201, %199                   ; <double> [#uses=1]
  %205 = fmul double %202, %199                   ; <double> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i
  %hit.i.i.0.0.0 = phi double [ %205, %bb3.i ], [ %hit.i.i.0.0.2, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i ] ; <double> [#uses=1]
  %hit.i.i.0.1.0 = phi double [ %204, %bb3.i ], [ %hit.i.i.0.1.2, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i ] ; <double> [#uses=1]
  %hit.i.i.0.2.0 = phi double [ %203, %bb3.i ], [ %hit.i.i.0.2.2, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i ] ; <double> [#uses=1]
  %hit.i.i.1.0 = phi double [ %191, %bb3.i ], [ %hit.i.i.1.2, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i ] ; <double> [#uses=1]
  %206 = getelementptr inbounds %struct.node_t* %p.09.i, i32 1 ; <%struct.node_t*> [#uses=1]
  br label %bb5.backedge.i

_ZN6node_t9intersectILb0EEEvRK5ray_tR5hit_t.exit: ; preds = %bb5.backedge.i
  %207 = fcmp une double %hit.i.i.1.1, 0x7FF0000000000000 ; <i1> [#uses=1]
  br i1 %207, label %bb2.i.i, label %_ZL9ray_tracePK6node_tRK5ray_t.exit.i

bb2.i.i:                                          ; preds = %_ZN6node_t9intersectILb0EEEvRK5ray_tR5hit_t.exit
  %208 = fmul double %hit.i.i.0.0.1, %300         ; <double> [#uses=1]
  %209 = fmul double %hit.i.i.0.1.1, %301         ; <double> [#uses=1]
  %210 = fadd double %208, %209                   ; <double> [#uses=1]
  %211 = fmul double %hit.i.i.0.2.1, %302         ; <double> [#uses=1]
  %212 = fadd double %210, %211                   ; <double> [#uses=1]
  %213 = fsub double -0.000000e+00, %212          ; <double> [#uses=2]
  %214 = fcmp ugt double %213, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %214, label %bb4.i.i, label %_ZL9ray_tracePK6node_tRK5ray_t.exit.i

bb4.i.i:                                          ; preds = %bb2.i.i
  %215 = fmul double %hit.i.i.0.2.1, 1.000000e-12 ; <double> [#uses=1]
  %216 = fmul double %hit.i.i.0.1.1, 1.000000e-12 ; <double> [#uses=1]
  %217 = fmul double %hit.i.i.0.0.1, 1.000000e-12 ; <double> [#uses=1]
  %218 = fmul double %124, %hit.i.i.1.1           ; <double> [#uses=1]
  %219 = fmul double %125, %hit.i.i.1.1           ; <double> [#uses=1]
  %220 = fmul double %126, %hit.i.i.1.1           ; <double> [#uses=1]
  %221 = fadd double %218, -4.500000e+00          ; <double> [#uses=1]
  %222 = fadd double %219, 0.000000e+00           ; <double> [#uses=1]
  %223 = fadd double %220, 0.000000e+00           ; <double> [#uses=1]
  %224 = fadd double %221, %215                   ; <double> [#uses=2]
  %225 = fadd double %222, %216                   ; <double> [#uses=2]
  %226 = fadd double %223, %217                   ; <double> [#uses=2]
  br label %bb5.i

bb.i2:                                            ; preds = %bb5.i
  %227 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  %228 = load double* %227, align 4               ; <double> [#uses=1]
  %229 = fsub double %228, %224                   ; <double> [#uses=3]
  %230 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %231 = load double* %230, align 4               ; <double> [#uses=1]
  %232 = fsub double %231, %225                   ; <double> [#uses=3]
  %233 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %234 = load double* %233, align 4               ; <double> [#uses=1]
  %235 = fsub double %234, %226                   ; <double> [#uses=3]
  %236 = fmul double %235, %305                   ; <double> [#uses=1]
  %237 = fmul double %232, %304                   ; <double> [#uses=1]
  %238 = fadd double %236, %237                   ; <double> [#uses=1]
  %239 = fmul double %229, %303                   ; <double> [#uses=1]
  %240 = fadd double %238, %239                   ; <double> [#uses=4]
  %241 = fmul double %240, %240                   ; <double> [#uses=1]
  %242 = fmul double %235, %235                   ; <double> [#uses=1]
  %243 = fmul double %232, %232                   ; <double> [#uses=1]
  %244 = fadd double %242, %243                   ; <double> [#uses=1]
  %245 = fmul double %229, %229                   ; <double> [#uses=1]
  %246 = fadd double %244, %245                   ; <double> [#uses=1]
  %247 = fsub double %241, %246                   ; <double> [#uses=1]
  %248 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %249 = load double* %248, align 4               ; <double> [#uses=2]
  %250 = fmul double %249, %249                   ; <double> [#uses=1]
  %251 = fadd double %247, %250                   ; <double> [#uses=2]
  %252 = fcmp olt double %251, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %252, label %bb1.i7, label %bb1.i.i3

bb1.i.i3:                                         ; preds = %bb.i2
  %253 = call double @llvm.sqrt.f64(double %251) nounwind ; <double> [#uses=2]
  %254 = fadd double %240, %253                   ; <double> [#uses=2]
  %255 = fsub double %240, %253                   ; <double> [#uses=2]
  %256 = fcmp olt double %254, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %256, label %bb1.i7, label %_ZNK8sphere_t9intersectERK5ray_t.exit.i6

_ZNK8sphere_t9intersectERK5ray_t.exit.i6:         ; preds = %bb1.i.i3
  %257 = fcmp ogt double %255, 0.000000e+00       ; <i1> [#uses=1]
  %iftmp.88.0.i.i4 = select i1 %257, double %255, double %254 ; <double> [#uses=1]
  %phitmp21 = fcmp ult double %iftmp.88.0.i.i4, 0x7FF0000000000000 ; <i1> [#uses=1]
  br i1 %phitmp21, label %bb2.i8, label %bb1.i7

bb1.i7:                                           ; preds = %_ZNK8sphere_t9intersectERK5ray_t.exit.i6, %bb1.i.i3, %bb.i2
  %258 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 2 ; <i32*> [#uses=1]
  %259 = load i32* %258, align 4                  ; <i32> [#uses=1]
  %260 = getelementptr inbounds %struct.node_t* %p.0.i, i32 %259 ; <%struct.node_t*> [#uses=1]
  br label %bb5.i

bb2.i8:                                           ; preds = %_ZNK8sphere_t9intersectERK5ray_t.exit.i6
  %261 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 1, i32 0, i32 2 ; <double*> [#uses=1]
  %262 = load double* %261, align 4               ; <double> [#uses=1]
  %263 = fsub double %262, %224                   ; <double> [#uses=3]
  %264 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 1, i32 0, i32 1 ; <double*> [#uses=1]
  %265 = load double* %264, align 4               ; <double> [#uses=1]
  %266 = fsub double %265, %225                   ; <double> [#uses=3]
  %267 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 1, i32 0, i32 0 ; <double*> [#uses=1]
  %268 = load double* %267, align 4               ; <double> [#uses=1]
  %269 = fsub double %268, %226                   ; <double> [#uses=3]
  %270 = fmul double %269, %305                   ; <double> [#uses=1]
  %271 = fmul double %266, %304                   ; <double> [#uses=1]
  %272 = fadd double %270, %271                   ; <double> [#uses=1]
  %273 = fmul double %263, %303                   ; <double> [#uses=1]
  %274 = fadd double %272, %273                   ; <double> [#uses=4]
  %275 = fmul double %274, %274                   ; <double> [#uses=1]
  %276 = fmul double %269, %269                   ; <double> [#uses=1]
  %277 = fmul double %266, %266                   ; <double> [#uses=1]
  %278 = fadd double %276, %277                   ; <double> [#uses=1]
  %279 = fmul double %263, %263                   ; <double> [#uses=1]
  %280 = fadd double %278, %279                   ; <double> [#uses=1]
  %281 = fsub double %275, %280                   ; <double> [#uses=1]
  %282 = getelementptr inbounds %struct.node_t* %p.0.i, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %283 = load double* %282, align 4               ; <double> [#uses=2]
  %284 = fmul double %283, %283                   ; <double> [#uses=1]
  %285 = fadd double %281, %284                   ; <double> [#uses=2]
  %286 = fcmp olt double %285, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %286, label %bb4.i14, label %bb1.i1.i9

bb1.i1.i9:                                        ; preds = %bb2.i8
  %287 = call double @llvm.sqrt.f64(double %285) nounwind ; <double> [#uses=2]
  %288 = fadd double %274, %287                   ; <double> [#uses=2]
  %289 = fsub double %274, %287                   ; <double> [#uses=2]
  %290 = fcmp olt double %288, 0.000000e+00       ; <i1> [#uses=1]
  br i1 %290, label %bb4.i14, label %_ZNK8sphere_t9intersectERK5ray_t.exit5.i12

_ZNK8sphere_t9intersectERK5ray_t.exit5.i12:       ; preds = %bb1.i1.i9
  %291 = fcmp ogt double %289, 0.000000e+00       ; <i1> [#uses=1]
  %iftmp.88.0.i2.i10 = select i1 %291, double %289, double %288 ; <double> [#uses=2]
  %292 = fcmp olt double %iftmp.88.0.i2.i10, 0x7FF0000000000000 ; <i1> [#uses=1]
  br i1 %292, label %_ZN6node_t9intersectILb1EEEvRK5ray_tR5hit_t.exit, label %bb4.i14

bb4.i14:                                          ; preds = %_ZNK8sphere_t9intersectERK5ray_t.exit5.i12, %bb1.i1.i9, %bb2.i8
  %293 = getelementptr inbounds %struct.node_t* %p.0.i, i32 1 ; <%struct.node_t*> [#uses=1]
  br label %bb5.i

bb5.i:                                            ; preds = %bb4.i14, %bb1.i7, %bb4.i.i
  %p.0.i = phi %struct.node_t* [ %107, %bb4.i.i ], [ %260, %bb1.i7 ], [ %293, %bb4.i14 ] ; <%struct.node_t*> [#uses=12]
  %294 = icmp ult %struct.node_t* %p.0.i, %108    ; <i1> [#uses=1]
  br i1 %294, label %bb.i2, label %_ZN6node_t9intersectILb1EEEvRK5ray_tR5hit_t.exit

_ZN6node_t9intersectILb1EEEvRK5ray_tR5hit_t.exit: ; preds = %bb5.i, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i12
  %shit.i.i.1.0 = phi double [ %iftmp.88.0.i2.i10, %_ZNK8sphere_t9intersectERK5ray_t.exit5.i12 ], [ 0x7FF0000000000000, %bb5.i ] ; <double> [#uses=1]
  %295 = fcmp oeq double %shit.i.i.1.0, 0x7FF0000000000000 ; <i1> [#uses=1]
  %iftmp.90.0.i.i = select i1 %295, double %213, double 0.000000e+00 ; <double> [#uses=1]
  br label %_ZL9ray_tracePK6node_tRK5ray_t.exit.i

_ZL9ray_tracePK6node_tRK5ray_t.exit.i:            ; preds = %_ZN6node_t9intersectILb1EEEvRK5ray_tR5hit_t.exit, %bb2.i.i, %_ZN6node_t9intersectILb0EEEvRK5ray_tR5hit_t.exit, %bb9.i
  %296 = phi double [ %iftmp.90.0.i.i, %_ZN6node_t9intersectILb1EEEvRK5ray_tR5hit_t.exit ], [ 0.000000e+00, %_ZN6node_t9intersectILb0EEEvRK5ray_tR5hit_t.exit ], [ 0.000000e+00, %bb2.i.i ], [ 0.000000e+00, %bb9.i ] ; <double> [#uses=1]
  %297 = fadd double %296, %g.08.i                ; <double> [#uses=2]
  %298 = add nsw i32 %idx.09.i, 1                 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %298, 4                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb10.bb11_crit_edge.i, label %bb9.i

bb10.bb11_crit_edge.i:                            ; preds = %_ZL9ray_tracePK6node_tRK5ray_t.exit.i
  %phitmp25.i = fmul double %297, 6.400000e+01    ; <double> [#uses=1]
  %phitmp26.i = fptosi double %phitmp25.i to i32  ; <i32> [#uses=1]
  call fastcc void @_ZNSo9_M_insertIlEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 %phitmp26.i)
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), i32 1)
  %299 = fadd double %scan.0.111.i, 1.000000e+00  ; <double> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond19 = icmp eq i32 %indvar.next.i, 1024  ; <i1> [#uses=1]
  br i1 %exitcond19, label %bb13.i, label %bb10.preheader.i

bb10.preheader.i:                                 ; preds = %bb12.preheader.i, %bb10.bb11_crit_edge.i
  %indvar.i = phi i32 [ 0, %bb12.preheader.i ], [ %indvar.next.i, %bb10.bb11_crit_edge.i ] ; <i32> [#uses=1]
  %scan.0.111.i = phi double [ 0.000000e+00, %bb12.preheader.i ], [ %299, %bb10.bb11_crit_edge.i ] ; <double> [#uses=2]
  %300 = load double* @_ZL5light.0, align 8       ; <double> [#uses=2]
  %301 = load double* @_ZL5light.1, align 8       ; <double> [#uses=2]
  %302 = load double* @_ZL5light.2, align 8       ; <double> [#uses=2]
  %303 = fsub double -0.000000e+00, %302          ; <double> [#uses=2]
  %304 = fsub double -0.000000e+00, %301          ; <double> [#uses=2]
  %305 = fsub double -0.000000e+00, %300          ; <double> [#uses=2]
  br label %bb9.i

bb13.i:                                           ; preds = %bb10.bb11_crit_edge.i
  %306 = fadd double %scan.1.014.i, -1.000000e+00 ; <double> [#uses=1]
  %indvar.next32.i = add i32 %indvar31.i, 1       ; <i32> [#uses=2]
  %exitcond20 = icmp eq i32 %indvar.next32.i, 1024 ; <i1> [#uses=1]
  br i1 %exitcond20, label %_ZL10trace_rgssii.exit, label %bb12.preheader.i

bb12.preheader.i:                                 ; preds = %bb13.i, %_ZNSo9_M_insertIdEERSoT_.exit
  %indvar31.i = phi i32 [ 0, %_ZNSo9_M_insertIdEERSoT_.exit ], [ %indvar.next32.i, %bb13.i ] ; <i32> [#uses=1]
  %scan.1.014.i = phi double [ 1.023000e+03, %_ZNSo9_M_insertIdEERSoT_.exit ], [ %306, %bb13.i ] ; <double> [#uses=2]
  br label %bb10.preheader.i

_ZL10trace_rgssii.exit:                           ; preds = %bb13.i
  call fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
  ret i32 0
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  store double 0xBFDA481A36CEBD67, double* @_ZL5light.0, align 8
  store double 0xBFE115443D3994B6, double* @_ZL5light.1, align 8
  store double 0x3FE7A74ACAED4410, double* @_ZL5light.2, align 8
  ret void
}

declare double @llvm.sqrt.f64(double) nounwind readonly

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

define internal fastcc void @_ZNSo9_M_insertIlEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %this, i32 %__v) {
entry:
  %__s = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %1 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %1, align 8
  %2 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* %this, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %2, align 4
  %3 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=6]
  %4 = load i32 (...)*** %3, align 4              ; <i32 (...)**> [#uses=3]
  %5 = getelementptr inbounds i32 (...)** %4, i32 -3 ; <i32 (...)**> [#uses=1]
  %6 = bitcast i32 (...)** %5 to i32*             ; <i32*> [#uses=1]
  %7 = load i32* %6, align 4                      ; <i32> [#uses=1]
  %8 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %this to i32 ; <i32> [#uses=6]
  %9 = add i32 %7, %8                             ; <i32> [#uses=1]
  %10 = inttoptr i32 %9 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %10, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %12 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %11, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %13 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %12, null ; <i1> [#uses=1]
  br i1 %13, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %14 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %10, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = icmp eq i32 %15, 0                        ; <i1> [#uses=1]
  br i1 %16, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %12)
  %.pre.i.i = load i32 (...)*** %3, align 4       ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i.i, %entry
  %17 = phi i32 (...)** [ %.pre.i.i, %bb8.i.i ], [ %4, %entry ], [ %4, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %18 = getelementptr inbounds i32 (...)** %17, i32 -3 ; <i32 (...)**> [#uses=1]
  %19 = bitcast i32 (...)** %18 to i32*           ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  %21 = add i32 %20, %8                           ; <i32> [#uses=1]
  %22 = inttoptr i32 %21 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %23 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %22, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=2]
  %25 = icmp eq i32 %24, 0                        ; <i1> [#uses=1]
  br i1 %25, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %1, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %26 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %22, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %27 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %26, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %28 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %27, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %28, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %24 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %23
  %29 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %22, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %30 = load i32* %29, align 4                    ; <i32> [#uses=1]
  %31 = and i32 %storemerge.i.i.i, %30            ; <i32> [#uses=1]
  %32 = icmp eq i32 %31, 0                        ; <i1> [#uses=1]
  br i1 %32, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %1, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb17, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %33 = load i32 (...)*** %3, align 4             ; <i32 (...)**> [#uses=2]
  %34 = getelementptr inbounds i32 (...)** %33, i32 -3 ; <i32 (...)**> [#uses=1]
  %35 = bitcast i32 (...)** %34 to i32*           ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=1]
  %37 = add i32 %36, %8                           ; <i32> [#uses=1]
  %38 = inttoptr i32 %37 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %39 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %40 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %39, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %41 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %40, null ; <i1> [#uses=1]
  br i1 %41, label %bb.i6, label %invcont1

bb.i6:                                            ; preds = %bb
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7 unwind label %lpad26

.noexc7:                                          ; preds = %bb.i6
  unreachable

invcont1:                                         ; preds = %bb
  %42 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 3 ; <i8*> [#uses=2]
  %43 = load i8* %42, align 1                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %43, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb.i4, label %invcont2

bb.i4:                                            ; preds = %invcont1
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %44 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5 unwind label %lpad26  ; <i8> [#uses=1]

.noexc5:                                          ; preds = %bb.i4
  %45 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %44, i8* %45, align 4
  store i8 1, i8* %42, align 1
  %.pre = load i32 (...)*** %3, align 4           ; <i32 (...)**> [#uses=1]
  br label %invcont2

invcont2:                                         ; preds = %.noexc5, %invcont1
  %46 = phi i32 (...)** [ %.pre, %.noexc5 ], [ %33, %invcont1 ] ; <i32 (...)**> [#uses=1]
  %47 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 2 ; <i8*> [#uses=1]
  %48 = load i8* %47, align 4                     ; <i8> [#uses=1]
  %49 = getelementptr inbounds i32 (...)** %46, i32 -3 ; <i32 (...)**> [#uses=1]
  %50 = bitcast i32 (...)** %49 to i32*           ; <i32*> [#uses=1]
  %51 = load i32* %50, align 4                    ; <i32> [#uses=1]
  %52 = add i32 %51, %8                           ; <i32> [#uses=2]
  %53 = inttoptr i32 %52 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %54 = inttoptr i32 %52 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %55 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %54, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %56 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %55, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %56 to i32 ; <i32> [#uses=1]
  %57 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %56, null ; <i1> [#uses=1]
  %tmp9 = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s to i64* ; <i64*> [#uses=1]
  %58 = zext i32 %tmp to i64                      ; <i64> [#uses=1]
  %59 = zext i1 %57 to i64                        ; <i64> [#uses=1]
  %60 = shl i64 %59, 32                           ; <i64> [#uses=1]
  %61 = or i64 %60, %58                           ; <i64> [#uses=1]
  store i64 %61, i64* %tmp9, align 8
  %62 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %40, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %63 = load i32 (...)*** %62, align 4            ; <i32 (...)**> [#uses=1]
  %64 = getelementptr inbounds i32 (...)** %63, i32 3 ; <i32 (...)**> [#uses=1]
  %65 = load i32 (...)** %64, align 4             ; <i32 (...)*> [#uses=1]
  %66 = bitcast i32 (...)* %65 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %66(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %40, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s, %"struct.std::ios_base"* %53, i8 signext %48, i32 %__v)
          to label %invcont3 unwind label %lpad26

invcont3:                                         ; preds = %invcont2
  %67 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %68 = load i8* %67, align 4                     ; <i8> [#uses=1]
  %toBool4 = icmp eq i8 %68, 0                    ; <i1> [#uses=1]
  br i1 %toBool4, label %bb17, label %bb15

bb12:                                             ; preds = %lpad26
  invoke void @__cxa_end_catch()
          to label %bb17 unwind label %lpad30

bb15:                                             ; preds = %invcont3
  %69 = load i32 (...)*** %3, align 4             ; <i32 (...)**> [#uses=1]
  %70 = getelementptr inbounds i32 (...)** %69, i32 -3 ; <i32 (...)**> [#uses=1]
  %71 = bitcast i32 (...)** %70 to i32*           ; <i32*> [#uses=1]
  %72 = load i32* %71, align 4                    ; <i32> [#uses=1]
  %73 = add i32 %72, %8                           ; <i32> [#uses=1]
  %74 = inttoptr i32 %73 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %75 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %74, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %76 = load i32* %75, align 4                    ; <i32> [#uses=1]
  %storemerge.i = or i32 %76, 1                   ; <i32> [#uses=2]
  store i32 %storemerge.i, i32* %75
  %77 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %74, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=1]
  %79 = and i32 %storemerge.i, %78                ; <i32> [#uses=1]
  %80 = icmp eq i32 %79, 0                        ; <i1> [#uses=1]
  br i1 %80, label %bb17, label %bb4.i.i

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
  %81 = call i8* @__cxa_begin_catch(i8* %eh_ptr27) nounwind ; <i8*> [#uses=0]
  %82 = load i32 (...)*** %3, align 4             ; <i32 (...)**> [#uses=1]
  %83 = getelementptr inbounds i32 (...)** %82, i32 -3 ; <i32 (...)**> [#uses=1]
  %84 = bitcast i32 (...)** %83 to i32*           ; <i32*> [#uses=1]
  %85 = load i32* %84, align 4                    ; <i32> [#uses=1]
  %86 = add i32 %85, %8                           ; <i32> [#uses=1]
  %87 = inttoptr i32 %86 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %88 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %87, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %89 = load i32* %88, align 4                    ; <i32> [#uses=1]
  %90 = or i32 %89, 1                             ; <i32> [#uses=1]
  store i32 %90, i32* %88, align 4
  %91 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %87, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %92 = load i32* %91, align 4                    ; <i32> [#uses=1]
  %93 = and i32 %92, 1                            ; <i32> [#uses=1]
  %94 = icmp eq i32 %93, 0                        ; <i1> [#uses=1]
  br i1 %94, label %bb12, label %bb.i

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

define internal fastcc %struct.node_t* @_ZL6createP6node_tii3v_tS1_d(%struct.node_t* %n, i32 %lvl, i32 %dist, double %c.0, double %c.1, double %c.2, double %d.0, double %d.1, double %d.2, double %r) nounwind {
entry:
  %0 = icmp eq %struct.node_t* %n, null           ; <i1> [#uses=1]
  br i1 %0, label %bb7, label %bb

bb:                                               ; preds = %entry
  %1 = fmul double %r, 2.000000e+00               ; <double> [#uses=1]
  %2 = icmp sgt i32 %lvl, 1                       ; <i1> [#uses=1]
  %iftmp.101.0 = select i1 %2, i32 %dist, i32 1   ; <i32> [#uses=1]
  %3 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %c.0, double* %3, align 4
  %4 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  store double %c.1, double* %4, align 4
  %5 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  store double %c.2, double* %5, align 4
  %6 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  store double %1, double* %6, align 4
  %7 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 1, i32 0, i32 0 ; <double*> [#uses=1]
  store double %c.0, double* %7, align 4
  %8 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 1, i32 0, i32 1 ; <double*> [#uses=1]
  store double %c.1, double* %8, align 4
  %9 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 1, i32 0, i32 2 ; <double*> [#uses=1]
  store double %c.2, double* %9, align 4
  %10 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  store double %r, double* %10, align 4
  %11 = getelementptr inbounds %struct.node_t* %n, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %iftmp.101.0, i32* %11, align 4
  br label %bb7

bb7:                                              ; preds = %bb, %entry
  %12 = getelementptr %struct.node_t* %n, i32 1   ; <%struct.node_t*> [#uses=2]
  %13 = icmp sgt i32 %lvl, 1                      ; <i1> [#uses=1]
  br i1 %13, label %bb9, label %bb16

bb9:                                              ; preds = %bb7
  %14 = add i32 %dist, -9                         ; <i32> [#uses=1]
  %15 = sdiv i32 %14, 9                           ; <i32> [#uses=2]
  %16 = icmp slt i32 %15, 1                       ; <i1> [#uses=1]
  %17 = select i1 %16, i32 1, i32 %15             ; <i32> [#uses=2]
  %18 = fmul double %d.0, %d.0                    ; <double> [#uses=1]
  %19 = fmul double %d.1, %d.1                    ; <double> [#uses=1]
  %20 = fadd double %18, %19                      ; <double> [#uses=1]
  %21 = fmul double %d.2, %d.2                    ; <double> [#uses=1]
  %22 = fadd double %20, %21                      ; <double> [#uses=1]
  %23 = call double @llvm.sqrt.f64(double %22) nounwind ; <double> [#uses=1]
  %24 = fdiv double 1.000000e+00, %23             ; <double> [#uses=3]
  %25 = fmul double %24, %d.2                     ; <double> [#uses=11]
  %26 = fmul double %24, %d.1                     ; <double> [#uses=11]
  %27 = fmul double %24, %d.0                     ; <double> [#uses=11]
  %28 = fmul double %27, %27                      ; <double> [#uses=3]
  %29 = fcmp une double %28, 1.000000e+00         ; <i1> [#uses=1]
  %30 = fmul double %26, %26                      ; <double> [#uses=3]
  %31 = fcmp une double %30, 1.000000e+00         ; <i1> [#uses=1]
  %32 = fmul double %25, %25                      ; <double> [#uses=3]
  %33 = fcmp une double %32, 1.000000e+00         ; <i1> [#uses=1]
  %34 = and i1 %31, %33                           ; <i1> [#uses=1]
  %35 = and i1 %34, %29                           ; <i1> [#uses=1]
  br i1 %35, label %bb.i, label %_ZN7basis_tC2ERK3v_t.exit

bb.i:                                             ; preds = %bb9
  %36 = fcmp ogt double %30, %28                  ; <i1> [#uses=1]
  br i1 %36, label %bb2.i, label %bb5.i

bb2.i:                                            ; preds = %bb.i
  %37 = fcmp ogt double %30, %32                  ; <i1> [#uses=1]
  br i1 %37, label %bb3.i, label %bb4.i

bb3.i:                                            ; preds = %bb2.i
  %38 = fsub double -0.000000e+00, %26            ; <double> [#uses=1]
  br label %_ZN7basis_tC2ERK3v_t.exit

bb4.i:                                            ; preds = %bb2.i
  %39 = fsub double -0.000000e+00, %25            ; <double> [#uses=1]
  br label %_ZN7basis_tC2ERK3v_t.exit

bb5.i:                                            ; preds = %bb.i
  %40 = fcmp ogt double %32, %28                  ; <i1> [#uses=1]
  br i1 %40, label %bb6.i, label %bb7.i

bb6.i:                                            ; preds = %bb5.i
  %41 = fsub double -0.000000e+00, %25            ; <double> [#uses=1]
  br label %_ZN7basis_tC2ERK3v_t.exit

bb7.i:                                            ; preds = %bb5.i
  %42 = fsub double -0.000000e+00, %27            ; <double> [#uses=1]
  br label %_ZN7basis_tC2ERK3v_t.exit

_ZN7basis_tC2ERK3v_t.exit:                        ; preds = %bb7.i, %bb6.i, %bb4.i, %bb3.i, %bb9
  %b.1.1.0 = phi double [ %38, %bb3.i ], [ %26, %bb4.i ], [ %26, %bb6.i ], [ %26, %bb7.i ], [ %27, %bb9 ] ; <double> [#uses=2]
  %b.1.2.0 = phi double [ %25, %bb3.i ], [ %39, %bb4.i ], [ %41, %bb6.i ], [ %25, %bb7.i ], [ %26, %bb9 ] ; <double> [#uses=2]
  %43 = phi double [ %42, %bb7.i ], [ %27, %bb6.i ], [ %27, %bb4.i ], [ %27, %bb3.i ], [ %25, %bb9 ] ; <double> [#uses=2]
  %44 = fmul double %27, %b.1.1.0                 ; <double> [#uses=1]
  %45 = fmul double %26, %43                      ; <double> [#uses=1]
  %46 = fsub double %44, %45                      ; <double> [#uses=4]
  %47 = fmul double %25, %43                      ; <double> [#uses=1]
  %48 = fmul double %27, %b.1.2.0                 ; <double> [#uses=1]
  %49 = fsub double %47, %48                      ; <double> [#uses=4]
  %50 = fmul double %26, %b.1.2.0                 ; <double> [#uses=1]
  %51 = fmul double %25, %b.1.1.0                 ; <double> [#uses=1]
  %52 = fsub double %50, %51                      ; <double> [#uses=4]
  %53 = fmul double %27, %49                      ; <double> [#uses=1]
  %54 = fmul double %26, %52                      ; <double> [#uses=1]
  %55 = fsub double %53, %54                      ; <double> [#uses=2]
  %56 = fmul double %25, %52                      ; <double> [#uses=1]
  %57 = fmul double %27, %46                      ; <double> [#uses=1]
  %58 = fsub double %56, %57                      ; <double> [#uses=2]
  %59 = fmul double %26, %46                      ; <double> [#uses=1]
  %60 = fmul double %25, %49                      ; <double> [#uses=1]
  %61 = fsub double %59, %60                      ; <double> [#uses=2]
  %62 = fdiv double %r, 3.000000e+00              ; <double> [#uses=3]
  %63 = fadd double %62, %r                       ; <double> [#uses=6]
  %64 = add i32 %lvl, -1                          ; <i32> [#uses=2]
  %65 = fmul double %d.2, -2.000000e-01           ; <double> [#uses=1]
  %66 = fmul double %d.1, -2.000000e-01           ; <double> [#uses=1]
  %67 = fmul double %d.0, -2.000000e-01           ; <double> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb10, %_ZN7basis_tC2ERK3v_t.exit
  %n_addr.069 = phi %struct.node_t* [ %12, %_ZN7basis_tC2ERK3v_t.exit ], [ %98, %bb10 ] ; <%struct.node_t*> [#uses=1]
  %i2.068 = phi i32 [ 0, %_ZN7basis_tC2ERK3v_t.exit ], [ %100, %bb10 ] ; <i32> [#uses=1]
  %a.067 = phi double [ 0.000000e+00, %_ZN7basis_tC2ERK3v_t.exit ], [ %99, %bb10 ] ; <double> [#uses=3]
  %68 = call double @cos(double %a.067) nounwind readonly ; <double> [#uses=3]
  %69 = fmul double %46, %68                      ; <double> [#uses=1]
  %70 = fmul double %49, %68                      ; <double> [#uses=1]
  %71 = fmul double %52, %68                      ; <double> [#uses=1]
  %72 = call double @sin(double %a.067) nounwind readonly ; <double> [#uses=3]
  %73 = fmul double %55, %72                      ; <double> [#uses=1]
  %74 = fmul double %58, %72                      ; <double> [#uses=1]
  %75 = fmul double %61, %72                      ; <double> [#uses=1]
  %76 = fadd double %65, %73                      ; <double> [#uses=1]
  %77 = fadd double %66, %74                      ; <double> [#uses=1]
  %78 = fadd double %67, %75                      ; <double> [#uses=1]
  %79 = fadd double %76, %69                      ; <double> [#uses=3]
  %80 = fadd double %77, %70                      ; <double> [#uses=3]
  %81 = fadd double %78, %71                      ; <double> [#uses=3]
  %82 = fmul double %81, %81                      ; <double> [#uses=1]
  %83 = fmul double %80, %80                      ; <double> [#uses=1]
  %84 = fadd double %82, %83                      ; <double> [#uses=1]
  %85 = fmul double %79, %79                      ; <double> [#uses=1]
  %86 = fadd double %84, %85                      ; <double> [#uses=1]
  %87 = call double @llvm.sqrt.f64(double %86) nounwind ; <double> [#uses=1]
  %88 = fdiv double 1.000000e+00, %87             ; <double> [#uses=3]
  %89 = fmul double %79, %88                      ; <double> [#uses=2]
  %90 = fmul double %80, %88                      ; <double> [#uses=2]
  %91 = fmul double %81, %88                      ; <double> [#uses=2]
  %92 = fmul double %89, %63                      ; <double> [#uses=1]
  %93 = fmul double %90, %63                      ; <double> [#uses=1]
  %94 = fmul double %91, %63                      ; <double> [#uses=1]
  %95 = fadd double %92, %c.2                     ; <double> [#uses=1]
  %96 = fadd double %93, %c.1                     ; <double> [#uses=1]
  %97 = fadd double %94, %c.0                     ; <double> [#uses=1]
  %98 = call fastcc %struct.node_t* @_ZL6createP6node_tii3v_tS1_d(%struct.node_t* %n_addr.069, i32 %64, i32 %17, double %97, double %96, double %95, double %91, double %90, double %89, double %62) ; <%struct.node_t*> [#uses=2]
  %99 = fadd double %a.067, 0x3FF0C152382D7365    ; <double> [#uses=2]
  %100 = add nsw i32 %i2.068, 1                   ; <i32> [#uses=2]
  %exitcond77 = icmp eq i32 %100, 6               ; <i1> [#uses=1]
  br i1 %exitcond77, label %bb11.bb12_crit_edge, label %bb10

bb11.bb12_crit_edge:                              ; preds = %bb10
  %phitmp74 = fadd double %99, 0xBFD657184AE74487 ; <double> [#uses=1]
  %101 = fmul double %d.2, 6.000000e-01           ; <double> [#uses=1]
  %102 = fmul double %d.1, 6.000000e-01           ; <double> [#uses=1]
  %103 = fmul double %d.0, 6.000000e-01           ; <double> [#uses=1]
  br label %bb13

bb13:                                             ; preds = %bb13, %bb11.bb12_crit_edge
  %n_addr.165 = phi %struct.node_t* [ %98, %bb11.bb12_crit_edge ], [ %134, %bb13 ] ; <%struct.node_t*> [#uses=1]
  %i.064 = phi i32 [ 0, %bb11.bb12_crit_edge ], [ %136, %bb13 ] ; <i32> [#uses=1]
  %a.163 = phi double [ %phitmp74, %bb11.bb12_crit_edge ], [ %135, %bb13 ] ; <double> [#uses=3]
  %104 = call double @cos(double %a.163) nounwind readonly ; <double> [#uses=3]
  %105 = fmul double %46, %104                    ; <double> [#uses=1]
  %106 = fmul double %49, %104                    ; <double> [#uses=1]
  %107 = fmul double %52, %104                    ; <double> [#uses=1]
  %108 = call double @sin(double %a.163) nounwind readonly ; <double> [#uses=3]
  %109 = fmul double %55, %108                    ; <double> [#uses=1]
  %110 = fmul double %58, %108                    ; <double> [#uses=1]
  %111 = fmul double %61, %108                    ; <double> [#uses=1]
  %112 = fadd double %101, %109                   ; <double> [#uses=1]
  %113 = fadd double %102, %110                   ; <double> [#uses=1]
  %114 = fadd double %103, %111                   ; <double> [#uses=1]
  %115 = fadd double %112, %105                   ; <double> [#uses=3]
  %116 = fadd double %113, %106                   ; <double> [#uses=3]
  %117 = fadd double %114, %107                   ; <double> [#uses=3]
  %118 = fmul double %117, %117                   ; <double> [#uses=1]
  %119 = fmul double %116, %116                   ; <double> [#uses=1]
  %120 = fadd double %118, %119                   ; <double> [#uses=1]
  %121 = fmul double %115, %115                   ; <double> [#uses=1]
  %122 = fadd double %120, %121                   ; <double> [#uses=1]
  %123 = call double @llvm.sqrt.f64(double %122) nounwind ; <double> [#uses=1]
  %124 = fdiv double 1.000000e+00, %123           ; <double> [#uses=3]
  %125 = fmul double %115, %124                   ; <double> [#uses=2]
  %126 = fmul double %116, %124                   ; <double> [#uses=2]
  %127 = fmul double %117, %124                   ; <double> [#uses=2]
  %128 = fmul double %125, %63                    ; <double> [#uses=1]
  %129 = fmul double %126, %63                    ; <double> [#uses=1]
  %130 = fmul double %127, %63                    ; <double> [#uses=1]
  %131 = fadd double %128, %c.2                   ; <double> [#uses=1]
  %132 = fadd double %129, %c.1                   ; <double> [#uses=1]
  %133 = fadd double %130, %c.0                   ; <double> [#uses=1]
  %134 = call fastcc %struct.node_t* @_ZL6createP6node_tii3v_tS1_d(%struct.node_t* %n_addr.165, i32 %64, i32 %17, double %133, double %132, double %131, double %127, double %126, double %125, double %62) ; <%struct.node_t*> [#uses=2]
  %135 = fadd double %a.163, 0x4000C152382D7365   ; <double> [#uses=1]
  %136 = add nsw i32 %i.064, 1                    ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %136, 3                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb16, label %bb13

bb16:                                             ; preds = %bb13, %bb7
  %.0 = phi %struct.node_t* [ %12, %bb7 ], [ %134, %bb13 ] ; <%struct.node_t*> [#uses=1]
  ret %struct.node_t* %.0
}

declare double @cos(double) nounwind readonly

declare double @sin(double) nounwind readonly

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

define internal fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__os) {
entry:
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__os, i32 0, i32 0 ; <i32 (...)***> [#uses=6]
  %1 = load i32 (...)*** %0, align 4              ; <i32 (...)**> [#uses=1]
  %2 = getelementptr inbounds i32 (...)** %1, i32 -3 ; <i32 (...)**> [#uses=1]
  %3 = bitcast i32 (...)** %2 to i32*             ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__os to i32 ; <i32> [#uses=6]
  %6 = add i32 %4, %5                             ; <i32> [#uses=1]
  %7 = inttoptr i32 %6 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %8 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10) ; <i8> [#uses=3]
  %9 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %9, align 8
  %10 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* %__os, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %10, align 4
  %11 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=3]
  %12 = getelementptr inbounds i32 (...)** %11, i32 -3 ; <i32 (...)**> [#uses=1]
  %13 = bitcast i32 (...)** %12 to i32*           ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = add i32 %14, %5                           ; <i32> [#uses=1]
  %16 = inttoptr i32 %15 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %17 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %16, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %18 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %17, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %19 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %18, null ; <i1> [#uses=1]
  br i1 %19, label %bb9.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %entry
  %20 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %16, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=1]
  %22 = icmp eq i32 %21, 0                        ; <i1> [#uses=1]
  br i1 %22, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %18)
  %.pre.i.i.i = load i32 (...)*** %0, align 4     ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i, %bb.i.i.i, %entry
  %23 = phi i32 (...)** [ %.pre.i.i.i, %bb8.i.i.i ], [ %11, %entry ], [ %11, %bb.i.i.i ] ; <i32 (...)**> [#uses=1]
  %24 = getelementptr inbounds i32 (...)** %23, i32 -3 ; <i32 (...)**> [#uses=1]
  %25 = bitcast i32 (...)** %24 to i32*           ; <i32*> [#uses=1]
  %26 = load i32* %25, align 4                    ; <i32> [#uses=1]
  %27 = add i32 %26, %5                           ; <i32> [#uses=1]
  %28 = inttoptr i32 %27 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %29 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %28, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %30 = load i32* %29, align 4                    ; <i32> [#uses=2]
  %31 = icmp eq i32 %30, 0                        ; <i1> [#uses=1]
  br i1 %31, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %9, align 8
  br label %invcont1.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %32 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %28, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %33 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %32, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %34 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %33, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %34, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %30 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %29
  %35 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %28, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=1]
  %37 = and i32 %storemerge.i.i.i.i, %36          ; <i32> [#uses=1]
  %38 = icmp eq i32 %37, 0                        ; <i1> [#uses=1]
  br i1 %38, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %9, align 8                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %_ZNSo3putEc.exit, label %invcont1.i

invcont1.i:                                       ; preds = %invcont.i, %invcont.i.thread
  %39 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %40 = getelementptr inbounds i32 (...)** %39, i32 -3 ; <i32 (...)**> [#uses=1]
  %41 = bitcast i32 (...)** %40 to i32*           ; <i32*> [#uses=1]
  %42 = load i32* %41, align 4                    ; <i32> [#uses=1]
  %43 = add i32 %42, %5                           ; <i32> [#uses=1]
  %44 = inttoptr i32 %43 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %45 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %44, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %46 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %45, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %47 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %46, i32 0, i32 5 ; <i8**> [#uses=3]
  %48 = load i8** %47, align 4                    ; <i8*> [#uses=2]
  %49 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %46, i32 0, i32 6 ; <i8**> [#uses=1]
  %50 = load i8** %49, align 4                    ; <i8*> [#uses=1]
  %51 = icmp ult i8* %48, %50                     ; <i1> [#uses=1]
  br i1 %51, label %bb.i2.i, label %bb1.i.i

bb.i2.i:                                          ; preds = %invcont1.i
  store i8 %8, i8* %48, align 1
  %52 = load i8** %47, align 4                    ; <i8*> [#uses=1]
  %53 = getelementptr inbounds i8* %52, i32 1     ; <i8*> [#uses=1]
  store i8* %53, i8** %47, align 4
  %54 = zext i8 %8 to i32                         ; <i32> [#uses=1]
  br label %invcont2.i

bb1.i.i:                                          ; preds = %invcont1.i
  %55 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %46, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %56 = load i32 (...)*** %55, align 4            ; <i32 (...)**> [#uses=1]
  %57 = getelementptr inbounds i32 (...)** %56, i32 13 ; <i32 (...)**> [#uses=1]
  %58 = load i32 (...)** %57, align 4             ; <i32 (...)*> [#uses=1]
  %59 = zext i8 %8 to i32                         ; <i32> [#uses=1]
  %60 = bitcast i32 (...)* %58 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %61 = invoke i32 %60(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %46, i32 %59)
          to label %invcont2.i unwind label %lpad25.i ; <i32> [#uses=1]

invcont2.i:                                       ; preds = %bb1.i.i, %bb.i2.i
  %62 = phi i32 [ %54, %bb.i2.i ], [ %61, %bb1.i.i ] ; <i32> [#uses=1]
  %63 = icmp eq i32 %62, -1                       ; <i1> [#uses=1]
  br i1 %63, label %bb14.i, label %_ZNSo3putEc.exit

bb11.i:                                           ; preds = %lpad25.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit unwind label %lpad29.i

bb14.i:                                           ; preds = %invcont2.i
  %64 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %65 = getelementptr inbounds i32 (...)** %64, i32 -3 ; <i32 (...)**> [#uses=1]
  %66 = bitcast i32 (...)** %65 to i32*           ; <i32*> [#uses=1]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=1]
  %68 = add i32 %67, %5                           ; <i32> [#uses=1]
  %69 = inttoptr i32 %68 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %70 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %69, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %71, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %70
  %72 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %69, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %73 = load i32* %72, align 4                    ; <i32> [#uses=1]
  %74 = and i32 %storemerge.i.i, %73              ; <i32> [#uses=1]
  %75 = icmp eq i32 %74, 0                        ; <i1> [#uses=1]
  br i1 %75, label %_ZNSo3putEc.exit, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb14.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

invcont20.i:                                      ; preds = %ppad.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

lpad.i:                                           ; preds = %bb4.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select24.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad25.i:                                         ; preds = %bb1.i.i
  %eh_ptr26.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select28.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %76 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i) nounwind ; <i8*> [#uses=0]
  %77 = load i32 (...)*** %0, align 4             ; <i32 (...)**> [#uses=1]
  %78 = getelementptr inbounds i32 (...)** %77, i32 -3 ; <i32 (...)**> [#uses=1]
  %79 = bitcast i32 (...)** %78 to i32*           ; <i32*> [#uses=1]
  %80 = load i32* %79, align 4                    ; <i32> [#uses=1]
  %81 = add i32 %80, %5                           ; <i32> [#uses=1]
  %82 = inttoptr i32 %81 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %83 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %82, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %84 = load i32* %83, align 4                    ; <i32> [#uses=1]
  %85 = or i32 %84, 1                             ; <i32> [#uses=1]
  store i32 %85, i32* %83, align 4
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %82, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %88 = and i32 %87, 1                            ; <i32> [#uses=1]
  %89 = icmp eq i32 %88, 0                        ; <i1> [#uses=1]
  br i1 %89, label %bb11.i, label %bb.i.i

bb.i.i:                                           ; preds = %lpad25.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i unwind label %lpad33.i

.noexc.i:                                         ; preds = %bb.i.i
  unreachable

lpad29.i:                                         ; preds = %bb11.i
  %eh_ptr30.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select32.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad33.i:                                         ; preds = %bb.i.i
  %eh_ptr34.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select36.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr34.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad.i unwind label %lpad37.i

lpad37.i:                                         ; preds = %lpad33.i
  %eh_ptr38.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select40.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr38.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad41.i:                                         ; preds = %ppad.i
  %eh_ptr42.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select44.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr42.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i:                                           ; preds = %lpad33.i, %lpad29.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr30.i, %lpad29.i ], [ %eh_ptr34.i, %lpad33.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont20.i unwind label %lpad41.i

_ZNSo3putEc.exit:                                 ; preds = %bb14.i, %bb11.i, %invcont2.i, %invcont.i
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
  tail call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__os)
  ret void
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare i8* @_Znaj(i32)

declare extern_weak i32 @pthread_once(i32*, void ()*)

declare extern_weak i8* @pthread_getspecific(i32)

declare extern_weak i32 @pthread_setspecific(i32, i8*)

declare extern_weak i32 @pthread_create(i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)

declare extern_weak i32 @pthread_cancel(i32)

declare extern_weak i32 @pthread_mutex_lock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_trylock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._44*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._44*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._44*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._44*)
