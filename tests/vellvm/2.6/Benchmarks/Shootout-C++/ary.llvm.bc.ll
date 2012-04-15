; ModuleID = 'ary.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%"struct.__gnu_cxx::new_allocator<int>" = type <{ i8 }>
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
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }

@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<int>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<int>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
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
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._10*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._10*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._10*)* @pthread_mutexattr_init ; <i32 (%struct..0._10*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._10*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._10*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._10*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._10*)*> [#uses=0]

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %1 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %1, label %bb3, label %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12

bb3:                                              ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = tail call i32 @atoi(i8* %3) nounwind readonly ; <i32> [#uses=2]
  %5 = icmp ugt i32 %4, 1073741823                ; <i1> [#uses=1]
  br i1 %5, label %bb.i.i.i.i.i10, label %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12

bb.i.i.i.i.i10:                                   ; preds = %bb3
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i11 unwind label %lpad.i.i.i15

.noexc.i.i.i11:                                   ; preds = %bb.i.i.i.i.i10
  unreachable

_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12: ; preds = %bb3, %entry
  %iftmp.98.0.reg2mem.0 = phi i32 [ %4, %bb3 ], [ 9000000, %entry ] ; <i32> [#uses=8]
  %6 = shl i32 %iftmp.98.0.reg2mem.0, 2           ; <i32> [#uses=3]
  %7 = invoke i8* @_Znwj(i32 %6)
          to label %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16 unwind label %lpad.i.i.i15 ; <i8*> [#uses=7]

lpad.i.i.i15:                                     ; preds = %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12, %bb.i.i.i.i.i10
  %eh_ptr.i.i.i13 = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i14 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i13, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i13)
          to label %.noexc26 unwind label %lpad

.noexc26:                                         ; preds = %lpad.i.i.i15
  unreachable

_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16:  ; preds = %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12
  %8 = icmp eq i32 %iftmp.98.0.reg2mem.0, 0       ; <i1> [#uses=2]
  br i1 %8, label %bb5, label %bb.i.i.i.i.i.i.i23

bb.i.i.i.i.i.i.i23:                               ; preds = %bb.i.i.i.i.i.i.i23, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16
  %indvar.i.i.i.i.i.i.i17 = phi i32 [ %indvar.next.i.i.i.i.i.i.i21, %bb.i.i.i.i.i.i.i23 ], [ 0, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16 ] ; <i32> [#uses=2]
  %tmp = shl i32 %indvar.i.i.i.i.i.i.i17, 2       ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %7, i32 %tmp       ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i20 = bitcast i8* %scevgep to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %__first_addr.02.i.i.i.i.i.i.i20, align 4
  %indvar.next.i.i.i.i.i.i.i21 = add i32 %indvar.i.i.i.i.i.i.i17, 1 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i.i.i.i.i.i.i21, %iftmp.98.0.reg2mem.0 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb.i.i.i.i.i.i.i23

bb5:                                              ; preds = %bb.i.i.i.i.i.i.i23, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16
  %9 = invoke i8* @_Znwj(i32 %6)
          to label %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i unwind label %lpad.i.i.i ; <i8*> [#uses=7]

lpad.i.i.i:                                       ; preds = %bb5
  %eh_ptr.i.i.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc unwind label %lpad40

.noexc:                                           ; preds = %lpad.i.i.i
  unreachable

_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i:    ; preds = %bb5
  %10 = bitcast i8* %9 to i32*                    ; <i32*> [#uses=1]
  br i1 %8, label %bb12.preheader, label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i
  %indvar.i.i.i.i.i.i.i = phi i32 [ %indvar.next.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i ], [ 0, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i ] ; <i32> [#uses=2]
  %tmp35 = shl i32 %indvar.i.i.i.i.i.i.i, 2       ; <i32> [#uses=1]
  %scevgep36 = getelementptr i8* %9, i32 %tmp35   ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i = bitcast i8* %scevgep36 to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %__first_addr.02.i.i.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i.i.i = add i32 %indvar.i.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond34 = icmp eq i32 %indvar.next.i.i.i.i.i.i.i, %iftmp.98.0.reg2mem.0 ; <i1> [#uses=1]
  br i1 %exitcond34, label %bb12.preheader, label %bb.i.i.i.i.i.i.i

bb12.preheader:                                   ; preds = %bb.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i
  %11 = icmp sgt i32 %iftmp.98.0.reg2mem.0, 0     ; <i1> [#uses=1]
  br i1 %11, label %bb11, label %bb15.loopexit

bb11:                                             ; preds = %bb11, %bb12.preheader
  %12 = phi i32 [ %13, %bb11 ], [ 0, %bb12.preheader ] ; <i32> [#uses=3]
  %tmp50 = shl i32 %12, 2                         ; <i32> [#uses=1]
  %scevgep51 = getelementptr i8* %7, i32 %tmp50   ; <i8*> [#uses=1]
  %scevgep5152 = bitcast i8* %scevgep51 to i32*   ; <i32*> [#uses=1]
  store i32 %12, i32* %scevgep5152, align 4
  %13 = add nsw i32 %12, 1                        ; <i32> [#uses=2]
  %exitcond49 = icmp eq i32 %13, %iftmp.98.0.reg2mem.0 ; <i1> [#uses=1]
  br i1 %exitcond49, label %bb15.loopexit, label %bb11

bb.nph:                                           ; preds = %bb15.loopexit
  %tmp39 = add i32 %iftmp.98.0.reg2mem.0, -2      ; <i32> [#uses=1]
  %tmp43 = add i32 %6, -4                         ; <i32> [#uses=1]
  br label %bb14

bb14:                                             ; preds = %bb14, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb14 ] ; <i32> [#uses=3]
  %tmp41 = mul i32 %indvar, -4                    ; <i32> [#uses=1]
  %tmp44 = add i32 %tmp41, %tmp43                 ; <i32> [#uses=2]
  %scevgep45 = getelementptr i8* %7, i32 %tmp44   ; <i8*> [#uses=1]
  %scevgep4546 = bitcast i8* %scevgep45 to i32*   ; <i32*> [#uses=1]
  %scevgep47 = getelementptr i8* %9, i32 %tmp44   ; <i8*> [#uses=1]
  %scevgep4748 = bitcast i8* %scevgep47 to i32*   ; <i32*> [#uses=1]
  %14 = load i32* %scevgep4546, align 4           ; <i32> [#uses=1]
  store i32 %14, i32* %scevgep4748, align 4
  %i.0 = sub i32 %tmp39, %indvar                  ; <i32> [#uses=1]
  %15 = icmp slt i32 %i.0, 0                      ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %15, label %invcont17, label %bb14

bb15.loopexit:                                    ; preds = %bb11, %bb12.preheader
  %i.029 = add i32 %iftmp.98.0.reg2mem.0, -1      ; <i32> [#uses=2]
  %16 = icmp slt i32 %i.029, 0                    ; <i1> [#uses=1]
  br i1 %16, label %invcont17, label %bb.nph

invcont17:                                        ; preds = %bb15.loopexit, %bb14
  %17 = getelementptr inbounds i32* %10, i32 %i.029 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %19, align 8
  %20 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %20, align 4
  %21 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %22 = getelementptr inbounds i32 (...)** %21, i32 -3 ; <i32 (...)**> [#uses=1]
  %23 = bitcast i32 (...)** %22 to i32*           ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = add i32 %24, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %26 = inttoptr i32 %25 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %27 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %26, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %28 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %27, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %29 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %28, null ; <i1> [#uses=1]
  br i1 %29, label %bb9.i.i.i, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %invcont17
  %30 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %26, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 4                    ; <i32> [#uses=1]
  %32 = icmp eq i32 %31, 0                        ; <i1> [#uses=1]
  br i1 %32, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i2
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %28)
          to label %.noexc3 unwind label %lpad44

.noexc3:                                          ; preds = %bb8.i.i.i
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %.noexc3, %bb.i.i.i2, %invcont17
  %33 = phi i32 (...)** [ %.pre.i.i.i, %.noexc3 ], [ %21, %invcont17 ], [ %21, %bb.i.i.i2 ] ; <i32 (...)**> [#uses=1]
  %34 = getelementptr inbounds i32 (...)** %33, i32 -3 ; <i32 (...)**> [#uses=1]
  %35 = bitcast i32 (...)** %34 to i32*           ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=1]
  %37 = add i32 %36, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %38 = inttoptr i32 %37 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %39 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=2]
  %41 = icmp eq i32 %40, 0                        ; <i1> [#uses=1]
  br i1 %41, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %19, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %42 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %43 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %42, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %44 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %43, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %44, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %40 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %39
  %45 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %38, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %46 = load i32* %45, align 4                    ; <i32> [#uses=1]
  %47 = and i32 %storemerge.i.i.i.i, %46          ; <i32> [#uses=1]
  %48 = icmp eq i32 %47, 0                        ; <i1> [#uses=1]
  br i1 %48, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc4 unwind label %lpad44

.noexc4:                                          ; preds = %bb4.i.i.i.i.i
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %19, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb17.i, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %49 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %50 = getelementptr inbounds i32 (...)** %49, i32 -3 ; <i32 (...)**> [#uses=1]
  %51 = bitcast i32 (...)** %50 to i32*           ; <i32*> [#uses=1]
  %52 = load i32* %51, align 4                    ; <i32> [#uses=1]
  %53 = add i32 %52, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %54 = inttoptr i32 %53 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %55 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %54, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %56 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %55, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %57 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %56, null ; <i1> [#uses=1]
  br i1 %57, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %58 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %54, i32 0, i32 3 ; <i8*> [#uses=2]
  %59 = load i8* %58, align 1                     ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %59, 0                 ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx15 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %54, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx15.val = load %"struct.std::ctype<char>"** %.idx15 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %60 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx15.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %61 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %54, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %60, i8* %61, align 4
  store i8 1, i8* %58, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %62 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %49, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %63 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %54, i32 0, i32 2 ; <i8*> [#uses=1]
  %64 = load i8* %63, align 4                     ; <i8> [#uses=1]
  %65 = getelementptr inbounds i32 (...)** %62, i32 -3 ; <i32 (...)**> [#uses=1]
  %66 = bitcast i32 (...)** %65 to i32*           ; <i32*> [#uses=1]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=1]
  %68 = add i32 %67, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %69 = inttoptr i32 %68 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %70 = inttoptr i32 %68 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %71 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %70, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %72 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %71, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %72 to i32 ; <i32> [#uses=1]
  %73 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %72, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %74 = zext i32 %tmp.i to i64                    ; <i64> [#uses=1]
  %75 = zext i1 %73 to i64                        ; <i64> [#uses=1]
  %76 = shl i64 %75, 32                           ; <i64> [#uses=1]
  %77 = or i64 %76, %74                           ; <i64> [#uses=1]
  store i64 %77, i64* %tmp9.i, align 8
  %78 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %56, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %79 = load i32 (...)*** %78, align 4            ; <i32 (...)**> [#uses=1]
  %80 = getelementptr inbounds i32 (...)** %79, i32 3 ; <i32 (...)**> [#uses=1]
  %81 = load i32 (...)** %80, align 4             ; <i32 (...)*> [#uses=1]
  %82 = bitcast i32 (...)* %81 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %82(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %56, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %69, i8 signext %64, i32 %18)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %83 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %84 = load i8* %83, align 4                     ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %84, 0                  ; <i1> [#uses=1]
  br i1 %toBool4.i, label %bb17.i, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %bb17.i unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %85 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %86 = getelementptr inbounds i32 (...)** %85, i32 -3 ; <i32 (...)**> [#uses=1]
  %87 = bitcast i32 (...)** %86 to i32*           ; <i32*> [#uses=1]
  %88 = load i32* %87, align 4                    ; <i32> [#uses=1]
  %89 = add i32 %88, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %90 = inttoptr i32 %89 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %91 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %90, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %92 = load i32* %91, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %92, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %91
  %93 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %90, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %94 = load i32* %93, align 4                    ; <i32> [#uses=1]
  %95 = and i32 %storemerge.i.i, %94              ; <i32> [#uses=1]
  %96 = icmp eq i32 %95, 0                        ; <i1> [#uses=1]
  br i1 %96, label %bb17.i, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb15.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

bb17.i:                                           ; preds = %bb15.i, %bb12.i, %invcont3.i, %invcont.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont18 unwind label %lpad44

invcont21.i:                                      ; preds = %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
          to label %.noexc6 unwind label %lpad44

.noexc6:                                          ; preds = %invcont21.i
  unreachable

lpad.i:                                           ; preds = %bb4.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %97 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %98 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %99 = getelementptr inbounds i32 (...)** %98, i32 -3 ; <i32 (...)**> [#uses=1]
  %100 = bitcast i32 (...)** %99 to i32*          ; <i32*> [#uses=1]
  %101 = load i32* %100, align 4                  ; <i32> [#uses=1]
  %102 = add i32 %101, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %103 = inttoptr i32 %102 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %104 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %103, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %105 = load i32* %104, align 4                  ; <i32> [#uses=1]
  %106 = or i32 %105, 1                           ; <i32> [#uses=1]
  store i32 %106, i32* %104, align 4
  %107 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %103, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %108 = load i32* %107, align 4                  ; <i32> [#uses=1]
  %109 = and i32 %108, 1                          ; <i32> [#uses=1]
  %110 = icmp eq i32 %109, 0                      ; <i1> [#uses=1]
  br i1 %110, label %bb12.i, label %bb.i.i

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

invcont18:                                        ; preds = %bb17.i
  %111 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %112 = getelementptr inbounds i32 (...)** %111, i32 -3 ; <i32 (...)**> [#uses=1]
  %113 = bitcast i32 (...)** %112 to i32*         ; <i32*> [#uses=1]
  %114 = load i32* %113, align 4                  ; <i32> [#uses=1]
  %115 = add i32 %114, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %116 = inttoptr i32 %115 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %116, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %117 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10)
          to label %.noexc9 unwind label %lpad44  ; <i8> [#uses=3]

.noexc9:                                          ; preds = %invcont18
  %118 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %118, align 8
  %119 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %119, align 4
  %120 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %121 = getelementptr inbounds i32 (...)** %120, i32 -3 ; <i32 (...)**> [#uses=1]
  %122 = bitcast i32 (...)** %121 to i32*         ; <i32*> [#uses=1]
  %123 = load i32* %122, align 4                  ; <i32> [#uses=1]
  %124 = add i32 %123, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %125 = inttoptr i32 %124 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %126 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %125, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %127 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %126, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %128 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %127, null ; <i1> [#uses=1]
  br i1 %128, label %bb9.i.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %.noexc9
  %129 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %125, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %130 = load i32* %129, align 4                  ; <i32> [#uses=1]
  %131 = icmp eq i32 %130, 0                      ; <i1> [#uses=1]
  br i1 %131, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %127)
          to label %.noexc10 unwind label %lpad44

.noexc10:                                         ; preds = %bb8.i.i.i.i
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %.noexc10, %bb.i.i.i.i, %.noexc9
  %132 = phi i32 (...)** [ %.pre.i.i.i.i, %.noexc10 ], [ %120, %.noexc9 ], [ %120, %bb.i.i.i.i ] ; <i32 (...)**> [#uses=1]
  %133 = getelementptr inbounds i32 (...)** %132, i32 -3 ; <i32 (...)**> [#uses=1]
  %134 = bitcast i32 (...)** %133 to i32*         ; <i32*> [#uses=1]
  %135 = load i32* %134, align 4                  ; <i32> [#uses=1]
  %136 = add i32 %135, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %137 = inttoptr i32 %136 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %138 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %137, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %139 = load i32* %138, align 4                  ; <i32> [#uses=2]
  %140 = icmp eq i32 %139, 0                      ; <i1> [#uses=1]
  br i1 %140, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %118, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %141 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %137, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %142 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %141, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %143 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %142, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %143, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %139 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %138
  %144 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %137, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %145 = load i32* %144, align 4                  ; <i32> [#uses=1]
  %146 = and i32 %storemerge.i.i.i.i.i, %145      ; <i32> [#uses=1]
  %147 = icmp eq i32 %146, 0                      ; <i1> [#uses=1]
  br i1 %147, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc11 unwind label %lpad44

.noexc11:                                         ; preds = %bb4.i.i.i.i.i.i
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr26 = load i8* %118, align 8                 ; <i8> [#uses=1]
  %toBool.i.i7 = icmp eq i8 %.pr26, 0             ; <i1> [#uses=1]
  br i1 %toBool.i.i7, label %_ZNSo3putEc.exit.i, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %148 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %149 = getelementptr inbounds i32 (...)** %148, i32 -3 ; <i32 (...)**> [#uses=1]
  %150 = bitcast i32 (...)** %149 to i32*         ; <i32*> [#uses=1]
  %151 = load i32* %150, align 4                  ; <i32> [#uses=1]
  %152 = add i32 %151, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %153 = inttoptr i32 %152 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %154 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %153, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %155 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %154, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %156 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %155, i32 0, i32 5 ; <i8**> [#uses=3]
  %157 = load i8** %156, align 4                  ; <i8*> [#uses=2]
  %158 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %155, i32 0, i32 6 ; <i8**> [#uses=1]
  %159 = load i8** %158, align 4                  ; <i8*> [#uses=1]
  %160 = icmp ult i8* %157, %159                  ; <i1> [#uses=1]
  br i1 %160, label %bb.i2.i.i, label %bb1.i.i.i

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %117, i8* %157, align 1
  %161 = load i8** %156, align 4                  ; <i8*> [#uses=1]
  %162 = getelementptr inbounds i8* %161, i32 1   ; <i8*> [#uses=1]
  store i8* %162, i8** %156, align 4
  %163 = zext i8 %117 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i:                                        ; preds = %invcont1.i.i
  %164 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %155, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %165 = load i32 (...)*** %164, align 4          ; <i32 (...)**> [#uses=1]
  %166 = getelementptr inbounds i32 (...)** %165, i32 13 ; <i32 (...)**> [#uses=1]
  %167 = load i32 (...)** %166, align 4           ; <i32 (...)*> [#uses=1]
  %168 = zext i8 %117 to i32                      ; <i32> [#uses=1]
  %169 = bitcast i32 (...)* %167 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %170 = invoke i32 %169(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %155, i32 %168)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i, %bb.i2.i.i
  %171 = phi i32 [ %163, %bb.i2.i.i ], [ %170, %bb1.i.i.i ] ; <i32> [#uses=1]
  %172 = icmp eq i32 %171, -1                     ; <i1> [#uses=1]
  br i1 %172, label %bb14.i.i, label %_ZNSo3putEc.exit.i

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit.i unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %173 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %174 = getelementptr inbounds i32 (...)** %173, i32 -3 ; <i32 (...)**> [#uses=1]
  %175 = bitcast i32 (...)** %174 to i32*         ; <i32*> [#uses=1]
  %176 = load i32* %175, align 4                  ; <i32> [#uses=1]
  %177 = add i32 %176, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %178 = inttoptr i32 %177 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %179 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %178, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %180 = load i32* %179, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %180, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %179
  %181 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %178, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %182 = load i32* %181, align 4                  ; <i32> [#uses=1]
  %183 = and i32 %storemerge.i.i.i, %182          ; <i32> [#uses=1]
  %184 = icmp eq i32 %183, 0                      ; <i1> [#uses=1]
  br i1 %184, label %_ZNSo3putEc.exit.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc12 unwind label %lpad44

.noexc12:                                         ; preds = %invcont20.i.i
  unreachable

lpad.i.i:                                         ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %185 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %186 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %187 = getelementptr inbounds i32 (...)** %186, i32 -3 ; <i32 (...)**> [#uses=1]
  %188 = bitcast i32 (...)** %187 to i32*         ; <i32*> [#uses=1]
  %189 = load i32* %188, align 4                  ; <i32> [#uses=1]
  %190 = add i32 %189, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %191 = inttoptr i32 %190 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %192 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %191, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %193 = load i32* %192, align 4                  ; <i32> [#uses=1]
  %194 = or i32 %193, 1                           ; <i32> [#uses=1]
  store i32 %194, i32* %192, align 4
  %195 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %191, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %196 = load i32* %195, align 4                  ; <i32> [#uses=1]
  %197 = and i32 %196, 1                          ; <i32> [#uses=1]
  %198 = icmp eq i32 %197, 0                      ; <i1> [#uses=1]
  br i1 %198, label %bb11.i.i, label %bb.i.i.i8

bb.i.i.i8:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i unwind label %lpad33.i.i

.noexc.i.i:                                       ; preds = %bb.i.i.i8
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i8
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
          to label %.noexc13 unwind label %lpad44

.noexc13:                                         ; preds = %_ZNSo3putEc.exit.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
          to label %bb25 unwind label %lpad44

bb25:                                             ; preds = %.noexc13
  %199 = icmp eq i8* %9, null                     ; <i1> [#uses=1]
  br i1 %199, label %bb32, label %bb.i.i.i7

bb.i.i.i7:                                        ; preds = %bb25
  tail call void @_ZdlPv(i8* %9) nounwind
  br label %bb32

bb32:                                             ; preds = %bb.i.i.i7, %bb25
  %200 = icmp eq i8* %7, null                     ; <i1> [#uses=1]
  br i1 %200, label %_ZNSt6vectorIiSaIiEED1Ev.exit6, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb32
  tail call void @_ZdlPv(i8* %7) nounwind
  ret i32 0

_ZNSt6vectorIiSaIiEED1Ev.exit6:                   ; preds = %bb32
  ret i32 0

lpad:                                             ; preds = %lpad.i.i.i15
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select35 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %Unwind

lpad40:                                           ; preds = %lpad.i.i.i
  %eh_ptr41 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select43 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr41, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad56

lpad44:                                           ; preds = %.noexc13, %_ZNSo3putEc.exit.i, %invcont20.i.i, %bb4.i.i.i.i.i.i, %bb8.i.i.i.i, %invcont18, %invcont21.i, %bb17.i, %bb4.i.i.i.i.i, %bb8.i.i.i
  %eh_ptr45 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=3]
  %eh_select47 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr45, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %201 = icmp eq i8* %9, null                     ; <i1> [#uses=1]
  br i1 %201, label %ppad56, label %bb.i.i.i1

bb.i.i.i1:                                        ; preds = %lpad44
  tail call void @_ZdlPv(i8* %9) nounwind
  br label %ppad56

ppad56:                                           ; preds = %bb.i.i.i1, %lpad44, %lpad40
  %eh_exception.1 = phi i8* [ %eh_ptr41, %lpad40 ], [ %eh_ptr45, %bb.i.i.i1 ], [ %eh_ptr45, %lpad44 ] ; <i8*> [#uses=2]
  %202 = icmp eq i8* %7, null                     ; <i1> [#uses=1]
  br i1 %202, label %Unwind, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %ppad56
  tail call void @_ZdlPv(i8* %7) nounwind
  br label %Unwind

Unwind:                                           ; preds = %bb.i.i.i, %ppad56, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_exception.1, %bb.i.i.i ], [ %eh_exception.1, %ppad56 ] ; <i8*> [#uses=1]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<int>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<int>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<int>"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<int>"*)

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZdlPv(i8*) nounwind

declare void @_ZSt9terminatev() noreturn nounwind

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

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._10*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._10*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._10*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._10*)
