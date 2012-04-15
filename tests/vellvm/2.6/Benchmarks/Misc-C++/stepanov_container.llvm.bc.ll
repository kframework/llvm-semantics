; ModuleID = 'stepanov_container.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%"struct.__gnu_cxx::new_allocator<double*>" = type <{ i8 }>
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Deque_base<double,std::allocator<double> >" = type { %"struct.std::_Deque_base<double,std::allocator<double> >::_Deque_impl" }
%"struct.std::_Deque_base<double,std::allocator<double> >::_Deque_impl" = type { double**, i32, %"struct.std::_Deque_iterator<double,double&,double*>", %"struct.std::_Deque_iterator<double,double&,double*>" }
%"struct.std::_Deque_iterator<double,double&,double*>" = type { double*, double*, double*, double** }
%"struct.std::_List_base<double,std::allocator<double> >" = type { %"struct.std::_List_base<double,std::allocator<double> >::_List_impl" }
%"struct.std::_List_base<double,std::allocator<double> >::_List_impl" = type { %"struct.std::_List_node_base" }
%"struct.std::_List_node_base" = type { %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"* }
%"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >" = type { %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >::_Rb_tree_impl<std::less<double>,false>" }
%"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >::_Rb_tree_impl<std::less<double>,false>" = type { %"struct.__gnu_cxx::new_allocator<double*>", %"struct.std::_Rb_tree_node_base", i32 }
%"struct.std::_Rb_tree_const_iterator<double>" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree_node<double>" = type { %"struct.std::_Rb_tree_node_base", double }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Vector_base<double,std::allocator<double> >" = type { %"struct.std::_Vector_base<double,std::allocator<double> >::_Vector_impl" }
%"struct.std::_Vector_base<double,std::allocator<double> >::_Vector_impl" = type { double*, double*, double* }
%"struct.std::deque<double,std::allocator<double> >" = type { %"struct.std::_Deque_base<double,std::allocator<double> >" }
%"struct.std::list<double,std::allocator<double> >" = type { %"struct.std::_List_base<double,std::allocator<double> >" }
%"struct.std::multiset<double,std::less<double>,std::allocator<double> >" = type { %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >" }
%"struct.std::pair<std::_Rb_tree_iterator<double>,bool>" = type { %"struct.std::_Rb_tree_const_iterator<double>", i8 }
%"struct.std::vector<double,std::allocator<double> >" = type { %"struct.std::_Vector_base<double,std::allocator<double> >" }

@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<double*>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<double*>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_result_times }] ; <[1 x %0]*> [#uses=0]

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

define internal void @_GLOBAL__I_result_times() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<double*>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  %1 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_1, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

define internal fastcc %"struct.std::_Rb_tree_node<double>"* @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x.0.2.val) nounwind readnone {
entry:
  %0 = bitcast %"struct.std::_Rb_tree_node_base"* %__x.0.2.val to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  ret %"struct.std::_Rb_tree_node<double>"* %0
}

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

define internal fastcc void @_ZSt13__heap_selectIPdEvT_S1_S1_(double* %__first, double* %__middle, double* %__last) nounwind {
entry:
  %0 = ptrtoint double* %__middle to i32          ; <i32> [#uses=1]
  %1 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=3]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb.i, label %_ZSt9make_heapIPdEvT_S1_.exit

bb.i:                                             ; preds = %entry
  %4 = ashr i32 %2, 3                             ; <i32> [#uses=4]
  %5 = add i32 %4, -2                             ; <i32> [#uses=1]
  %6 = sdiv i32 %5, 2                             ; <i32> [#uses=3]
  %tmp3.i = shl i32 %6, 1                         ; <i32> [#uses=2]
  %tmp5.i = add i32 %tmp3.i, 2                    ; <i32> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb2.i, %bb.i
  %indvar.i = phi i32 [ 0, %bb.i ], [ %indvar.next.i, %bb2.i ] ; <i32> [#uses=4]
  %__parent.0.i = sub i32 %6, %indvar.i           ; <i32> [#uses=4]
  %tmp2.i = mul i32 %indvar.i, -2                 ; <i32> [#uses=2]
  %__secondChild.1.in3.i.i = add i32 %tmp2.i, %tmp3.i ; <i32> [#uses=2]
  %__secondChild.15.i.i = add i32 %tmp2.i, %tmp5.i ; <i32> [#uses=3]
  %scevgep.i = getelementptr double* %__first, i32 %__parent.0.i ; <double*> [#uses=1]
  %7 = load double* %scevgep.i, align 4           ; <double> [#uses=2]
  %8 = icmp slt i32 %__secondChild.15.i.i, %4     ; <i1> [#uses=1]
  br i1 %8, label %bb.i.i7, label %bb4.i.i11

bb.i.i7:                                          ; preds = %bb.i.i7, %bb1.i
  %__secondChild.16.i.i1 = phi i32 [ %__secondChild.1.i.i6, %bb.i.i7 ], [ %__secondChild.15.i.i, %bb1.i ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i2 = phi i32 [ %phitmp.i.i5, %bb.i.i7 ], [ %__secondChild.1.in3.i.i, %bb1.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i3 = phi i32 [ %__secondChild.0.i.i4, %bb.i.i7 ], [ %__parent.0.i, %bb1.i ] ; <i32> [#uses=1]
  %9 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i1 ; <double*> [#uses=1]
  %10 = load double* %9, align 4                  ; <double> [#uses=1]
  %11 = or i32 %__secondChild.1.in4.i.i2, 1       ; <i32> [#uses=2]
  %12 = getelementptr inbounds double* %__first, i32 %11 ; <double*> [#uses=1]
  %13 = load double* %12, align 4                 ; <double> [#uses=1]
  %14 = fcmp olt double %10, %13                  ; <i1> [#uses=1]
  %__secondChild.0.i.i4 = select i1 %14, i32 %11, i32 %__secondChild.16.i.i1 ; <i32> [#uses=4]
  %15 = getelementptr inbounds double* %__first, i32 %__secondChild.0.i.i4 ; <double*> [#uses=1]
  %16 = load double* %15, align 4                 ; <double> [#uses=1]
  %17 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i3 ; <double*> [#uses=1]
  store double %16, double* %17, align 4
  %phitmp.i.i5 = shl i32 %__secondChild.0.i.i4, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i6 = add i32 %phitmp.i.i5, 2 ; <i32> [#uses=3]
  %18 = icmp slt i32 %__secondChild.1.i.i6, %4    ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i7, label %bb4.i.i11

bb4.i.i11:                                        ; preds = %bb.i.i7, %bb1.i
  %__secondChild.1.lcssa.i.i8 = phi i32 [ %__secondChild.15.i.i, %bb1.i ], [ %__secondChild.1.i.i6, %bb.i.i7 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i9 = phi i32 [ %__secondChild.1.in3.i.i, %bb1.i ], [ %phitmp.i.i5, %bb.i.i7 ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa.i.i10 = phi i32 [ %__parent.0.i, %bb1.i ], [ %__secondChild.0.i.i4, %bb.i.i7 ] ; <i32> [#uses=3]
  %19 = icmp eq i32 %__secondChild.1.lcssa.i.i8, %4 ; <i1> [#uses=1]
  br i1 %19, label %bb5.i.i12, label %bb1.i.i.i18

bb5.i.i12:                                        ; preds = %bb4.i.i11
  %20 = or i32 %__secondChild.1.in.lcssa.i.i9, 1  ; <i32> [#uses=3]
  %21 = getelementptr inbounds double* %__first, i32 %20 ; <double*> [#uses=1]
  %22 = load double* %21, align 4                 ; <double> [#uses=1]
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i10 ; <double*> [#uses=1]
  store double %22, double* %23, align 4
  br label %bb1.i.i.i18

bb.i.i.i13:                                       ; preds = %bb2.i.i.i19
  %24 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i14 ; <double*> [#uses=1]
  store double %27, double* %24, align 4
  br label %bb1.i.i.i18

bb1.i.i.i18:                                      ; preds = %bb.i.i.i13, %bb5.i.i12, %bb4.i.i11
  %__holeIndex_addr.0.i.i.i14 = phi i32 [ %__parent.0.i.i.i17, %bb.i.i.i13 ], [ %20, %bb5.i.i12 ], [ %__holeIndex_addr.0.lcssa.i.i10, %bb4.i.i11 ] ; <i32> [#uses=3]
  %__parent.0.in.in.i.i.i15 = phi i32 [ %__parent.0.i.i.i17, %bb.i.i.i13 ], [ %20, %bb5.i.i12 ], [ %__holeIndex_addr.0.lcssa.i.i10, %bb4.i.i11 ] ; <i32> [#uses=1]
  %__parent.0.in.i.i.i16 = add i32 %__parent.0.in.in.i.i.i15, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i17 = sdiv i32 %__parent.0.in.i.i.i16, 2 ; <i32> [#uses=3]
  %25 = icmp sgt i32 %__holeIndex_addr.0.i.i.i14, %__parent.0.i ; <i1> [#uses=1]
  br i1 %25, label %bb2.i.i.i19, label %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i

bb2.i.i.i19:                                      ; preds = %bb1.i.i.i18
  %26 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i17 ; <double*> [#uses=1]
  %27 = load double* %26, align 4                 ; <double> [#uses=2]
  %28 = fcmp olt double %27, %7                   ; <i1> [#uses=1]
  br i1 %28, label %bb.i.i.i13, label %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i

_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i:     ; preds = %bb2.i.i.i19, %bb1.i.i.i18
  %29 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i14 ; <double*> [#uses=1]
  store double %7, double* %29, align 4
  %30 = icmp eq i32 %6, %indvar.i                 ; <i1> [#uses=1]
  br i1 %30, label %_ZSt9make_heapIPdEvT_S1_.exit, label %bb2.i

bb2.i:                                            ; preds = %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb1.i

_ZSt9make_heapIPdEvT_S1_.exit:                    ; preds = %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i, %entry
  %31 = icmp ult double* %__middle, %__last       ; <i1> [#uses=1]
  br i1 %31, label %bb.nph, label %return

bb.nph:                                           ; preds = %_ZSt9make_heapIPdEvT_S1_.exit
  %32 = ashr i32 %2, 3                            ; <i32> [#uses=3]
  %33 = icmp sgt i32 %32, 2                       ; <i1> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb2, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %tmp, %bb2 ] ; <i32> [#uses=2]
  %__i.01 = getelementptr double* %__middle, i32 %indvar ; <double*> [#uses=2]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %__middle, i32 %tmp ; <double*> [#uses=1]
  %34 = load double* %__i.01, align 8             ; <double> [#uses=3]
  %35 = load double* %__first, align 8            ; <double> [#uses=2]
  %36 = fcmp olt double %34, %35                  ; <i1> [#uses=1]
  br i1 %36, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  store double %35, double* %__i.01, align 8
  br i1 %33, label %bb.i.i, label %bb4.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb1
  %__secondChild.16.i.i = phi i32 [ %__secondChild.1.i.i, %bb.i.i ], [ 2, %bb1 ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i = phi i32 [ %phitmp.i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i = phi i32 [ %__secondChild.0.i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=1]
  %37 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i ; <double*> [#uses=1]
  %38 = load double* %37, align 4                 ; <double> [#uses=1]
  %39 = or i32 %__secondChild.1.in4.i.i, 1        ; <i32> [#uses=2]
  %40 = getelementptr inbounds double* %__first, i32 %39 ; <double*> [#uses=1]
  %41 = load double* %40, align 4                 ; <double> [#uses=1]
  %42 = fcmp olt double %38, %41                  ; <i1> [#uses=1]
  %__secondChild.0.i.i = select i1 %42, i32 %39, i32 %__secondChild.16.i.i ; <i32> [#uses=4]
  %43 = getelementptr inbounds double* %__first, i32 %__secondChild.0.i.i ; <double*> [#uses=1]
  %44 = load double* %43, align 4                 ; <double> [#uses=1]
  %45 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i ; <double*> [#uses=1]
  store double %44, double* %45, align 4
  %phitmp.i.i = shl i32 %__secondChild.0.i.i, 1   ; <i32> [#uses=3]
  %__secondChild.1.i.i = add i32 %phitmp.i.i, 2   ; <i32> [#uses=3]
  %46 = icmp slt i32 %__secondChild.1.i.i, %32    ; <i1> [#uses=1]
  br i1 %46, label %bb.i.i, label %bb4.i.loopexit.i

bb4.i.loopexit.i:                                 ; preds = %bb.i.i
  %phitmp.i = or i32 %phitmp.i.i, 1               ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb4.i.loopexit.i, %bb1
  %__secondChild.1.lcssa.i.i = phi i32 [ %__secondChild.1.i.i, %bb4.i.loopexit.i ], [ 2, %bb1 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i = phi i32 [ %phitmp.i, %bb4.i.loopexit.i ], [ 1, %bb1 ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i = phi i32 [ %__secondChild.0.i.i, %bb4.i.loopexit.i ], [ 0, %bb1 ] ; <i32> [#uses=3]
  %47 = icmp eq i32 %__secondChild.1.lcssa.i.i, %32 ; <i1> [#uses=1]
  br i1 %47, label %bb5.i.i, label %bb1.i.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %48 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i ; <double*> [#uses=1]
  %49 = load double* %48, align 4                 ; <double> [#uses=1]
  %50 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i ; <double*> [#uses=1]
  store double %49, double* %50, align 4
  br label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb2.i.i.i
  %51 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %54, double* %51, align 4
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i, %bb5.i.i, %bb4.i.i
  %__holeIndex_addr.0.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.in.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %__parent.0.in.i.i.i = add i32 %__parent.0.in.in.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i = sdiv i32 %__parent.0.in.i.i.i, 2 ; <i32> [#uses=3]
  %52 = icmp sgt i32 %__holeIndex_addr.0.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %52, label %bb2.i.i.i, label %_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit

bb2.i.i.i:                                        ; preds = %bb1.i.i.i
  %53 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i ; <double*> [#uses=1]
  %54 = load double* %53, align 4                 ; <double> [#uses=2]
  %55 = fcmp olt double %54, %34                  ; <i1> [#uses=1]
  br i1 %55, label %bb.i.i.i, label %_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit

_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit:           ; preds = %bb2.i.i.i, %bb1.i.i.i
  %56 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %34, double* %56, align 4
  br label %bb2

bb2:                                              ; preds = %_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit, %bb
  %57 = icmp ult double* %scevgep, %__last        ; <i1> [#uses=1]
  br i1 %57, label %bb, label %return

return:                                           ; preds = %bb2, %_ZSt9make_heapIPdEvT_S1_.exit
  ret void
}

define internal fastcc void @_ZSt9sort_heapIPdEvT_S1_(double* %__first, double* %__last) nounwind {
entry:
  %0 = ptrtoint double* %__last to i32            ; <i32> [#uses=1]
  %1 = ptrtoint double* %__first to i32           ; <i32> [#uses=2]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %_ZSt8pop_heapIPdEvT_S1_.exit, %entry
  %indvar = phi i32 [ %indvar.next, %_ZSt8pop_heapIPdEvT_S1_.exit ], [ 0, %entry ] ; <i32> [#uses=2]
  %tmp2 = xor i32 %indvar, -1                     ; <i32> [#uses=1]
  %scevgep = getelementptr double* %__last, i32 %tmp2 ; <double*> [#uses=3]
  %4 = load double* %scevgep, align 4             ; <double> [#uses=2]
  %5 = load double* %__first, align 8             ; <double> [#uses=1]
  store double %5, double* %scevgep, align 8
  %6 = ptrtoint double* %scevgep to i32           ; <i32> [#uses=1]
  %7 = sub i32 %6, %1                             ; <i32> [#uses=2]
  %8 = ashr i32 %7, 3                             ; <i32> [#uses=3]
  %9 = icmp sgt i32 %8, 2                         ; <i1> [#uses=1]
  br i1 %9, label %bb.i.i.i, label %bb4.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %bb
  %__secondChild.16.i.i.i = phi i32 [ %__secondChild.1.i.i.i, %bb.i.i.i ], [ 2, %bb ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i.i = phi i32 [ %phitmp.i.i.i, %bb.i.i.i ], [ 0, %bb ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i.i = phi i32 [ %__secondChild.0.i.i.i, %bb.i.i.i ], [ 0, %bb ] ; <i32> [#uses=1]
  %10 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i.i ; <double*> [#uses=1]
  %11 = load double* %10, align 4                 ; <double> [#uses=1]
  %12 = or i32 %__secondChild.1.in4.i.i.i, 1      ; <i32> [#uses=2]
  %13 = getelementptr inbounds double* %__first, i32 %12 ; <double*> [#uses=1]
  %14 = load double* %13, align 4                 ; <double> [#uses=1]
  %15 = fcmp olt double %11, %14                  ; <i1> [#uses=1]
  %__secondChild.0.i.i.i = select i1 %15, i32 %12, i32 %__secondChild.16.i.i.i ; <i32> [#uses=4]
  %16 = getelementptr inbounds double* %__first, i32 %__secondChild.0.i.i.i ; <double*> [#uses=1]
  %17 = load double* %16, align 4                 ; <double> [#uses=1]
  %18 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i.i ; <double*> [#uses=1]
  store double %17, double* %18, align 4
  %phitmp.i.i.i = shl i32 %__secondChild.0.i.i.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i.i = add i32 %phitmp.i.i.i, 2 ; <i32> [#uses=3]
  %19 = icmp slt i32 %__secondChild.1.i.i.i, %8   ; <i1> [#uses=1]
  br i1 %19, label %bb.i.i.i, label %bb4.i.loopexit.i.i

bb4.i.loopexit.i.i:                               ; preds = %bb.i.i.i
  %phitmp.i.i = or i32 %phitmp.i.i.i, 1           ; <i32> [#uses=1]
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb4.i.loopexit.i.i, %bb
  %__secondChild.1.lcssa.i.i.i = phi i32 [ %__secondChild.1.i.i.i, %bb4.i.loopexit.i.i ], [ 2, %bb ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i.i = phi i32 [ %phitmp.i.i, %bb4.i.loopexit.i.i ], [ 1, %bb ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i.i = phi i32 [ %__secondChild.0.i.i.i, %bb4.i.loopexit.i.i ], [ 0, %bb ] ; <i32> [#uses=3]
  %20 = icmp eq i32 %__secondChild.1.lcssa.i.i.i, %8 ; <i1> [#uses=1]
  br i1 %20, label %bb5.i.i.i, label %bb1.i.i.i.i

bb5.i.i.i:                                        ; preds = %bb4.i.i.i
  %21 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i.i ; <double*> [#uses=1]
  %22 = load double* %21, align 4                 ; <double> [#uses=1]
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i.i ; <double*> [#uses=1]
  store double %22, double* %23, align 4
  br label %bb1.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb2.i.i.i.i
  %24 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i ; <double*> [#uses=1]
  store double %27, double* %24, align 4
  br label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i.i, %bb5.i.i.i, %bb4.i.i.i
  %__holeIndex_addr.0.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i, %bb.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i, %bb5.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.in.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i, %bb.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i, %bb5.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=1]
  %__parent.0.in.i.i.i.i = add i32 %__parent.0.in.in.i.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i.i = sdiv i32 %__parent.0.in.i.i.i.i, 2 ; <i32> [#uses=3]
  %25 = icmp sgt i32 %__holeIndex_addr.0.i.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %25, label %bb2.i.i.i.i, label %_ZSt8pop_heapIPdEvT_S1_.exit

bb2.i.i.i.i:                                      ; preds = %bb1.i.i.i.i
  %26 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i.i ; <double*> [#uses=1]
  %27 = load double* %26, align 4                 ; <double> [#uses=2]
  %28 = fcmp olt double %27, %4                   ; <i1> [#uses=1]
  br i1 %28, label %bb.i.i.i.i, label %_ZSt8pop_heapIPdEvT_S1_.exit

_ZSt8pop_heapIPdEvT_S1_.exit:                     ; preds = %bb2.i.i.i.i, %bb1.i.i.i.i
  %29 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i ; <double*> [#uses=1]
  store double %4, double* %29, align 4
  %30 = icmp sgt i32 %7, 15                       ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %30, label %bb, label %return

return:                                           ; preds = %_ZSt8pop_heapIPdEvT_S1_.exit, %entry
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %__first, double* %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %tmp16 = add i32 %__depth_limit, -2             ; <i32> [#uses=1]
  %tmp19 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb3

bb:                                               ; preds = %bb3
  %1 = icmp eq i32 %indvar13, %__depth_limit      ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  tail call fastcc void @_ZSt13__heap_selectIPdEvT_S1_S1_(double* %__first, double* %__last_addr.0, double* %__last_addr.0) nounwind
  tail call fastcc void @_ZSt9sort_heapIPdEvT_S1_(double* %__first, double* %__last_addr.0) nounwind
  ret void

bb2:                                              ; preds = %bb
  %2 = getelementptr inbounds double* %__last_addr.0, i32 -1 ; <double*> [#uses=3]
  %3 = sdiv i32 %52, 16                           ; <i32> [#uses=1]
  %4 = getelementptr inbounds double* %__first, i32 %3 ; <double*> [#uses=3]
  %5 = load double* %__first, align 8             ; <double> [#uses=4]
  %6 = load double* %4, align 8                   ; <double> [#uses=3]
  %7 = fcmp olt double %5, %6                     ; <i1> [#uses=1]
  %8 = load double* %2, align 8                   ; <double> [#uses=4]
  br i1 %7, label %bb.i2, label %bb5.i4

bb.i2:                                            ; preds = %bb2
  %9 = fcmp olt double %6, %8                     ; <i1> [#uses=1]
  br i1 %9, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb2.i3

bb2.i3:                                           ; preds = %bb.i2
  %10 = fcmp olt double %5, %8                    ; <i1> [#uses=1]
  %retval.i = select i1 %10, double* %2, double* %__first ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

bb5.i4:                                           ; preds = %bb2
  %11 = fcmp olt double %5, %8                    ; <i1> [#uses=1]
  br i1 %11, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb7.i

bb7.i:                                            ; preds = %bb5.i4
  %12 = fcmp olt double %6, %8                    ; <i1> [#uses=1]
  %retval1.i = select i1 %12, double* %2, double* %4 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

_ZSt8__medianIdERKT_S2_S2_S2_.exit:               ; preds = %bb7.i, %bb5.i4, %bb2.i3, %bb.i2
  %13 = phi double* [ %retval1.i, %bb7.i ], [ %retval.i, %bb2.i3 ], [ %4, %bb.i2 ], [ %__first, %bb5.i4 ] ; <double*> [#uses=1]
  %14 = load double* %13, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb8.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit
  %15 = phi double [ %.pre, %bb8.i ], [ %5, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ] ; <double> [#uses=2]
  %__last_addr.0.ph.i = phi double* [ %__last_addr.0, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %__last_addr.1.i, %bb8.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i = phi double* [ %__first, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %24, %bb8.i ] ; <double*> [#uses=2]
  %16 = fcmp olt double %15, %14                  ; <i1> [#uses=1]
  br i1 %16, label %bb1.i1, label %bb5.preheader.i

bb1.i1:                                           ; preds = %bb1.i1, %bb2.outer.i
  %indvar4.i = phi i32 [ %tmp, %bb1.i1 ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar4.i, 1                    ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.ph.i, i32 %tmp ; <double*> [#uses=2]
  %17 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %18 = fcmp olt double %17, %14                  ; <i1> [#uses=1]
  br i1 %18, label %bb1.i1, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i1, %bb2.outer.i
  %19 = phi double [ %15, %bb2.outer.i ], [ %17, %bb1.i1 ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i = phi double* [ %__first_addr.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i1 ] ; <double*> [#uses=12]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp10 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__last_addr.1.i = getelementptr double* %__last_addr.0.ph.i, i32 %tmp10 ; <double*> [#uses=4]
  %20 = load double* %__last_addr.1.i, align 8    ; <double> [#uses=2]
  %21 = fcmp ogt double %20, %14                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %21, label %bb5.i, label %bb6.i

bb6.i:                                            ; preds = %bb5.i
  %22 = icmp ult double* %__first_addr.0.lcssa.i, %__last_addr.1.i ; <i1> [#uses=1]
  br i1 %22, label %bb8.i, label %bb3.i.preheader

bb3.i.preheader:                                  ; preds = %bb6.i
  %23 = ptrtoint double* %__first_addr.0.lcssa.i to i32 ; <i32> [#uses=1]
  br label %bb3.i

bb8.i:                                            ; preds = %bb6.i
  store double %20, double* %__first_addr.0.lcssa.i, align 8
  store double %19, double* %__last_addr.1.i, align 8
  %24 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %24, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

bb.i:                                             ; preds = %bb3.i
  %25 = icmp eq i32 %indvar, %tmp20               ; <i1> [#uses=1]
  br i1 %25, label %bb1.i, label %bb2.i

bb1.i:                                            ; preds = %bb.i
  tail call fastcc void @_ZSt13__heap_selectIPdEvT_S1_S1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0.i, double* %__last_addr.0.i) nounwind
  tail call fastcc void @_ZSt9sort_heapIPdEvT_S1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0.i) nounwind
  br label %bb3.backedge

bb3.backedge:                                     ; preds = %bb3.i, %bb1.i
  %indvar.next14 = add i32 %indvar13, 1           ; <i32> [#uses=1]
  br label %bb3

bb2.i:                                            ; preds = %bb.i
  %26 = getelementptr inbounds double* %__last_addr.0.i, i32 -1 ; <double*> [#uses=3]
  %27 = sdiv i32 %49, 16                          ; <i32> [#uses=1]
  %28 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 %27 ; <double*> [#uses=3]
  %29 = load double* %__first_addr.0.lcssa.i, align 8 ; <double> [#uses=4]
  %30 = load double* %28, align 8                 ; <double> [#uses=3]
  %31 = fcmp olt double %29, %30                  ; <i1> [#uses=1]
  %32 = load double* %26, align 8                 ; <double> [#uses=4]
  br i1 %31, label %bb.i1, label %bb5.i5

bb.i1:                                            ; preds = %bb2.i
  %33 = fcmp olt double %30, %32                  ; <i1> [#uses=1]
  br i1 %33, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8, label %bb2.i4

bb2.i4:                                           ; preds = %bb.i1
  %34 = fcmp olt double %29, %32                  ; <i1> [#uses=1]
  %retval.i2 = select i1 %34, double* %26, double* %__first_addr.0.lcssa.i ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8

bb5.i5:                                           ; preds = %bb2.i
  %35 = fcmp olt double %29, %32                  ; <i1> [#uses=1]
  br i1 %35, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8, label %bb7.i7

bb7.i7:                                           ; preds = %bb5.i5
  %36 = fcmp olt double %30, %32                  ; <i1> [#uses=1]
  %retval1.i6 = select i1 %36, double* %26, double* %28 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8

_ZSt8__medianIdERKT_S2_S2_S2_.exit8:              ; preds = %bb7.i7, %bb5.i5, %bb2.i4, %bb.i1
  %37 = phi double* [ %retval1.i6, %bb7.i7 ], [ %retval.i2, %bb2.i4 ], [ %28, %bb.i1 ], [ %__first_addr.0.lcssa.i, %bb5.i5 ] ; <double*> [#uses=1]
  %38 = load double* %37, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i11

bb2.outer.i11:                                    ; preds = %bb8.i23, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8
  %39 = phi double [ %.pre24, %bb8.i23 ], [ %29, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8 ] ; <double> [#uses=2]
  %__last_addr.0.ph.i9 = phi double* [ %__last_addr.0.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8 ], [ %__last_addr.1.i18, %bb8.i23 ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i10 = phi double* [ %__first_addr.0.lcssa.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8 ], [ %47, %bb8.i23 ] ; <double*> [#uses=2]
  %40 = fcmp olt double %39, %38                  ; <i1> [#uses=1]
  br i1 %40, label %bb1.i14, label %bb5.preheader.i16

bb1.i14:                                          ; preds = %bb1.i14, %bb2.outer.i11
  %indvar4.i12 = phi i32 [ %tmp6.i, %bb1.i14 ], [ 0, %bb2.outer.i11 ] ; <i32> [#uses=1]
  %tmp6.i = add i32 %indvar4.i12, 1               ; <i32> [#uses=2]
  %scevgep.i13 = getelementptr double* %__first_addr.0.ph.i10, i32 %tmp6.i ; <double*> [#uses=2]
  %41 = load double* %scevgep.i13, align 8        ; <double> [#uses=2]
  %42 = fcmp olt double %41, %38                  ; <i1> [#uses=1]
  br i1 %42, label %bb1.i14, label %bb5.preheader.i16

bb5.preheader.i16:                                ; preds = %bb1.i14, %bb2.outer.i11
  %43 = phi double [ %39, %bb2.outer.i11 ], [ %41, %bb1.i14 ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i15 = phi double* [ %__first_addr.0.ph.i10, %bb2.outer.i11 ], [ %scevgep.i13, %bb1.i14 ] ; <double*> [#uses=5]
  br label %bb5.i20

bb5.i20:                                          ; preds = %bb5.i20, %bb5.preheader.i16
  %indvar.i17 = phi i32 [ 0, %bb5.preheader.i16 ], [ %indvar.next.i19, %bb5.i20 ] ; <i32> [#uses=2]
  %tmp3.i = xor i32 %indvar.i17, -1               ; <i32> [#uses=1]
  %__last_addr.1.i18 = getelementptr double* %__last_addr.0.ph.i9, i32 %tmp3.i ; <double*> [#uses=4]
  %44 = load double* %__last_addr.1.i18, align 8  ; <double> [#uses=2]
  %45 = fcmp ogt double %44, %38                  ; <i1> [#uses=1]
  %indvar.next.i19 = add i32 %indvar.i17, 1       ; <i32> [#uses=1]
  br i1 %45, label %bb5.i20, label %bb6.i21

bb6.i21:                                          ; preds = %bb5.i20
  %46 = icmp ult double* %__first_addr.0.lcssa.i15, %__last_addr.1.i18 ; <i1> [#uses=1]
  br i1 %46, label %bb8.i23, label %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit

bb8.i23:                                          ; preds = %bb6.i21
  store double %44, double* %__first_addr.0.lcssa.i15, align 8
  store double %43, double* %__last_addr.1.i18, align 8
  %47 = getelementptr inbounds double* %__first_addr.0.lcssa.i15, i32 1 ; <double*> [#uses=2]
  %.pre24 = load double* %47, align 8             ; <double> [#uses=1]
  br label %bb2.outer.i11

_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit: ; preds = %bb6.i21
  tail call fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %__first_addr.0.lcssa.i15, double* %__last_addr.0.i, i32 %tmp18) nounwind
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit, %bb3.i.preheader
  %indvar = phi i32 [ 0, %bb3.i.preheader ], [ %indvar.next, %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit ] ; <i32> [#uses=3]
  %__last_addr.0.i = phi double* [ %__first_addr.0.lcssa.i15, %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit ], [ %__last_addr.0, %bb3.i.preheader ] ; <double*> [#uses=7]
  %tmp18 = sub i32 %tmp17, %indvar                ; <i32> [#uses=1]
  %48 = ptrtoint double* %__last_addr.0.i to i32  ; <i32> [#uses=1]
  %49 = sub i32 %48, %23                          ; <i32> [#uses=2]
  %50 = icmp sgt i32 %49, 135                     ; <i1> [#uses=1]
  br i1 %50, label %bb.i, label %bb3.backedge

bb3:                                              ; preds = %bb3.backedge, %entry
  %indvar13 = phi i32 [ 0, %entry ], [ %indvar.next14, %bb3.backedge ] ; <i32> [#uses=4]
  %__last_addr.0 = phi double* [ %__last, %entry ], [ %__first_addr.0.lcssa.i, %bb3.backedge ] ; <double*> [#uses=7]
  %tmp20 = sub i32 %tmp19, %indvar13              ; <i32> [#uses=1]
  %tmp17 = sub i32 %tmp16, %indvar13              ; <i32> [#uses=1]
  %51 = ptrtoint double* %__last_addr.0 to i32    ; <i32> [#uses=1]
  %52 = sub i32 %51, %0                           ; <i32> [#uses=2]
  %53 = icmp sgt i32 %52, 135                     ; <i1> [#uses=1]
  br i1 %53, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEiEvT_S7_T0_(double* %__first.0, double* %__last.0, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first.0 to i32         ; <i32> [#uses=2]
  %tmp10 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb15

bb:                                               ; preds = %bb15
  %1 = icmp eq i32 %indvar, %__depth_limit        ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb6

bb1:                                              ; preds = %bb
  %2 = icmp slt i32 %81, 2                        ; <i1> [#uses=1]
  br i1 %2, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit, label %bb.i.i

bb.i.i:                                           ; preds = %bb1
  %3 = add i32 %81, -2                            ; <i32> [#uses=1]
  %4 = sdiv i32 %3, 2                             ; <i32> [#uses=3]
  %tmp3.i.i = shl i32 %4, 1                       ; <i32> [#uses=2]
  %tmp5.i.i = add i32 %tmp3.i.i, 2                ; <i32> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb2.i.i, %bb.i.i
  %indvar.i.i = phi i32 [ 0, %bb.i.i ], [ %indvar.next.i.i, %bb2.i.i ] ; <i32> [#uses=4]
  %storemerge.i.i = sub i32 %4, %indvar.i.i       ; <i32> [#uses=4]
  %tmp2.i.i = mul i32 %indvar.i.i, -2             ; <i32> [#uses=2]
  %storemerge.in4.i.i.i = add i32 %tmp2.i.i, %tmp3.i.i ; <i32> [#uses=2]
  %storemerge6.i.i.i = add i32 %tmp2.i.i, %tmp5.i.i ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr double* %__first.0, i32 %storemerge.i.i ; <double*> [#uses=1]
  %5 = load double* %scevgep.i.i, align 8         ; <double> [#uses=2]
  %6 = icmp slt i32 %storemerge6.i.i.i, %81       ; <i1> [#uses=1]
  br i1 %6, label %bb.i.i7.i, label %bb4.i.i11.i

bb.i.i7.i:                                        ; preds = %bb.i.i7.i, %bb1.i.i
  %storemerge7.i.i1.i = phi i32 [ %storemerge.i.i6.i, %bb.i.i7.i ], [ %storemerge6.i.i.i, %bb1.i.i ] ; <i32> [#uses=2]
  %storemerge.in5.i.i2.i = phi i32 [ %phitmp.i.i5.i, %bb.i.i7.i ], [ %storemerge.in4.i.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %storemerge12.i.i3.i = phi i32 [ %__secondChild.0.i.i4.i, %bb.i.i7.i ], [ %storemerge.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %7 = getelementptr inbounds double* %__first.0, i32 %storemerge7.i.i1.i ; <double*> [#uses=1]
  %8 = load double* %7, align 8                   ; <double> [#uses=1]
  %9 = or i32 %storemerge.in5.i.i2.i, 1           ; <i32> [#uses=2]
  %10 = getelementptr inbounds double* %__first.0, i32 %9 ; <double*> [#uses=1]
  %11 = load double* %10, align 8                 ; <double> [#uses=1]
  %12 = fcmp olt double %8, %11                   ; <i1> [#uses=1]
  %__secondChild.0.i.i4.i = select i1 %12, i32 %9, i32 %storemerge7.i.i1.i ; <i32> [#uses=4]
  %13 = getelementptr inbounds double* %__first.0, i32 %storemerge12.i.i3.i ; <double*> [#uses=1]
  %14 = getelementptr inbounds double* %__first.0, i32 %__secondChild.0.i.i4.i ; <double*> [#uses=1]
  %15 = load double* %14, align 8                 ; <double> [#uses=1]
  store double %15, double* %13, align 8
  %phitmp.i.i5.i = shl i32 %__secondChild.0.i.i4.i, 1 ; <i32> [#uses=3]
  %storemerge.i.i6.i = add i32 %phitmp.i.i5.i, 2  ; <i32> [#uses=3]
  %16 = icmp slt i32 %storemerge.i.i6.i, %81      ; <i1> [#uses=1]
  br i1 %16, label %bb.i.i7.i, label %bb4.i.i11.i

bb4.i.i11.i:                                      ; preds = %bb.i.i7.i, %bb1.i.i
  %storemerge.lcssa.i.i8.i = phi i32 [ %storemerge6.i.i.i, %bb1.i.i ], [ %storemerge.i.i6.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %storemerge.in.lcssa.i.i9.i = phi i32 [ %storemerge.in4.i.i.i, %bb1.i.i ], [ %phitmp.i.i5.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %storemerge1.lcssa.i.i10.i = phi i32 [ %storemerge.i.i, %bb1.i.i ], [ %__secondChild.0.i.i4.i, %bb.i.i7.i ] ; <i32> [#uses=3]
  %17 = icmp eq i32 %storemerge.lcssa.i.i8.i, %81 ; <i1> [#uses=1]
  br i1 %17, label %bb5.i.i12.i, label %bb1.i.i.i18.i

bb5.i.i12.i:                                      ; preds = %bb4.i.i11.i
  %18 = getelementptr inbounds double* %__first.0, i32 %storemerge1.lcssa.i.i10.i ; <double*> [#uses=1]
  %19 = or i32 %storemerge.in.lcssa.i.i9.i, 1     ; <i32> [#uses=3]
  %20 = getelementptr inbounds double* %__first.0, i32 %19 ; <double*> [#uses=1]
  %21 = load double* %20, align 8                 ; <double> [#uses=1]
  store double %21, double* %18, align 8
  br label %bb1.i.i.i18.i

bb.i.i.i13.i:                                     ; preds = %bb2.i.i.i19.i
  %22 = getelementptr inbounds double* %__first.0, i32 %storemerge1.i.i.i14.i ; <double*> [#uses=1]
  store double %25, double* %22, align 8
  br label %bb1.i.i.i18.i

bb1.i.i.i18.i:                                    ; preds = %bb.i.i.i13.i, %bb5.i.i12.i, %bb4.i.i11.i
  %storemerge1.i.i.i14.i = phi i32 [ %storemerge.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %storemerge1.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=3]
  %storemerge.in.in.i.i.i15.i = phi i32 [ %storemerge.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %storemerge1.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=1]
  %storemerge.in.i.i.i16.i = add i32 %storemerge.in.in.i.i.i15.i, -1 ; <i32> [#uses=1]
  %storemerge.i.i.i17.i = sdiv i32 %storemerge.in.i.i.i16.i, 2 ; <i32> [#uses=3]
  %23 = icmp sgt i32 %storemerge1.i.i.i14.i, %storemerge.i.i ; <i1> [#uses=1]
  br i1 %23, label %bb2.i.i.i19.i, label %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i

bb2.i.i.i19.i:                                    ; preds = %bb1.i.i.i18.i
  %24 = getelementptr inbounds double* %__first.0, i32 %storemerge.i.i.i17.i ; <double*> [#uses=1]
  %25 = load double* %24, align 8                 ; <double> [#uses=2]
  %26 = fcmp uge double %25, %5                   ; <i1> [#uses=1]
  br i1 %26, label %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i, label %bb.i.i.i13.i

_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i: ; preds = %bb2.i.i.i19.i, %bb1.i.i.i18.i
  %27 = getelementptr inbounds double* %__first.0, i32 %storemerge1.i.i.i14.i ; <double*> [#uses=1]
  store double %5, double* %27, align 8
  %28 = icmp eq i32 %4, %indvar.i.i               ; <i1> [#uses=1]
  br i1 %28, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb1.i.i

_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit: ; preds = %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i, %bb1
  %29 = icmp sgt i32 %81, 1                       ; <i1> [#uses=1]
  br i1 %29, label %bb.i6, label %_ZSt9sort_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit

bb.i6:                                            ; preds = %_ZSt8pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit
  %indvar.i4 = phi i32 [ %indvar.next.i10, %_ZSt8pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i ], [ 0, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit ] ; <i32> [#uses=2]
  %tmp2.i = xor i32 %indvar.i4, -1                ; <i32> [#uses=1]
  %scevgep.i5 = getelementptr double* %__last_addr.0.0, i32 %tmp2.i ; <double*> [#uses=3]
  %30 = load double* %scevgep.i5, align 8         ; <double> [#uses=2]
  %31 = load double* %__first.0, align 8          ; <double> [#uses=1]
  store double %31, double* %scevgep.i5, align 8
  %32 = ptrtoint double* %scevgep.i5 to i32       ; <i32> [#uses=1]
  %33 = sub i32 %32, %0                           ; <i32> [#uses=1]
  %34 = ashr i32 %33, 3                           ; <i32> [#uses=4]
  %35 = icmp sgt i32 %34, 2                       ; <i1> [#uses=1]
  br i1 %35, label %bb.i.i.i.i8, label %bb4.i.i.i.i

bb.i.i.i.i8:                                      ; preds = %bb.i.i.i.i8, %bb.i6
  %storemerge7.i.i.i.i = phi i32 [ %storemerge.i.i.i.i7, %bb.i.i.i.i8 ], [ 2, %bb.i6 ] ; <i32> [#uses=2]
  %storemerge.in5.i.i.i.i = phi i32 [ %phitmp.i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i6 ] ; <i32> [#uses=1]
  %storemerge12.i.i.i.i = phi i32 [ %__secondChild.0.i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i6 ] ; <i32> [#uses=1]
  %36 = getelementptr inbounds double* %__first.0, i32 %storemerge7.i.i.i.i ; <double*> [#uses=1]
  %37 = load double* %36, align 8                 ; <double> [#uses=1]
  %38 = or i32 %storemerge.in5.i.i.i.i, 1         ; <i32> [#uses=2]
  %39 = getelementptr inbounds double* %__first.0, i32 %38 ; <double*> [#uses=1]
  %40 = load double* %39, align 8                 ; <double> [#uses=1]
  %41 = fcmp olt double %37, %40                  ; <i1> [#uses=1]
  %__secondChild.0.i.i.i.i = select i1 %41, i32 %38, i32 %storemerge7.i.i.i.i ; <i32> [#uses=4]
  %42 = getelementptr inbounds double* %__first.0, i32 %storemerge12.i.i.i.i ; <double*> [#uses=1]
  %43 = getelementptr inbounds double* %__first.0, i32 %__secondChild.0.i.i.i.i ; <double*> [#uses=1]
  %44 = load double* %43, align 8                 ; <double> [#uses=1]
  store double %44, double* %42, align 8
  %phitmp.i.i.i.i = shl i32 %__secondChild.0.i.i.i.i, 1 ; <i32> [#uses=3]
  %storemerge.i.i.i.i7 = add i32 %phitmp.i.i.i.i, 2 ; <i32> [#uses=3]
  %45 = icmp slt i32 %storemerge.i.i.i.i7, %34    ; <i1> [#uses=1]
  br i1 %45, label %bb.i.i.i.i8, label %bb4.i.loopexit.i.i.i

bb4.i.loopexit.i.i.i:                             ; preds = %bb.i.i.i.i8
  %phitmp.i.i.i9 = or i32 %phitmp.i.i.i.i, 1      ; <i32> [#uses=1]
  br label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb4.i.loopexit.i.i.i, %bb.i6
  %storemerge.lcssa.i.i.i.i = phi i32 [ %storemerge.i.i.i.i7, %bb4.i.loopexit.i.i.i ], [ 2, %bb.i6 ] ; <i32> [#uses=1]
  %storemerge.in.lcssa.i.i.i.i = phi i32 [ %phitmp.i.i.i9, %bb4.i.loopexit.i.i.i ], [ 1, %bb.i6 ] ; <i32> [#uses=3]
  %storemerge1.lcssa.i.i.i.i = phi i32 [ %__secondChild.0.i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 0, %bb.i6 ] ; <i32> [#uses=3]
  %46 = icmp eq i32 %storemerge.lcssa.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %46, label %bb5.i.i.i.i, label %bb1.i.i.i.i.i

bb5.i.i.i.i:                                      ; preds = %bb4.i.i.i.i
  %47 = getelementptr inbounds double* %__first.0, i32 %storemerge1.lcssa.i.i.i.i ; <double*> [#uses=1]
  %48 = getelementptr inbounds double* %__first.0, i32 %storemerge.in.lcssa.i.i.i.i ; <double*> [#uses=1]
  %49 = load double* %48, align 8                 ; <double> [#uses=1]
  store double %49, double* %47, align 8
  br label %bb1.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb2.i.i.i.i.i
  %50 = getelementptr inbounds double* %__first.0, i32 %storemerge1.i.i.i.i.i ; <double*> [#uses=1]
  store double %53, double* %50, align 8
  br label %bb1.i.i.i.i.i

bb1.i.i.i.i.i:                                    ; preds = %bb.i.i.i.i.i, %bb5.i.i.i.i, %bb4.i.i.i.i
  %storemerge1.i.i.i.i.i = phi i32 [ %storemerge.i.i.i.i.i, %bb.i.i.i.i.i ], [ %storemerge.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %storemerge1.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=3]
  %storemerge.in.in.i.i.i.i.i = phi i32 [ %storemerge.i.i.i.i.i, %bb.i.i.i.i.i ], [ %storemerge.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %storemerge1.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=1]
  %storemerge.in.i.i.i.i.i = add i32 %storemerge.in.in.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = sdiv i32 %storemerge.in.i.i.i.i.i, 2 ; <i32> [#uses=3]
  %51 = icmp sgt i32 %storemerge1.i.i.i.i.i, 0    ; <i1> [#uses=1]
  br i1 %51, label %bb2.i.i.i.i.i, label %_ZSt8pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i

bb2.i.i.i.i.i:                                    ; preds = %bb1.i.i.i.i.i
  %52 = getelementptr inbounds double* %__first.0, i32 %storemerge.i.i.i.i.i ; <double*> [#uses=1]
  %53 = load double* %52, align 8                 ; <double> [#uses=2]
  %54 = fcmp uge double %53, %30                  ; <i1> [#uses=1]
  br i1 %54, label %_ZSt8pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i, label %bb.i.i.i.i.i

_ZSt8pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i: ; preds = %bb2.i.i.i.i.i, %bb1.i.i.i.i.i
  %55 = getelementptr inbounds double* %__first.0, i32 %storemerge1.i.i.i.i.i ; <double*> [#uses=1]
  store double %30, double* %55, align 8
  %56 = icmp sgt i32 %34, 1                       ; <i1> [#uses=1]
  %indvar.next.i10 = add i32 %indvar.i4, 1        ; <i32> [#uses=1]
  br i1 %56, label %bb.i6, label %_ZSt9sort_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit

_ZSt9sort_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit: ; preds = %_ZSt8pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit
  ret void

bb6:                                              ; preds = %bb
  %57 = getelementptr inbounds double* %__last_addr.0.0, i32 -1 ; <double*> [#uses=3]
  %58 = sdiv i32 %81, 2                           ; <i32> [#uses=1]
  %59 = getelementptr inbounds double* %__first.0, i32 %58 ; <double*> [#uses=3]
  %60 = load double* %__first.0, align 8          ; <double> [#uses=4]
  %61 = load double* %59, align 8                 ; <double> [#uses=3]
  %62 = fcmp olt double %60, %61                  ; <i1> [#uses=1]
  %63 = load double* %57, align 8                 ; <double> [#uses=4]
  br i1 %62, label %bb.i, label %bb5.i1

bb.i:                                             ; preds = %bb6
  %64 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  br i1 %64, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb2.i

bb2.i:                                            ; preds = %bb.i
  %65 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  %retval.i = select i1 %65, double* %57, double* %__first.0 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

bb5.i1:                                           ; preds = %bb6
  %66 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  br i1 %66, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb7.i2

bb7.i2:                                           ; preds = %bb5.i1
  %67 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  %retval1.i = select i1 %67, double* %57, double* %59 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

_ZSt8__medianIdERKT_S2_S2_S2_.exit:               ; preds = %bb7.i2, %bb5.i1, %bb2.i, %bb.i
  %68 = phi double* [ %retval1.i, %bb7.i2 ], [ %retval.i, %bb2.i ], [ %59, %bb.i ], [ %__first.0, %bb5.i1 ] ; <double*> [#uses=1]
  %69 = load double* %68, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb12.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit
  %70 = phi double [ %.pre, %bb12.i ], [ %60, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ] ; <double> [#uses=2]
  %__last_addr.0.0.ph.i = phi double* [ %__last_addr.0.0, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %__last_addr.0.1.i, %bb12.i ] ; <double*> [#uses=1]
  %__first_addr.0.0.ph.i = phi double* [ %__first.0, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %78, %bb12.i ] ; <double*> [#uses=2]
  %71 = fcmp olt double %70, %69                  ; <i1> [#uses=1]
  br i1 %71, label %bb1.i, label %bb5.preheader.i

bb1.i:                                            ; preds = %bb1.i, %bb2.outer.i
  %indvar4.i = phi i32 [ %tmp, %bb1.i ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar4.i, 1                    ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.0.ph.i, i32 %tmp ; <double*> [#uses=2]
  %72 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %73 = fcmp olt double %72, %69                  ; <i1> [#uses=1]
  br i1 %73, label %bb1.i, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i, %bb2.outer.i
  %74 = phi double [ %70, %bb2.outer.i ], [ %72, %bb1.i ] ; <double> [#uses=1]
  %__first_addr.0.0.lcssa.i = phi double* [ %__first_addr.0.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i ] ; <double*> [#uses=5]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp7 = xor i32 %indvar.i, -1                   ; <i32> [#uses=1]
  %__last_addr.0.1.i = getelementptr double* %__last_addr.0.0.ph.i, i32 %tmp7 ; <double*> [#uses=4]
  %75 = load double* %__last_addr.0.1.i, align 8  ; <double> [#uses=2]
  %76 = fcmp ogt double %75, %69                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %76, label %bb5.i, label %bb7.i

bb7.i:                                            ; preds = %bb5.i
  %77 = icmp ult double* %__first_addr.0.0.lcssa.i, %__last_addr.0.1.i ; <i1> [#uses=1]
  br i1 %77, label %bb12.i, label %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit

bb12.i:                                           ; preds = %bb7.i
  store double %75, double* %__first_addr.0.0.lcssa.i, align 8
  store double %74, double* %__last_addr.0.1.i, align 8
  %78 = getelementptr inbounds double* %__first_addr.0.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %78, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit: ; preds = %bb7.i
  tail call fastcc void @_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEiEvT_S7_T0_(double* %__first_addr.0.0.lcssa.i, double* %__last_addr.0.0, i32 %tmp11)
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb15

bb15:                                             ; preds = %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit ] ; <i32> [#uses=3]
  %__last_addr.0.0 = phi double* [ %__last.0, %entry ], [ %__first_addr.0.0.lcssa.i, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit ] ; <double*> [#uses=5]
  %tmp11 = sub i32 %tmp10, %indvar                ; <i32> [#uses=1]
  %79 = ptrtoint double* %__last_addr.0.0 to i32  ; <i32> [#uses=1]
  %80 = sub i32 %79, %0                           ; <i32> [#uses=1]
  %81 = ashr i32 %80, 3                           ; <i32> [#uses=8]
  %82 = icmp sgt i32 %81, 16                      ; <i1> [#uses=1]
  br i1 %82, label %bb, label %return

return:                                           ; preds = %bb15
  ret void
}

define internal fastcc void @_ZSt13__adjust_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias nocapture %__first, i32 %__holeIndex, i32 %__len, double %__value) nounwind {
entry:
  %__secondChild.1.in98 = shl i32 %__holeIndex, 1 ; <i32> [#uses=3]
  %__secondChild.1100 = add i32 %__secondChild.1.in98, 2 ; <i32> [#uses=3]
  %0 = icmp slt i32 %__secondChild.1100, %__len   ; <i1> [#uses=1]
  br i1 %0, label %bb.nph, label %bb4

bb.nph:                                           ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 0 ; <double**> [#uses=1]
  %2 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 1 ; <double**> [#uses=1]
  %3 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 3 ; <double***> [#uses=1]
  br label %bb

bb:                                               ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45, %bb.nph
  %__secondChild.1101 = phi i32 [ %__secondChild.1100, %bb.nph ], [ %__secondChild.1, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45 ] ; <i32> [#uses=3]
  %__secondChild.1.in99 = phi i32 [ %__secondChild.1.in98, %bb.nph ], [ %phitmp, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45 ] ; <i32> [#uses=1]
  %__holeIndex_addr.096 = phi i32 [ %__holeIndex, %bb.nph ], [ %__secondChild.0, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45 ] ; <i32> [#uses=2]
  %4 = load double** %1, align 4                  ; <double*> [#uses=5]
  %5 = load double** %2, align 4                  ; <double*> [#uses=1]
  %6 = load double*** %3, align 4                 ; <double**> [#uses=4]
  %7 = ptrtoint double* %4 to i32                 ; <i32> [#uses=1]
  %8 = ptrtoint double* %5 to i32                 ; <i32> [#uses=1]
  %9 = sub i32 %7, %8                             ; <i32> [#uses=1]
  %10 = ashr i32 %9, 3                            ; <i32> [#uses=4]
  %11 = add nsw i32 %10, %__secondChild.1101      ; <i32> [#uses=5]
  %or.cond.i.i = icmp ult i32 %11, 64             ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb
  %12 = icmp sgt i32 %11, 0                       ; <i1> [#uses=1]
  br i1 %12, label %bb6.i.i, label %bb7.i.i

bb6.i.i:                                          ; preds = %bb2.i.i
  %13 = sdiv i32 %11, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i

bb7.i.i:                                          ; preds = %bb2.i.i
  %not.i.i = lshr i32 %11, 6                      ; <i32> [#uses=1]
  %not91.i.i = or i32 %not.i.i, -67108864         ; <i32> [#uses=1]
  br label %bb10.i.i

bb10.i.i:                                         ; preds = %bb7.i.i, %bb6.i.i
  %iftmp.255.0.i.i = phi i32 [ %13, %bb6.i.i ], [ %not91.i.i, %bb7.i.i ] ; <i32> [#uses=2]
  %14 = getelementptr inbounds double** %6, i32 %iftmp.255.0.i.i ; <double**> [#uses=1]
  %15 = load double** %14, align 4                ; <double*> [#uses=1]
  %16 = shl i32 %iftmp.255.0.i.i, 6               ; <i32> [#uses=1]
  %17 = sub i32 %11, %16                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit:          ; preds = %bb10.i.i, %bb
  %.pn.i = phi double* [ %15, %bb10.i.i ], [ %4, %bb ] ; <double*> [#uses=1]
  %__n.pn.i = phi i32 [ %17, %bb10.i.i ], [ %__secondChild.1101, %bb ] ; <i32> [#uses=1]
  %storemerge.i = getelementptr inbounds double* %.pn.i, i32 %__n.pn.i ; <double*> [#uses=1]
  %18 = load double* %storemerge.i, align 8       ; <double> [#uses=1]
  %19 = or i32 %__secondChild.1.in99, 1           ; <i32> [#uses=3]
  %20 = add nsw i32 %10, %19                      ; <i32> [#uses=5]
  %or.cond.i.i61 = icmp ult i32 %20, 64           ; <i1> [#uses=1]
  br i1 %or.cond.i.i61, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75, label %bb2.i.i62

bb2.i.i62:                                        ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit
  %21 = icmp sgt i32 %20, 0                       ; <i1> [#uses=1]
  br i1 %21, label %bb6.i.i63, label %bb7.i.i66

bb6.i.i63:                                        ; preds = %bb2.i.i62
  %22 = sdiv i32 %20, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i68

bb7.i.i66:                                        ; preds = %bb2.i.i62
  %not.i.i64 = lshr i32 %20, 6                    ; <i32> [#uses=1]
  %not91.i.i65 = or i32 %not.i.i64, -67108864     ; <i32> [#uses=1]
  br label %bb10.i.i68

bb10.i.i68:                                       ; preds = %bb7.i.i66, %bb6.i.i63
  %iftmp.255.0.i.i67 = phi i32 [ %22, %bb6.i.i63 ], [ %not91.i.i65, %bb7.i.i66 ] ; <i32> [#uses=2]
  %23 = getelementptr inbounds double** %6, i32 %iftmp.255.0.i.i67 ; <double**> [#uses=1]
  %24 = load double** %23, align 4                ; <double*> [#uses=1]
  %25 = shl i32 %iftmp.255.0.i.i67, 6             ; <i32> [#uses=1]
  %26 = sub i32 %20, %25                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75:        ; preds = %bb10.i.i68, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit
  %.pn.i72 = phi double* [ %24, %bb10.i.i68 ], [ %4, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit ] ; <double*> [#uses=1]
  %__n.pn.i73 = phi i32 [ %26, %bb10.i.i68 ], [ %19, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit ] ; <i32> [#uses=1]
  %storemerge.i74 = getelementptr inbounds double* %.pn.i72, i32 %__n.pn.i73 ; <double*> [#uses=1]
  %27 = load double* %storemerge.i74, align 8     ; <double> [#uses=1]
  %28 = fcmp olt double %18, %27                  ; <i1> [#uses=1]
  %__secondChild.0 = select i1 %28, i32 %19, i32 %__secondChild.1101 ; <i32> [#uses=5]
  %29 = add nsw i32 %10, %__holeIndex_addr.096    ; <i32> [#uses=5]
  %or.cond.i.i46 = icmp ult i32 %29, 64           ; <i1> [#uses=1]
  br i1 %or.cond.i.i46, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60, label %bb2.i.i47

bb2.i.i47:                                        ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75
  %30 = icmp sgt i32 %29, 0                       ; <i1> [#uses=1]
  br i1 %30, label %bb6.i.i48, label %bb7.i.i51

bb6.i.i48:                                        ; preds = %bb2.i.i47
  %31 = sdiv i32 %29, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i53

bb7.i.i51:                                        ; preds = %bb2.i.i47
  %not.i.i49 = lshr i32 %29, 6                    ; <i32> [#uses=1]
  %not91.i.i50 = or i32 %not.i.i49, -67108864     ; <i32> [#uses=1]
  br label %bb10.i.i53

bb10.i.i53:                                       ; preds = %bb7.i.i51, %bb6.i.i48
  %iftmp.255.0.i.i52 = phi i32 [ %31, %bb6.i.i48 ], [ %not91.i.i50, %bb7.i.i51 ] ; <i32> [#uses=2]
  %32 = getelementptr inbounds double** %6, i32 %iftmp.255.0.i.i52 ; <double**> [#uses=1]
  %33 = load double** %32, align 4                ; <double*> [#uses=1]
  %34 = shl i32 %iftmp.255.0.i.i52, 6             ; <i32> [#uses=1]
  %35 = sub i32 %29, %34                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60:        ; preds = %bb10.i.i53, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75
  %.pn.i57 = phi double* [ %33, %bb10.i.i53 ], [ %4, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75 ] ; <double*> [#uses=1]
  %__n.pn.i58 = phi i32 [ %35, %bb10.i.i53 ], [ %__holeIndex_addr.096, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit75 ] ; <i32> [#uses=1]
  %storemerge.i59 = getelementptr inbounds double* %.pn.i57, i32 %__n.pn.i58 ; <double*> [#uses=1]
  %36 = add nsw i32 %10, %__secondChild.0         ; <i32> [#uses=5]
  %or.cond.i.i31 = icmp ult i32 %36, 64           ; <i1> [#uses=1]
  br i1 %or.cond.i.i31, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45, label %bb2.i.i32

bb2.i.i32:                                        ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60
  %37 = icmp sgt i32 %36, 0                       ; <i1> [#uses=1]
  br i1 %37, label %bb6.i.i33, label %bb7.i.i36

bb6.i.i33:                                        ; preds = %bb2.i.i32
  %38 = sdiv i32 %36, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i38

bb7.i.i36:                                        ; preds = %bb2.i.i32
  %not.i.i34 = lshr i32 %36, 6                    ; <i32> [#uses=1]
  %not91.i.i35 = or i32 %not.i.i34, -67108864     ; <i32> [#uses=1]
  br label %bb10.i.i38

bb10.i.i38:                                       ; preds = %bb7.i.i36, %bb6.i.i33
  %iftmp.255.0.i.i37 = phi i32 [ %38, %bb6.i.i33 ], [ %not91.i.i35, %bb7.i.i36 ] ; <i32> [#uses=2]
  %39 = getelementptr inbounds double** %6, i32 %iftmp.255.0.i.i37 ; <double**> [#uses=1]
  %40 = load double** %39, align 4                ; <double*> [#uses=1]
  %41 = shl i32 %iftmp.255.0.i.i37, 6             ; <i32> [#uses=1]
  %42 = sub i32 %36, %41                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45:        ; preds = %bb10.i.i38, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60
  %.pn.i42 = phi double* [ %40, %bb10.i.i38 ], [ %4, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60 ] ; <double*> [#uses=1]
  %__n.pn.i43 = phi i32 [ %42, %bb10.i.i38 ], [ %__secondChild.0, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit60 ] ; <i32> [#uses=1]
  %storemerge.i44 = getelementptr inbounds double* %.pn.i42, i32 %__n.pn.i43 ; <double*> [#uses=1]
  %43 = load double* %storemerge.i44, align 8     ; <double> [#uses=1]
  store double %43, double* %storemerge.i59, align 8
  %phitmp = shl i32 %__secondChild.0, 1           ; <i32> [#uses=3]
  %__secondChild.1 = add i32 %phitmp, 2           ; <i32> [#uses=3]
  %44 = icmp slt i32 %__secondChild.1, %__len     ; <i1> [#uses=1]
  br i1 %44, label %bb, label %bb4

bb4:                                              ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45, %entry
  %__secondChild.1.lcssa = phi i32 [ %__secondChild.1100, %entry ], [ %__secondChild.1, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa = phi i32 [ %__secondChild.1.in98, %entry ], [ %phitmp, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45 ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa = phi i32 [ %__holeIndex, %entry ], [ %__secondChild.0, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45 ] ; <i32> [#uses=3]
  %45 = icmp eq i32 %__secondChild.1.lcssa, %__len ; <i1> [#uses=1]
  br i1 %45, label %bb5, label %bb6

bb5:                                              ; preds = %bb4
  %46 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 0 ; <double**> [#uses=1]
  %47 = load double** %46, align 4                ; <double*> [#uses=3]
  %48 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 1 ; <double**> [#uses=1]
  %49 = load double** %48, align 4                ; <double*> [#uses=1]
  %50 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 3 ; <double***> [#uses=1]
  %51 = load double*** %50, align 4               ; <double**> [#uses=2]
  %52 = ptrtoint double* %47 to i32               ; <i32> [#uses=1]
  %53 = ptrtoint double* %49 to i32               ; <i32> [#uses=1]
  %54 = sub i32 %52, %53                          ; <i32> [#uses=1]
  %55 = ashr i32 %54, 3                           ; <i32> [#uses=2]
  %56 = add nsw i32 %55, %__holeIndex_addr.0.lcssa ; <i32> [#uses=5]
  %or.cond.i.i16 = icmp ult i32 %56, 64           ; <i1> [#uses=1]
  br i1 %or.cond.i.i16, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30, label %bb2.i.i17

bb2.i.i17:                                        ; preds = %bb5
  %57 = icmp sgt i32 %56, 0                       ; <i1> [#uses=1]
  br i1 %57, label %bb6.i.i18, label %bb7.i.i21

bb6.i.i18:                                        ; preds = %bb2.i.i17
  %58 = sdiv i32 %56, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i23

bb7.i.i21:                                        ; preds = %bb2.i.i17
  %not.i.i19 = lshr i32 %56, 6                    ; <i32> [#uses=1]
  %not91.i.i20 = or i32 %not.i.i19, -67108864     ; <i32> [#uses=1]
  br label %bb10.i.i23

bb10.i.i23:                                       ; preds = %bb7.i.i21, %bb6.i.i18
  %iftmp.255.0.i.i22 = phi i32 [ %58, %bb6.i.i18 ], [ %not91.i.i20, %bb7.i.i21 ] ; <i32> [#uses=2]
  %59 = getelementptr inbounds double** %51, i32 %iftmp.255.0.i.i22 ; <double**> [#uses=1]
  %60 = load double** %59, align 4                ; <double*> [#uses=1]
  %61 = shl i32 %iftmp.255.0.i.i22, 6             ; <i32> [#uses=1]
  %62 = sub i32 %56, %61                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30:        ; preds = %bb10.i.i23, %bb5
  %.pn.i27 = phi double* [ %60, %bb10.i.i23 ], [ %47, %bb5 ] ; <double*> [#uses=1]
  %__n.pn.i28 = phi i32 [ %62, %bb10.i.i23 ], [ %__holeIndex_addr.0.lcssa, %bb5 ] ; <i32> [#uses=1]
  %storemerge.i29 = getelementptr inbounds double* %.pn.i27, i32 %__n.pn.i28 ; <double*> [#uses=1]
  %63 = or i32 %__secondChild.1.in.lcssa, 1       ; <i32> [#uses=3]
  %64 = add nsw i32 %55, %63                      ; <i32> [#uses=5]
  %or.cond.i.i1 = icmp ult i32 %64, 64            ; <i1> [#uses=1]
  br i1 %or.cond.i.i1, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15, label %bb2.i.i2

bb2.i.i2:                                         ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30
  %65 = icmp sgt i32 %64, 0                       ; <i1> [#uses=1]
  br i1 %65, label %bb6.i.i3, label %bb7.i.i6

bb6.i.i3:                                         ; preds = %bb2.i.i2
  %66 = sdiv i32 %64, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i8

bb7.i.i6:                                         ; preds = %bb2.i.i2
  %not.i.i4 = lshr i32 %64, 6                     ; <i32> [#uses=1]
  %not91.i.i5 = or i32 %not.i.i4, -67108864       ; <i32> [#uses=1]
  br label %bb10.i.i8

bb10.i.i8:                                        ; preds = %bb7.i.i6, %bb6.i.i3
  %iftmp.255.0.i.i7 = phi i32 [ %66, %bb6.i.i3 ], [ %not91.i.i5, %bb7.i.i6 ] ; <i32> [#uses=2]
  %67 = getelementptr inbounds double** %51, i32 %iftmp.255.0.i.i7 ; <double**> [#uses=1]
  %68 = load double** %67, align 4                ; <double*> [#uses=1]
  %69 = shl i32 %iftmp.255.0.i.i7, 6              ; <i32> [#uses=1]
  %70 = sub i32 %64, %69                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15:        ; preds = %bb10.i.i8, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30
  %.pn.i12 = phi double* [ %68, %bb10.i.i8 ], [ %47, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30 ] ; <double*> [#uses=1]
  %__n.pn.i13 = phi i32 [ %70, %bb10.i.i8 ], [ %63, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30 ] ; <i32> [#uses=1]
  %storemerge.i14 = getelementptr inbounds double* %.pn.i12, i32 %__n.pn.i13 ; <double*> [#uses=1]
  %71 = load double* %storemerge.i14, align 8     ; <double> [#uses=1]
  store double %71, double* %storemerge.i29, align 8
  br label %bb6

bb6:                                              ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15, %bb4
  %__holeIndex_addr.1 = phi i32 [ %63, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15 ], [ %__holeIndex_addr.0.lcssa, %bb4 ] ; <i32> [#uses=2]
  %72 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 0 ; <double**> [#uses=1]
  %73 = load double** %72, align 4                ; <double*> [#uses=5]
  %74 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 1 ; <double**> [#uses=1]
  %75 = load double** %74, align 4                ; <double*> [#uses=1]
  %76 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 3 ; <double***> [#uses=1]
  %77 = load double*** %76, align 4               ; <double**> [#uses=4]
  %78 = ptrtoint double* %73 to i32               ; <i32> [#uses=1]
  %79 = ptrtoint double* %75 to i32               ; <i32> [#uses=1]
  %80 = sub i32 %78, %79                          ; <i32> [#uses=1]
  %81 = ashr i32 %80, 3                           ; <i32> [#uses=3]
  br label %bb1.i

bb.i:                                             ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30.i
  %82 = add i32 %81, %__holeIndex_addr.0.i        ; <i32> [#uses=5]
  %or.cond.i.i.i = icmp ult i32 %82, 64           ; <i1> [#uses=1]
  br i1 %or.cond.i.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i, label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb.i
  %83 = icmp sgt i32 %82, 0                       ; <i1> [#uses=1]
  br i1 %83, label %bb6.i.i.i, label %bb7.i.i.i

bb6.i.i.i:                                        ; preds = %bb2.i.i.i
  %84 = sdiv i32 %82, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i.i

bb7.i.i.i:                                        ; preds = %bb2.i.i.i
  %not.i.i.i = lshr i32 %82, 6                    ; <i32> [#uses=1]
  %not91.i.i.i = or i32 %not.i.i.i, -67108864     ; <i32> [#uses=1]
  br label %bb10.i.i.i

bb10.i.i.i:                                       ; preds = %bb7.i.i.i, %bb6.i.i.i
  %iftmp.255.0.i.i.i = phi i32 [ %84, %bb6.i.i.i ], [ %not91.i.i.i, %bb7.i.i.i ] ; <i32> [#uses=2]
  %85 = getelementptr inbounds double** %77, i32 %iftmp.255.0.i.i.i ; <double**> [#uses=1]
  %86 = load double** %85, align 4                ; <double*> [#uses=1]
  %87 = shl i32 %iftmp.255.0.i.i.i, 6             ; <i32> [#uses=1]
  %88 = sub i32 %82, %87                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i:        ; preds = %bb10.i.i.i, %bb.i
  %.pn.i.i = phi double* [ %86, %bb10.i.i.i ], [ %73, %bb.i ] ; <double*> [#uses=1]
  %__n.pn.i.i = phi i32 [ %88, %bb10.i.i.i ], [ %__holeIndex_addr.0.i, %bb.i ] ; <i32> [#uses=1]
  %storemerge.i.i = getelementptr inbounds double* %.pn.i.i, i32 %__n.pn.i.i ; <double*> [#uses=1]
  br i1 %or.cond.i.i16.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45.i, label %bb2.i.i32.i

bb2.i.i32.i:                                      ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i
  %89 = icmp sgt i32 %97, 0                       ; <i1> [#uses=1]
  br i1 %89, label %bb6.i.i33.i, label %bb7.i.i36.i

bb6.i.i33.i:                                      ; preds = %bb2.i.i32.i
  %90 = sdiv i32 %97, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i38.i

bb7.i.i36.i:                                      ; preds = %bb2.i.i32.i
  %not.i.i34.i = lshr i32 %97, 6                  ; <i32> [#uses=1]
  %not91.i.i35.i = or i32 %not.i.i34.i, -67108864 ; <i32> [#uses=1]
  br label %bb10.i.i38.i

bb10.i.i38.i:                                     ; preds = %bb7.i.i36.i, %bb6.i.i33.i
  %iftmp.255.0.i.i37.i = phi i32 [ %90, %bb6.i.i33.i ], [ %not91.i.i35.i, %bb7.i.i36.i ] ; <i32> [#uses=2]
  %91 = getelementptr inbounds double** %77, i32 %iftmp.255.0.i.i37.i ; <double**> [#uses=1]
  %92 = load double** %91, align 4                ; <double*> [#uses=1]
  %93 = shl i32 %iftmp.255.0.i.i37.i, 6           ; <i32> [#uses=1]
  %94 = sub i32 %97, %93                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45.i

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45.i:      ; preds = %bb10.i.i38.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i
  %.pn.i42.i = phi double* [ %92, %bb10.i.i38.i ], [ %73, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i ] ; <double*> [#uses=1]
  %__n.pn.i43.i = phi i32 [ %94, %bb10.i.i38.i ], [ %__parent.0.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i ] ; <i32> [#uses=1]
  %storemerge.i44.i = getelementptr inbounds double* %.pn.i42.i, i32 %__n.pn.i43.i ; <double*> [#uses=1]
  %95 = load double* %storemerge.i44.i, align 8   ; <double> [#uses=1]
  store double %95, double* %storemerge.i.i, align 8
  br label %bb1.i

bb1.i:                                            ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45.i, %bb6
  %__parent.0.in.in.i = phi i32 [ %__holeIndex_addr.1, %bb6 ], [ %__parent.0.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i = phi i32 [ %__holeIndex_addr.1, %bb6 ], [ %__parent.0.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit45.i ] ; <i32> [#uses=5]
  %__parent.0.in.i = add i32 %__parent.0.in.in.i, -1 ; <i32> [#uses=1]
  %__parent.0.i = sdiv i32 %__parent.0.in.i, 2    ; <i32> [#uses=5]
  %96 = icmp sgt i32 %__holeIndex_addr.0.i, %__holeIndex ; <i1> [#uses=1]
  br i1 %96, label %bb2.i, label %bb6.critedge.i

bb2.i:                                            ; preds = %bb1.i
  %97 = add nsw i32 %81, %__parent.0.i            ; <i32> [#uses=9]
  %or.cond.i.i16.i = icmp ult i32 %97, 64         ; <i1> [#uses=2]
  br i1 %or.cond.i.i16.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30.i, label %bb2.i.i17.i

bb2.i.i17.i:                                      ; preds = %bb2.i
  %98 = icmp sgt i32 %97, 0                       ; <i1> [#uses=1]
  br i1 %98, label %bb6.i.i18.i, label %bb7.i.i21.i

bb6.i.i18.i:                                      ; preds = %bb2.i.i17.i
  %99 = sdiv i32 %97, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i23.i

bb7.i.i21.i:                                      ; preds = %bb2.i.i17.i
  %not.i.i19.i = lshr i32 %97, 6                  ; <i32> [#uses=1]
  %not91.i.i20.i = or i32 %not.i.i19.i, -67108864 ; <i32> [#uses=1]
  br label %bb10.i.i23.i

bb10.i.i23.i:                                     ; preds = %bb7.i.i21.i, %bb6.i.i18.i
  %iftmp.255.0.i.i22.i = phi i32 [ %99, %bb6.i.i18.i ], [ %not91.i.i20.i, %bb7.i.i21.i ] ; <i32> [#uses=2]
  %100 = getelementptr inbounds double** %77, i32 %iftmp.255.0.i.i22.i ; <double**> [#uses=1]
  %101 = load double** %100, align 4              ; <double*> [#uses=1]
  %102 = shl i32 %iftmp.255.0.i.i22.i, 6          ; <i32> [#uses=1]
  %103 = sub i32 %97, %102                        ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30.i

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30.i:      ; preds = %bb10.i.i23.i, %bb2.i
  %.pn.i27.i = phi double* [ %101, %bb10.i.i23.i ], [ %73, %bb2.i ] ; <double*> [#uses=1]
  %__n.pn.i28.i = phi i32 [ %103, %bb10.i.i23.i ], [ %__parent.0.i, %bb2.i ] ; <i32> [#uses=1]
  %storemerge.i29.i = getelementptr inbounds double* %.pn.i27.i, i32 %__n.pn.i28.i ; <double*> [#uses=1]
  %104 = load double* %storemerge.i29.i, align 8  ; <double> [#uses=1]
  %105 = fcmp uge double %104, %__value           ; <i1> [#uses=1]
  br i1 %105, label %bb6.critedge.i, label %bb.i

bb6.critedge.i:                                   ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit30.i, %bb1.i
  %106 = add nsw i32 %81, %__holeIndex_addr.0.i   ; <i32> [#uses=5]
  %or.cond.i.i1.i = icmp ult i32 %106, 64         ; <i1> [#uses=1]
  br i1 %or.cond.i.i1.i, label %_ZSt11__push_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_.exit, label %bb2.i.i2.i

bb2.i.i2.i:                                       ; preds = %bb6.critedge.i
  %107 = icmp sgt i32 %106, 0                     ; <i1> [#uses=1]
  br i1 %107, label %bb6.i.i3.i, label %bb7.i.i6.i

bb6.i.i3.i:                                       ; preds = %bb2.i.i2.i
  %108 = sdiv i32 %106, 64                        ; <i32> [#uses=1]
  br label %bb10.i.i8.i

bb7.i.i6.i:                                       ; preds = %bb2.i.i2.i
  %not.i.i4.i = lshr i32 %106, 6                  ; <i32> [#uses=1]
  %not91.i.i5.i = or i32 %not.i.i4.i, -67108864   ; <i32> [#uses=1]
  br label %bb10.i.i8.i

bb10.i.i8.i:                                      ; preds = %bb7.i.i6.i, %bb6.i.i3.i
  %iftmp.255.0.i.i7.i = phi i32 [ %108, %bb6.i.i3.i ], [ %not91.i.i5.i, %bb7.i.i6.i ] ; <i32> [#uses=2]
  %109 = getelementptr inbounds double** %77, i32 %iftmp.255.0.i.i7.i ; <double**> [#uses=1]
  %110 = load double** %109, align 4              ; <double*> [#uses=1]
  %111 = shl i32 %iftmp.255.0.i.i7.i, 6           ; <i32> [#uses=1]
  %112 = sub i32 %106, %111                       ; <i32> [#uses=1]
  br label %_ZSt11__push_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_.exit

_ZSt11__push_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_.exit: ; preds = %bb10.i.i8.i, %bb6.critedge.i
  %.pn.i12.i = phi double* [ %110, %bb10.i.i8.i ], [ %73, %bb6.critedge.i ] ; <double*> [#uses=1]
  %__n.pn.i13.i = phi i32 [ %112, %bb10.i.i8.i ], [ %__holeIndex_addr.0.i, %bb6.critedge.i ] ; <i32> [#uses=1]
  %storemerge.i14.i = getelementptr inbounds double* %.pn.i12.i, i32 %__n.pn.i13.i ; <double*> [#uses=1]
  store double %__value, double* %storemerge.i14.i, align 8
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopISt15_Deque_iteratorIdRdPdEiEvT_S4_T0_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias nocapture %__first, %"struct.std::_Deque_iterator<double,double&,double*>"* noalias nocapture %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %1 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %2 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %3 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %4 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %5 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__last, i32 0, i32 3 ; <double***> [#uses=2]
  %6 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 3 ; <double***> [#uses=1]
  %7 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__last, i32 0, i32 0 ; <double**> [#uses=2]
  %8 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__last, i32 0, i32 1 ; <double**> [#uses=2]
  %9 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 2 ; <double**> [#uses=1]
  %10 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 0 ; <double**> [#uses=1]
  %11 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 1 ; <double**> [#uses=2]
  %12 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__last, i32 0, i32 2 ; <double**> [#uses=3]
  %13 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 0 ; <double**> [#uses=1]
  %14 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 1 ; <double**> [#uses=1]
  %15 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 2 ; <double**> [#uses=1]
  %16 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 3 ; <double***> [#uses=1]
  %17 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 0 ; <double**> [#uses=1]
  %18 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 1 ; <double**> [#uses=1]
  %19 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 2 ; <double**> [#uses=1]
  %20 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 3 ; <double***> [#uses=1]
  %tmp20 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  %.pre = load double*** %5, align 4              ; <double**> [#uses=1]
  %.pre23 = load double*** %6, align 4            ; <double**> [#uses=7]
  %.pre24 = load double** %7, align 4             ; <double*> [#uses=1]
  %.pre25 = load double** %8, align 4             ; <double*> [#uses=1]
  %.pre26 = load double** %9, align 4             ; <double*> [#uses=5]
  %.pre27 = load double** %10, align 4            ; <double*> [#uses=14]
  %21 = ptrtoint double** %.pre23 to i32          ; <i32> [#uses=3]
  %22 = ptrtoint double* %.pre26 to i32           ; <i32> [#uses=1]
  %23 = ptrtoint double* %.pre27 to i32           ; <i32> [#uses=3]
  %24 = sub i32 %22, %23                          ; <i32> [#uses=1]
  %25 = ashr i32 %24, 3                           ; <i32> [#uses=4]
  br label %bb3

bb:                                               ; preds = %bb3
  %26 = icmp eq i32 %indvar, %__depth_limit       ; <i1> [#uses=1]
  br i1 %26, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %27 = load double** %12, align 4                ; <double*> [#uses=1]
  %28 = load double** %11, align 4                ; <double*> [#uses=4]
  %29 = icmp slt i32 %194, 2                      ; <i1> [#uses=1]
  br i1 %29, label %_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i, label %bb.i2.i

bb.i2.i:                                          ; preds = %bb1
  %30 = add i32 %194, -2                          ; <i32> [#uses=1]
  %31 = sdiv i32 %30, 2                           ; <i32> [#uses=3]
  %32 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 0 ; <double**> [#uses=1]
  %33 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 1 ; <double**> [#uses=1]
  %34 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 2 ; <double**> [#uses=1]
  %35 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 3 ; <double***> [#uses=1]
  %36 = ptrtoint double* %28 to i32               ; <i32> [#uses=1]
  %37 = sub i32 %23, %36                          ; <i32> [#uses=1]
  %38 = ashr i32 %37, 3                           ; <i32> [#uses=1]
  br label %bb1.i3.i

bb1.i3.i:                                         ; preds = %bb2.i.i1, %bb.i2.i
  %indvar.i.i = phi i32 [ 0, %bb.i2.i ], [ %indvar.next.i.i, %bb2.i.i1 ] ; <i32> [#uses=3]
  %39 = phi i32 [ %31, %bb.i2.i ], [ %46, %bb2.i.i1 ] ; <i32> [#uses=2]
  %__parent.0.i.i = sub i32 %31, %indvar.i.i      ; <i32> [#uses=2]
  %tmp8.i.i = add i32 %38, %__parent.0.i.i        ; <i32> [#uses=5]
  %or.cond.i.i.i.i = icmp ult i32 %tmp8.i.i, 64   ; <i1> [#uses=1]
  br i1 %or.cond.i.i.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i.i, label %bb2.i.i.i.i

bb2.i.i.i.i:                                      ; preds = %bb1.i3.i
  %40 = icmp sgt i32 %tmp8.i.i, 0                 ; <i1> [#uses=1]
  br i1 %40, label %bb6.i.i.i.i, label %bb7.i.i.i.i

bb6.i.i.i.i:                                      ; preds = %bb2.i.i.i.i
  %41 = sdiv i32 %tmp8.i.i, 64                    ; <i32> [#uses=1]
  br label %bb10.i.i.i.i

bb7.i.i.i.i:                                      ; preds = %bb2.i.i.i.i
  %not.i.i.i.i = lshr i32 %tmp8.i.i, 6            ; <i32> [#uses=1]
  %not91.i.i.i.i = or i32 %not.i.i.i.i, -67108864 ; <i32> [#uses=1]
  br label %bb10.i.i.i.i

bb10.i.i.i.i:                                     ; preds = %bb7.i.i.i.i, %bb6.i.i.i.i
  %iftmp.255.0.i.i.i.i = phi i32 [ %41, %bb6.i.i.i.i ], [ %not91.i.i.i.i, %bb7.i.i.i.i ] ; <i32> [#uses=2]
  %42 = getelementptr inbounds double** %.pre23, i32 %iftmp.255.0.i.i.i.i ; <double**> [#uses=1]
  %43 = load double** %42, align 4                ; <double*> [#uses=1]
  %tmp3.i.i = mul i32 %iftmp.255.0.i.i.i.i, -64   ; <i32> [#uses=1]
  %tmp4.i.i = add i32 %tmp8.i.i, %tmp3.i.i        ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i.i

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i.i:      ; preds = %bb10.i.i.i.i, %bb1.i3.i
  %.pn.i.i.i = phi double* [ %43, %bb10.i.i.i.i ], [ %.pre27, %bb1.i3.i ] ; <double*> [#uses=1]
  %__n.pn.i.i.i = phi i32 [ %tmp4.i.i, %bb10.i.i.i.i ], [ %39, %bb1.i3.i ] ; <i32> [#uses=1]
  %storemerge.i.i.i = getelementptr inbounds double* %.pn.i.i.i, i32 %__n.pn.i.i.i ; <double*> [#uses=1]
  %44 = load double* %storemerge.i.i.i, align 8   ; <double> [#uses=1]
  store double* %.pre27, double** %32, align 8
  store double* %28, double** %33, align 4
  store double* %.pre26, double** %34, align 8
  store double** %.pre23, double*** %35, align 4
  call fastcc void @_ZSt13__adjust_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %1, i32 %__parent.0.i.i, i32 %194, double %44) nounwind
  %45 = icmp eq i32 %31, %indvar.i.i              ; <i1> [#uses=1]
  br i1 %45, label %_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i, label %bb2.i.i1

bb2.i.i1:                                         ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i.i
  %46 = add i32 %39, -1                           ; <i32> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb1.i3.i

_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i: ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit.i.i, %bb1
  %47 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 0 ; <double**> [#uses=1]
  %48 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 1 ; <double**> [#uses=1]
  %49 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 2 ; <double**> [#uses=1]
  %50 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 3 ; <double***> [#uses=1]
  %51 = add nsw i32 %25, %192                     ; <i32> [#uses=1]
  %52 = add nsw i32 %51, %188                     ; <i32> [#uses=1]
  br label %bb3.outer.i

bb.i2:                                            ; preds = %bb1.i.i, %bb.i.i
  %53 = load double* %__i.0.0.i, align 8          ; <double> [#uses=2]
  %54 = load double* %.pre27, align 8             ; <double> [#uses=2]
  %55 = fcmp olt double %53, %54                  ; <i1> [#uses=1]
  br i1 %55, label %bb1.i, label %bb2.i3

bb1.i:                                            ; preds = %bb.i2
  store double %54, double* %__i.0.0.i, align 8
  store double* %.pre27, double** %47, align 8
  store double* %28, double** %48, align 4
  store double* %.pre26, double** %49, align 8
  store double** %.pre23, double*** %50, align 4
  call fastcc void @_ZSt13__adjust_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %2, i32 0, i32 %52, double %53) nounwind
  br label %bb2.i3

bb2.i3:                                           ; preds = %bb1.i, %bb.i2
  %56 = icmp eq double* %scevgep.i, %__i.2.0.ph.i ; <i1> [#uses=1]
  br i1 %56, label %bb.i1.i, label %bb3.i

bb.i1.i:                                          ; preds = %bb2.i3
  %57 = load double** %scevgep16.i, align 4       ; <double*> [#uses=2]
  %58 = getelementptr inbounds double* %57, i32 64 ; <double*> [#uses=1]
  br label %bb3.outer.i

bb3.outer.i:                                      ; preds = %bb.i1.i, %_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i
  %indvar12.i = phi i32 [ 0, %_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ], [ %tmp15.i, %bb.i1.i ] ; <i32> [#uses=2]
  %__i.2.0.ph.i = phi double* [ %27, %_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ], [ %58, %bb.i1.i ] ; <double*> [#uses=1]
  %__i.0.0.ph.i = phi double* [ %182, %_ZSt9make_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ], [ %57, %bb.i1.i ] ; <double*> [#uses=2]
  %__i.3.0.ph.i = getelementptr double** %183, i32 %indvar12.i ; <double**> [#uses=2]
  %tmp15.i = add i32 %indvar12.i, 1               ; <i32> [#uses=2]
  %scevgep16.i = getelementptr double** %183, i32 %tmp15.i ; <double**> [#uses=1]
  %59 = icmp eq double** %__i.3.0.ph.i, %183      ; <i1> [#uses=1]
  %60 = icmp ult double** %__i.3.0.ph.i, %183     ; <i1> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %bb3.outer.i, %bb2.i3
  %indvar.i = phi i32 [ 0, %bb3.outer.i ], [ %tmp.i, %bb2.i3 ] ; <i32> [#uses=2]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__i.0.0.ph.i, i32 %tmp.i ; <double*> [#uses=1]
  %__i.0.0.i = getelementptr double* %__i.0.0.ph.i, i32 %indvar.i ; <double*> [#uses=3]
  br i1 %59, label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %bb3.i
  %61 = icmp ult double* %__i.0.0.i, %182         ; <i1> [#uses=1]
  br i1 %61, label %bb.i2, label %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit

bb1.i.i:                                          ; preds = %bb3.i
  br i1 %60, label %bb.i2, label %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit

_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit: ; preds = %bb1.i.i, %bb.i.i
  %62 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 0 ; <double**> [#uses=1]
  %63 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 1 ; <double**> [#uses=1]
  %64 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 2 ; <double**> [#uses=1]
  %65 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 3 ; <double***> [#uses=1]
  br label %bb1.i5

bb.i4:                                            ; preds = %bb1.i5
  %66 = icmp eq double* %102, %.130.1             ; <i1> [#uses=1]
  br i1 %66, label %bb.i.i.i, label %_ZNSt15_Deque_iteratorIdRdPdEmmEi.exit.i

bb.i.i.i:                                         ; preds = %bb.i4
  %67 = getelementptr inbounds double** %.332.1, i32 -1 ; <double**> [#uses=3]
  %68 = load double** %67, align 4                ; <double*> [#uses=3]
  %69 = getelementptr inbounds double* %68, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEmmEi.exit.i

_ZNSt15_Deque_iteratorIdRdPdEmmEi.exit.i:         ; preds = %bb.i.i.i, %bb.i4
  %.130.0 = phi double* [ %68, %bb.i.i.i ], [ %.130.1, %bb.i4 ] ; <double*> [#uses=1]
  %.332.0 = phi double** [ %67, %bb.i.i.i ], [ %.332.1, %bb.i4 ] ; <double**> [#uses=1]
  %.rle5.i = phi double* [ %68, %bb.i.i.i ], [ %.130.1, %bb.i4 ] ; <double*> [#uses=1]
  %.rle1.i = phi double** [ %67, %bb.i.i.i ], [ %.332.1, %bb.i4 ] ; <double**> [#uses=1]
  %70 = phi double* [ %69, %bb.i.i.i ], [ %102, %bb.i4 ] ; <double*> [#uses=1]
  %71 = getelementptr inbounds double* %70, i32 -1 ; <double*> [#uses=1]
  %72 = add i32 %112, -1                          ; <i32> [#uses=12]
  %or.cond.i.i.i.i.i = icmp ult i32 %72, 64       ; <i1> [#uses=3]
  br i1 %or.cond.i.i.i.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread, label %bb2.i.i.i.i.i

_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread: ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEi.exit.i
  %storemerge.i.i.i.i10 = getelementptr inbounds double* %102, i32 -1 ; <double*> [#uses=1]
  %73 = load double* %storemerge.i.i.i.i10, align 8 ; <double> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i

bb2.i.i.i.i.i:                                    ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEi.exit.i
  %74 = icmp sgt i32 %72, 0                       ; <i1> [#uses=2]
  br i1 %74, label %bb6.i.i.i.i.i, label %bb7.i.i.i.i.i

bb6.i.i.i.i.i:                                    ; preds = %bb2.i.i.i.i.i
  %75 = sdiv i32 %72, 64                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i

bb7.i.i.i.i.i:                                    ; preds = %bb2.i.i.i.i.i
  %not.i.i.i.i.i = lshr i32 %72, 6                ; <i32> [#uses=1]
  %not91.i.i.i.i.i = or i32 %not.i.i.i.i.i, -67108864 ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i

_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i:      ; preds = %bb7.i.i.i.i.i, %bb6.i.i.i.i.i
  %iftmp.255.0.i.i.i.i.i = phi i32 [ %75, %bb6.i.i.i.i.i ], [ %not91.i.i.i.i.i, %bb7.i.i.i.i.i ] ; <i32> [#uses=2]
  %76 = getelementptr inbounds double** %.332.1, i32 %iftmp.255.0.i.i.i.i.i ; <double**> [#uses=1]
  %77 = load double** %76, align 4                ; <double*> [#uses=1]
  %78 = shl i32 %iftmp.255.0.i.i.i.i.i, 6         ; <i32> [#uses=1]
  %.pn1.i.i.i.i = sub i32 %72, %78                ; <i32> [#uses=1]
  %storemerge.i.i.i.i = getelementptr inbounds double* %77, i32 %.pn1.i.i.i.i ; <double*> [#uses=1]
  %79 = load double* %storemerge.i.i.i.i, align 8 ; <double> [#uses=2]
  br i1 %or.cond.i.i.i.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread, label %bb2.i.i.i19.i.i

_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread: ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i
  %storemerge.i.i33.i.i12 = getelementptr inbounds double* %102, i32 -1 ; <double*> [#uses=1]
  br label %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i

bb2.i.i.i19.i.i:                                  ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i
  br i1 %74, label %bb6.i.i.i20.i.i, label %bb7.i.i.i23.i.i

bb6.i.i.i20.i.i:                                  ; preds = %bb2.i.i.i19.i.i
  %80 = sdiv i32 %72, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i.i25.i.i

bb7.i.i.i23.i.i:                                  ; preds = %bb2.i.i.i19.i.i
  %not.i.i.i21.i.i = lshr i32 %72, 6              ; <i32> [#uses=1]
  %not91.i.i.i22.i.i = or i32 %not.i.i.i21.i.i, -67108864 ; <i32> [#uses=1]
  br label %bb10.i.i.i25.i.i

bb10.i.i.i25.i.i:                                 ; preds = %bb7.i.i.i23.i.i, %bb6.i.i.i20.i.i
  %iftmp.255.0.i.i.i24.i.i = phi i32 [ %80, %bb6.i.i.i20.i.i ], [ %not91.i.i.i22.i.i, %bb7.i.i.i23.i.i ] ; <i32> [#uses=2]
  %81 = getelementptr inbounds double** %.332.1, i32 %iftmp.255.0.i.i.i24.i.i ; <double**> [#uses=1]
  %82 = load double** %81, align 4                ; <double*> [#uses=1]
  %83 = shl i32 %iftmp.255.0.i.i.i24.i.i, 6       ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i

_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i:    ; preds = %bb10.i.i.i25.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread
  %.reg2mem.0 = phi double [ %73, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread ], [ %79, %bb10.i.i.i25.i.i ] ; <double> [#uses=2]
  %.pn.i.i29.i.i = phi double* [ %82, %bb10.i.i.i25.i.i ], [ %102, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread ] ; <double*> [#uses=1]
  %.pn2.i.i30.i.i = phi i32 [ %72, %bb10.i.i.i25.i.i ], [ 0, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread ] ; <i32> [#uses=1]
  %__n.pn.i.i31.i.i = phi i32 [ %83, %bb10.i.i.i25.i.i ], [ 1, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit.i.i.thread ] ; <i32> [#uses=1]
  %.pn1.i.i32.i.i = sub i32 %.pn2.i.i30.i.i, %__n.pn.i.i31.i.i ; <i32> [#uses=1]
  %storemerge.i.i33.i.i = getelementptr inbounds double* %.pn.i.i29.i.i, i32 %.pn1.i.i32.i.i ; <double*> [#uses=2]
  br i1 %or.cond.i.i.i.i.i, label %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i, label %bb2.i.i.i2.i.i

bb2.i.i.i2.i.i:                                   ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i
  %84 = icmp sgt i32 %72, 0                       ; <i1> [#uses=1]
  br i1 %84, label %bb6.i.i.i3.i.i, label %bb7.i.i.i6.i.i

bb6.i.i.i3.i.i:                                   ; preds = %bb2.i.i.i2.i.i
  %85 = sdiv i32 %72, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i.i8.i.i

bb7.i.i.i6.i.i:                                   ; preds = %bb2.i.i.i2.i.i
  %not.i.i.i4.i.i = lshr i32 %72, 6               ; <i32> [#uses=1]
  %not91.i.i.i5.i.i = or i32 %not.i.i.i4.i.i, -67108864 ; <i32> [#uses=1]
  br label %bb10.i.i.i8.i.i

bb10.i.i.i8.i.i:                                  ; preds = %bb7.i.i.i6.i.i, %bb6.i.i.i3.i.i
  %iftmp.255.0.i.i.i7.i.i = phi i32 [ %85, %bb6.i.i.i3.i.i ], [ %not91.i.i.i5.i.i, %bb7.i.i.i6.i.i ] ; <i32> [#uses=2]
  %86 = getelementptr inbounds double** %.332.1, i32 %iftmp.255.0.i.i.i7.i.i ; <double**> [#uses=2]
  %87 = load double** %86, align 4                ; <double*> [#uses=2]
  %88 = shl i32 %iftmp.255.0.i.i.i7.i.i, 6        ; <i32> [#uses=1]
  br label %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i

_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i: ; preds = %bb10.i.i.i8.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread
  %.reg2mem.1 = phi double [ %.reg2mem.0, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ %.reg2mem.0, %bb10.i.i.i8.i.i ], [ %79, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <double> [#uses=1]
  %storemerge.i.i33.i.i.reg2mem.0 = phi double* [ %storemerge.i.i33.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ %storemerge.i.i33.i.i, %bb10.i.i.i8.i.i ], [ %storemerge.i.i33.i.i12, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <double*> [#uses=1]
  %__tmp.3.0.i9.i.i = phi double** [ %86, %bb10.i.i.i8.i.i ], [ %.332.1, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ %.332.1, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <double**> [#uses=1]
  %__tmp.1.0.i11.i.i = phi double* [ %87, %bb10.i.i.i8.i.i ], [ %101, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ %101, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <double*> [#uses=1]
  %.pn.i.i12.i.i = phi double* [ %87, %bb10.i.i.i8.i.i ], [ %102, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ %102, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <double*> [#uses=1]
  %.pn2.i.i13.i.i = phi i32 [ %72, %bb10.i.i.i8.i.i ], [ 0, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ 0, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <i32> [#uses=1]
  %__n.pn.i.i14.i.i = phi i32 [ %88, %bb10.i.i.i8.i.i ], [ 1, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i ], [ 1, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit34.i.i.thread ] ; <i32> [#uses=1]
  %.pn1.i.i15.i.i = sub i32 %.pn2.i.i13.i.i, %__n.pn.i.i14.i.i ; <i32> [#uses=1]
  %storemerge.i.i16.i.i = getelementptr inbounds double* %.pn.i.i12.i.i, i32 %.pn1.i.i15.i.i ; <double*> [#uses=1]
  %89 = load double* %.pre27, align 8             ; <double> [#uses=1]
  store double %89, double* %storemerge.i.i33.i.i.reg2mem.0, align 8
  %90 = ptrtoint double** %__tmp.3.0.i9.i.i to i32 ; <i32> [#uses=1]
  %91 = sub i32 %90, %21                          ; <i32> [#uses=1]
  %92 = shl i32 %91, 4                            ; <i32> [#uses=1]
  %93 = add i32 %92, -64                          ; <i32> [#uses=1]
  %94 = and i32 %93, -64                          ; <i32> [#uses=1]
  %95 = ptrtoint double* %storemerge.i.i16.i.i to i32 ; <i32> [#uses=1]
  %96 = ptrtoint double* %__tmp.1.0.i11.i.i to i32 ; <i32> [#uses=1]
  %97 = sub i32 %95, %96                          ; <i32> [#uses=1]
  %98 = ashr i32 %97, 3                           ; <i32> [#uses=1]
  %99 = add nsw i32 %25, %98                      ; <i32> [#uses=1]
  %100 = add nsw i32 %99, %94                     ; <i32> [#uses=1]
  store double* %.pre27, double** %62, align 8
  store double* %28, double** %63, align 4
  store double* %.pre26, double** %64, align 8
  store double** %.pre23, double*** %65, align 4
  call fastcc void @_ZSt13__adjust_heapISt15_Deque_iteratorIdRdPdEidEvT_T0_S5_T1_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %0, i32 0, i32 %100, double %.reg2mem.1) nounwind
  br label %bb1.i5

bb1.i5:                                           ; preds = %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i, %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit
  %.130.1 = phi double* [ %181, %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit ], [ %.130.0, %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ] ; <double*> [#uses=3]
  %.332.1 = phi double** [ %183, %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit ], [ %.332.0, %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ] ; <double**> [#uses=8]
  %101 = phi double* [ %.rle5.i, %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ], [ %181, %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit ] ; <double*> [#uses=3]
  %102 = phi double* [ %71, %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ], [ %182, %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit ] ; <double*> [#uses=8]
  %103 = phi double** [ %.rle1.i, %_ZSt8pop_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i ], [ %183, %_ZSt13__heap_selectISt15_Deque_iteratorIdRdPdEEvT_S4_S4_.exit ] ; <double**> [#uses=1]
  %104 = ptrtoint double** %103 to i32            ; <i32> [#uses=1]
  %105 = sub i32 %104, %21                        ; <i32> [#uses=1]
  %106 = shl i32 %105, 4                          ; <i32> [#uses=1]
  %107 = add i32 %106, -64                        ; <i32> [#uses=1]
  %108 = and i32 %107, -64                        ; <i32> [#uses=1]
  %109 = ptrtoint double* %102 to i32             ; <i32> [#uses=1]
  %110 = ptrtoint double* %101 to i32             ; <i32> [#uses=1]
  %111 = sub i32 %109, %110                       ; <i32> [#uses=1]
  %112 = ashr i32 %111, 3                         ; <i32> [#uses=2]
  %113 = add nsw i32 %108, %112                   ; <i32> [#uses=1]
  %114 = add nsw i32 %113, %25                    ; <i32> [#uses=1]
  %115 = icmp sgt i32 %114, 1                     ; <i1> [#uses=1]
  br i1 %115, label %bb.i4, label %_ZSt9sort_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit

_ZSt9sort_heapISt15_Deque_iteratorIdRdPdEEvT_S4_.exit: ; preds = %bb1.i5
  ret void

bb2:                                              ; preds = %bb
  %116 = add i32 %192, -1                         ; <i32> [#uses=5]
  %or.cond.i.i.i = icmp ult i32 %116, 64          ; <i1> [#uses=1]
  br i1 %or.cond.i.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit, label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb2
  %117 = icmp sgt i32 %116, 0                     ; <i1> [#uses=1]
  br i1 %117, label %bb6.i.i.i, label %bb7.i.i.i

bb6.i.i.i:                                        ; preds = %bb2.i.i.i
  %118 = sdiv i32 %116, 64                        ; <i32> [#uses=1]
  br label %bb10.i.i.i

bb7.i.i.i:                                        ; preds = %bb2.i.i.i
  %not.i.i.i = lshr i32 %116, 6                   ; <i32> [#uses=1]
  %not91.i.i.i = or i32 %not.i.i.i, -67108864     ; <i32> [#uses=1]
  br label %bb10.i.i.i

bb10.i.i.i:                                       ; preds = %bb7.i.i.i, %bb6.i.i.i
  %iftmp.255.0.i.i.i = phi i32 [ %118, %bb6.i.i.i ], [ %not91.i.i.i, %bb7.i.i.i ] ; <i32> [#uses=2]
  %119 = getelementptr inbounds double** %183, i32 %iftmp.255.0.i.i.i ; <double**> [#uses=1]
  %120 = load double** %119, align 4              ; <double*> [#uses=1]
  %121 = shl i32 %iftmp.255.0.i.i.i, 6            ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit

_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit:          ; preds = %bb10.i.i.i, %bb2
  %.pn.i.i = phi double* [ %120, %bb10.i.i.i ], [ %182, %bb2 ] ; <double*> [#uses=1]
  %.pn2.i.i = phi i32 [ %116, %bb10.i.i.i ], [ 0, %bb2 ] ; <i32> [#uses=1]
  %__n.pn.i.i = phi i32 [ %121, %bb10.i.i.i ], [ 1, %bb2 ] ; <i32> [#uses=1]
  %.pn1.i.i = sub i32 %.pn2.i.i, %__n.pn.i.i      ; <i32> [#uses=1]
  %storemerge.i.i = getelementptr inbounds double* %.pn.i.i, i32 %.pn1.i.i ; <double*> [#uses=3]
  %122 = sdiv i32 %194, 2                         ; <i32> [#uses=2]
  %123 = load double** %11, align 4               ; <double*> [#uses=2]
  %124 = ptrtoint double* %123 to i32             ; <i32> [#uses=1]
  %125 = sub i32 %23, %124                        ; <i32> [#uses=1]
  %126 = ashr i32 %125, 3                         ; <i32> [#uses=1]
  %127 = add nsw i32 %126, %122                   ; <i32> [#uses=5]
  %or.cond.i.i = icmp ult i32 %127, 64            ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit
  %128 = icmp sgt i32 %127, 0                     ; <i1> [#uses=1]
  br i1 %128, label %bb6.i.i, label %bb7.i.i

bb6.i.i:                                          ; preds = %bb2.i.i
  %129 = sdiv i32 %127, 64                        ; <i32> [#uses=1]
  br label %bb10.i.i

bb7.i.i:                                          ; preds = %bb2.i.i
  %not.i.i = lshr i32 %127, 6                     ; <i32> [#uses=1]
  %not91.i.i = or i32 %not.i.i, -67108864         ; <i32> [#uses=1]
  br label %bb10.i.i

bb10.i.i:                                         ; preds = %bb7.i.i, %bb6.i.i
  %iftmp.255.0.i.i = phi i32 [ %129, %bb6.i.i ], [ %not91.i.i, %bb7.i.i ] ; <i32> [#uses=2]
  %130 = getelementptr inbounds double** %.pre23, i32 %iftmp.255.0.i.i ; <double**> [#uses=1]
  %131 = load double** %130, align 4              ; <double*> [#uses=1]
  %132 = shl i32 %iftmp.255.0.i.i, 6              ; <i32> [#uses=1]
  %133 = sub i32 %127, %132                       ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit:          ; preds = %bb10.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit
  %.pn.i = phi double* [ %131, %bb10.i.i ], [ %.pre27, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit ] ; <double*> [#uses=1]
  %__n.pn.i = phi i32 [ %133, %bb10.i.i ], [ %122, %_ZNKSt15_Deque_iteratorIdRdPdEmiEi.exit ] ; <i32> [#uses=1]
  %storemerge.i = getelementptr inbounds double* %.pn.i, i32 %__n.pn.i ; <double*> [#uses=3]
  %134 = load double* %.pre27, align 8            ; <double> [#uses=3]
  %135 = load double* %storemerge.i, align 8      ; <double> [#uses=3]
  %136 = fcmp olt double %134, %135               ; <i1> [#uses=1]
  %137 = load double* %storemerge.i.i, align 8    ; <double> [#uses=4]
  br i1 %136, label %bb.i, label %bb5.i

bb.i:                                             ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit
  %138 = fcmp olt double %135, %137               ; <i1> [#uses=1]
  br i1 %138, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb2.i

bb2.i:                                            ; preds = %bb.i
  %139 = fcmp olt double %134, %137               ; <i1> [#uses=1]
  %retval.i = select i1 %139, double* %storemerge.i.i, double* %.pre27 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

bb5.i:                                            ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit
  %140 = fcmp olt double %134, %137               ; <i1> [#uses=1]
  br i1 %140, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb7.i

bb7.i:                                            ; preds = %bb5.i
  %141 = fcmp olt double %135, %137               ; <i1> [#uses=1]
  %retval1.i = select i1 %141, double* %storemerge.i.i, double* %storemerge.i ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

_ZSt8__medianIdERKT_S2_S2_S2_.exit:               ; preds = %bb7.i, %bb5.i, %bb2.i, %bb.i
  %142 = phi double* [ %retval1.i, %bb7.i ], [ %retval.i, %bb2.i ], [ %storemerge.i, %bb.i ], [ %.pre27, %bb5.i ] ; <double*> [#uses=1]
  %143 = load double* %142, align 8               ; <double> [#uses=3]
  %144 = load double** %12, align 4               ; <double*> [#uses=1]
  br label %bb10.i.outer

bb9.i:                                            ; preds = %bb10.i
  %145 = getelementptr inbounds double* %149, i32 1 ; <double*> [#uses=4]
  %146 = icmp eq double* %145, %.215.0.ph         ; <i1> [#uses=1]
  br i1 %146, label %bb.i.i7, label %bb10.i

bb.i.i7:                                          ; preds = %bb9.i
  %147 = getelementptr inbounds double** %.316.0.ph, i32 1 ; <double**> [#uses=2]
  %148 = load double** %147, align 4              ; <double*> [#uses=5]
  br label %bb10.i.outer.backedge

bb10.i.outer.backedge:                            ; preds = %bb.i1.i8, %bb.i.i7
  %.013.0.ph.be = phi double* [ %148, %bb.i.i7 ], [ %179, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.114.0.ph.be = phi double* [ %148, %bb.i.i7 ], [ %179, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.pn = phi double* [ %148, %bb.i.i7 ], [ %179, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.316.0.ph.be = phi double** [ %147, %bb.i.i7 ], [ %178, %bb.i1.i8 ] ; <double**> [#uses=1]
  %.0.1.ph.be = phi double* [ %.0.1.ph55, %bb.i.i7 ], [ %.0.0, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.1.3.ph.be = phi double* [ %.1.3.ph56, %bb.i.i7 ], [ %.1.2, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.3.3.ph.be = phi double** [ %.3.3.ph57, %bb.i.i7 ], [ %.3.2, %bb.i1.i8 ] ; <double**> [#uses=1]
  %.rle27.i.ph.be = phi double* [ %148, %bb.i.i7 ], [ %179, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.ph.be = phi double* [ %148, %bb.i.i7 ], [ %179, %bb.i1.i8 ] ; <double*> [#uses=1]
  %.215.0.ph.be = getelementptr inbounds double* %.pn, i32 64 ; <double*> [#uses=1]
  br label %bb10.i.outer

bb10.i.outer:                                     ; preds = %bb10.i.outer.backedge, %_ZSt8__medianIdERKT_S2_S2_S2_.exit
  %.013.0.ph = phi double* [ %.pre27, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.013.0.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=1]
  %.114.0.ph = phi double* [ %123, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.114.0.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=3]
  %.215.0.ph = phi double* [ %.pre26, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.215.0.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=4]
  %.316.0.ph = phi double** [ %.pre23, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.316.0.ph.be, %bb10.i.outer.backedge ] ; <double**> [#uses=7]
  %.0.1.ph = phi double* [ %182, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.0.1.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=1]
  %.1.3.ph = phi double* [ %181, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.1.3.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=1]
  %.3.3.ph = phi double** [ %183, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.3.3.ph.be, %bb10.i.outer.backedge ] ; <double**> [#uses=1]
  %.rle27.i.ph = phi double* [ %.pre27, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.rle27.i.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=1]
  %.ph = phi double* [ %.pre27, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %.ph.be, %bb10.i.outer.backedge ] ; <double*> [#uses=1]
  br label %bb10.i.outer53

bb10.i.outer53:                                   ; preds = %bb20.i, %bb10.i.outer
  %.013.0.ph54 = phi double* [ %176, %bb20.i ], [ %.013.0.ph, %bb10.i.outer ] ; <double*> [#uses=1]
  %.0.1.ph55 = phi double* [ %.0.0, %bb20.i ], [ %.0.1.ph, %bb10.i.outer ] ; <double*> [#uses=3]
  %.1.3.ph56 = phi double* [ %.1.2, %bb20.i ], [ %.1.3.ph, %bb10.i.outer ] ; <double*> [#uses=4]
  %.3.3.ph57 = phi double** [ %.3.2, %bb20.i ], [ %.3.3.ph, %bb10.i.outer ] ; <double**> [#uses=3]
  %.rle27.i.ph58 = phi double* [ %176, %bb20.i ], [ %.rle27.i.ph, %bb10.i.outer ] ; <double*> [#uses=1]
  %.ph59 = phi double* [ %176, %bb20.i ], [ %.ph, %bb10.i.outer ] ; <double*> [#uses=1]
  br label %bb10.i

bb10.i:                                           ; preds = %bb10.i.outer53, %bb9.i
  %.013.0 = phi double* [ %145, %bb9.i ], [ %.013.0.ph54, %bb10.i.outer53 ] ; <double*> [#uses=1]
  %.rle27.i = phi double* [ %145, %bb9.i ], [ %.rle27.i.ph58, %bb10.i.outer53 ] ; <double*> [#uses=4]
  %149 = phi double* [ %145, %bb9.i ], [ %.ph59, %bb10.i.outer53 ] ; <double*> [#uses=3]
  %150 = load double* %149, align 8               ; <double> [#uses=1]
  %151 = fcmp olt double %150, %143               ; <i1> [#uses=1]
  br i1 %151, label %bb9.i, label %bb11.i

bb11.i:                                           ; preds = %bb10.i
  %152 = icmp eq double* %.0.1.ph55, %.1.3.ph56   ; <i1> [#uses=1]
  br i1 %152, label %bb.i8.i, label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i

bb.i8.i:                                          ; preds = %bb11.i
  %153 = getelementptr inbounds double** %.3.3.ph57, i32 -1 ; <double**> [#uses=2]
  %154 = load double** %153, align 4              ; <double*> [#uses=3]
  %155 = getelementptr inbounds double* %154, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i

_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i:       ; preds = %bb.i8.i, %bb11.i
  %.1.4 = phi double* [ %154, %bb.i8.i ], [ %.1.3.ph56, %bb11.i ] ; <double*> [#uses=2]
  %.3.4 = phi double** [ %153, %bb.i8.i ], [ %.3.3.ph57, %bb11.i ] ; <double**> [#uses=2]
  %.rle17.i = phi double* [ %154, %bb.i8.i ], [ %.1.3.ph56, %bb11.i ] ; <double*> [#uses=1]
  %156 = phi double* [ %155, %bb.i8.i ], [ %.0.1.ph55, %bb11.i ] ; <double*> [#uses=1]
  %157 = getelementptr inbounds double* %156, i32 -1 ; <double*> [#uses=4]
  %158 = load double* %157, align 8               ; <double> [#uses=2]
  %159 = fcmp ogt double %158, %143               ; <i1> [#uses=1]
  br i1 %159, label %bb12.i, label %bb15.i

bb12.i:                                           ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i
  %.1.1 = phi double* [ %.1.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ], [ %.1.4, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ] ; <double*> [#uses=1]
  %.3.1 = phi double** [ %.3.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ], [ %.3.4, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ] ; <double**> [#uses=2]
  %160 = phi double* [ %.rle18.i, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ], [ %.rle17.i, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ] ; <double*> [#uses=2]
  %161 = phi double* [ %167, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ], [ %157, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ] ; <double*> [#uses=2]
  %162 = icmp eq double* %161, %160               ; <i1> [#uses=1]
  br i1 %162, label %bb.i6.i, label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i

bb.i6.i:                                          ; preds = %bb12.i
  %163 = getelementptr inbounds double** %.3.1, i32 -1 ; <double**> [#uses=2]
  %164 = load double** %163, align 4              ; <double*> [#uses=3]
  %165 = getelementptr inbounds double* %164, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i

_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i:         ; preds = %bb.i6.i, %bb12.i
  %.1.0 = phi double* [ %164, %bb.i6.i ], [ %.1.1, %bb12.i ] ; <double*> [#uses=2]
  %.3.0 = phi double** [ %163, %bb.i6.i ], [ %.3.1, %bb12.i ] ; <double**> [#uses=2]
  %.rle18.i = phi double* [ %164, %bb.i6.i ], [ %160, %bb12.i ] ; <double*> [#uses=1]
  %166 = phi double* [ %165, %bb.i6.i ], [ %161, %bb12.i ] ; <double*> [#uses=1]
  %167 = getelementptr inbounds double* %166, i32 -1 ; <double*> [#uses=4]
  %168 = load double* %167, align 8               ; <double> [#uses=2]
  %169 = fcmp ogt double %168, %143               ; <i1> [#uses=1]
  br i1 %169, label %bb12.i, label %bb15.i

bb15.i:                                           ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i
  %.0.0 = phi double* [ %157, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ], [ %167, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %.1.2 = phi double* [ %.1.4, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ], [ %.1.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %.3.2 = phi double** [ %.3.4, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ], [ %.3.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double**> [#uses=4]
  %170 = phi double [ %158, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ], [ %168, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double> [#uses=1]
  %171 = phi double* [ %157, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit10.i ], [ %167, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %172 = icmp eq double** %.316.0.ph, %.3.2       ; <i1> [#uses=1]
  br i1 %172, label %bb.i4.i, label %bb1.i5.i

bb.i4.i:                                          ; preds = %bb15.i
  %173 = icmp ult double* %.rle27.i, %171         ; <i1> [#uses=1]
  br i1 %173, label %bb20.i, label %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit

bb1.i5.i:                                         ; preds = %bb15.i
  %174 = icmp ult double** %.316.0.ph, %.3.2      ; <i1> [#uses=1]
  br i1 %174, label %bb20.i, label %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit

bb20.i:                                           ; preds = %bb1.i5.i, %bb.i4.i
  %175 = load double* %.rle27.i, align 8          ; <double> [#uses=1]
  store double %170, double* %.rle27.i, align 8
  store double %175, double* %171, align 8
  %176 = getelementptr inbounds double* %.013.0, i32 1 ; <double*> [#uses=4]
  %177 = icmp eq double* %176, %.215.0.ph         ; <i1> [#uses=1]
  br i1 %177, label %bb.i1.i8, label %bb10.i.outer53

bb.i1.i8:                                         ; preds = %bb20.i
  %178 = getelementptr inbounds double** %.316.0.ph, i32 1 ; <double**> [#uses=2]
  %179 = load double** %178, align 4              ; <double*> [#uses=5]
  br label %bb10.i.outer.backedge

_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit: ; preds = %bb1.i5.i, %bb.i4.i
  %180 = phi double* [ %.rle27.i, %bb.i4.i ], [ %149, %bb1.i5.i ] ; <double*> [#uses=3]
  store double* %182, double** %13, align 8
  store double* %181, double** %14, align 4
  store double* %144, double** %15, align 8
  store double** %183, double*** %16, align 4
  store double* %180, double** %17, align 8
  store double* %.114.0.ph, double** %18, align 4
  store double* %.215.0.ph, double** %19, align 8
  store double** %.316.0.ph, double*** %20, align 4
  call fastcc void @_ZSt16__introsort_loopISt15_Deque_iteratorIdRdPdEiEvT_S4_T0_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %3, %"struct.std::_Deque_iterator<double,double&,double*>"* noalias %4, i32 %tmp21)
  store double* %180, double** %7, align 4
  store double* %.114.0.ph, double** %8, align 4
  store double* %.215.0.ph, double** %12, align 4
  store double** %.316.0.ph, double*** %5, align 4
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit, %entry
  %181 = phi double* [ %.114.0.ph, %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit ], [ %.pre25, %entry ] ; <double*> [#uses=5]
  %182 = phi double* [ %180, %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit ], [ %.pre24, %entry ] ; <double*> [#uses=7]
  %183 = phi double** [ %.316.0.ph, %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit ], [ %.pre, %entry ] ; <double**> [#uses=10]
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %_ZSt21__unguarded_partitionISt15_Deque_iteratorIdRdPdEdET_S4_S4_T0_.exit ] ; <i32> [#uses=3]
  %tmp21 = sub i32 %tmp20, %indvar                ; <i32> [#uses=1]
  %184 = ptrtoint double** %183 to i32            ; <i32> [#uses=1]
  %185 = sub i32 %184, %21                        ; <i32> [#uses=1]
  %186 = shl i32 %185, 4                          ; <i32> [#uses=1]
  %187 = add i32 %186, -64                        ; <i32> [#uses=1]
  %188 = and i32 %187, -64                        ; <i32> [#uses=2]
  %189 = ptrtoint double* %182 to i32             ; <i32> [#uses=1]
  %190 = ptrtoint double* %181 to i32             ; <i32> [#uses=1]
  %191 = sub i32 %189, %190                       ; <i32> [#uses=1]
  %192 = ashr i32 %191, 3                         ; <i32> [#uses=3]
  %193 = add nsw i32 %188, %192                   ; <i32> [#uses=1]
  %194 = add nsw i32 %193, %25                    ; <i32> [#uses=5]
  %195 = icmp sgt i32 %194, 16                    ; <i1> [#uses=1]
  br i1 %195, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

define internal fastcc void @_ZSt16__insertion_sortISt15_Deque_iteratorIdRdPdEEvT_S4_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias nocapture %__first, %"struct.std::_Deque_iterator<double,double&,double*>"* noalias nocapture %__last) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 0 ; <double**> [#uses=2]
  %1 = load double** %0, align 4                  ; <double*> [#uses=3]
  %2 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__last, i32 0, i32 0 ; <double**> [#uses=2]
  %3 = load double** %2, align 4                  ; <double*> [#uses=1]
  %4 = icmp eq double* %1, %3                     ; <i1> [#uses=1]
  br i1 %4, label %return, label %bb

bb:                                               ; preds = %entry
  %5 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 1 ; <double**> [#uses=1]
  %6 = load double** %5, align 4                  ; <double*> [#uses=2]
  %7 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 2 ; <double**> [#uses=2]
  %8 = load double** %7, align 4                  ; <double*> [#uses=1]
  %9 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %__first, i32 0, i32 3 ; <double***> [#uses=2]
  %10 = load double*** %9, align 4                ; <double**> [#uses=2]
  %11 = ptrtoint double* %1 to i32                ; <i32> [#uses=1]
  %12 = ptrtoint double* %6 to i32                ; <i32> [#uses=1]
  %13 = sub i32 %11, %12                          ; <i32> [#uses=1]
  %14 = ashr i32 %13, 3                           ; <i32> [#uses=1]
  %15 = add nsw i32 %14, 1                        ; <i32> [#uses=5]
  %or.cond.i.i3 = icmp ult i32 %15, 64            ; <i1> [#uses=1]
  br i1 %or.cond.i.i3, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17, label %bb2.i.i4

bb2.i.i4:                                         ; preds = %bb
  %16 = icmp sgt i32 %15, 0                       ; <i1> [#uses=1]
  br i1 %16, label %bb6.i.i5, label %bb7.i.i8

bb6.i.i5:                                         ; preds = %bb2.i.i4
  %17 = sdiv i32 %15, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i10

bb7.i.i8:                                         ; preds = %bb2.i.i4
  %not.i.i6 = lshr i32 %15, 6                     ; <i32> [#uses=1]
  %not91.i.i7 = or i32 %not.i.i6, -67108864       ; <i32> [#uses=1]
  br label %bb10.i.i10

bb10.i.i10:                                       ; preds = %bb7.i.i8, %bb6.i.i5
  %iftmp.255.0.i.i9 = phi i32 [ %17, %bb6.i.i5 ], [ %not91.i.i7, %bb7.i.i8 ] ; <i32> [#uses=2]
  %18 = getelementptr inbounds double** %10, i32 %iftmp.255.0.i.i9 ; <double**> [#uses=2]
  %19 = load double** %18, align 4                ; <double*> [#uses=3]
  %20 = getelementptr inbounds double* %19, i32 64 ; <double*> [#uses=1]
  %21 = shl i32 %iftmp.255.0.i.i9, 6              ; <i32> [#uses=1]
  %22 = sub i32 %15, %21                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17:        ; preds = %bb10.i.i10, %bb
  %__tmp.3.0.i11 = phi double** [ %18, %bb10.i.i10 ], [ %10, %bb ] ; <double**> [#uses=4]
  %__tmp.2.0.i12 = phi double* [ %20, %bb10.i.i10 ], [ %8, %bb ] ; <double*> [#uses=1]
  %__tmp.1.0.i13 = phi double* [ %19, %bb10.i.i10 ], [ %6, %bb ] ; <double*> [#uses=1]
  %.pn.i14 = phi double* [ %19, %bb10.i.i10 ], [ %1, %bb ] ; <double*> [#uses=1]
  %__n.pn.i15 = phi i32 [ %22, %bb10.i.i10 ], [ 1, %bb ] ; <i32> [#uses=1]
  %storemerge.i16 = getelementptr inbounds double* %.pn.i14, i32 %__n.pn.i15 ; <double*> [#uses=1]
  br label %bb7.outer

bb1:                                              ; preds = %bb7
  %23 = load double* %__i.0.0, align 8            ; <double> [#uses=4]
  %24 = load double** %0, align 4                 ; <double*> [#uses=3]
  %25 = load double* %24, align 8                 ; <double> [#uses=1]
  %26 = fcmp ogt double %25, %23                  ; <i1> [#uses=1]
  br i1 %26, label %bb3, label %bb5

bb3:                                              ; preds = %bb1
  %27 = ptrtoint double* %__i.0.0 to i32          ; <i32> [#uses=1]
  %28 = sub i32 %27, %75                          ; <i32> [#uses=1]
  %29 = ashr i32 %28, 3                           ; <i32> [#uses=2]
  %30 = add nsw i32 %29, 1                        ; <i32> [#uses=5]
  %or.cond.i.i = icmp ult i32 %30, 64             ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb3
  %31 = icmp sgt i32 %30, 0                       ; <i1> [#uses=1]
  br i1 %31, label %bb6.i.i, label %bb7.i.i

bb6.i.i:                                          ; preds = %bb2.i.i
  %32 = sdiv i32 %30, 64                          ; <i32> [#uses=1]
  br label %bb10.i.i

bb7.i.i:                                          ; preds = %bb2.i.i
  %not.i.i = lshr i32 %30, 6                      ; <i32> [#uses=1]
  %not91.i.i = or i32 %not.i.i, -67108864         ; <i32> [#uses=1]
  br label %bb10.i.i

bb10.i.i:                                         ; preds = %bb7.i.i, %bb6.i.i
  %iftmp.255.0.i.i = phi i32 [ %32, %bb6.i.i ], [ %not91.i.i, %bb7.i.i ] ; <i32> [#uses=2]
  %__i.3.0.ph.sum47 = add i32 %indvar38, %iftmp.255.0.i.i ; <i32> [#uses=1]
  %scevgep42 = getelementptr double** %__tmp.3.0.i11, i32 %__i.3.0.ph.sum47 ; <double**> [#uses=2]
  %33 = load double** %scevgep42, align 4         ; <double*> [#uses=2]
  %34 = shl i32 %iftmp.255.0.i.i, 6               ; <i32> [#uses=1]
  %35 = sub i32 %30, %34                          ; <i32> [#uses=1]
  br label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit:          ; preds = %bb10.i.i, %bb3
  %__tmp.3.0.i = phi double** [ %scevgep42, %bb10.i.i ], [ %__i.3.0.ph, %bb3 ] ; <double**> [#uses=1]
  %__tmp.1.0.i = phi double* [ %33, %bb10.i.i ], [ %__i.1.0.ph, %bb3 ] ; <double*> [#uses=1]
  %.pn.i = phi double* [ %33, %bb10.i.i ], [ %__i.0.0, %bb3 ] ; <double*> [#uses=1]
  %__n.pn.i = phi i32 [ %35, %bb10.i.i ], [ 1, %bb3 ] ; <i32> [#uses=1]
  %storemerge.i = getelementptr inbounds double* %.pn.i, i32 %__n.pn.i ; <double*> [#uses=1]
  %36 = load double** %7, align 4                 ; <double*> [#uses=1]
  %37 = load double*** %9, align 4                ; <double**> [#uses=1]
  %38 = ptrtoint double** %37 to i32              ; <i32> [#uses=1]
  %39 = sub i32 %76, %38                          ; <i32> [#uses=1]
  %40 = shl i32 %39, 4                            ; <i32> [#uses=1]
  %41 = add i32 %40, -64                          ; <i32> [#uses=1]
  %42 = and i32 %41, -64                          ; <i32> [#uses=1]
  %43 = ptrtoint double* %36 to i32               ; <i32> [#uses=1]
  %44 = ptrtoint double* %24 to i32               ; <i32> [#uses=1]
  %45 = sub i32 %43, %44                          ; <i32> [#uses=1]
  %46 = ashr i32 %45, 3                           ; <i32> [#uses=2]
  %47 = add nsw i32 %42, %29                      ; <i32> [#uses=2]
  %__n.06.i = add i32 %46, %47                    ; <i32> [#uses=1]
  %48 = icmp sgt i32 %__n.06.i, 0                 ; <i1> [#uses=1]
  br i1 %48, label %bb.nph.i, label %_ZNSt15__copy_backwardILb0ESt26random_access_iterator_tagE8__copy_bISt15_Deque_iteratorIdRdPdES6_EET0_T_S8_S7_.exit

bb.nph.i:                                         ; preds = %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit
  %tmp10.i = add i32 %47, %46                     ; <i32> [#uses=1]
  br label %bb.i2

bb.i2:                                            ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i, %bb.nph.i
  %.39.1 = phi double** [ %__i.3.0.ph, %bb.nph.i ], [ %.39.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double**> [#uses=2]
  %.17.1 = phi double* [ %__i.1.0.ph, %bb.nph.i ], [ %.17.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %.06.0 = phi double* [ %__i.0.0, %bb.nph.i ], [ %61, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %.1.1 = phi double* [ %__tmp.1.0.i, %bb.nph.i ], [ %.1.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %.3.1 = phi double** [ %__tmp.3.0.i, %bb.nph.i ], [ %.3.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double**> [#uses=2]
  %indvar.i1 = phi i32 [ 0, %bb.nph.i ], [ %indvar.next.i5, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <i32> [#uses=1]
  %49 = phi double* [ %storemerge.i, %bb.nph.i ], [ %55, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i ] ; <double*> [#uses=2]
  %50 = icmp eq double* %49, %.1.1                ; <i1> [#uses=1]
  br i1 %50, label %bb.i1.i3, label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i

bb.i1.i3:                                         ; preds = %bb.i2
  %51 = getelementptr inbounds double** %.3.1, i32 -1 ; <double**> [#uses=2]
  %52 = load double** %51, align 4                ; <double*> [#uses=2]
  %53 = getelementptr inbounds double* %52, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i

_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i:        ; preds = %bb.i1.i3, %bb.i2
  %.1.0 = phi double* [ %52, %bb.i1.i3 ], [ %.1.1, %bb.i2 ] ; <double*> [#uses=1]
  %.3.0 = phi double** [ %51, %bb.i1.i3 ], [ %.3.1, %bb.i2 ] ; <double**> [#uses=1]
  %54 = phi double* [ %53, %bb.i1.i3 ], [ %49, %bb.i2 ] ; <double*> [#uses=1]
  %55 = getelementptr inbounds double* %54, i32 -1 ; <double*> [#uses=2]
  %56 = icmp eq double* %.06.0, %.17.1            ; <i1> [#uses=1]
  br i1 %56, label %bb.i.i4, label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i

bb.i.i4:                                          ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i
  %57 = getelementptr inbounds double** %.39.1, i32 -1 ; <double**> [#uses=2]
  %58 = load double** %57, align 4                ; <double*> [#uses=2]
  %59 = getelementptr inbounds double* %58, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i

_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i:         ; preds = %bb.i.i4, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i
  %.39.0 = phi double** [ %57, %bb.i.i4 ], [ %.39.1, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i ] ; <double**> [#uses=1]
  %.17.0 = phi double* [ %58, %bb.i.i4 ], [ %.17.1, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i ] ; <double*> [#uses=1]
  %60 = phi double* [ %59, %bb.i.i4 ], [ %.06.0, %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit2.i ] ; <double*> [#uses=1]
  %61 = getelementptr inbounds double* %60, i32 -1 ; <double*> [#uses=2]
  %62 = load double* %61, align 8                 ; <double> [#uses=1]
  store double %62, double* %55, align 8
  %indvar.next.i5 = add i32 %indvar.i1, 1         ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i5, %tmp10.i ; <i1> [#uses=1]
  br i1 %exitcond.i, label %_ZNSt15__copy_backwardILb0ESt26random_access_iterator_tagE8__copy_bISt15_Deque_iteratorIdRdPdES6_EET0_T_S8_S7_.exit, label %bb.i2

_ZNSt15__copy_backwardILb0ESt26random_access_iterator_tagE8__copy_bISt15_Deque_iteratorIdRdPdES6_EET0_T_S8_S7_.exit: ; preds = %_ZNSt15_Deque_iteratorIdRdPdEmmEv.exit.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit
  store double %23, double* %24, align 8
  br label %bb6

bb5:                                              ; preds = %bb1
  %63 = icmp eq double* %__i.0.0, %__i.1.0.ph     ; <i1> [#uses=1]
  br i1 %63, label %bb.i1.i, label %bb1.preheader.i

bb.i1.i:                                          ; preds = %bb5
  %64 = load double** %scevgep46, align 4         ; <double*> [#uses=2]
  %65 = getelementptr inbounds double* %64, i32 64 ; <double*> [#uses=1]
  br label %bb1.preheader.i

bb1.preheader.i:                                  ; preds = %bb.i1.i, %bb5
  %__next.3.2.ph.i = phi double** [ %scevgep46, %bb.i1.i ], [ %__i.3.0.ph, %bb5 ] ; <double**> [#uses=1]
  %__next.1.2.ph.i = phi double* [ %64, %bb.i1.i ], [ %__i.1.0.ph, %bb5 ] ; <double*> [#uses=1]
  %.pn.ph.i = phi double* [ %65, %bb.i1.i ], [ %__i.0.0, %bb5 ] ; <double*> [#uses=1]
  br label %bb1.outer.i

bb.i1:                                            ; preds = %bb1.i2
  store double %70, double* %69, align 8
  %66 = icmp eq double* %__next.0.0.i, %__next.1.2.ph5.i ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %66, label %bb.i.i, label %bb1.i2

bb.i.i:                                           ; preds = %bb.i1
  %67 = load double** %scevgep.i, align 4         ; <double*> [#uses=2]
  %68 = getelementptr inbounds double* %67, i32 64 ; <double*> [#uses=1]
  %indvar.next11.i = add i32 %indvar10.i, 1       ; <i32> [#uses=1]
  br label %bb1.outer.i

bb1.outer.i:                                      ; preds = %bb.i.i, %bb1.preheader.i
  %.rle14.i = phi double* [ %__i.0.0, %bb1.preheader.i ], [ %__next.0.0.i, %bb.i.i ] ; <double*> [#uses=1]
  %indvar10.i = phi i32 [ 0, %bb1.preheader.i ], [ %indvar.next11.i, %bb.i.i ] ; <i32> [#uses=2]
  %__next.1.2.ph5.i = phi double* [ %67, %bb.i.i ], [ %__next.1.2.ph.i, %bb1.preheader.i ] ; <double*> [#uses=1]
  %.pn.ph6.i = phi double* [ %68, %bb.i.i ], [ %.pn.ph.i, %bb1.preheader.i ] ; <double*> [#uses=1]
  %tmp36 = xor i32 %indvar10.i, -1                ; <i32> [#uses=1]
  %scevgep.i = getelementptr double** %__next.3.2.ph.i, i32 %tmp36 ; <double**> [#uses=1]
  br label %bb1.i2

bb1.i2:                                           ; preds = %bb1.outer.i, %bb.i1
  %69 = phi double* [ %.rle14.i, %bb1.outer.i ], [ %__next.0.0.i, %bb.i1 ] ; <double*> [#uses=2]
  %indvar.i = phi i32 [ 0, %bb1.outer.i ], [ %indvar.next.i, %bb.i1 ] ; <i32> [#uses=2]
  %tmp34 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__next.0.0.i = getelementptr double* %.pn.ph6.i, i32 %tmp34 ; <double*> [#uses=4]
  %70 = load double* %__next.0.0.i, align 8       ; <double> [#uses=2]
  %71 = fcmp ogt double %70, %23                  ; <i1> [#uses=1]
  br i1 %71, label %bb.i1, label %_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit

_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit: ; preds = %bb1.i2
  store double %23, double* %69, align 8
  br label %bb6

bb6:                                              ; preds = %_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit, %_ZNSt15__copy_backwardILb0ESt26random_access_iterator_tagE8__copy_bISt15_Deque_iteratorIdRdPdES6_EET0_T_S8_S7_.exit
  %72 = icmp eq double* %scevgep, %__i.2.0.ph     ; <i1> [#uses=1]
  br i1 %72, label %bb.i, label %bb7

bb.i:                                             ; preds = %bb6
  %73 = load double** %scevgep44, align 4         ; <double*> [#uses=3]
  %74 = getelementptr inbounds double* %73, i32 64 ; <double*> [#uses=1]
  br label %bb7.outer

bb7.outer:                                        ; preds = %bb.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17
  %indvar38 = phi i32 [ 0, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17 ], [ %tmp43, %bb.i ] ; <i32> [#uses=4]
  %__i.2.0.ph = phi double* [ %__tmp.2.0.i12, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17 ], [ %74, %bb.i ] ; <double*> [#uses=1]
  %__i.1.0.ph = phi double* [ %__tmp.1.0.i13, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17 ], [ %73, %bb.i ] ; <double*> [#uses=5]
  %__i.0.0.ph = phi double* [ %storemerge.i16, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit17 ], [ %73, %bb.i ] ; <double*> [#uses=2]
  %__i.3.0.ph = getelementptr double** %__tmp.3.0.i11, i32 %indvar38 ; <double**> [#uses=4]
  %tmp43 = add i32 %indvar38, 1                   ; <i32> [#uses=2]
  %scevgep44 = getelementptr double** %__tmp.3.0.i11, i32 %tmp43 ; <double**> [#uses=1]
  %tmp45 = add i32 %indvar38, -1                  ; <i32> [#uses=1]
  %scevgep46 = getelementptr double** %__tmp.3.0.i11, i32 %tmp45 ; <double**> [#uses=2]
  %75 = ptrtoint double* %__i.1.0.ph to i32       ; <i32> [#uses=1]
  %76 = ptrtoint double** %__i.3.0.ph to i32      ; <i32> [#uses=1]
  br label %bb7

bb7:                                              ; preds = %bb7.outer, %bb6
  %indvar = phi i32 [ 0, %bb7.outer ], [ %tmp37, %bb6 ] ; <i32> [#uses=2]
  %__i.0.0 = getelementptr double* %__i.0.0.ph, i32 %indvar ; <double*> [#uses=8]
  %tmp37 = add i32 %indvar, 1                     ; <i32> [#uses=2]
  %scevgep = getelementptr double* %__i.0.0.ph, i32 %tmp37 ; <double*> [#uses=1]
  %77 = load double** %2, align 4                 ; <double*> [#uses=1]
  %78 = icmp eq double* %__i.0.0, %77             ; <i1> [#uses=1]
  br i1 %78, label %return, label %bb1

return:                                           ; preds = %bb7, %entry
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<double*>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<double*>"* @_ZStL8__ioinit)
  ret void
}

define internal void @__tcf_1(i8* nocapture %unnamed_arg) nounwind readnone {
_ZNSt6vectorIdSaIdEED1Ev.exit:
  ret void
}

declare void @_ZdlPv(i8*) nounwind

declare void @_ZSt9terminatev() noreturn nounwind

define internal fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %__x) nounwind {
entry:
  %0 = icmp eq %"struct.std::_Rb_tree_node<double>"* %__x, null ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb

bb:                                               ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit, %entry
  %__x_addr.02 = phi %"struct.std::_Rb_tree_node<double>"* [ %24, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit ], [ %__x, %entry ] ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=3]
  %1 = getelementptr inbounds %"struct.std::_Rb_tree_node<double>"* %__x_addr.02, i32 0, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %2 = load %"struct.std::_Rb_tree_node_base"** %1, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %3 = icmp eq %"struct.std::_Rb_tree_node_base"* %2, null ; <i1> [#uses=1]
  br i1 %3, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit, label %bb.i

bb.i:                                             ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit2, %bb
  %__x_addr.0.i1.in = phi %"struct.std::_Rb_tree_node_base"* [ %20, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit2 ], [ %2, %bb ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %4 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %5 = load %"struct.std::_Rb_tree_node_base"** %4, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %6 = icmp eq %"struct.std::_Rb_tree_node_base"* %5, null ; <i1> [#uses=1]
  br i1 %6, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit2, label %bb.i1

bb.i1:                                            ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i, %bb.i
  %__x_addr.02.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %17, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i ], [ %5, %bb.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %7 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %8 = load %"struct.std::_Rb_tree_node_base"** %7, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %9 = bitcast %"struct.std::_Rb_tree_node_base"* %8 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  %10 = icmp eq %"struct.std::_Rb_tree_node_base"* %8, null ; <i1> [#uses=1]
  br i1 %10, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i1
  %__x_addr.0.i1.i = phi %"struct.std::_Rb_tree_node<double>"* [ %14, %bb.i.i ], [ %9, %bb.i1 ] ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=3]
  %11 = getelementptr inbounds %"struct.std::_Rb_tree_node<double>"* %__x_addr.0.i1.i, i32 0, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %12 = load %"struct.std::_Rb_tree_node_base"** %11, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %13 = bitcast %"struct.std::_Rb_tree_node_base"* %12 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  tail call fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %13) nounwind
  %.idx = getelementptr %"struct.std::_Rb_tree_node<double>"* %__x_addr.0.i1.i, i32 0, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %.idx.val = load %"struct.std::_Rb_tree_node_base"** %.idx ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %14 = tail call fastcc %"struct.std::_Rb_tree_node<double>"* @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %.idx.val) nounwind ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=2]
  %15 = bitcast %"struct.std::_Rb_tree_node<double>"* %__x_addr.0.i1.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %15) nounwind
  %phitmp4.i = icmp eq %"struct.std::_Rb_tree_node<double>"* %14, null ; <i1> [#uses=1]
  br i1 %phitmp4.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i, label %bb.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i: ; preds = %bb.i.i, %bb.i1
  %16 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %17 = load %"struct.std::_Rb_tree_node_base"** %16, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %18 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %18) nounwind
  %phitmp.i = icmp eq %"struct.std::_Rb_tree_node_base"* %17, null ; <i1> [#uses=1]
  br i1 %phitmp.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit2, label %bb.i1

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit2: ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i, %bb.i
  %19 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %20 = load %"struct.std::_Rb_tree_node_base"** %19, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %21 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %21) nounwind
  %phitmp4 = icmp eq %"struct.std::_Rb_tree_node_base"* %20, null ; <i1> [#uses=1]
  br i1 %phitmp4, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit, label %bb.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit: ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit2, %bb
  %22 = getelementptr inbounds %"struct.std::_Rb_tree_node<double>"* %__x_addr.02, i32 0, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %23 = load %"struct.std::_Rb_tree_node_base"** %22, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %24 = bitcast %"struct.std::_Rb_tree_node_base"* %23 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  %25 = bitcast %"struct.std::_Rb_tree_node<double>"* %__x_addr.02 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %25) nounwind
  %phitmp = icmp eq %"struct.std::_Rb_tree_node_base"* %23, null ; <i1> [#uses=1]
  br i1 %phitmp, label %return, label %bb

return:                                           ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit, %entry
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<double*>"*)

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare i32 @rand() nounwind

declare double @llvm.log.f64(double) nounwind readonly

declare double @floor(double) nounwind readnone

define i32 @main() {
entry:
  %0 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %1 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %2 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %3 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %4 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %5 = alloca %"struct.std::_Deque_iterator<double,double&,double*>", align 8 ; <%"struct.std::_Deque_iterator<double,double&,double*>"*> [#uses=5]
  %__tmp.i.i.i = alloca [64 x %"struct.std::list<double,std::allocator<double> >"], align 8 ; <[64 x %"struct.std::list<double,std::allocator<double> >"]*> [#uses=16]
  %__carry.i.i.i = alloca %"struct.std::list<double,std::allocator<double> >", align 8 ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=4]
  %container.i71.i = alloca %"struct.std::list<double,std::allocator<double> >", align 8 ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=3]
  %6 = alloca %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"*> [#uses=1]
  %container.i10.i = alloca %"struct.std::multiset<double,std::less<double>,std::allocator<double> >", align 8 ; <%"struct.std::multiset<double,std::less<double>,std::allocator<double> >"*> [#uses=8]
  %container.i.i = alloca %"struct.std::multiset<double,std::less<double>,std::allocator<double> >", align 8 ; <%"struct.std::multiset<double,std::less<double>,std::allocator<double> >"*> [#uses=7]
  %7 = tail call double @llvm.log.f64(double 1.000000e+06) nounwind ; <double> [#uses=1]
  %8 = tail call double @llvm.log.f64(double 2.000000e+00) nounwind ; <double> [#uses=1]
  %9 = fdiv double %7, %8                         ; <double> [#uses=1]
  %10 = fmul double %9, 1.000000e+06              ; <double> [#uses=1]
  %11 = tail call double @llvm.log.f64(double 1.000000e+05) nounwind ; <double> [#uses=1]
  %12 = tail call double @llvm.log.f64(double 2.000000e+00) nounwind ; <double> [#uses=1]
  %13 = fdiv double %11, %12                      ; <double> [#uses=1]
  %14 = fmul double %13, 1.000000e+05             ; <double> [#uses=1]
  %15 = fdiv double %10, %14                      ; <double> [#uses=1]
  %16 = tail call double @floor(double %15) nounwind readnone ; <double> [#uses=1]
  %17 = fptosi double %16 to i32                  ; <i32> [#uses=8]
  %18 = invoke i8* @_Znwj(i32 1600000)
          to label %_ZNSt12_Vector_baseIdSaIdEEC2EjRKS0_.exit.i.i.i unwind label %lpad.i.i.i.i ; <i8*> [#uses=14]

lpad.i.i.i.i:                                     ; preds = %entry
  %eh_ptr.i.i.i.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i)
          to label %.noexc73.i unwind label %lpad.i

.noexc73.i:                                       ; preds = %lpad.i.i.i.i
  unreachable

_ZNSt12_Vector_baseIdSaIdEEC2EjRKS0_.exit.i.i.i:  ; preds = %entry
  %19 = bitcast i8* %18 to double*                ; <double*> [#uses=8]
  br label %bb.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %bb.i.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIdSaIdEEC2EjRKS0_.exit.i.i.i
  %indvar.i.i.i.i.i.i.i.i = phi i32 [ 0, %_ZNSt12_Vector_baseIdSaIdEEC2EjRKS0_.exit.i.i.i ], [ %indvar.next.i.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp81.i = shl i32 %indvar.i.i.i.i.i.i.i.i, 3   ; <i32> [#uses=1]
  %scevgep.i = getelementptr i8* %18, i32 %tmp81.i ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i.i = bitcast i8* %scevgep.i to double* ; <double*> [#uses=1]
  store double 0.000000e+00, double* %__first_addr.02.i.i.i.i.i.i.i.i, align 8
  %indvar.next.i.i.i.i.i.i.i.i = add i32 %indvar.i.i.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i.i.i.i.i.i.i, 200000 ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb1.i, label %bb.i.i.i.i.i.i.i.i

bb1.i:                                            ; preds = %bb.i.i.i.i.i.i.i.i
  %20 = getelementptr inbounds i8* %18, i32 1600000 ; <i8*> [#uses=2]
  %21 = bitcast i8* %20 to double*                ; <double*> [#uses=3]
  br label %bb.i68.i

bb.i68.i:                                         ; preds = %bb.i68.i, %bb1.i
  %indvar.i63.i = phi i32 [ 0, %bb1.i ], [ %tmp.i66.i, %bb.i68.i ] ; <i32> [#uses=2]
  %value.01.i64.i = phi double [ 0.000000e+00, %bb1.i ], [ %22, %bb.i68.i ] ; <double> [#uses=2]
  %tmp84.i = shl i32 %indvar.i63.i, 3             ; <i32> [#uses=1]
  %scevgep85.i = getelementptr i8* %18, i32 %tmp84.i ; <i8*> [#uses=1]
  %first_addr.02.i65.i = bitcast i8* %scevgep85.i to double* ; <double*> [#uses=1]
  store double %value.01.i64.i, double* %first_addr.02.i65.i, align 8
  %22 = fadd double %value.01.i64.i, 1.000000e+00 ; <double> [#uses=1]
  %tmp.i66.i = add i32 %indvar.i63.i, 1           ; <i32> [#uses=2]
  %exitcond83.i = icmp eq i32 %tmp.i66.i, 100000  ; <i1> [#uses=1]
  br i1 %exitcond83.i, label %bb.i62.i, label %bb.i68.i

bb.i62.i:                                         ; preds = %bb.i62.i, %bb.i68.i
  %indvar.i60.i = phi i32 [ %tmp.i61.i, %bb.i62.i ], [ 0, %bb.i68.i ] ; <i32> [#uses=2]
  %value.01.i.i = phi double [ %23, %bb.i62.i ], [ 0.000000e+00, %bb.i68.i ] ; <double> [#uses=2]
  %tmp88121.i = shl i32 %indvar.i60.i, 3          ; <i32> [#uses=1]
  %tmp90.i = add i32 %tmp88121.i, 800000          ; <i32> [#uses=1]
  %scevgep91.i = getelementptr i8* %18, i32 %tmp90.i ; <i8*> [#uses=1]
  %first_addr.02.i.i = bitcast i8* %scevgep91.i to double* ; <double*> [#uses=1]
  store double %value.01.i.i, double* %first_addr.02.i.i, align 8
  %23 = fadd double %value.01.i.i, 1.000000e+00   ; <double> [#uses=1]
  %tmp.i61.i = add i32 %indvar.i60.i, 1           ; <i32> [#uses=2]
  %exitcond87.i = icmp eq i32 %tmp.i61.i, 100000  ; <i1> [#uses=1]
  br i1 %exitcond87.i, label %_Z10initializePdS_.exit.i, label %bb.i62.i

_Z10initializePdS_.exit.i:                        ; preds = %bb.i62.i
  %24 = ptrtoint i8* %18 to i32                   ; <i32> [#uses=2]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb1.i.i, %_Z10initializePdS_.exit.i
  %indvar.i59.i = phi i32 [ 0, %_Z10initializePdS_.exit.i ], [ %tmp4.i.i, %bb1.i.i ] ; <i32> [#uses=2]
  %tmp96.i = shl i32 %indvar.i59.i, 3             ; <i32> [#uses=1]
  %tmp97.i = add i32 %tmp96.i, 8                  ; <i32> [#uses=1]
  %scevgep98.i = getelementptr i8* %18, i32 %tmp97.i ; <i8*> [#uses=2]
  %__i.03.i.i = bitcast i8* %scevgep98.i to double* ; <double*> [#uses=2]
  %tmp4.i.i = add i32 %indvar.i59.i, 1            ; <i32> [#uses=2]
  %25 = tail call i32 @rand() nounwind            ; <i32> [#uses=1]
  %26 = ptrtoint i8* %scevgep98.i to i32          ; <i32> [#uses=1]
  %27 = sub i32 %26, %24                          ; <i32> [#uses=1]
  %28 = ashr i32 %27, 3                           ; <i32> [#uses=1]
  %29 = add nsw i32 %28, 1                        ; <i32> [#uses=1]
  %30 = srem i32 %25, %29                         ; <i32> [#uses=1]
  %31 = getelementptr inbounds double* %19, i32 %30 ; <double*> [#uses=2]
  %32 = load double* %__i.03.i.i, align 8         ; <double> [#uses=1]
  %33 = load double* %31, align 8                 ; <double> [#uses=1]
  store double %33, double* %__i.03.i.i, align 8
  store double %32, double* %31, align 8
  %exitcond95.i = icmp eq i32 %tmp4.i.i, 199999   ; <i1> [#uses=1]
  br i1 %exitcond95.i, label %invcont2.i, label %bb1.i.i

invcont2.i:                                       ; preds = %bb1.i.i
  %34 = icmp sgt i32 %17, 0                       ; <i1> [#uses=6]
  br i1 %34, label %bb.nph.i50.i, label %bb15.i

bb.nph.i50.i:                                     ; preds = %invcont2.i
  %35 = ptrtoint i8* %20 to i32                   ; <i32> [#uses=1]
  %36 = sub i32 %35, %24                          ; <i32> [#uses=6]
  %37 = and i32 %36, -8                           ; <i32> [#uses=3]
  %38 = ashr i32 %36, 3                           ; <i32> [#uses=17]
  br label %bb.i55.i

bb.i55.i:                                         ; preds = %_Z10array_testPdS_i.exit.i, %bb.nph.i50.i
  %indvar.i51.i = phi i32 [ 0, %bb.nph.i50.i ], [ %indvar.next.i53.i, %_Z10array_testPdS_i.exit.i ] ; <i32> [#uses=1]
  %39 = invoke i8* @_Znaj(i32 %37)
          to label %.noexc4.i unwind label %lpad18.i ; <i8*> [#uses=7]

.noexc4.i:                                        ; preds = %bb.i55.i
  %40 = bitcast i8* %39 to double*                ; <double*> [#uses=4]
  call void @llvm.memmove.i32(i8* %39, i8* %18, i32 %36, i32 8) nounwind
  %41 = getelementptr inbounds double* %40, i32 %38 ; <double*> [#uses=5]
  %42 = icmp eq double* %40, %41                  ; <i1> [#uses=2]
  br i1 %42, label %_ZSt6uniqueIPdET_S1_S1_.exit.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %.noexc4.i
  %43 = ptrtoint double* %41 to i32               ; <i32> [#uses=1]
  %44 = ptrtoint i8* %39 to i32                   ; <i32> [#uses=1]
  %45 = sub i32 %43, %44                          ; <i32> [#uses=1]
  %46 = ashr i32 %45, 3                           ; <i32> [#uses=2]
  %47 = icmp eq i32 %46, 1                        ; <i1> [#uses=1]
  br i1 %47, label %_ZSt4__lgIiET_S0_.exit.i.i.i, label %bb.i.i.i2.i

bb.i.i.i2.i:                                      ; preds = %bb.i.i.i2.i, %bb.i.i.i
  %__n_addr.02.i.i.i.i = phi i32 [ %50, %bb.i.i.i2.i ], [ %46, %bb.i.i.i ] ; <i32> [#uses=1]
  %48 = phi i32 [ %49, %bb.i.i.i2.i ], [ 0, %bb.i.i.i ] ; <i32> [#uses=2]
  %49 = add i32 %48, 1                            ; <i32> [#uses=1]
  %50 = ashr i32 %__n_addr.02.i.i.i.i, 1          ; <i32> [#uses=2]
  %phitmp.i.i.i.i = icmp eq i32 %50, 1            ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i.i.i, label %bb.i.i.i2.i

_ZSt4__lgIiET_S0_.exit.loopexit.i.i.i:            ; preds = %bb.i.i.i2.i
  %tmp.i.i.i.i = shl i32 %48, 1                   ; <i32> [#uses=1]
  %phitmp.i.i.i = add i32 %tmp.i.i.i.i, 2         ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i.i.i

_ZSt4__lgIiET_S0_.exit.i.i.i:                     ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i.i.i, %bb.i.i.i
  %__k.0.lcssa.i.i.i.i = phi i32 [ %phitmp.i.i.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i.i ], [ 0, %bb.i.i.i ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %40, double* %41, i32 %__k.0.lcssa.i.i.i.i) nounwind
  call fastcc void @_ZSt22__final_insertion_sortIPdEvT_S1_(double* %40, double* %41) nounwind
  br i1 %42, label %_ZSt6uniqueIPdET_S1_S1_.exit.i.i, label %bb5.i.i.i.i

bb2.i.i.i.i:                                      ; preds = %bb5.i.i.i.i
  %51 = load double* %__first_addr.0.i.i.i.i, align 8 ; <double> [#uses=2]
  %52 = load double* %scevgep.i.i.i.i, align 8    ; <double> [#uses=1]
  %53 = fcmp oeq double %51, %52                  ; <i1> [#uses=1]
  br i1 %53, label %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i, label %bb5.i.i.i.i

bb5.i.i.i.i:                                      ; preds = %bb2.i.i.i.i, %_ZSt4__lgIiET_S0_.exit.i.i.i
  %54 = phi i32 [ %tmp10.i.i.i, %bb2.i.i.i.i ], [ 0, %_ZSt4__lgIiET_S0_.exit.i.i.i ] ; <i32> [#uses=3]
  %tmp10.i.i.i = add i32 %54, 1                   ; <i32> [#uses=2]
  %tmp15.i.i = shl i32 %54, 3                     ; <i32> [#uses=2]
  %tmp16.i.i = add i32 %tmp15.i.i, 8              ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr i8* %39, i32 %tmp16.i.i ; <i8*> [#uses=1]
  %scevgep.i.i.i.i = bitcast i8* %scevgep.i.i to double* ; <double*> [#uses=2]
  %scevgep18.i.i = getelementptr i8* %39, i32 %tmp15.i.i ; <i8*> [#uses=1]
  %__first_addr.0.i.i.i.i = bitcast i8* %scevgep18.i.i to double* ; <double*> [#uses=2]
  %55 = icmp eq i32 %tmp10.i.i.i, %38             ; <i1> [#uses=1]
  br i1 %55, label %_ZSt6uniqueIPdET_S1_S1_.exit.i.i, label %bb2.i.i.i.i

_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i:       ; preds = %bb2.i.i.i.i
  %56 = icmp eq i32 %54, %38                      ; <i1> [#uses=1]
  br i1 %56, label %_ZSt6uniqueIPdET_S1_S1_.exit.i.i, label %bb4.outer.i.i.i

bb2.i.i.i:                                        ; preds = %bb4.i.i.i
  %57 = load double* %scevgep.i.i.i, align 8      ; <double> [#uses=3]
  %58 = fcmp une double %.rle13.i.i.i, %57        ; <i1> [#uses=1]
  br i1 %58, label %bb3.i.i.i, label %bb4.i.i.i

bb3.i.i.i:                                        ; preds = %bb2.i.i.i
  %59 = getelementptr inbounds double* %__dest.0.ph.i.i.i, i32 1 ; <double*> [#uses=2]
  store double %57, double* %59, align 8
  br label %bb4.outer.i.i.i

bb4.outer.i.i.i:                                  ; preds = %bb3.i.i.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i
  %.rle13.i.i.i = phi double [ %57, %bb3.i.i.i ], [ %51, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i ] ; <double> [#uses=1]
  %__dest.0.ph.i.i.i = phi double* [ %59, %bb3.i.i.i ], [ %__first_addr.0.i.i.i.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i.i.i = phi double* [ %scevgep.i.i.i, %bb3.i.i.i ], [ %scevgep.i.i.i.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i ] ; <double*> [#uses=1]
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb4.outer.i.i.i, %bb2.i.i.i
  %indvar.i.i.i = phi i32 [ 0, %bb4.outer.i.i.i ], [ %tmp.i.i, %bb2.i.i.i ] ; <i32> [#uses=1]
  %tmp.i.i = add i32 %indvar.i.i.i, 1             ; <i32> [#uses=2]
  %scevgep.i.i.i = getelementptr double* %__first_addr.0.ph.i.i.i, i32 %tmp.i.i ; <double*> [#uses=3]
  %60 = icmp eq double* %scevgep.i.i.i, %41       ; <i1> [#uses=1]
  br i1 %60, label %_ZSt6uniqueIPdET_S1_S1_.exit.i.i, label %bb2.i.i.i

_ZSt6uniqueIPdET_S1_S1_.exit.i.i:                 ; preds = %bb4.i.i.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i.i, %bb5.i.i.i.i, %_ZSt4__lgIiET_S0_.exit.i.i.i, %.noexc4.i
  %61 = icmp eq i8* %39, null                     ; <i1> [#uses=1]
  br i1 %61, label %_Z10array_testPdS_i.exit.i, label %bb.i3.i

bb.i3.i:                                          ; preds = %_ZSt6uniqueIPdET_S1_S1_.exit.i.i
  call void @_ZdaPv(i8* %39) nounwind
  br label %_Z10array_testPdS_i.exit.i

_Z10array_testPdS_i.exit.i:                       ; preds = %bb.i3.i, %_ZSt6uniqueIPdET_S1_S1_.exit.i.i
  %indvar.next.i53.i = add i32 %indvar.i51.i, 1   ; <i32> [#uses=2]
  %exitcond.i54.i = icmp eq i32 %indvar.next.i53.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i54.i, label %bb.i46.i.loopexit, label %bb.i55.i

bb.i46.i.loopexit:                                ; preds = %_Z10array_testPdS_i.exit.i
  %62 = icmp ugt i32 %38, 536870911               ; <i1> [#uses=1]
  br label %bb.i46.i

bb.i46.i:                                         ; preds = %_Z19vector_pointer_testPdS_i.exit.i, %bb.i46.i.loopexit
  %indvar.i42.i = phi i32 [ %indvar.next.i44.i, %_Z19vector_pointer_testPdS_i.exit.i ], [ 0, %bb.i46.i.loopexit ] ; <i32> [#uses=1]
  br i1 %62, label %bb.i.i.i.i.i.i168.i, label %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i170.i

bb.i.i.i.i.i.i168.i:                              ; preds = %bb.i46.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i169.i unwind label %lpad.i.i174.i

.noexc.i.i169.i:                                  ; preds = %bb.i.i.i.i.i.i168.i
  unreachable

_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i170.i: ; preds = %bb.i46.i
  %63 = invoke i8* @_Znwj(i32 %37)
          to label %invcont3.i175.i unwind label %lpad.i.i174.i ; <i8*> [#uses=7]

.noexc.i171.i:                                    ; preds = %lpad.i.i174.i
  unreachable

lpad.i.i174.i:                                    ; preds = %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i170.i, %bb.i.i.i.i.i.i168.i
  %eh_ptr.i.i172.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select5.i.i173.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i172.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i172.i)
          to label %.noexc.i171.i unwind label %Unwind.i207.i

invcont3.i175.i:                                  ; preds = %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i170.i
  %64 = bitcast i8* %63 to double*                ; <double*> [#uses=4]
  %65 = getelementptr inbounds double* %64, i32 %38 ; <double*> [#uses=5]
  call void @llvm.memmove.i32(i8* %63, i8* %18, i32 %36, i32 8) nounwind
  %66 = icmp eq double* %64, %65                  ; <i1> [#uses=2]
  br i1 %66, label %bb13.i.i, label %bb.i.i176.i

bb.i.i176.i:                                      ; preds = %invcont3.i175.i
  %67 = ptrtoint double* %65 to i32               ; <i32> [#uses=1]
  %68 = ptrtoint i8* %63 to i32                   ; <i32> [#uses=1]
  %69 = sub i32 %67, %68                          ; <i32> [#uses=1]
  %70 = ashr i32 %69, 3                           ; <i32> [#uses=2]
  %71 = icmp eq i32 %70, 1                        ; <i1> [#uses=1]
  br i1 %71, label %_ZSt4__lgIiET_S0_.exit.i.i184.i, label %bb.i.i.i179.i

bb.i.i.i179.i:                                    ; preds = %bb.i.i.i179.i, %bb.i.i176.i
  %__n_addr.02.i.i.i177.i = phi i32 [ %74, %bb.i.i.i179.i ], [ %70, %bb.i.i176.i ] ; <i32> [#uses=1]
  %72 = phi i32 [ %73, %bb.i.i.i179.i ], [ 0, %bb.i.i176.i ] ; <i32> [#uses=2]
  %73 = add i32 %72, 1                            ; <i32> [#uses=1]
  %74 = ashr i32 %__n_addr.02.i.i.i177.i, 1       ; <i32> [#uses=2]
  %phitmp.i.i.i178.i = icmp eq i32 %74, 1         ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i178.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i.i182.i, label %bb.i.i.i179.i

_ZSt4__lgIiET_S0_.exit.loopexit.i.i182.i:         ; preds = %bb.i.i.i179.i
  %tmp.i.i.i180.i = shl i32 %72, 1                ; <i32> [#uses=1]
  %phitmp.i.i181.i = add i32 %tmp.i.i.i180.i, 2   ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i.i184.i

_ZSt4__lgIiET_S0_.exit.i.i184.i:                  ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i.i182.i, %bb.i.i176.i
  %__k.0.lcssa.i.i.i183.i = phi i32 [ %phitmp.i.i181.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i182.i ], [ 0, %bb.i.i176.i ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %64, double* %65, i32 %__k.0.lcssa.i.i.i183.i) nounwind
  call fastcc void @_ZSt22__final_insertion_sortIPdEvT_S1_(double* %64, double* %65) nounwind
  br i1 %66, label %bb13.i.i, label %bb5.i.i.i191.i

bb2.i.i.i185.i:                                   ; preds = %bb5.i.i.i191.i
  %75 = load double* %__first_addr.0.i.i.i190.i, align 8 ; <double> [#uses=2]
  %76 = load double* %scevgep.i.i.i189.i, align 8 ; <double> [#uses=1]
  %77 = fcmp oeq double %75, %76                  ; <i1> [#uses=1]
  br i1 %77, label %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i, label %bb5.i.i.i191.i

bb5.i.i.i191.i:                                   ; preds = %bb2.i.i.i185.i, %_ZSt4__lgIiET_S0_.exit.i.i184.i
  %78 = phi i32 [ %tmp10.i.i186.i, %bb2.i.i.i185.i ], [ 0, %_ZSt4__lgIiET_S0_.exit.i.i184.i ] ; <i32> [#uses=3]
  %tmp10.i.i186.i = add i32 %78, 1                ; <i32> [#uses=2]
  %tmp20.i.i = shl i32 %78, 3                     ; <i32> [#uses=2]
  %tmp21.i187.i = add i32 %tmp20.i.i, 8           ; <i32> [#uses=1]
  %scevgep.i188.i = getelementptr i8* %63, i32 %tmp21.i187.i ; <i8*> [#uses=1]
  %scevgep.i.i.i189.i = bitcast i8* %scevgep.i188.i to double* ; <double*> [#uses=2]
  %scevgep23.i.i = getelementptr i8* %63, i32 %tmp20.i.i ; <i8*> [#uses=1]
  %__first_addr.0.i.i.i190.i = bitcast i8* %scevgep23.i.i to double* ; <double*> [#uses=2]
  %79 = icmp eq i32 %tmp10.i.i186.i, %38          ; <i1> [#uses=1]
  br i1 %79, label %bb13.i.i, label %bb2.i.i.i185.i

_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i:    ; preds = %bb2.i.i.i185.i
  %80 = icmp eq i32 %78, %38                      ; <i1> [#uses=1]
  br i1 %80, label %bb13.i.i, label %bb4.outer.i.i198.i

bb2.i.i193.i:                                     ; preds = %bb4.i.i202.i
  %81 = load double* %scevgep.i.i201.i, align 8   ; <double> [#uses=3]
  %82 = fcmp une double %.rle13.i.i195.i, %81     ; <i1> [#uses=1]
  br i1 %82, label %bb3.i.i194.i, label %bb4.i.i202.i

bb3.i.i194.i:                                     ; preds = %bb2.i.i193.i
  %83 = getelementptr inbounds double* %__dest.0.ph.i.i196.i, i32 1 ; <double*> [#uses=2]
  store double %81, double* %83, align 8
  br label %bb4.outer.i.i198.i

bb4.outer.i.i198.i:                               ; preds = %bb3.i.i194.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i
  %.rle13.i.i195.i = phi double [ %81, %bb3.i.i194.i ], [ %75, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i ] ; <double> [#uses=1]
  %__dest.0.ph.i.i196.i = phi double* [ %83, %bb3.i.i194.i ], [ %__first_addr.0.i.i.i190.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i.i197.i = phi double* [ %scevgep.i.i201.i, %bb3.i.i194.i ], [ %scevgep.i.i.i189.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i ] ; <double*> [#uses=1]
  br label %bb4.i.i202.i

bb4.i.i202.i:                                     ; preds = %bb4.outer.i.i198.i, %bb2.i.i193.i
  %indvar.i.i199.i = phi i32 [ 0, %bb4.outer.i.i198.i ], [ %tmp.i200.i, %bb2.i.i193.i ] ; <i32> [#uses=1]
  %tmp.i200.i = add i32 %indvar.i.i199.i, 1       ; <i32> [#uses=2]
  %scevgep.i.i201.i = getelementptr double* %__first_addr.0.ph.i.i197.i, i32 %tmp.i200.i ; <double*> [#uses=3]
  %84 = icmp eq double* %scevgep.i.i201.i, %65    ; <i1> [#uses=1]
  br i1 %84, label %bb13.i.i, label %bb2.i.i193.i

bb13.i.i:                                         ; preds = %bb4.i.i202.i, %_ZSt13adjacent_findIPdET_S1_S1_.exit.i.i192.i, %bb5.i.i.i191.i, %_ZSt4__lgIiET_S0_.exit.i.i184.i, %invcont3.i175.i
  %85 = icmp eq i8* %63, null                     ; <i1> [#uses=1]
  br i1 %85, label %_Z19vector_pointer_testPdS_i.exit.i, label %bb.i.i.i.i203.i

bb.i.i.i.i203.i:                                  ; preds = %bb13.i.i
  call void @_ZdlPv(i8* %63) nounwind
  br label %_Z19vector_pointer_testPdS_i.exit.i

Unwind.i207.i:                                    ; preds = %lpad.i.i174.i
  %eh_ptr.i205.i = call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select15.i206.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i205.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i205.i)
          to label %.noexc208.i unwind label %lpad18.i

.noexc208.i:                                      ; preds = %Unwind.i207.i
  unreachable

_Z19vector_pointer_testPdS_i.exit.i:              ; preds = %bb.i.i.i.i203.i, %bb13.i.i
  %indvar.next.i44.i = add i32 %indvar.i42.i, 1   ; <i32> [#uses=2]
  %exitcond.i45.i = icmp eq i32 %indvar.next.i44.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i45.i, label %invcont4.i, label %bb.i46.i

invcont4.i:                                       ; preds = %_Z19vector_pointer_testPdS_i.exit.i
  br i1 %34, label %bb.nph.i32.i, label %bb15.i

bb.nph.i32.i:                                     ; preds = %invcont4.i
  %86 = icmp eq i32 %38, 16                       ; <i1> [#uses=1]
  %87 = icmp eq i32 %38, 1                        ; <i1> [#uses=1]
  br label %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i.i

_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i.i: ; preds = %_Z20vector_iterator_testPdS_i.exit.i, %bb.nph.i32.i
  %indvar.i33.i = phi i32 [ 0, %bb.nph.i32.i ], [ %indvar.next.i35.i, %_Z20vector_iterator_testPdS_i.exit.i ] ; <i32> [#uses=1]
  %88 = invoke i8* @_Znwj(i32 %37)
          to label %invcont3.i.i unwind label %lpad.i.i140.i ; <i8*> [#uses=9]

.noexc.i137.i:                                    ; preds = %lpad.i.i140.i
  unreachable

lpad.i.i140.i:                                    ; preds = %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i.i
  %eh_ptr.i.i138.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select5.i.i139.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i138.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i138.i)
          to label %.noexc.i137.i unwind label %Unwind.i166.i

invcont3.i.i:                                     ; preds = %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i.i
  %89 = bitcast i8* %88 to double*                ; <double*> [#uses=27]
  %90 = getelementptr inbounds double* %89, i32 %38 ; <double*> [#uses=4]
  call void @llvm.memmove.i32(i8* %88, i8* %18, i32 %36, i32 8) nounwind
  %91 = icmp eq double* %89, %90                  ; <i1> [#uses=2]
  br i1 %91, label %bb19.i.i, label %bb.i1.i.i

bb.i1.i.i:                                        ; preds = %invcont3.i.i
  %92 = ptrtoint double* %90 to i32               ; <i32> [#uses=1]
  %93 = ptrtoint i8* %88 to i32                   ; <i32> [#uses=3]
  %94 = sub i32 %92, %93                          ; <i32> [#uses=1]
  %95 = ashr i32 %94, 3                           ; <i32> [#uses=3]
  %96 = icmp eq i32 %95, 1                        ; <i1> [#uses=1]
  br i1 %96, label %_ZSt4__lgIiET_S0_.exit.i.i148.i, label %bb.i.i.i143.i

bb.i.i.i143.i:                                    ; preds = %bb.i.i.i143.i, %bb.i1.i.i
  %__n_addr.02.i.i.i141.i = phi i32 [ %99, %bb.i.i.i143.i ], [ %95, %bb.i1.i.i ] ; <i32> [#uses=1]
  %97 = phi i32 [ %98, %bb.i.i.i143.i ], [ 0, %bb.i1.i.i ] ; <i32> [#uses=2]
  %98 = add i32 %97, 1                            ; <i32> [#uses=1]
  %99 = ashr i32 %__n_addr.02.i.i.i141.i, 1       ; <i32> [#uses=2]
  %phitmp.i.i.i142.i = icmp eq i32 %99, 1         ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i142.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i.i146.i, label %bb.i.i.i143.i

_ZSt4__lgIiET_S0_.exit.loopexit.i.i146.i:         ; preds = %bb.i.i.i143.i
  %tmp.i.i.i144.i = shl i32 %97, 1                ; <i32> [#uses=1]
  %phitmp.i.i145.i = add i32 %tmp.i.i.i144.i, 2   ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i.i148.i

_ZSt4__lgIiET_S0_.exit.i.i148.i:                  ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i.i146.i, %bb.i1.i.i
  %__k.0.lcssa.i.i.i147.i = phi i32 [ %phitmp.i.i145.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i146.i ], [ 0, %bb.i1.i.i ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEiEvT_S7_T0_(double* %89, double* %90, i32 %__k.0.lcssa.i.i.i147.i) nounwind
  %100 = icmp sgt i32 %95, 16                     ; <i1> [#uses=1]
  br i1 %100, label %bb1.i19.i.i.i, label %bb12.preheader.i.i.i.i

bb1.i19.i.i.i:                                    ; preds = %bb12.backedge.i37.i.i.i, %_ZSt4__lgIiET_S0_.exit.i.i148.i
  %101 = phi i32 [ %tmp70.i.i.i, %bb12.backedge.i37.i.i.i ], [ 0, %_ZSt4__lgIiET_S0_.exit.i.i148.i ] ; <i32> [#uses=5]
  %tmp70.i.i.i = add i32 %101, 1                  ; <i32> [#uses=4]
  %tmp68.i.i.i = add i32 %101, -1                 ; <i32> [#uses=1]
  %__i.0.07.i18.i.i.i = getelementptr double* %89, i32 %tmp70.i.i.i ; <double*> [#uses=3]
  %102 = load double* %__i.0.07.i18.i.i.i, align 8 ; <double> [#uses=5]
  %103 = load double* %89, align 8                ; <double> [#uses=1]
  %104 = fcmp ogt double %103, %102               ; <i1> [#uses=1]
  br i1 %104, label %bb3.i23.i.i.i, label %bb8.i25.i.i.i

bb3.i23.i.i.i:                                    ; preds = %bb1.i19.i.i.i
  %tmp75.i.i.i = add i32 %101, 2                  ; <i32> [#uses=1]
  %105 = ptrtoint double* %__i.0.07.i18.i.i.i to i32 ; <i32> [#uses=1]
  %106 = sub i32 %105, %93                        ; <i32> [#uses=2]
  %107 = ashr i32 %106, 3                         ; <i32> [#uses=1]
  %108 = and i32 %106, -8                         ; <i32> [#uses=1]
  %__i.0.0.sum.i20.i.i.i = sub i32 %tmp75.i.i.i, %107 ; <i32> [#uses=1]
  %scevgep.i21.i.i.i = getelementptr double* %89, i32 %__i.0.0.sum.i20.i.i.i ; <double*> [#uses=1]
  %scevgep17.i22.i.i.i = bitcast double* %scevgep.i21.i.i.i to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep17.i22.i.i.i, i8* %88, i32 %108, i32 8) nounwind
  store double %102, double* %89, align 8
  br label %bb12.backedge.i37.i.i.i

bb8.i25.i.i.i:                                    ; preds = %bb1.i19.i.i.i
  %__first.0.pn5.i24.i.i.i = getelementptr double* %89, i32 %101 ; <double*> [#uses=1]
  %109 = load double* %__first.0.pn5.i24.i.i.i, align 8 ; <double> [#uses=1]
  %110 = fcmp ogt double %109, %102               ; <i1> [#uses=1]
  br i1 %110, label %bb.i.i34.i.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i36.i.i.i

bb.i.i34.i.i.i:                                   ; preds = %bb.i.i34.i.i.i, %bb8.i25.i.i.i
  %indvar.i.i26.i.i.i = phi i32 [ %indvar.next.i.i33.i.i.i, %bb.i.i34.i.i.i ], [ 0, %bb8.i25.i.i.i ] ; <i32> [#uses=4]
  %tmp69.i.i.i = sub i32 %tmp68.i.i.i, %indvar.i.i26.i.i.i ; <i32> [#uses=1]
  %__next.0.0.i.i28.i.i.i = getelementptr double* %89, i32 %tmp69.i.i.i ; <double*> [#uses=1]
  %tmp71.i.i.i = sub i32 %tmp70.i.i.i, %indvar.i.i26.i.i.i ; <i32> [#uses=1]
  %__last_addr.0.02.i.i32.i.i.i = getelementptr double* %89, i32 %tmp71.i.i.i ; <double*> [#uses=1]
  %tmp72.i.i149.i = sub i32 %101, %indvar.i.i26.i.i.i ; <i32> [#uses=1]
  %__next.0.04.i.i30.i.i.i = getelementptr double* %89, i32 %tmp72.i.i149.i ; <double*> [#uses=2]
  %111 = load double* %__next.0.04.i.i30.i.i.i, align 8 ; <double> [#uses=1]
  store double %111, double* %__last_addr.0.02.i.i32.i.i.i, align 8
  %112 = load double* %__next.0.0.i.i28.i.i.i, align 8 ; <double> [#uses=1]
  %113 = fcmp ogt double %112, %102               ; <i1> [#uses=1]
  %indvar.next.i.i33.i.i.i = add i32 %indvar.i.i26.i.i.i, 1 ; <i32> [#uses=1]
  br i1 %113, label %bb.i.i34.i.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i36.i.i.i

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i36.i.i.i: ; preds = %bb.i.i34.i.i.i, %bb8.i25.i.i.i
  %__last_addr.0.0.lcssa.i.i35.i.i.i = phi double* [ %__i.0.07.i18.i.i.i, %bb8.i25.i.i.i ], [ %__next.0.04.i.i30.i.i.i, %bb.i.i34.i.i.i ] ; <double*> [#uses=1]
  store double %102, double* %__last_addr.0.0.lcssa.i.i35.i.i.i, align 8
  br label %bb12.backedge.i37.i.i.i

bb12.backedge.i37.i.i.i:                          ; preds = %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i36.i.i.i, %bb3.i23.i.i.i
  %exitcond.i.i150.i = icmp eq i32 %tmp70.i.i.i, 15 ; <i1> [#uses=1]
  br i1 %exitcond.i.i150.i, label %_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit38.i.i.i, label %bb1.i19.i.i.i

_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit38.i.i.i: ; preds = %bb12.backedge.i37.i.i.i
  br i1 %86, label %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i, label %bb.i.i1.i.i

bb.i.i1.i.i:                                      ; preds = %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i10.i.i.i, %_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit38.i.i.i
  %114 = phi i32 [ %tmp9.i1.i.i.i, %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i10.i.i.i ], [ 0, %_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit38.i.i.i ] ; <i32> [#uses=5]
  %tmp61.i.i.i = add i32 %114, 16                 ; <i32> [#uses=2]
  %tmp59.i.i.i = add i32 %114, 14                 ; <i32> [#uses=1]
  %tmp57.i.i.i = add i32 %114, 15                 ; <i32> [#uses=2]
  %tmp66.i.i.i = add i32 %114, 17                 ; <i32> [#uses=1]
  %__i.0.01.i.i.i.i = getelementptr double* %89, i32 %tmp61.i.i.i ; <double*> [#uses=2]
  %__next.0.03.i.i.i.i.i = getelementptr double* %89, i32 %tmp57.i.i.i ; <double*> [#uses=1]
  %tmp9.i1.i.i.i = add i32 %114, 1                ; <i32> [#uses=1]
  %115 = load double* %__i.0.01.i.i.i.i, align 8  ; <double> [#uses=3]
  %116 = load double* %__next.0.03.i.i.i.i.i, align 8 ; <double> [#uses=1]
  %117 = fcmp ogt double %116, %115               ; <i1> [#uses=1]
  br i1 %117, label %bb.i.i8.i.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i10.i.i.i

bb.i.i8.i.i.i:                                    ; preds = %bb.i.i8.i.i.i, %bb.i.i1.i.i
  %indvar.i.i3.i.i.i = phi i32 [ %indvar.next.i.i7.i.i.i, %bb.i.i8.i.i.i ], [ 0, %bb.i.i1.i.i ] ; <i32> [#uses=4]
  %tmp58.i.i.i = sub i32 %tmp57.i.i.i, %indvar.i.i3.i.i.i ; <i32> [#uses=1]
  %__next.0.04.i.i4.i.i.i = getelementptr double* %89, i32 %tmp58.i.i.i ; <double*> [#uses=2]
  %tmp60.i.i.i = sub i32 %tmp59.i.i.i, %indvar.i.i3.i.i.i ; <i32> [#uses=1]
  %__next.0.0.i.i5.i.i.i = getelementptr double* %89, i32 %tmp60.i.i.i ; <double*> [#uses=1]
  %tmp62.i.i.i = sub i32 %tmp61.i.i.i, %indvar.i.i3.i.i.i ; <i32> [#uses=1]
  %__last_addr.0.02.i.i6.i.i.i = getelementptr double* %89, i32 %tmp62.i.i.i ; <double*> [#uses=1]
  %118 = load double* %__next.0.04.i.i4.i.i.i, align 8 ; <double> [#uses=1]
  store double %118, double* %__last_addr.0.02.i.i6.i.i.i, align 8
  %119 = load double* %__next.0.0.i.i5.i.i.i, align 8 ; <double> [#uses=1]
  %120 = fcmp ogt double %119, %115               ; <i1> [#uses=1]
  %indvar.next.i.i7.i.i.i = add i32 %indvar.i.i3.i.i.i, 1 ; <i32> [#uses=1]
  br i1 %120, label %bb.i.i8.i.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i10.i.i.i

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i10.i.i.i: ; preds = %bb.i.i8.i.i.i, %bb.i.i1.i.i
  %__last_addr.0.0.lcssa.i.i9.i.i.i = phi double* [ %__i.0.01.i.i.i.i, %bb.i.i1.i.i ], [ %__next.0.04.i.i4.i.i.i, %bb.i.i8.i.i.i ] ; <double*> [#uses=1]
  store double %115, double* %__last_addr.0.0.lcssa.i.i9.i.i.i, align 8
  %121 = icmp eq i32 %tmp66.i.i.i, %38            ; <i1> [#uses=1]
  br i1 %121, label %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i, label %bb.i.i1.i.i

bb12.preheader.i.i.i.i:                           ; preds = %_ZSt4__lgIiET_S0_.exit.i.i148.i
  br i1 %87, label %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i, label %bb1.i.i.i151.i

bb1.i.i.i151.i:                                   ; preds = %bb12.backedge.i.i.i.i, %bb12.preheader.i.i.i.i
  %122 = phi i32 [ %tmp48.i.i.i, %bb12.backedge.i.i.i.i ], [ 0, %bb12.preheader.i.i.i.i ] ; <i32> [#uses=5]
  %tmp48.i.i.i = add i32 %122, 1                  ; <i32> [#uses=3]
  %tmp46.i.i.i = add i32 %122, -1                 ; <i32> [#uses=1]
  %tmp53.i.i.i = add i32 %122, 2                  ; <i32> [#uses=2]
  %__i.0.07.i.i.i.i = getelementptr double* %89, i32 %tmp48.i.i.i ; <double*> [#uses=3]
  %123 = load double* %__i.0.07.i.i.i.i, align 8  ; <double> [#uses=5]
  %124 = load double* %89, align 8                ; <double> [#uses=1]
  %125 = fcmp ogt double %124, %123               ; <i1> [#uses=1]
  br i1 %125, label %bb3.i.i.i.i, label %bb8.i.i.i152.i

bb3.i.i.i.i:                                      ; preds = %bb1.i.i.i151.i
  %126 = ptrtoint double* %__i.0.07.i.i.i.i to i32 ; <i32> [#uses=1]
  %127 = sub i32 %126, %93                        ; <i32> [#uses=2]
  %128 = ashr i32 %127, 3                         ; <i32> [#uses=1]
  %129 = and i32 %127, -8                         ; <i32> [#uses=1]
  %__i.0.0.sum.i.i.i.i = sub i32 %tmp53.i.i.i, %128 ; <i32> [#uses=1]
  %scevgep.i.i3.i.i = getelementptr double* %89, i32 %__i.0.0.sum.i.i.i.i ; <double*> [#uses=1]
  %scevgep17.i.i.i.i = bitcast double* %scevgep.i.i3.i.i to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep17.i.i.i.i, i8* %88, i32 %129, i32 8) nounwind
  store double %123, double* %89, align 8
  br label %bb12.backedge.i.i.i.i

bb8.i.i.i152.i:                                   ; preds = %bb1.i.i.i151.i
  %__first.0.pn5.i.i.i.i = getelementptr double* %89, i32 %122 ; <double*> [#uses=1]
  %130 = load double* %__first.0.pn5.i.i.i.i, align 8 ; <double> [#uses=1]
  %131 = fcmp ogt double %130, %123               ; <i1> [#uses=1]
  br i1 %131, label %bb.i.i.i4.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i.i

bb.i.i.i4.i.i:                                    ; preds = %bb.i.i.i4.i.i, %bb8.i.i.i152.i
  %indvar.i.i.i.i153.i = phi i32 [ %indvar.next.i.i.i.i.i, %bb.i.i.i4.i.i ], [ 0, %bb8.i.i.i152.i ] ; <i32> [#uses=4]
  %tmp47.i.i.i = sub i32 %tmp46.i.i.i, %indvar.i.i.i.i153.i ; <i32> [#uses=1]
  %__next.0.0.i.i.i.i.i = getelementptr double* %89, i32 %tmp47.i.i.i ; <double*> [#uses=1]
  %tmp49.i.i.i = sub i32 %tmp48.i.i.i, %indvar.i.i.i.i153.i ; <i32> [#uses=1]
  %__last_addr.0.02.i.i.i.i.i = getelementptr double* %89, i32 %tmp49.i.i.i ; <double*> [#uses=1]
  %tmp50.i.i.i = sub i32 %122, %indvar.i.i.i.i153.i ; <i32> [#uses=1]
  %__next.0.04.i.i.i.i.i = getelementptr double* %89, i32 %tmp50.i.i.i ; <double*> [#uses=2]
  %132 = load double* %__next.0.04.i.i.i.i.i, align 8 ; <double> [#uses=1]
  store double %132, double* %__last_addr.0.02.i.i.i.i.i, align 8
  %133 = load double* %__next.0.0.i.i.i.i.i, align 8 ; <double> [#uses=1]
  %134 = fcmp ogt double %133, %123               ; <i1> [#uses=1]
  %indvar.next.i.i.i.i.i = add i32 %indvar.i.i.i.i153.i, 1 ; <i32> [#uses=1]
  br i1 %134, label %bb.i.i.i4.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i.i

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i.i: ; preds = %bb.i.i.i4.i.i, %bb8.i.i.i152.i
  %__last_addr.0.0.lcssa.i.i.i.i.i = phi double* [ %__i.0.07.i.i.i.i, %bb8.i.i.i152.i ], [ %__next.0.04.i.i.i.i.i, %bb.i.i.i4.i.i ] ; <double*> [#uses=1]
  store double %123, double* %__last_addr.0.0.lcssa.i.i.i.i.i, align 8
  br label %bb12.backedge.i.i.i.i

bb12.backedge.i.i.i.i:                            ; preds = %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i.i, %bb3.i.i.i.i
  %135 = icmp eq i32 %tmp53.i.i.i, %38            ; <i1> [#uses=1]
  br i1 %135, label %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i, label %bb1.i.i.i151.i

_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i: ; preds = %bb12.backedge.i.i.i.i, %bb12.preheader.i.i.i.i, %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i10.i.i.i, %_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit38.i.i.i
  br i1 %91, label %bb19.i.i, label %bb6.i.i.i.i

bb2.i.i.i156.i:                                   ; preds = %bb6.i.i.i.i
  %tmp22.i.i = add i32 %tmp21.i.i, 8              ; <i32> [#uses=1]
  %scevgep.i154.i = getelementptr i8* %88, i32 %tmp22.i.i ; <i8*> [#uses=1]
  %scevgep.i.i.i155.i = bitcast i8* %scevgep.i154.i to double* ; <double*> [#uses=1]
  %scevgep24.i.i = getelementptr i8* %88, i32 %tmp21.i.i ; <i8*> [#uses=1]
  %__first_addr.0.0.i.i.i.i = bitcast i8* %scevgep24.i.i to double* ; <double*> [#uses=1]
  %136 = load double* %__first_addr.0.0.i.i.i.i, align 8 ; <double> [#uses=1]
  %137 = load double* %scevgep.i.i.i155.i, align 8 ; <double> [#uses=1]
  %138 = fcmp oeq double %136, %137               ; <i1> [#uses=1]
  br i1 %138, label %_ZSt13adjacent_findIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i.i.i, label %bb6.i.i.i.i

bb6.i.i.i.i:                                      ; preds = %bb2.i.i.i156.i, %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i
  %139 = phi i32 [ %tmp.i.i157.i, %bb2.i.i.i156.i ], [ 0, %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i ] ; <i32> [#uses=5]
  %tmp.i.i157.i = add i32 %139, 1                 ; <i32> [#uses=3]
  %tmp21.i.i = shl i32 %139, 3                    ; <i32> [#uses=2]
  %140 = icmp eq i32 %tmp.i.i157.i, %38           ; <i1> [#uses=1]
  br i1 %140, label %bb19.i.i, label %bb2.i.i.i156.i

_ZSt13adjacent_findIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i.i.i: ; preds = %bb2.i.i.i156.i
  %141 = icmp eq i32 %139, %38                    ; <i1> [#uses=1]
  br i1 %141, label %bb19.i.i, label %bb3.i.i158.i

bb3.i.i158.i:                                     ; preds = %_ZSt13adjacent_findIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i.i.i
  %142 = getelementptr inbounds double* %89, i32 %tmp.i.i157.i ; <double*> [#uses=1]
  br label %bb7.outer.i.i.i

bb4.i.i159.i:                                     ; preds = %bb7.i.i.i
  %143 = load double* %__dest.0.0.ph.i.i.i, align 8 ; <double> [#uses=1]
  %144 = load double* %scevgep.i.i163.i, align 8  ; <double> [#uses=2]
  %145 = fcmp une double %143, %144               ; <i1> [#uses=1]
  br i1 %145, label %bb6.i.i160.i, label %bb7.i.i.i

bb6.i.i160.i:                                     ; preds = %bb4.i.i159.i
  store double %144, double* %scevgep9.i.i.i, align 8
  br label %bb7.outer.i.i.i

bb7.outer.i.i.i:                                  ; preds = %bb6.i.i160.i, %bb3.i.i158.i
  %146 = phi i32 [ 0, %bb3.i.i158.i ], [ %tmp8.i.i.i, %bb6.i.i160.i ] ; <i32> [#uses=2]
  %__first_addr.0.0.ph.i.i.i = phi double* [ %142, %bb3.i.i158.i ], [ %scevgep.i.i163.i, %bb6.i.i160.i ] ; <double*> [#uses=1]
  %tmp8.i.i.i = add i32 %146, 1                   ; <i32> [#uses=2]
  %__first_addr.0.0.i.i.sum12.i.i = add i32 %146, %139 ; <i32> [#uses=1]
  %__dest.0.0.ph.i.i.i = getelementptr double* %89, i32 %__first_addr.0.0.i.i.sum12.i.i ; <double*> [#uses=1]
  %__first_addr.0.0.i.i.sum.i.i = add i32 %tmp8.i.i.i, %139 ; <i32> [#uses=1]
  %scevgep9.i.i.i = getelementptr double* %89, i32 %__first_addr.0.0.i.i.sum.i.i ; <double*> [#uses=1]
  br label %bb7.i.i.i

bb7.i.i.i:                                        ; preds = %bb7.outer.i.i.i, %bb4.i.i159.i
  %indvar.i.i161.i = phi i32 [ 0, %bb7.outer.i.i.i ], [ %tmp.i162.i, %bb4.i.i159.i ] ; <i32> [#uses=1]
  %tmp.i162.i = add i32 %indvar.i.i161.i, 1       ; <i32> [#uses=2]
  %scevgep.i.i163.i = getelementptr double* %__first_addr.0.0.ph.i.i.i, i32 %tmp.i162.i ; <double*> [#uses=3]
  %147 = icmp eq double* %scevgep.i.i163.i, %90   ; <i1> [#uses=1]
  br i1 %147, label %bb19.i.i, label %bb4.i.i159.i

bb19.i.i:                                         ; preds = %bb7.i.i.i, %_ZSt13adjacent_findIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i.i.i, %bb6.i.i.i.i, %_ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i, %invcont3.i.i
  %148 = icmp eq i8* %88, null                    ; <i1> [#uses=1]
  br i1 %148, label %_Z20vector_iterator_testPdS_i.exit.i, label %bb.i.i.i.i164.i

bb.i.i.i.i164.i:                                  ; preds = %bb19.i.i
  call void @_ZdlPv(i8* %88) nounwind
  br label %_Z20vector_iterator_testPdS_i.exit.i

Unwind.i166.i:                                    ; preds = %lpad.i.i140.i
  %eh_ptr.i165.i = call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select21.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i165.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i165.i)
          to label %.noexc167.i unwind label %lpad18.i

.noexc167.i:                                      ; preds = %Unwind.i166.i
  unreachable

_Z20vector_iterator_testPdS_i.exit.i:             ; preds = %bb.i.i.i.i164.i, %bb19.i.i
  %indvar.next.i35.i = add i32 %indvar.i33.i, 1   ; <i32> [#uses=2]
  %exitcond.i36.i = icmp eq i32 %indvar.next.i35.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i36.i, label %invcont5.i, label %_ZNSt6vectorIdSaIdEE19_M_range_initializeIPdEEvT_S4_St20forward_iterator_tag.exit.i.i.i.i

invcont5.i:                                       ; preds = %_Z20vector_iterator_testPdS_i.exit.i
  br i1 %34, label %bb.nph.i23.i, label %bb15.i

bb.nph.i23.i:                                     ; preds = %invcont5.i
  %149 = ashr i32 %36, 9                          ; <i32> [#uses=1]
  %150 = and i32 %149, 67108863                   ; <i32> [#uses=2]
  %151 = add i32 %150, 1                          ; <i32> [#uses=2]
  %152 = add i32 %150, 3                          ; <i32> [#uses=2]
  %153 = icmp ugt i32 %152, 8                     ; <i1> [#uses=1]
  %154 = select i1 %153, i32 %152, i32 8          ; <i32> [#uses=3]
  %155 = icmp ugt i32 %154, 1073741823            ; <i1> [#uses=1]
  %156 = shl i32 %154, 2                          ; <i32> [#uses=1]
  %157 = sub i32 %154, %151                       ; <i32> [#uses=1]
  %158 = lshr i32 %157, 1                         ; <i32> [#uses=14]
  %.sum.i.i.i = add i32 %158, %151                ; <i32> [#uses=4]
  %.sum1.i.i.i = add i32 %.sum.i.i.i, -1          ; <i32> [#uses=3]
  %159 = and i32 %38, 63                          ; <i32> [#uses=3]
  %160 = icmp sgt i32 %38, 0                      ; <i1> [#uses=1]
  %161 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %5, i32 0, i32 0 ; <double**> [#uses=1]
  %162 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %5, i32 0, i32 1 ; <double**> [#uses=1]
  %163 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %5, i32 0, i32 2 ; <double**> [#uses=1]
  %164 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %5, i32 0, i32 3 ; <double***> [#uses=1]
  %165 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 0 ; <double**> [#uses=1]
  %166 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 1 ; <double**> [#uses=1]
  %167 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 2 ; <double**> [#uses=1]
  %168 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %4, i32 0, i32 3 ; <double***> [#uses=1]
  %169 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 0 ; <double**> [#uses=1]
  %170 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 1 ; <double**> [#uses=1]
  %171 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 2 ; <double**> [#uses=1]
  %172 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %3, i32 0, i32 3 ; <double***> [#uses=1]
  %173 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 0 ; <double**> [#uses=1]
  %174 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 1 ; <double**> [#uses=1]
  %175 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 2 ; <double**> [#uses=1]
  %176 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %2, i32 0, i32 3 ; <double***> [#uses=1]
  %177 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 0 ; <double**> [#uses=1]
  %178 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 1 ; <double**> [#uses=1]
  %179 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 2 ; <double**> [#uses=1]
  %180 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %1, i32 0, i32 3 ; <double***> [#uses=1]
  %181 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 0 ; <double**> [#uses=1]
  %182 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 1 ; <double**> [#uses=1]
  %183 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 2 ; <double**> [#uses=1]
  %184 = getelementptr inbounds %"struct.std::_Deque_iterator<double,double&,double*>"* %0, i32 0, i32 3 ; <double***> [#uses=1]
  br label %bb.i28.i

bb.i28.i:                                         ; preds = %_Z10deque_testPdS_i.exit.i, %bb.nph.i23.i
  %indvar.i24.i = phi i32 [ 0, %bb.nph.i23.i ], [ %indvar.next.i26.i, %_Z10deque_testPdS_i.exit.i ] ; <i32> [#uses=1]
  br i1 %155, label %bb.i.i.i1.i.i, label %bb1.i.i.i.i.i

bb.i.i.i1.i.i:                                    ; preds = %bb.i28.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i unwind label %lpad.i.i4.i.i

.noexc.i.i.i.i:                                   ; preds = %bb.i.i.i1.i.i
  unreachable

bb1.i.i.i.i.i:                                    ; preds = %bb.i28.i
  %185 = invoke i8* @_Znwj(i32 %156)
          to label %_ZNSt11_Deque_baseIdSaIdEE15_M_allocate_mapEj.exit.i.i.i unwind label %lpad.i.i4.i.i ; <i8*> [#uses=4]

lpad.i.i4.i.i:                                    ; preds = %bb1.i.i.i.i.i, %bb.i.i.i1.i.i
  %eh_ptr.i.i2.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select3.i.i3.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i2.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i2.i.i)
          to label %.noexc6.i98.i unwind label %lpad.i.i.i106.i

.noexc6.i98.i:                                    ; preds = %lpad.i.i4.i.i
  unreachable

_ZNSt11_Deque_baseIdSaIdEE15_M_allocate_mapEj.exit.i.i.i: ; preds = %bb1.i.i.i.i.i
  %186 = bitcast i8* %185 to double**             ; <double**> [#uses=9]
  %187 = getelementptr inbounds double** %186, i32 %158 ; <double**> [#uses=9]
  br label %bb1.i.i.i100.i

bb.i.i.i99.i:                                     ; preds = %bb1.i.i.i100.i
  %188 = invoke i8* @_Znwj(i32 512)
          to label %invcont.i.i.i.i unwind label %lpad.i2.i.i.i ; <i8*> [#uses=1]

invcont.i.i.i.i:                                  ; preds = %bb.i.i.i99.i
  %189 = bitcast i8* %188 to double*              ; <double*> [#uses=1]
  store double* %189, double** %__cur.0.i.i.i.i, align 4
  %indvar.next.i.i.i.i = add i32 %indvar.i.i5.i.i, 1 ; <i32> [#uses=1]
  br label %bb1.i.i.i100.i

bb1.i.i.i100.i:                                   ; preds = %invcont.i.i.i.i, %_ZNSt11_Deque_baseIdSaIdEE15_M_allocate_mapEj.exit.i.i.i
  %indvar.i.i5.i.i = phi i32 [ 0, %_ZNSt11_Deque_baseIdSaIdEE15_M_allocate_mapEj.exit.i.i.i ], [ %indvar.next.i.i.i.i, %invcont.i.i.i.i ] ; <i32> [#uses=3]
  %.sum1 = add i32 %158, %indvar.i.i5.i.i         ; <i32> [#uses=3]
  %__cur.0.i.i.i.i = getelementptr double** %186, i32 %.sum1 ; <double**> [#uses=1]
  %190 = icmp slt i32 %.sum1, %.sum.i.i.i         ; <i1> [#uses=1]
  br i1 %190, label %bb.i.i.i99.i, label %_ZNSt11_Deque_baseIdSaIdEE17_M_initialize_mapEj.exit.i.i

invcont3.i.i.i.i:                                 ; preds = %bb.i.i3.i.i.i, %lpad.i2.i.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %invcont4.i.i.i.i unwind label %lpad12.i.i.i.i

invcont4.i.i.i.i:                                 ; preds = %invcont3.i.i.i.i
  unreachable

invcont7.i.i.i.i:                                 ; preds = %lpad12.i.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr13.i.i.i.i)
          to label %.noexc.i.i101.i unwind label %invcont1.i.i104.i

.noexc.i.i101.i:                                  ; preds = %invcont7.i.i.i.i
  unreachable

lpad.i2.i.i.i:                                    ; preds = %bb.i.i.i99.i
  %eh_ptr.i1.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select11.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i1.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %191 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i1.i.i.i) nounwind ; <i8*> [#uses=0]
  %192 = icmp sgt i32 %.sum1, %158                ; <i1> [#uses=1]
  br i1 %192, label %bb.i.i3.i.i.i, label %invcont3.i.i.i.i

bb.i.i3.i.i.i:                                    ; preds = %bb.i.i3.i.i.i, %lpad.i2.i.i.i
  %indvar.i.i.i.i.i = phi i32 [ %tmp.i.i.i102.i, %bb.i.i3.i.i.i ], [ 0, %lpad.i2.i.i.i ] ; <i32> [#uses=2]
  %tmp.i.i.i102.i = add i32 %indvar.i.i.i.i.i, 1  ; <i32> [#uses=2]
  %.sum = add i32 %158, %indvar.i.i.i.i.i         ; <i32> [#uses=1]
  %__n.01.i.i.i.i.i = getelementptr double** %186, i32 %.sum ; <double**> [#uses=1]
  %193 = load double** %__n.01.i.i.i.i.i, align 4 ; <double*> [#uses=1]
  %194 = bitcast double* %193 to i8*              ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %194) nounwind
  %195 = icmp slt i32 %tmp.i.i.i102.i, %indvar.i.i5.i.i ; <i1> [#uses=1]
  br i1 %195, label %bb.i.i3.i.i.i, label %invcont3.i.i.i.i

lpad12.i.i.i.i:                                   ; preds = %invcont3.i.i.i.i
  %eh_ptr13.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select15.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr13.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont7.i.i.i.i unwind label %lpad16.i.i.i.i

lpad16.i.i.i.i:                                   ; preds = %lpad12.i.i.i.i
  %eh_ptr17.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=1]
  %eh_select19.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr17.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

invcont1.i.i104.i:                                ; preds = %invcont7.i.i.i.i
  %eh_ptr.i.i103.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select9.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i103.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %196 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i.i103.i) nounwind ; <i8*> [#uses=0]
  call void @_ZdlPv(i8* %185) nounwind
  invoke void @__cxa_rethrow() noreturn
          to label %invcont2.i.i.i unwind label %lpad10.i.i.i

invcont2.i.i.i:                                   ; preds = %invcont1.i.i104.i
  unreachable

invcont5.i.i.i:                                   ; preds = %lpad10.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr11.i.i.i)
          to label %.noexc7.i.i unwind label %lpad.i.i.i106.i

.noexc7.i.i:                                      ; preds = %invcont5.i.i.i
  unreachable

lpad10.i.i.i:                                     ; preds = %invcont1.i.i104.i
  %eh_ptr11.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select13.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr11.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont5.i.i.i unwind label %lpad14.i.i.i

lpad14.i.i.i:                                     ; preds = %lpad10.i.i.i
  %eh_ptr15.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=1]
  %eh_select17.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_ZNSt11_Deque_baseIdSaIdEE17_M_initialize_mapEj.exit.i.i: ; preds = %bb1.i.i.i100.i
  %197 = load double** %187, align 4              ; <double*> [#uses=17]
  %198 = getelementptr inbounds double* %197, i32 64 ; <double*> [#uses=9]
  %199 = getelementptr inbounds double** %186, i32 %.sum1.i.i.i ; <double**> [#uses=4]
  %200 = load double** %199, align 4              ; <double*> [#uses=6]
  %201 = getelementptr inbounds double* %200, i32 64 ; <double*> [#uses=2]
  %202 = getelementptr inbounds double* %200, i32 %159 ; <double*> [#uses=8]
  %203 = icmp sgt i32 %.sum1.i.i.i, %158          ; <i1> [#uses=1]
  br i1 %203, label %bb.i1.i.i110.i, label %bb4.i.i.i.i

lpad.i.i.i106.i:                                  ; preds = %invcont5.i.i.i, %lpad.i.i4.i.i
  %eh_ptr.i.i.i105.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select3.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i105.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i105.i)
          to label %.noexc.i107.i unwind label %Unwind.i133.i

.noexc.i107.i:                                    ; preds = %lpad.i.i.i106.i
  unreachable

bb.i1.i.i110.i:                                   ; preds = %bb2.i.i.i111.i, %_ZNSt11_Deque_baseIdSaIdEE17_M_initialize_mapEj.exit.i.i
  %indvar.i.i.i108.i = phi i32 [ %tmp7.i.i, %bb2.i.i.i111.i ], [ 0, %_ZNSt11_Deque_baseIdSaIdEE17_M_initialize_mapEj.exit.i.i ] ; <i32> [#uses=2]
  %tmp7.i.i = add i32 %indvar.i.i.i108.i, 1       ; <i32> [#uses=2]
  %.sum63 = add i32 %158, %tmp7.i.i               ; <i32> [#uses=1]
  %.sum62 = add i32 %158, %indvar.i.i.i108.i      ; <i32> [#uses=1]
  %__cur.07.i.i.i.i = getelementptr double** %186, i32 %.sum62 ; <double**> [#uses=1]
  %204 = load double** %__cur.07.i.i.i.i, align 4 ; <double*> [#uses=1]
  br label %bb.i.i.i.i.i5.i.i.i.i

bb.i.i.i.i.i5.i.i.i.i:                            ; preds = %bb.i.i.i.i.i5.i.i.i.i, %bb.i1.i.i110.i
  %indvar.i.i.i.i.i1.i.i.i.i = phi i32 [ 0, %bb.i1.i.i110.i ], [ %tmp.i2.i.i.i.i, %bb.i.i.i.i.i5.i.i.i.i ] ; <i32> [#uses=2]
  %__first_addr.01.i.i.i.i.i4.i.i.i.i = getelementptr double* %204, i32 %indvar.i.i.i.i.i1.i.i.i.i ; <double*> [#uses=1]
  %tmp.i2.i.i.i.i = add i32 %indvar.i.i.i.i.i1.i.i.i.i, 1 ; <i32> [#uses=2]
  store double 0.000000e+00, double* %__first_addr.01.i.i.i.i.i4.i.i.i.i, align 8
  %exitcond6.i.i = icmp eq i32 %tmp.i2.i.i.i.i, 64 ; <i1> [#uses=1]
  br i1 %exitcond6.i.i, label %bb2.i.i.i111.i, label %bb.i.i.i.i.i5.i.i.i.i

bb2.i.i.i111.i:                                   ; preds = %bb.i.i.i.i.i5.i.i.i.i
  %205 = icmp sgt i32 %.sum1.i.i.i, %.sum63       ; <i1> [#uses=1]
  br i1 %205, label %bb.i1.i.i110.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb2.i.i.i111.i, %_ZNSt11_Deque_baseIdSaIdEE17_M_initialize_mapEj.exit.i.i
  %206 = icmp eq i32 %159, 0                      ; <i1> [#uses=1]
  br i1 %206, label %invcont2.i.i, label %bb.i.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i.i:                             ; preds = %bb.i.i.i.i.i.i.i.i.i, %bb4.i.i.i.i
  %indvar.i.i.i.i.i.i.i.i.i = phi i32 [ %tmp.i112.i, %bb.i.i.i.i.i.i.i.i.i ], [ 0, %bb4.i.i.i.i ] ; <i32> [#uses=2]
  %tmp.i112.i = add i32 %indvar.i.i.i.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %__first_addr.01.i.i.i.i.i.i.i.i.i = getelementptr double* %200, i32 %indvar.i.i.i.i.i.i.i.i.i ; <double*> [#uses=1]
  store double 0.000000e+00, double* %__first_addr.01.i.i.i.i.i.i.i.i.i, align 8
  %207 = icmp eq i32 %tmp.i112.i, %159            ; <i1> [#uses=1]
  br i1 %207, label %invcont2.i.i, label %bb.i.i.i.i.i.i.i.i.i

invcont2.i.i:                                     ; preds = %bb.i.i.i.i.i.i.i.i.i, %bb4.i.i.i.i
  br i1 %160, label %bb.i.i.i.i3.i.i, label %invcont10.i.i

bb.i.i.i.i3.i.i:                                  ; preds = %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i, %invcont2.i.i
  %.3.1.i.i.i.i.i = phi double** [ %.3.0.i.i.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i ], [ %187, %invcont2.i.i ] ; <double**> [#uses=2]
  %.2.1.i.i.i.i.i = phi double* [ %.2.0.i.i.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i ], [ %198, %invcont2.i.i ] ; <double*> [#uses=2]
  %.0.1.i.i.i.i.i = phi double* [ %.0.0.i.i.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i ], [ %197, %invcont2.i.i ] ; <double*> [#uses=1]
  %indvar.i.i.i.i2.i.i = phi i32 [ %indvar.next.i.i.i.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i ], [ 0, %invcont2.i.i ] ; <i32> [#uses=2]
  %208 = phi double* [ %215, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i ], [ %197, %invcont2.i.i ] ; <double*> [#uses=1]
  %__first_addr.01.i.i.i.i.i.i = getelementptr double* %19, i32 %indvar.i.i.i.i2.i.i ; <double*> [#uses=1]
  %209 = load double* %__first_addr.01.i.i.i.i.i.i, align 8 ; <double> [#uses=1]
  store double %209, double* %208, align 8
  %210 = getelementptr inbounds double* %.0.1.i.i.i.i.i, i32 1 ; <double*> [#uses=3]
  %211 = icmp eq double* %210, %.2.1.i.i.i.i.i    ; <i1> [#uses=1]
  br i1 %211, label %bb.i.i.i.i.i.i113.i, label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i

bb.i.i.i.i.i.i113.i:                              ; preds = %bb.i.i.i.i3.i.i
  %212 = getelementptr inbounds double** %.3.1.i.i.i.i.i, i32 1 ; <double**> [#uses=2]
  %213 = load double** %212, align 4              ; <double*> [#uses=3]
  %214 = getelementptr inbounds double* %213, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i

_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i: ; preds = %bb.i.i.i.i.i.i113.i, %bb.i.i.i.i3.i.i
  %.3.0.i.i.i.i.i = phi double** [ %212, %bb.i.i.i.i.i.i113.i ], [ %.3.1.i.i.i.i.i, %bb.i.i.i.i3.i.i ] ; <double**> [#uses=1]
  %.2.0.i.i.i.i.i = phi double* [ %214, %bb.i.i.i.i.i.i113.i ], [ %.2.1.i.i.i.i.i, %bb.i.i.i.i3.i.i ] ; <double*> [#uses=1]
  %.0.0.i.i.i.i.i = phi double* [ %213, %bb.i.i.i.i.i.i113.i ], [ %210, %bb.i.i.i.i3.i.i ] ; <double*> [#uses=1]
  %215 = phi double* [ %213, %bb.i.i.i.i.i.i113.i ], [ %210, %bb.i.i.i.i3.i.i ] ; <double*> [#uses=1]
  %indvar.next.i.i.i.i.i.i = add i32 %indvar.i.i.i.i2.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i114.i = icmp eq i32 %indvar.next.i.i.i.i.i.i, %38 ; <i1> [#uses=1]
  br i1 %exitcond.i114.i, label %invcont10.i.i, label %bb.i.i.i.i3.i.i

invcont10.i.i:                                    ; preds = %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i.i.i, %invcont2.i.i
  %216 = icmp eq double* %197, %202               ; <i1> [#uses=2]
  br i1 %216, label %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i, label %bb.i11.i.i

bb.i11.i.i:                                       ; preds = %invcont10.i.i
  %217 = ptrtoint double** %199 to i32            ; <i32> [#uses=1]
  %218 = ptrtoint double** %187 to i32            ; <i32> [#uses=1]
  %219 = sub i32 %217, %218                       ; <i32> [#uses=1]
  %220 = shl i32 %219, 4                          ; <i32> [#uses=1]
  %221 = add i32 %220, -64                        ; <i32> [#uses=1]
  %222 = and i32 %221, -64                        ; <i32> [#uses=1]
  %223 = ptrtoint double* %202 to i32             ; <i32> [#uses=1]
  %224 = ptrtoint double* %200 to i32             ; <i32> [#uses=1]
  %225 = sub i32 %223, %224                       ; <i32> [#uses=1]
  %226 = ashr i32 %225, 3                         ; <i32> [#uses=1]
  %227 = ptrtoint double* %198 to i32             ; <i32> [#uses=1]
  %228 = ptrtoint double* %197 to i32             ; <i32> [#uses=1]
  %229 = sub i32 %227, %228                       ; <i32> [#uses=1]
  %230 = ashr i32 %229, 3                         ; <i32> [#uses=1]
  %231 = add nsw i32 %222, %226                   ; <i32> [#uses=1]
  %232 = add nsw i32 %231, %230                   ; <i32> [#uses=3]
  %233 = icmp eq i32 %232, 1                      ; <i1> [#uses=1]
  br i1 %233, label %_ZSt4__lgIiET_S0_.exit.i.i121.i, label %bb.i.i12.i.i

bb.i.i12.i.i:                                     ; preds = %bb.i.i12.i.i, %bb.i11.i.i
  %__n_addr.02.i.i.i116.i = phi i32 [ %235, %bb.i.i12.i.i ], [ %232, %bb.i11.i.i ] ; <i32> [#uses=1]
  %__k.01.i.i.i.i = phi i32 [ %234, %bb.i.i12.i.i ], [ 0, %bb.i11.i.i ] ; <i32> [#uses=2]
  %234 = add i32 %__k.01.i.i.i.i, 1               ; <i32> [#uses=1]
  %235 = ashr i32 %__n_addr.02.i.i.i116.i, 1      ; <i32> [#uses=2]
  %phitmp.i.i.i117.i = icmp eq i32 %235, 1        ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i117.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i.i119.i, label %bb.i.i12.i.i

_ZSt4__lgIiET_S0_.exit.loopexit.i.i119.i:         ; preds = %bb.i.i12.i.i
  %tmp.i1.i.i.i = shl i32 %__k.01.i.i.i.i, 1      ; <i32> [#uses=1]
  %phitmp.i.i118.i = add i32 %tmp.i1.i.i.i, 2     ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i.i121.i

_ZSt4__lgIiET_S0_.exit.i.i121.i:                  ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i.i119.i, %bb.i11.i.i
  %__k.0.lcssa.i.i.i120.i = phi i32 [ %phitmp.i.i118.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i119.i ], [ 0, %bb.i11.i.i ] ; <i32> [#uses=1]
  store double* %202, double** %161, align 8
  store double* %200, double** %162, align 4
  store double* %201, double** %163, align 8
  store double** %199, double*** %164, align 4
  store double* %197, double** %165, align 8
  store double* %197, double** %166, align 4
  store double* %198, double** %167, align 8
  store double** %187, double*** %168, align 4
  call fastcc void @_ZSt16__introsort_loopISt15_Deque_iteratorIdRdPdEiEvT_S4_T0_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %4, %"struct.std::_Deque_iterator<double,double&,double*>"* noalias %5, i32 %__k.0.lcssa.i.i.i120.i) nounwind
  %236 = icmp sgt i32 %232, 16                    ; <i1> [#uses=1]
  br i1 %236, label %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i, label %bb1.i.i22.i.i

_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i: ; preds = %_ZSt4__lgIiET_S0_.exit.i.i121.i
  %storemerge.i.i.i.i.i = getelementptr inbounds double* %197, i32 16 ; <double*> [#uses=1]
  store double* %storemerge.i.i.i.i.i, double** %169, align 8
  store double* %197, double** %170, align 4
  store double* %198, double** %171, align 8
  store double** %187, double*** %172, align 4
  store double* %197, double** %173, align 8
  store double* %197, double** %174, align 4
  store double* %198, double** %175, align 8
  store double** %187, double*** %176, align 4
  call fastcc void @_ZSt16__insertion_sortISt15_Deque_iteratorIdRdPdEEvT_S4_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %2, %"struct.std::_Deque_iterator<double,double&,double*>"* noalias %3) nounwind
  %storemerge.i14.i.i.i.i = getelementptr inbounds double* %197, i32 16 ; <double*> [#uses=1]
  br label %bb1.outer.i.i.i.i.i

bb.i.i.i14.i.i:                                   ; preds = %bb1.i.i.i21.i.i
  %237 = load double* %__i.0.0.i.i.i.i.i, align 8 ; <double> [#uses=2]
  %238 = icmp eq double* %__i.0.0.i.i.i.i.i, %__i.1.0.ph.i.i.i.i.i ; <i1> [#uses=1]
  br i1 %238, label %bb.i1.i.i.i.i.i.i, label %bb1.preheader.i.i.i.i.i.i

bb.i1.i.i.i.i.i.i:                                ; preds = %bb.i.i.i14.i.i
  %239 = load double** %scevgep14.i.i.i.i.i, align 4 ; <double*> [#uses=2]
  %240 = getelementptr inbounds double* %239, i32 64 ; <double*> [#uses=1]
  br label %bb1.preheader.i.i.i.i.i.i

bb1.preheader.i.i.i.i.i.i:                        ; preds = %bb.i1.i.i.i.i.i.i, %bb.i.i.i14.i.i
  %__next.3.2.ph.i.i.i.i.i.i = phi double** [ %scevgep14.i.i.i.i.i, %bb.i1.i.i.i.i.i.i ], [ %__i.3.0.ph.i.i.i.i.i, %bb.i.i.i14.i.i ] ; <double**> [#uses=1]
  %__next.1.2.ph.i.i.i.i.i.i = phi double* [ %239, %bb.i1.i.i.i.i.i.i ], [ %__i.1.0.ph.i.i.i.i.i, %bb.i.i.i14.i.i ] ; <double*> [#uses=1]
  %.pn.ph.i.i.i.i.i.i = phi double* [ %240, %bb.i1.i.i.i.i.i.i ], [ %__i.0.0.i.i.i.i.i, %bb.i.i.i14.i.i ] ; <double*> [#uses=1]
  br label %bb1.outer.i.i.i.i.i.i

bb.i1.i.i.i.i.i:                                  ; preds = %bb1.i2.i.i.i.i.i
  store double %245, double* %244, align 8
  %241 = icmp eq double* %__next.0.0.i.i.i.i.i.i, %__next.1.2.ph5.i.i.i.i.i.i ; <i1> [#uses=1]
  %indvar.next.i.i.i.i15.i.i = add i32 %indvar.i.i.i.i18.i.i, 1 ; <i32> [#uses=1]
  br i1 %241, label %bb.i.i.i.i.i16.i.i, label %bb1.i2.i.i.i.i.i

bb.i.i.i.i.i16.i.i:                               ; preds = %bb.i1.i.i.i.i.i
  %242 = load double** %scevgep.i.i.i.i17.i.i, align 4 ; <double*> [#uses=2]
  %243 = getelementptr inbounds double* %242, i32 64 ; <double*> [#uses=1]
  %indvar.next11.i.i.i.i.i.i = add i32 %indvar10.i.i.i.i.i.i, 1 ; <i32> [#uses=1]
  br label %bb1.outer.i.i.i.i.i.i

bb1.outer.i.i.i.i.i.i:                            ; preds = %bb.i.i.i.i.i16.i.i, %bb1.preheader.i.i.i.i.i.i
  %.rle14.i.i.i.i.i.i = phi double* [ %__i.0.0.i.i.i.i.i, %bb1.preheader.i.i.i.i.i.i ], [ %__next.0.0.i.i.i.i.i.i, %bb.i.i.i.i.i16.i.i ] ; <double*> [#uses=1]
  %indvar10.i.i.i.i.i.i = phi i32 [ 0, %bb1.preheader.i.i.i.i.i.i ], [ %indvar.next11.i.i.i.i.i.i, %bb.i.i.i.i.i16.i.i ] ; <i32> [#uses=2]
  %__next.1.2.ph5.i.i.i.i.i.i = phi double* [ %242, %bb.i.i.i.i.i16.i.i ], [ %__next.1.2.ph.i.i.i.i.i.i, %bb1.preheader.i.i.i.i.i.i ] ; <double*> [#uses=1]
  %.pn.ph6.i.i.i.i.i.i = phi double* [ %243, %bb.i.i.i.i.i16.i.i ], [ %.pn.ph.i.i.i.i.i.i, %bb1.preheader.i.i.i.i.i.i ] ; <double*> [#uses=1]
  %tmp26.i.i.i.i = xor i32 %indvar10.i.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %scevgep.i.i.i.i17.i.i = getelementptr double** %__next.3.2.ph.i.i.i.i.i.i, i32 %tmp26.i.i.i.i ; <double**> [#uses=1]
  br label %bb1.i2.i.i.i.i.i

bb1.i2.i.i.i.i.i:                                 ; preds = %bb1.outer.i.i.i.i.i.i, %bb.i1.i.i.i.i.i
  %244 = phi double* [ %.rle14.i.i.i.i.i.i, %bb1.outer.i.i.i.i.i.i ], [ %__next.0.0.i.i.i.i.i.i, %bb.i1.i.i.i.i.i ] ; <double*> [#uses=2]
  %indvar.i.i.i.i18.i.i = phi i32 [ 0, %bb1.outer.i.i.i.i.i.i ], [ %indvar.next.i.i.i.i15.i.i, %bb.i1.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp24.i.i.i.i = xor i32 %indvar.i.i.i.i18.i.i, -1 ; <i32> [#uses=1]
  %__next.0.0.i.i.i.i.i.i = getelementptr double* %.pn.ph6.i.i.i.i.i.i, i32 %tmp24.i.i.i.i ; <double*> [#uses=4]
  %245 = load double* %__next.0.0.i.i.i.i.i.i, align 8 ; <double> [#uses=2]
  %246 = fcmp ogt double %245, %237               ; <i1> [#uses=1]
  br i1 %246, label %bb.i1.i.i.i.i.i, label %_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit.i.i.i.i.i

_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit.i.i.i.i.i: ; preds = %bb1.i2.i.i.i.i.i
  store double %237, double* %244, align 8
  %247 = icmp eq double* %scevgep.i.i.i.i.i, %__i.2.0.ph.i.i.i.i.i ; <i1> [#uses=1]
  br i1 %247, label %bb.i.i.i.i19.i.i, label %bb1.i.i.i21.i.i

bb.i.i.i.i19.i.i:                                 ; preds = %_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit.i.i.i.i.i
  %248 = load double** %scevgep16.i.i.i.i.i, align 4 ; <double*> [#uses=3]
  %249 = getelementptr inbounds double* %248, i32 64 ; <double*> [#uses=1]
  br label %bb1.outer.i.i.i.i.i

bb1.outer.i.i.i.i.i:                              ; preds = %bb.i.i.i.i19.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i
  %indvar11.i.i.i.i.i = phi i32 [ 0, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i ], [ %tmp28.i.i.i.i, %bb.i.i.i.i19.i.i ] ; <i32> [#uses=3]
  %__i.2.0.ph.i.i.i.i.i = phi double* [ %198, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i ], [ %249, %bb.i.i.i.i19.i.i ] ; <double*> [#uses=1]
  %__i.1.0.ph.i.i.i.i.i = phi double* [ %197, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i ], [ %248, %bb.i.i.i.i19.i.i ] ; <double*> [#uses=2]
  %__i.0.0.ph.i.i.i.i.i = phi double* [ %storemerge.i14.i.i.i.i, %_ZNKSt15_Deque_iteratorIdRdPdEplEi.exit15.i.i.i.i ], [ %248, %bb.i.i.i.i19.i.i ] ; <double*> [#uses=2]
  %tmp28.i.i.i.i = add i32 %indvar11.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %.sum71 = add i32 %158, %tmp28.i.i.i.i          ; <i32> [#uses=1]
  %scevgep16.i.i.i.i.i = getelementptr double** %186, i32 %.sum71 ; <double**> [#uses=1]
  %tmp29.i.i.i.i = add i32 %indvar11.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %.sum70 = add i32 %158, %tmp29.i.i.i.i          ; <i32> [#uses=1]
  %scevgep14.i.i.i.i.i = getelementptr double** %186, i32 %.sum70 ; <double**> [#uses=2]
  %.sum69 = add i32 %158, %indvar11.i.i.i.i.i     ; <i32> [#uses=1]
  %__i.3.0.ph.i.i.i.i.i = getelementptr double** %186, i32 %.sum69 ; <double**> [#uses=1]
  br label %bb1.i.i.i21.i.i

bb1.i.i.i21.i.i:                                  ; preds = %bb1.outer.i.i.i.i.i, %_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit.i.i.i.i.i
  %indvar.i.i.i20.i.i = phi i32 [ 0, %bb1.outer.i.i.i.i.i ], [ %tmp27.i.i.i.i, %_ZSt25__unguarded_linear_insertISt15_Deque_iteratorIdRdPdEdEvT_T0_.exit.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp27.i.i.i.i = add i32 %indvar.i.i.i20.i.i, 1 ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i = getelementptr double* %__i.0.0.ph.i.i.i.i.i, i32 %tmp27.i.i.i.i ; <double*> [#uses=1]
  %__i.0.0.i.i.i.i.i = getelementptr double* %__i.0.0.ph.i.i.i.i.i, i32 %indvar.i.i.i20.i.i ; <double*> [#uses=5]
  %250 = icmp eq double* %__i.0.0.i.i.i.i.i, %202 ; <i1> [#uses=1]
  br i1 %250, label %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i, label %bb.i.i.i14.i.i

bb1.i.i22.i.i:                                    ; preds = %_ZSt4__lgIiET_S0_.exit.i.i121.i
  store double* %202, double** %177, align 8
  store double* %200, double** %178, align 4
  store double* %201, double** %179, align 8
  store double** %199, double*** %180, align 4
  store double* %197, double** %181, align 8
  store double* %197, double** %182, align 4
  store double* %198, double** %183, align 8
  store double** %187, double*** %184, align 4
  call fastcc void @_ZSt16__insertion_sortISt15_Deque_iteratorIdRdPdEEvT_S4_(%"struct.std::_Deque_iterator<double,double&,double*>"* noalias %0, %"struct.std::_Deque_iterator<double,double&,double*>"* noalias %1) nounwind
  br label %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i

_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i: ; preds = %bb1.i.i22.i.i, %bb1.i.i.i21.i.i
  br i1 %216, label %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i, label %bb12.i.i.i126.i

bb8.i.i.i125.i:                                   ; preds = %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i
  %251 = load double* %256, align 8               ; <double> [#uses=3]
  %252 = load double* %__next.0.0.i.i.i.i, align 8 ; <double> [#uses=1]
  %253 = fcmp oeq double %251, %252               ; <i1> [#uses=1]
  br i1 %253, label %_ZSt13adjacent_findISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i.i, label %bb12.i.i.i126.i

bb12.i.i.i126.i:                                  ; preds = %bb8.i.i.i125.i, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i
  %254 = phi double** [ %__next.3.0.i.i.i.i, %bb8.i.i.i125.i ], [ %187, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i ] ; <double**> [#uses=4]
  %255 = phi double* [ %__next.2.0.i.i.i.i, %bb8.i.i.i125.i ], [ %198, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i ] ; <double*> [#uses=4]
  %256 = phi double* [ %__next.0.0.i.i.i.i, %bb8.i.i.i125.i ], [ %197, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i ] ; <double*> [#uses=5]
  %__next.3.1.i.i.i.i = phi double** [ %__next.3.0.i.i.i.i, %bb8.i.i.i125.i ], [ %187, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i ] ; <double**> [#uses=2]
  %__next.2.1.i.i.i.i = phi double* [ %__next.2.0.i.i.i.i, %bb8.i.i.i125.i ], [ %198, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i ] ; <double*> [#uses=2]
  %__next.0.1.i.i.i.i = phi double* [ %__next.0.0.i.i.i.i, %bb8.i.i.i125.i ], [ %197, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i ] ; <double*> [#uses=1]
  %257 = getelementptr inbounds double* %__next.0.1.i.i.i.i, i32 1 ; <double*> [#uses=2]
  %258 = icmp eq double* %257, %__next.2.1.i.i.i.i ; <i1> [#uses=1]
  br i1 %258, label %bb.i.i.i8.i.i, label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i

bb.i.i.i8.i.i:                                    ; preds = %bb12.i.i.i126.i
  %259 = getelementptr inbounds double** %__next.3.1.i.i.i.i, i32 1 ; <double**> [#uses=2]
  %260 = load double** %259, align 4              ; <double*> [#uses=2]
  %261 = getelementptr inbounds double* %260, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i

_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i:   ; preds = %bb.i.i.i8.i.i, %bb12.i.i.i126.i
  %__next.3.0.i.i.i.i = phi double** [ %259, %bb.i.i.i8.i.i ], [ %__next.3.1.i.i.i.i, %bb12.i.i.i126.i ] ; <double**> [#uses=2]
  %__next.2.0.i.i.i.i = phi double* [ %261, %bb.i.i.i8.i.i ], [ %__next.2.1.i.i.i.i, %bb12.i.i.i126.i ] ; <double*> [#uses=2]
  %__next.0.0.i.i.i.i = phi double* [ %260, %bb.i.i.i8.i.i ], [ %257, %bb12.i.i.i126.i ] ; <double*> [#uses=4]
  %262 = icmp eq double* %__next.0.0.i.i.i.i, %202 ; <i1> [#uses=1]
  br i1 %262, label %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i, label %bb8.i.i.i125.i

_ZSt13adjacent_findISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i.i: ; preds = %bb8.i.i.i125.i
  %263 = icmp eq double* %256, %202               ; <i1> [#uses=1]
  br i1 %263, label %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i, label %bb10.i.i.i

bb10.i.i.i:                                       ; preds = %_ZSt13adjacent_findISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i.i
  %264 = getelementptr inbounds double* %256, i32 1 ; <double*> [#uses=2]
  %265 = icmp eq double* %264, %255               ; <i1> [#uses=1]
  br i1 %265, label %bb.i7.i.i.i, label %bb14.outer.i.i.i

bb.i7.i.i.i:                                      ; preds = %bb10.i.i.i
  %266 = getelementptr inbounds double** %254, i32 1 ; <double**> [#uses=2]
  %267 = load double** %266, align 4              ; <double*> [#uses=2]
  %268 = getelementptr inbounds double* %267, i32 64 ; <double*> [#uses=1]
  br label %bb14.outer.i.i.i

bb11.i.i128.i:                                    ; preds = %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit3.i.i.i
  %269 = load double* %282, align 8               ; <double> [#uses=3]
  %270 = fcmp une double %.rle60, %269            ; <i1> [#uses=1]
  br i1 %270, label %bb13.i.i.i, label %bb14.i.i.i

bb13.i.i.i:                                       ; preds = %bb11.i.i128.i
  %271 = getelementptr inbounds double* %__dest.0.1.ph.i.i.i, i32 1 ; <double*> [#uses=2]
  %272 = icmp eq double* %271, %__dest.2.1.ph.i.i.i ; <i1> [#uses=1]
  br i1 %272, label %bb.i4.i.i.i, label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i

bb.i4.i.i.i:                                      ; preds = %bb13.i.i.i
  %273 = getelementptr inbounds double** %__dest.3.1.ph.i.i.i, i32 1 ; <double**> [#uses=2]
  %274 = load double** %273, align 4              ; <double*> [#uses=2]
  %275 = getelementptr inbounds double* %274, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i

_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i:    ; preds = %bb.i4.i.i.i, %bb13.i.i.i
  %__dest.3.0.i.i.i = phi double** [ %273, %bb.i4.i.i.i ], [ %__dest.3.1.ph.i.i.i, %bb13.i.i.i ] ; <double**> [#uses=1]
  %__dest.2.0.i.i.i = phi double* [ %275, %bb.i4.i.i.i ], [ %__dest.2.1.ph.i.i.i, %bb13.i.i.i ] ; <double*> [#uses=1]
  %__dest.0.0.i.i.i = phi double* [ %274, %bb.i4.i.i.i ], [ %271, %bb13.i.i.i ] ; <double*> [#uses=2]
  store double %269, double* %__dest.0.0.i.i.i, align 8
  br label %bb14.outer.i.i.i

bb14.outer.i.i.i:                                 ; preds = %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i, %bb.i7.i.i.i, %bb10.i.i.i
  %.rle60 = phi double [ %269, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %251, %bb10.i.i.i ], [ %251, %bb.i7.i.i.i ] ; <double> [#uses=1]
  %.237.1 = phi double* [ %.237.0, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %268, %bb.i7.i.i.i ], [ %255, %bb10.i.i.i ] ; <double*> [#uses=1]
  %.338.1 = phi double** [ %.338.0, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %266, %bb.i7.i.i.i ], [ %254, %bb10.i.i.i ] ; <double**> [#uses=1]
  %.pre.i.i.i = phi double* [ %.035.0, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %267, %bb.i7.i.i.i ], [ %264, %bb10.i.i.i ] ; <double*> [#uses=1]
  %__dest.3.1.ph.i.i.i = phi double** [ %__dest.3.0.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %254, %bb10.i.i.i ], [ %254, %bb.i7.i.i.i ] ; <double**> [#uses=2]
  %__dest.2.1.ph.i.i.i = phi double* [ %__dest.2.0.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %255, %bb10.i.i.i ], [ %255, %bb.i7.i.i.i ] ; <double*> [#uses=2]
  %__dest.0.1.ph.i.i.i = phi double* [ %__dest.0.0.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit6.i.i.i ], [ %256, %bb10.i.i.i ], [ %256, %bb.i7.i.i.i ] ; <double*> [#uses=1]
  br label %bb14.i.i.i

bb14.i.i.i:                                       ; preds = %bb14.outer.i.i.i, %bb11.i.i128.i
  %.237.2 = phi double* [ %.237.1, %bb14.outer.i.i.i ], [ %.237.0, %bb11.i.i128.i ] ; <double*> [#uses=2]
  %.338.2 = phi double** [ %.338.1, %bb14.outer.i.i.i ], [ %.338.0, %bb11.i.i128.i ] ; <double**> [#uses=2]
  %276 = phi double* [ %.pre.i.i.i, %bb14.outer.i.i.i ], [ %282, %bb11.i.i128.i ] ; <double*> [#uses=1]
  %277 = getelementptr inbounds double* %276, i32 1 ; <double*> [#uses=3]
  %278 = icmp eq double* %277, %.237.2            ; <i1> [#uses=1]
  br i1 %278, label %bb.i1.i9.i.i, label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit3.i.i.i

bb.i1.i9.i.i:                                     ; preds = %bb14.i.i.i
  %279 = getelementptr inbounds double** %.338.2, i32 1 ; <double**> [#uses=2]
  %280 = load double** %279, align 4              ; <double*> [#uses=3]
  %281 = getelementptr inbounds double* %280, i32 64 ; <double*> [#uses=1]
  br label %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit3.i.i.i

_ZNSt15_Deque_iteratorIdRdPdEppEv.exit3.i.i.i:    ; preds = %bb.i1.i9.i.i, %bb14.i.i.i
  %.035.0 = phi double* [ %280, %bb.i1.i9.i.i ], [ %277, %bb14.i.i.i ] ; <double*> [#uses=1]
  %.237.0 = phi double* [ %281, %bb.i1.i9.i.i ], [ %.237.2, %bb14.i.i.i ] ; <double*> [#uses=2]
  %.338.0 = phi double** [ %279, %bb.i1.i9.i.i ], [ %.338.2, %bb14.i.i.i ] ; <double**> [#uses=2]
  %282 = phi double* [ %280, %bb.i1.i9.i.i ], [ %277, %bb14.i.i.i ] ; <double*> [#uses=3]
  %283 = icmp eq double* %282, %202               ; <i1> [#uses=1]
  br i1 %283, label %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i, label %bb11.i.i128.i

_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i: ; preds = %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit3.i.i.i, %_ZSt13adjacent_findISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i.i, %_ZNSt15_Deque_iteratorIdRdPdEppEv.exit.i.i.i.i, %_ZSt4sortISt15_Deque_iteratorIdRdPdEEvT_S4_.exit.i.i, %invcont10.i.i
  %284 = icmp eq i8* %185, null                   ; <i1> [#uses=1]
  br i1 %284, label %_Z10deque_testPdS_i.exit.i, label %bb.i.i.i.i129.i

bb.i.i.i.i129.i:                                  ; preds = %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i
  %285 = icmp slt i32 %158, %.sum.i.i.i           ; <i1> [#uses=1]
  br i1 %285, label %bb.i.i.i.i.i130.i, label %invcont.i.i.i.i.i

bb.i.i.i.i.i130.i:                                ; preds = %bb.i.i.i.i.i130.i, %bb.i.i.i.i129.i
  %indvar.i.i.i.i.i.i = phi i32 [ %tmp5.i.i, %bb.i.i.i.i.i130.i ], [ 0, %bb.i.i.i.i129.i ] ; <i32> [#uses=2]
  %tmp5.i.i = add i32 %indvar.i.i.i.i.i.i, 1      ; <i32> [#uses=2]
  %.sum67 = add i32 %158, %tmp5.i.i               ; <i32> [#uses=1]
  %.sum66 = add i32 %158, %indvar.i.i.i.i.i.i     ; <i32> [#uses=1]
  %__n.01.i.i.i.i.i.i = getelementptr double** %186, i32 %.sum66 ; <double**> [#uses=1]
  %286 = load double** %__n.01.i.i.i.i.i.i, align 4 ; <double*> [#uses=1]
  %287 = bitcast double* %286 to i8*              ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %287) nounwind
  %288 = icmp slt i32 %.sum67, %.sum.i.i.i        ; <i1> [#uses=1]
  br i1 %288, label %bb.i.i.i.i.i130.i, label %invcont.i.i.i.i.i

invcont.i.i.i.i.i:                                ; preds = %bb.i.i.i.i.i130.i, %bb.i.i.i.i129.i
  call void @_ZdlPv(i8* %185) nounwind
  br label %_Z10deque_testPdS_i.exit.i

Unwind.i133.i:                                    ; preds = %lpad.i.i.i106.i
  %eh_ptr.i131.i = call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select18.i132.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i131.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i131.i)
          to label %.noexc134.i unwind label %lpad18.i

.noexc134.i:                                      ; preds = %Unwind.i133.i
  unreachable

_Z10deque_testPdS_i.exit.i:                       ; preds = %invcont.i.i.i.i.i, %_ZSt6uniqueISt15_Deque_iteratorIdRdPdEET_S4_S4_.exit.i.i
  %indvar.next.i26.i = add i32 %indvar.i24.i, 1   ; <i32> [#uses=2]
  %exitcond.i27.i = icmp eq i32 %indvar.next.i26.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i27.i, label %invcont6.i, label %bb.i28.i

invcont6.i:                                       ; preds = %_Z10deque_testPdS_i.exit.i
  br i1 %34, label %bb.nph.i14.i, label %bb15.i

bb.nph.i14.i:                                     ; preds = %invcont6.i
  %289 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %container.i71.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=7]
  %290 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %container.i71.i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %291 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %container.i71.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=15]
  %292 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %__carry.i.i.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=5]
  %293 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %__carry.i.i.i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %294 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %__carry.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=10]
  %295 = getelementptr inbounds [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 0 ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=1]
  br label %bb.i19.i

bb.i19.i:                                         ; preds = %_Z9list_testPdS_i.exit.i, %bb.nph.i14.i
  %indvar.i15.i = phi i32 [ 0, %bb.nph.i14.i ], [ %indvar.next.i17.i, %_Z9list_testPdS_i.exit.i ] ; <i32> [#uses=1]
  store %"struct.std::_List_node_base"* %291, %"struct.std::_List_node_base"** %289, align 8
  store %"struct.std::_List_node_base"* %291, %"struct.std::_List_node_base"** %290, align 4
  br label %bb.i.i.i76.i

bb.i.i.i76.i:                                     ; preds = %.noexc2.i.i.i, %bb.i19.i
  %indvar.i.i.i72.i = phi i32 [ 0, %bb.i19.i ], [ %tmp.i73.i, %.noexc2.i.i.i ] ; <i32> [#uses=2]
  %tmp.i73.i = add i32 %indvar.i.i.i72.i, 1       ; <i32> [#uses=2]
  %scevgep.i.i.i74.i = getelementptr double* %19, i32 %tmp.i73.i ; <double*> [#uses=1]
  %__first_addr.01.i.i.i75.i = getelementptr double* %19, i32 %indvar.i.i.i72.i ; <double*> [#uses=1]
  %296 = invoke i8* @_Znwj(i32 16)
          to label %.noexc.i.i.i unwind label %lpad.i.i81.i ; <i8*> [#uses=2]

.noexc.i.i.i:                                     ; preds = %bb.i.i.i76.i
  %297 = getelementptr inbounds i8* %296, i32 8   ; <i8*> [#uses=2]
  %298 = icmp eq i8* %297, null                   ; <i1> [#uses=1]
  br i1 %298, label %_ZNSt4listIdSaIdEE9push_backERKd.exit.i.i.i.i, label %bb.i.i.i.i.i.i.i77.i

bb.i.i.i.i.i.i.i77.i:                             ; preds = %.noexc.i.i.i
  %299 = bitcast i8* %297 to double*              ; <double*> [#uses=1]
  %300 = load double* %__first_addr.01.i.i.i75.i, align 8 ; <double> [#uses=1]
  store double %300, double* %299, align 8
  br label %_ZNSt4listIdSaIdEE9push_backERKd.exit.i.i.i.i

_ZNSt4listIdSaIdEE9push_backERKd.exit.i.i.i.i:    ; preds = %bb.i.i.i.i.i.i.i77.i, %.noexc.i.i.i
  %301 = bitcast i8* %296 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %301, %"struct.std::_List_node_base"* %291)
          to label %.noexc2.i.i.i unwind label %lpad.i.i81.i

.noexc2.i.i.i:                                    ; preds = %_ZNSt4listIdSaIdEE9push_backERKd.exit.i.i.i.i
  %302 = icmp eq double* %scevgep.i.i.i74.i, %21  ; <i1> [#uses=1]
  br i1 %302, label %bb1.i82.i, label %bb.i.i.i76.i

invcont1.i.i78.i:                                 ; preds = %bb.i.i.i5.i.i, %lpad.i.i81.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i79.i)
          to label %.noexc6.i.i unwind label %lpad.i94.i

.noexc6.i.i:                                      ; preds = %invcont1.i.i78.i
  unreachable

lpad.i.i81.i:                                     ; preds = %_ZNSt4listIdSaIdEE9push_backERKd.exit.i.i.i.i, %bb.i.i.i76.i
  %eh_ptr.i.i79.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select5.i.i80.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i79.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %303 = load %"struct.std::_List_node_base"** %289, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %304 = icmp eq %"struct.std::_List_node_base"* %291, %303 ; <i1> [#uses=1]
  br i1 %304, label %invcont1.i.i78.i, label %bb.i.i.i5.i.i

bb.i.i.i5.i.i:                                    ; preds = %bb.i.i.i5.i.i, %lpad.i.i81.i
  %__cur.0.in1.i.i.i4.i.i = phi %"struct.std::_List_node_base"* [ %306, %bb.i.i.i5.i.i ], [ %303, %lpad.i.i81.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %305 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %306 = load %"struct.std::_List_node_base"** %305, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %307 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %307) nounwind
  %308 = icmp eq %"struct.std::_List_node_base"* %291, %306 ; <i1> [#uses=1]
  br i1 %308, label %invcont1.i.i78.i, label %bb.i.i.i5.i.i

bb1.i82.i:                                        ; preds = %.noexc2.i.i.i
  %309 = load %"struct.std::_List_node_base"** %289, align 8 ; <%"struct.std::_List_node_base"*> [#uses=5]
  %310 = icmp eq %"struct.std::_List_node_base"* %309, %291 ; <i1> [#uses=1]
  br i1 %310, label %_ZNSt4listIdSaIdEE4sortEv.exit.i.i, label %bb.i.i83.i

bb.i.i83.i:                                       ; preds = %bb1.i82.i
  %311 = getelementptr inbounds %"struct.std::_List_node_base"* %309, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %312 = load %"struct.std::_List_node_base"** %311, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %313 = icmp eq %"struct.std::_List_node_base"* %312, %291 ; <i1> [#uses=1]
  br i1 %313, label %_ZNSt4listIdSaIdEE4sortEv.exit.i.i, label %bb1.i1.i.i

bb1.i1.i.i:                                       ; preds = %bb.i.i83.i
  store %"struct.std::_List_node_base"* %294, %"struct.std::_List_node_base"** %292, align 8
  store %"struct.std::_List_node_base"* %294, %"struct.std::_List_node_base"** %293, align 4
  br label %invcont.i.i.i

invcont.i.i.i:                                    ; preds = %invcont.i.i.i, %bb1.i1.i.i
  %indvar106.i.i.i = phi i32 [ 0, %bb1.i1.i.i ], [ %indvar.next107.i.i.i, %invcont.i.i.i ] ; <i32> [#uses=4]
  %scevgep109112.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar106.i.i.i, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %scevgep111.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar106.i.i.i, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %314 = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar106.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  store %"struct.std::_List_node_base"* %scevgep109112.i.i.i, %"struct.std::_List_node_base"** %314, align 8
  store %"struct.std::_List_node_base"* %scevgep109112.i.i.i, %"struct.std::_List_node_base"** %scevgep111.i.i.i, align 4
  %indvar.next107.i.i.i = add i32 %indvar106.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond108.i.i.i = icmp eq i32 %indvar.next107.i.i.i, 64 ; <i1> [#uses=1]
  br i1 %exitcond108.i.i.i, label %invcont14.i.i.i, label %invcont.i.i.i

invcont14.i.i.i:                                  ; preds = %bb36.i.i.i, %invcont.i.i.i
  %315 = phi %"struct.std::_List_node_base"* [ %340, %bb36.i.i.i ], [ %309, %invcont.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=3]
  %__fill.1.i.i.i = phi %"struct.std::list<double,std::allocator<double> >"* [ %__fill.0.i.i.i, %bb36.i.i.i ], [ %295, %invcont.i.i.i ] ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=3]
  %316 = load %"struct.std::_List_node_base"** %292, align 8 ; <%"struct.std::_List_node_base"*> [#uses=3]
  %317 = getelementptr inbounds %"struct.std::_List_node_base"* %315, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %318 = load %"struct.std::_List_node_base"** %317, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %319 = icmp eq %"struct.std::_List_node_base"* %316, %315 ; <i1> [#uses=1]
  %320 = icmp eq %"struct.std::_List_node_base"* %318, %316 ; <i1> [#uses=1]
  %or.cond.i.i.i84.i = or i1 %320, %319           ; <i1> [#uses=1]
  br i1 %or.cond.i.i.i84.i, label %bb21.i.i.i, label %bb6.critedge.i.i.i.i

bb6.critedge.i.i.i.i:                             ; preds = %invcont14.i.i.i
  invoke void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"* %316, %"struct.std::_List_node_base"* %315, %"struct.std::_List_node_base"* %318)
          to label %bb21.i.i.i unwind label %lpad75.i.i.i

bb18.i.i.i:                                       ; preds = %bb22.i.i.i
  %321 = icmp eq %"struct.std::list<double,std::allocator<double> >"* %__counter.0.i.i.i, %__carry.i.i.i ; <i1> [#uses=1]
  br i1 %321, label %invcont19.i.i.i, label %bb.i19.i.i.i

bb.i19.i.i.i:                                     ; preds = %bb18.i.i.i
  %322 = load %"struct.std::_List_node_base"** %292, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb8.outer.i22.i.i.i

bb8.outer.i22.i.i.i:                              ; preds = %bb2.split.i24.i.i.i, %bb.i19.i.i.i
  %__first2.0.0.ph.i20.i.i.i = phi %"struct.std::_List_node_base"* [ %322, %bb.i19.i.i.i ], [ %332, %bb2.split.i24.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=5]
  %__first1.0.0.ph.i21.i.i.i = phi %"struct.std::_List_node_base"* [ %337, %bb.i19.i.i.i ], [ %__first1.0.0.i26.i.i.i, %bb2.split.i24.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %323 = icmp eq %"struct.std::_List_node_base"* %__first2.0.0.ph.i20.i.i.i, %294 ; <i1> [#uses=2]
  %324 = getelementptr inbounds %"struct.std::_List_node_base"* %__first2.0.0.ph.i20.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %325 = bitcast %"struct.std::_List_node_base"* %324 to double* ; <double*> [#uses=1]
  br i1 %323, label %invcont19.i.i.i, label %bb8.i27.i.i.i

bb1.i23.i.i.i:                                    ; preds = %bb8.i27.i.i.i
  %326 = load double* %325, align 8               ; <double> [#uses=1]
  %327 = getelementptr inbounds %"struct.std::_List_node_base"* %__first1.0.0.i26.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %328 = bitcast %"struct.std::_List_node_base"* %327 to double* ; <double*> [#uses=1]
  %329 = load double* %328, align 8               ; <double> [#uses=1]
  %330 = fcmp olt double %326, %329               ; <i1> [#uses=1]
  br i1 %330, label %bb2.split.i24.i.i.i, label %bb7.i25.i.i.i

bb2.split.i24.i.i.i:                              ; preds = %bb1.i23.i.i.i
  %331 = getelementptr inbounds %"struct.std::_List_node_base"* %__first2.0.0.ph.i20.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %332 = load %"struct.std::_List_node_base"** %331, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  invoke void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"* %__first1.0.0.i26.i.i.i, %"struct.std::_List_node_base"* %__first2.0.0.ph.i20.i.i.i, %"struct.std::_List_node_base"* %332)
          to label %bb8.outer.i22.i.i.i unwind label %lpad75.i.i.i

bb7.i25.i.i.i:                                    ; preds = %bb1.i23.i.i.i
  %333 = getelementptr inbounds %"struct.std::_List_node_base"* %__first1.0.0.i26.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %334 = load %"struct.std::_List_node_base"** %333, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb8.i27.i.i.i

bb8.i27.i.i.i:                                    ; preds = %bb7.i25.i.i.i, %bb8.outer.i22.i.i.i
  %__first1.0.0.i26.i.i.i = phi %"struct.std::_List_node_base"* [ %334, %bb7.i25.i.i.i ], [ %__first1.0.0.ph.i21.i.i.i, %bb8.outer.i22.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=5]
  %335 = icmp eq %"struct.std::_List_node_base"* %__first1.0.0.i26.i.i.i, %__counter.0101.i.i.i ; <i1> [#uses=1]
  br i1 %335, label %bb22.critedge.split.i28.i.i.i, label %bb1.i23.i.i.i

bb22.critedge.split.i28.i.i.i:                    ; preds = %bb8.i27.i.i.i
  br i1 %323, label %invcont19.i.i.i, label %bb24.i30.i.i.i

bb24.i30.i.i.i:                                   ; preds = %bb22.critedge.split.i28.i.i.i
  invoke void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"* %__counter.0101.i.i.i, %"struct.std::_List_node_base"* %__first2.0.0.ph.i20.i.i.i, %"struct.std::_List_node_base"* %294)
          to label %invcont19.i.i.i unwind label %lpad75.i.i.i

invcont19.i.i.i:                                  ; preds = %bb24.i30.i.i.i, %bb22.critedge.split.i28.i.i.i, %bb8.outer.i22.i.i.i, %bb18.i.i.i
  invoke void @_ZNSt15_List_node_base4swapERS_S0_(%"struct.std::_List_node_base"* %294, %"struct.std::_List_node_base"* %__counter.0101.i.i.i)
          to label %invcont20.i.i.i unwind label %lpad75.i.i.i

invcont20.i.i.i:                                  ; preds = %invcont19.i.i.i
  %indvar.next99.i.i.i = add i32 %indvar98.i.i.i, 1 ; <i32> [#uses=1]
  br label %bb21.i.i.i

bb21.i.i.i:                                       ; preds = %invcont20.i.i.i, %bb6.critedge.i.i.i.i, %invcont14.i.i.i
  %indvar98.i.i.i = phi i32 [ %indvar.next99.i.i.i, %invcont20.i.i.i ], [ 0, %invcont14.i.i.i ], [ 0, %bb6.critedge.i.i.i.i ] ; <i32> [#uses=4]
  %__counter.0.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar98.i.i.i ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=2]
  %__counter.0101.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar98.i.i.i, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=5]
  %336 = icmp eq %"struct.std::list<double,std::allocator<double> >"* %__counter.0.i.i.i, %__fill.1.i.i.i ; <i1> [#uses=2]
  br i1 %336, label %bb33.critedge.i.i.i, label %bb22.i.i.i

bb22.i.i.i:                                       ; preds = %bb21.i.i.i
  %__counter.0102.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar98.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %337 = load %"struct.std::_List_node_base"** %__counter.0102.i.i.i, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %338 = icmp eq %"struct.std::_List_node_base"* %337, %__counter.0101.i.i.i ; <i1> [#uses=1]
  br i1 %338, label %bb33.critedge.i.i.i, label %bb18.i.i.i

bb33.critedge.i.i.i:                              ; preds = %bb22.i.i.i, %bb21.i.i.i
  invoke void @_ZNSt15_List_node_base4swapERS_S0_(%"struct.std::_List_node_base"* %294, %"struct.std::_List_node_base"* %__counter.0101.i.i.i)
          to label %invcont34.i.i.i unwind label %lpad75.i.i.i

invcont34.i.i.i:                                  ; preds = %bb33.critedge.i.i.i
  br i1 %336, label %bb35.i.i.i, label %bb36.i.i.i

bb35.i.i.i:                                       ; preds = %invcont34.i.i.i
  %339 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %__fill.1.i.i.i, i32 1 ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=1]
  br label %bb36.i.i.i

bb36.i.i.i:                                       ; preds = %bb35.i.i.i, %invcont34.i.i.i
  %__fill.0.i.i.i = phi %"struct.std::list<double,std::allocator<double> >"* [ %339, %bb35.i.i.i ], [ %__fill.1.i.i.i, %invcont34.i.i.i ] ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=3]
  %340 = load %"struct.std::_List_node_base"** %289, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %341 = icmp eq %"struct.std::_List_node_base"* %340, %291 ; <i1> [#uses=1]
  br i1 %341, label %bb43.i.i.i, label %invcont14.i.i.i

bb.i.i2.i.i:                                      ; preds = %bb43.i.i.i
  %scevgep8384.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar81.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %scevgep8789.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp86.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %342 = load %"struct.std::_List_node_base"** %scevgep8789.i.i.i, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %343 = load %"struct.std::_List_node_base"** %scevgep8384.i.i.i, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb8.outer.i.i.i.i

bb8.outer.i.i.i.i:                                ; preds = %bb2.split.i.i.i.i, %bb.i.i2.i.i
  %__first2.0.0.ph.i.i.i.i = phi %"struct.std::_List_node_base"* [ %343, %bb.i.i2.i.i ], [ %353, %bb2.split.i.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=5]
  %__first1.0.0.ph.i.i.i.i = phi %"struct.std::_List_node_base"* [ %342, %bb.i.i2.i.i ], [ %__first1.0.0.i.i.i.i, %bb2.split.i.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %344 = icmp eq %"struct.std::_List_node_base"* %__first2.0.0.ph.i.i.i.i, %scevgep8385.i.i.i ; <i1> [#uses=2]
  %345 = getelementptr inbounds %"struct.std::_List_node_base"* %__first2.0.0.ph.i.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %346 = bitcast %"struct.std::_List_node_base"* %345 to double* ; <double*> [#uses=1]
  br i1 %344, label %bb43.i.i.i, label %bb8.i.i.i.i

bb1.i.i.i85.i:                                    ; preds = %bb8.i.i.i.i
  %347 = load double* %346, align 8               ; <double> [#uses=1]
  %348 = getelementptr inbounds %"struct.std::_List_node_base"* %__first1.0.0.i.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %349 = bitcast %"struct.std::_List_node_base"* %348 to double* ; <double*> [#uses=1]
  %350 = load double* %349, align 8               ; <double> [#uses=1]
  %351 = fcmp olt double %347, %350               ; <i1> [#uses=1]
  br i1 %351, label %bb2.split.i.i.i.i, label %bb7.i.i.i86.i

bb2.split.i.i.i.i:                                ; preds = %bb1.i.i.i85.i
  %352 = getelementptr inbounds %"struct.std::_List_node_base"* %__first2.0.0.ph.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %353 = load %"struct.std::_List_node_base"** %352, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  invoke void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"* %__first1.0.0.i.i.i.i, %"struct.std::_List_node_base"* %__first2.0.0.ph.i.i.i.i, %"struct.std::_List_node_base"* %353)
          to label %bb8.outer.i.i.i.i unwind label %lpad75.i.i.i

bb7.i.i.i86.i:                                    ; preds = %bb1.i.i.i85.i
  %354 = getelementptr inbounds %"struct.std::_List_node_base"* %__first1.0.0.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %355 = load %"struct.std::_List_node_base"** %354, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb8.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb7.i.i.i86.i, %bb8.outer.i.i.i.i
  %__first1.0.0.i.i.i.i = phi %"struct.std::_List_node_base"* [ %355, %bb7.i.i.i86.i ], [ %__first1.0.0.ph.i.i.i.i, %bb8.outer.i.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=5]
  %356 = icmp eq %"struct.std::_List_node_base"* %__first1.0.0.i.i.i.i, %scevgep8788.i.i.i ; <i1> [#uses=1]
  br i1 %356, label %bb22.critedge.split.i.i.i.i, label %bb1.i.i.i85.i

bb22.critedge.split.i.i.i.i:                      ; preds = %bb8.i.i.i.i
  br i1 %344, label %bb43.i.i.i, label %bb24.i.i.i87.i

bb24.i.i.i87.i:                                   ; preds = %bb22.critedge.split.i.i.i.i
  invoke void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"* %scevgep8788.i.i.i, %"struct.std::_List_node_base"* %__first2.0.0.ph.i.i.i.i, %"struct.std::_List_node_base"* %scevgep8385.i.i.i)
          to label %bb43.i.i.i unwind label %lpad75.i.i.i

bb43.i.i.i:                                       ; preds = %bb24.i.i.i87.i, %bb22.critedge.split.i.i.i.i, %bb8.outer.i.i.i.i, %bb36.i.i.i
  %indvar81.i.i.i = phi i32 [ 0, %bb36.i.i.i ], [ %tmp86.i.i.i, %bb22.critedge.split.i.i.i.i ], [ %tmp86.i.i.i, %bb24.i.i.i87.i ], [ %tmp86.i.i.i, %bb8.outer.i.i.i.i ] ; <i32> [#uses=3]
  %scevgep8385.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %indvar81.i.i.i, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %tmp86.i.i.i = add i32 %indvar81.i.i.i, 1       ; <i32> [#uses=6]
  %__counter.1.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp86.i.i.i ; <%"struct.std::list<double,std::allocator<double> >"*> [#uses=1]
  %scevgep8788.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp86.i.i.i, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %357 = icmp eq %"struct.std::list<double,std::allocator<double> >"* %__counter.1.i.i.i, %__fill.0.i.i.i ; <i1> [#uses=1]
  br i1 %357, label %bb44.i.i.i, label %bb.i.i2.i.i

bb44.i.i.i:                                       ; preds = %bb43.i.i.i
  %358 = getelementptr inbounds %"struct.std::list<double,std::allocator<double> >"* %__fill.0.i.i.i, i32 -1, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4swapERS_S0_(%"struct.std::_List_node_base"* %291, %"struct.std::_List_node_base"* %358)
          to label %bb56.i.i.i unwind label %lpad75.i.i.i

bb50.i.i.i:                                       ; preds = %lpad75.i.i.i, %bb49.backedge.i.i.i
  %indvar.i.i88.i = phi i32 [ 0, %lpad75.i.i.i ], [ %indvar.next.i.i.i, %bb49.backedge.i.i.i ] ; <i32> [#uses=2]
  %tmp65.i.i.i = sub i32 63, %indvar.i.i88.i      ; <i32> [#uses=2]
  %scevgep67.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp65.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %scevgep66.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp65.i.i.i, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %359 = load %"struct.std::_List_node_base"** %scevgep67.i.i.i, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %360 = icmp eq %"struct.std::_List_node_base"* %scevgep66.i.i.i, %359 ; <i1> [#uses=1]
  br i1 %360, label %bb49.backedge.i.i.i, label %bb.i.i.i11.i.i.i

bb49.backedge.i.i.i:                              ; preds = %bb.i.i.i11.i.i.i, %bb50.i.i.i
  %indvar.next.i.i.i = add i32 %indvar.i.i88.i, 1 ; <i32> [#uses=2]
  %exitcond.i.i.i = icmp eq i32 %indvar.next.i.i.i, 64 ; <i1> [#uses=1]
  br i1 %exitcond.i.i.i, label %ppad.i.i.i, label %bb50.i.i.i

bb.i.i.i11.i.i.i:                                 ; preds = %bb.i.i.i11.i.i.i, %bb50.i.i.i
  %__cur.0.in1.i.i.i10.i.i.i = phi %"struct.std::_List_node_base"* [ %362, %bb.i.i.i11.i.i.i ], [ %359, %bb50.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %361 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i10.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %362 = load %"struct.std::_List_node_base"** %361, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %363 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i10.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %363) nounwind
  %364 = icmp eq %"struct.std::_List_node_base"* %scevgep66.i.i.i, %362 ; <i1> [#uses=1]
  br i1 %364, label %bb49.backedge.i.i.i, label %bb.i.i.i11.i.i.i

bb56.i.i.i:                                       ; preds = %bb55.backedge.i.i.i, %bb44.i.i.i
  %indvar68.i.i.i = phi i32 [ %indvar.next69.i.i.i, %bb55.backedge.i.i.i ], [ 0, %bb44.i.i.i ] ; <i32> [#uses=2]
  %tmp72.i.i.i = sub i32 63, %indvar68.i.i.i      ; <i32> [#uses=2]
  %scevgep7375.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp72.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %scevgep7374.i.i.i = getelementptr [64 x %"struct.std::list<double,std::allocator<double> >"]* %__tmp.i.i.i, i32 0, i32 %tmp72.i.i.i, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %365 = load %"struct.std::_List_node_base"** %scevgep7375.i.i.i, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %366 = icmp eq %"struct.std::_List_node_base"* %scevgep7374.i.i.i, %365 ; <i1> [#uses=1]
  br i1 %366, label %bb55.backedge.i.i.i, label %bb.i.i.i8.i.i.i

bb55.backedge.i.i.i:                              ; preds = %bb.i.i.i8.i.i.i, %bb56.i.i.i
  %indvar.next69.i.i.i = add i32 %indvar68.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond70.i.i.i = icmp eq i32 %indvar.next69.i.i.i, 64 ; <i1> [#uses=1]
  br i1 %exitcond70.i.i.i, label %bb63.i.i.i, label %bb56.i.i.i

bb.i.i.i8.i.i.i:                                  ; preds = %bb.i.i.i8.i.i.i, %bb56.i.i.i
  %__cur.0.in1.i.i.i7.i.i.i = phi %"struct.std::_List_node_base"* [ %368, %bb.i.i.i8.i.i.i ], [ %365, %bb56.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %367 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i7.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %368 = load %"struct.std::_List_node_base"** %367, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %369 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i7.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %369) nounwind
  %370 = icmp eq %"struct.std::_List_node_base"* %scevgep7374.i.i.i, %368 ; <i1> [#uses=1]
  br i1 %370, label %bb55.backedge.i.i.i, label %bb.i.i.i8.i.i.i

invcont61.i.i.i:                                  ; preds = %bb.i.i.i.i.i89.i, %ppad.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr76.i.i.i)
          to label %.noexc3.i.i unwind label %lpad12.i.i

.noexc3.i.i:                                      ; preds = %invcont61.i.i.i
  unreachable

bb63.i.i.i:                                       ; preds = %bb55.backedge.i.i.i
  %371 = load %"struct.std::_List_node_base"** %292, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %372 = icmp eq %"struct.std::_List_node_base"* %294, %371 ; <i1> [#uses=1]
  br i1 %372, label %_ZNSt4listIdSaIdEED1Ev.exit6.i.i.i, label %bb.i.i.i5.i.i.i

bb.i.i.i5.i.i.i:                                  ; preds = %bb.i.i.i5.i.i.i, %bb63.i.i.i
  %__cur.0.in1.i.i.i4.i.i.i = phi %"struct.std::_List_node_base"* [ %374, %bb.i.i.i5.i.i.i ], [ %371, %bb63.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %373 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %374 = load %"struct.std::_List_node_base"** %373, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %375 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %375) nounwind
  %376 = icmp eq %"struct.std::_List_node_base"* %294, %374 ; <i1> [#uses=1]
  br i1 %376, label %_ZNSt4listIdSaIdEED1Ev.exit6.i.i.i, label %bb.i.i.i5.i.i.i

_ZNSt4listIdSaIdEED1Ev.exit6.i.i.i:               ; preds = %bb.i.i.i5.i.i.i, %bb63.i.i.i
  %.pre = load %"struct.std::_List_node_base"** %289, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %_ZNSt4listIdSaIdEE4sortEv.exit.i.i

lpad75.i.i.i:                                     ; preds = %bb44.i.i.i, %bb24.i.i.i87.i, %bb2.split.i.i.i.i, %bb33.critedge.i.i.i, %invcont19.i.i.i, %bb24.i30.i.i.i, %bb2.split.i24.i.i.i, %bb6.critedge.i.i.i.i
  %eh_ptr76.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select78.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr76.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %bb50.i.i.i

ppad.i.i.i:                                       ; preds = %bb49.backedge.i.i.i
  %377 = load %"struct.std::_List_node_base"** %292, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %378 = icmp eq %"struct.std::_List_node_base"* %294, %377 ; <i1> [#uses=1]
  br i1 %378, label %invcont61.i.i.i, label %bb.i.i.i.i.i89.i

bb.i.i.i.i.i89.i:                                 ; preds = %bb.i.i.i.i.i89.i, %ppad.i.i.i
  %__cur.0.in1.i.i.i.i.i.i = phi %"struct.std::_List_node_base"* [ %380, %bb.i.i.i.i.i89.i ], [ %377, %ppad.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %379 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %380 = load %"struct.std::_List_node_base"** %379, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %381 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %381) nounwind
  %382 = icmp eq %"struct.std::_List_node_base"* %294, %380 ; <i1> [#uses=1]
  br i1 %382, label %invcont61.i.i.i, label %bb.i.i.i.i.i89.i

_ZNSt4listIdSaIdEE4sortEv.exit.i.i:               ; preds = %_ZNSt4listIdSaIdEED1Ev.exit6.i.i.i, %bb.i.i83.i, %bb1.i82.i
  %383 = phi %"struct.std::_List_node_base"* [ %.pre, %_ZNSt4listIdSaIdEED1Ev.exit6.i.i.i ], [ %309, %bb.i.i83.i ], [ %309, %bb1.i82.i ] ; <%"struct.std::_List_node_base"*> [#uses=4]
  %384 = icmp eq %"struct.std::_List_node_base"* %383, %291 ; <i1> [#uses=1]
  br i1 %384, label %bb9.i91.i, label %bb6.outer.i.i.i

bb1.i.i.i:                                        ; preds = %bb6.i.i.i
  %385 = load double* %391, align 8               ; <double> [#uses=1]
  %386 = getelementptr inbounds %"struct.std::_List_node_base"* %394, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %387 = bitcast %"struct.std::_List_node_base"* %386 to double* ; <double*> [#uses=1]
  %388 = load double* %387, align 8               ; <double> [#uses=1]
  %389 = fcmp oeq double %385, %388               ; <i1> [#uses=1]
  br i1 %389, label %bb3.i.i90.i, label %bb6.outer.i.i.i

bb6.outer.i.i.i:                                  ; preds = %bb1.i.i.i, %_ZNSt4listIdSaIdEE4sortEv.exit.i.i
  %__first.0.1.ph.i.i.i = phi %"struct.std::_List_node_base"* [ %383, %_ZNSt4listIdSaIdEE4sortEv.exit.i.i ], [ %394, %bb1.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %__next.0.0.ph.i.i.i = phi %"struct.std::_List_node_base"* [ %383, %_ZNSt4listIdSaIdEE4sortEv.exit.i.i ], [ %394, %bb1.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %390 = getelementptr inbounds %"struct.std::_List_node_base"* %__first.0.1.ph.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %391 = bitcast %"struct.std::_List_node_base"* %390 to double* ; <double*> [#uses=1]
  br label %bb6.i.i.i

bb3.i.i90.i:                                      ; preds = %bb1.i.i.i
  invoke void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"* %394)
          to label %.noexc.i.i unwind label %lpad12.i.i

.noexc.i.i:                                       ; preds = %bb3.i.i90.i
  %392 = bitcast %"struct.std::_List_node_base"* %394 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %392) nounwind
  br label %bb6.i.i.i

bb6.i.i.i:                                        ; preds = %.noexc.i.i, %bb6.outer.i.i.i
  %__next.0.0.i.i.i = phi %"struct.std::_List_node_base"* [ %__first.0.1.ph.i.i.i, %.noexc.i.i ], [ %__next.0.0.ph.i.i.i, %bb6.outer.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %393 = getelementptr inbounds %"struct.std::_List_node_base"* %__next.0.0.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %394 = load %"struct.std::_List_node_base"** %393, align 4 ; <%"struct.std::_List_node_base"*> [#uses=6]
  %395 = icmp eq %"struct.std::_List_node_base"* %394, %291 ; <i1> [#uses=1]
  br i1 %395, label %bb9.loopexit.i.i, label %bb1.i.i.i

bb9.loopexit.i.i:                                 ; preds = %bb6.i.i.i
  %.pre.i.i = load %"struct.std::_List_node_base"** %289, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb9.i91.i

bb9.i91.i:                                        ; preds = %bb9.loopexit.i.i, %_ZNSt4listIdSaIdEE4sortEv.exit.i.i
  %396 = phi %"struct.std::_List_node_base"* [ %.pre.i.i, %bb9.loopexit.i.i ], [ %383, %_ZNSt4listIdSaIdEE4sortEv.exit.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %397 = icmp eq %"struct.std::_List_node_base"* %291, %396 ; <i1> [#uses=1]
  br i1 %397, label %_Z9list_testPdS_i.exit.i, label %bb.i.i.i2.i92.i

bb.i.i.i2.i92.i:                                  ; preds = %bb.i.i.i2.i92.i, %bb9.i91.i
  %__cur.0.in1.i.i.i1.i.i = phi %"struct.std::_List_node_base"* [ %399, %bb.i.i.i2.i92.i ], [ %396, %bb9.i91.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %398 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %399 = load %"struct.std::_List_node_base"** %398, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %400 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %400) nounwind
  %401 = icmp eq %"struct.std::_List_node_base"* %291, %399 ; <i1> [#uses=1]
  br i1 %401, label %_Z9list_testPdS_i.exit.i, label %bb.i.i.i2.i92.i

lpad.i94.i:                                       ; preds = %invcont1.i.i78.i
  %eh_ptr.i93.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select11.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i93.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %Unwind.i.i

lpad12.i.i:                                       ; preds = %bb3.i.i90.i, %invcont61.i.i.i
  %eh_ptr13.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=3]
  %eh_select15.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr13.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %402 = load %"struct.std::_List_node_base"** %289, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %403 = icmp eq %"struct.std::_List_node_base"* %291, %402 ; <i1> [#uses=1]
  br i1 %403, label %Unwind.i.i, label %bb.i.i.i.i95.i

bb.i.i.i.i95.i:                                   ; preds = %bb.i.i.i.i95.i, %lpad12.i.i
  %__cur.0.in1.i.i.i.i.i = phi %"struct.std::_List_node_base"* [ %405, %bb.i.i.i.i95.i ], [ %402, %lpad12.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %404 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %405 = load %"struct.std::_List_node_base"** %404, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %406 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %406) nounwind
  %407 = icmp eq %"struct.std::_List_node_base"* %291, %405 ; <i1> [#uses=1]
  br i1 %407, label %Unwind.i.i, label %bb.i.i.i.i95.i

Unwind.i.i:                                       ; preds = %bb.i.i.i.i95.i, %lpad12.i.i, %lpad.i94.i
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i93.i, %lpad.i94.i ], [ %eh_ptr13.i.i, %lpad12.i.i ], [ %eh_ptr13.i.i, %bb.i.i.i.i95.i ] ; <i8*> [#uses=1]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc96.i unwind label %lpad18.i

.noexc96.i:                                       ; preds = %Unwind.i.i
  unreachable

_Z9list_testPdS_i.exit.i:                         ; preds = %bb.i.i.i2.i92.i, %bb9.i91.i
  %indvar.next.i17.i = add i32 %indvar.i15.i, 1   ; <i32> [#uses=2]
  %exitcond.i18.i = icmp eq i32 %indvar.next.i17.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i18.i, label %invcont7.i, label %bb.i19.i

invcont7.i:                                       ; preds = %_Z9list_testPdS_i.exit.i
  br i1 %34, label %bb.nph.i5.i, label %bb15.i

bb.nph.i5.i:                                      ; preds = %invcont7.i
  %408 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i8*> [#uses=1]
  %409 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %410 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=3]
  %411 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %412 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 1, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=2]
  %413 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 2 ; <i32*> [#uses=4]
  %414 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %415 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i10.i, i32 0, i32 0 ; <%"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"*> [#uses=1]
  br label %bb.i10.i

bb.i10.i:                                         ; preds = %_Z8set_testPdS_i.exit.i, %bb.nph.i5.i
  %indvar.i6.i = phi i32 [ 0, %bb.nph.i5.i ], [ %indvar.next.i8.i, %_Z8set_testPdS_i.exit.i ] ; <i32> [#uses=1]
  store i8 0, i8* %408, align 8
  store i32 0, i32* %413, align 4
  store i32 0, i32* %409, align 4
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %410, align 4
  store %"struct.std::_Rb_tree_node_base"* %414, %"struct.std::_Rb_tree_node_base"** %411, align 4
  store %"struct.std::_Rb_tree_node_base"* %414, %"struct.std::_Rb_tree_node_base"** %412, align 4
  br label %bb.i1.i.i14.i

bb.i1.i.i14.i:                                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueESt17_Rb_tree_iteratorIdERKd.exit.i.i.i, %bb.i10.i
  %indvar.i.i.i11.i = phi i32 [ 0, %bb.i10.i ], [ %tmp.i.i50.i, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueESt17_Rb_tree_iteratorIdERKd.exit.i.i.i ] ; <i32> [#uses=2]
  %__first_addr.01.i.i.i12.i = getelementptr double* %19, i32 %indvar.i.i.i11.i ; <double*> [#uses=3]
  %416 = load i32* %413, align 4                  ; <i32> [#uses=1]
  %417 = icmp eq i32 %416, 0                      ; <i1> [#uses=1]
  br i1 %417, label %bb7.i.i.i.i, label %bb1.i.i.i15.i

bb1.i.i.i15.i:                                    ; preds = %bb.i1.i.i14.i
  %418 = load %"struct.std::_Rb_tree_node_base"** %412, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %419 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %418, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %420 = bitcast %"struct.std::_Rb_tree_node_base"* %419 to double* ; <double*> [#uses=1]
  %421 = load double* %420, align 8               ; <double> [#uses=2]
  %422 = load double* %__first_addr.01.i.i.i12.i, align 8 ; <double> [#uses=2]
  %423 = fcmp olt double %421, %422               ; <i1> [#uses=1]
  br i1 %423, label %bb10.i.i.i17.i, label %bb7.i.i.i.i

bb7.i.i.i.i:                                      ; preds = %bb1.i.i.i15.i, %bb.i1.i.i14.i
  invoke fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueERKd(%"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* noalias sret %6, %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %415, double* %__first_addr.01.i.i.i12.i)
          to label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueESt17_Rb_tree_iteratorIdERKd.exit.i.i.i unwind label %lpad.i.i55.i

bb10.i.i.i17.i:                                   ; preds = %bb1.i.i.i15.i
  %424 = icmp eq %"struct.std::_Rb_tree_node_base"* %414, %418 ; <i1> [#uses=1]
  %425 = fcmp olt double %422, %421               ; <i1> [#uses=1]
  %or.cond.i.i.i16.i = or i1 %424, %425           ; <i1> [#uses=1]
  %iftmp.270.0.i42.i.i.i.i = zext i1 %or.cond.i.i.i16.i to i8 ; <i8> [#uses=1]
  %426 = invoke i8* @_Znwj(i32 24)
          to label %.noexc4.i.i18.i unwind label %lpad.i.i55.i ; <i8*> [#uses=2]

.noexc4.i.i18.i:                                  ; preds = %bb10.i.i.i17.i
  %427 = getelementptr inbounds i8* %426, i32 16  ; <i8*> [#uses=2]
  %428 = icmp eq i8* %427, null                   ; <i1> [#uses=1]
  br i1 %428, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit45.i.i.i.i, label %bb.i.i.i44.i.i.i.i

bb.i.i.i44.i.i.i.i:                               ; preds = %.noexc4.i.i18.i
  %429 = bitcast i8* %427 to double*              ; <double*> [#uses=1]
  %430 = load double* %__first_addr.01.i.i.i12.i, align 8 ; <double> [#uses=1]
  store double %430, double* %429, align 8
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit45.i.i.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit45.i.i.i.i: ; preds = %bb.i.i.i44.i.i.i.i, %.noexc4.i.i18.i
  %431 = bitcast i8* %426 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.270.0.i42.i.i.i.i, %"struct.std::_Rb_tree_node_base"* %431, %"struct.std::_Rb_tree_node_base"* %418, %"struct.std::_Rb_tree_node_base"* %414)
          to label %.noexc5.i.i19.i unwind label %lpad.i.i55.i

.noexc5.i.i19.i:                                  ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit45.i.i.i.i
  %432 = load i32* %413, align 4                  ; <i32> [#uses=1]
  %433 = add i32 %432, 1                          ; <i32> [#uses=1]
  store i32 %433, i32* %413, align 4
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueESt17_Rb_tree_iteratorIdERKd.exit.i.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueESt17_Rb_tree_iteratorIdERKd.exit.i.i.i: ; preds = %.noexc5.i.i19.i, %bb7.i.i.i.i
  %tmp.i.i50.i = add i32 %indvar.i.i.i11.i, 1     ; <i32> [#uses=2]
  %scevgep.i.i.i51.i = getelementptr double* %19, i32 %tmp.i.i50.i ; <double*> [#uses=1]
  %434 = icmp eq double* %scevgep.i.i.i51.i, %21  ; <i1> [#uses=1]
  br i1 %434, label %_ZNSt3setIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i, label %bb.i1.i.i14.i

invcont1.i.i52.i:                                 ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i62.i, %lpad.i.i55.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i53.i)
          to label %.noexc70.i unwind label %lpad18.i

.noexc70.i:                                       ; preds = %invcont1.i.i52.i
  unreachable

lpad.i.i55.i:                                     ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit45.i.i.i.i, %bb10.i.i.i17.i, %bb7.i.i.i.i
  %eh_ptr.i.i53.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select5.i.i54.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i53.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %435 = load %"struct.std::_Rb_tree_node_base"** %410, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %436 = icmp eq %"struct.std::_Rb_tree_node_base"* %435, null ; <i1> [#uses=1]
  br i1 %436, label %invcont1.i.i52.i, label %bb.i.i.i2.i57.i

bb.i.i.i2.i57.i:                                  ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i62.i, %lpad.i.i55.i
  %__x_addr.02.i.in.i.i1.i56.i = phi %"struct.std::_Rb_tree_node_base"* [ %447, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i62.i ], [ %435, %lpad.i.i55.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %437 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1.i56.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %438 = load %"struct.std::_Rb_tree_node_base"** %437, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %439 = icmp eq %"struct.std::_Rb_tree_node_base"* %438, null ; <i1> [#uses=1]
  br i1 %439, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i62.i, label %bb.i.i.i.i5.i60.i

bb.i.i.i.i5.i60.i:                                ; preds = %bb.i.i.i.i5.i60.i, %bb.i.i.i2.i57.i
  %__x_addr.0.i1.i.i.i3.i58.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %444, %bb.i.i.i.i5.i60.i ], [ %438, %bb.i.i.i2.i57.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %440 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.i58.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %441 = load %"struct.std::_Rb_tree_node_base"** %440, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %442 = bitcast %"struct.std::_Rb_tree_node_base"* %441 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %442) nounwind
  %443 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.i58.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %444 = load %"struct.std::_Rb_tree_node_base"** %443, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %445 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.i58.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %445) nounwind
  %phitmp4.i.i.i4.i59.i = icmp eq %"struct.std::_Rb_tree_node_base"* %444, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i4.i59.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i62.i, label %bb.i.i.i.i5.i60.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i62.i: ; preds = %bb.i.i.i.i5.i60.i, %bb.i.i.i2.i57.i
  %446 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1.i56.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %447 = load %"struct.std::_Rb_tree_node_base"** %446, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %448 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1.i56.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %448) nounwind
  %phitmp.i.i.i6.i61.i = icmp eq %"struct.std::_Rb_tree_node_base"* %447, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i6.i61.i, label %invcont1.i.i52.i, label %bb.i.i.i2.i57.i

_ZNSt3setIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i: ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueESt17_Rb_tree_iteratorIdERKd.exit.i.i.i
  %449 = load %"struct.std::_Rb_tree_node_base"** %410, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %450 = icmp eq %"struct.std::_Rb_tree_node_base"* %449, null ; <i1> [#uses=1]
  br i1 %450, label %_Z8set_testPdS_i.exit.i, label %bb.i.i.i.i64.i

bb.i.i.i.i64.i:                                   ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i69.i, %_ZNSt3setIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i
  %__x_addr.02.i.in.i.i.i63.i = phi %"struct.std::_Rb_tree_node_base"* [ %461, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i69.i ], [ %449, %_ZNSt3setIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %451 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i63.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %452 = load %"struct.std::_Rb_tree_node_base"** %451, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %453 = icmp eq %"struct.std::_Rb_tree_node_base"* %452, null ; <i1> [#uses=1]
  br i1 %453, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i69.i, label %bb.i.i.i.i.i67.i

bb.i.i.i.i.i67.i:                                 ; preds = %bb.i.i.i.i.i67.i, %bb.i.i.i.i64.i
  %__x_addr.0.i1.i.i.i.i65.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %458, %bb.i.i.i.i.i67.i ], [ %452, %bb.i.i.i.i64.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %454 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i65.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %455 = load %"struct.std::_Rb_tree_node_base"** %454, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %456 = bitcast %"struct.std::_Rb_tree_node_base"* %455 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %456) nounwind
  %457 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i65.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %458 = load %"struct.std::_Rb_tree_node_base"** %457, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %459 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i65.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %459) nounwind
  %phitmp4.i.i.i.i66.i = icmp eq %"struct.std::_Rb_tree_node_base"* %458, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i.i66.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i69.i, label %bb.i.i.i.i.i67.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i69.i: ; preds = %bb.i.i.i.i.i67.i, %bb.i.i.i.i64.i
  %460 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i63.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %461 = load %"struct.std::_Rb_tree_node_base"** %460, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %462 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i63.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %462) nounwind
  %phitmp.i.i.i.i68.i = icmp eq %"struct.std::_Rb_tree_node_base"* %461, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i68.i, label %_Z8set_testPdS_i.exit.i, label %bb.i.i.i.i64.i

_Z8set_testPdS_i.exit.i:                          ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i69.i, %_ZNSt3setIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i
  %indvar.next.i8.i = add i32 %indvar.i6.i, 1     ; <i32> [#uses=2]
  %exitcond.i9.i = icmp eq i32 %indvar.next.i8.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i9.i, label %invcont8.i, label %bb.i10.i

invcont8.i:                                       ; preds = %_Z8set_testPdS_i.exit.i
  br i1 %34, label %bb.nph.i.i, label %bb15.i

bb.nph.i.i:                                       ; preds = %invcont8.i
  %463 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i8*> [#uses=1]
  %464 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %465 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=5]
  %466 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=2]
  %467 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 1, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=2]
  %468 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 2 ; <i32*> [#uses=6]
  %469 = getelementptr inbounds %"struct.std::multiset<double,std::less<double>,std::allocator<double> >"* %container.i.i, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=10]
  br label %bb.i.i

bb.i.i:                                           ; preds = %_Z13multiset_testPdS_i.exit.i, %bb.nph.i.i
  %indvar.i.i = phi i32 [ 0, %bb.nph.i.i ], [ %indvar.next.i.i, %_Z13multiset_testPdS_i.exit.i ] ; <i32> [#uses=1]
  store i8 0, i8* %463, align 8
  store i32 0, i32* %468, align 4
  store i32 0, i32* %464, align 4
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %465, align 4
  store %"struct.std::_Rb_tree_node_base"* %469, %"struct.std::_Rb_tree_node_base"** %466, align 4
  store %"struct.std::_Rb_tree_node_base"* %469, %"struct.std::_Rb_tree_node_base"** %467, align 4
  br label %bb.i1.i.i.i

bb.i1.i.i.i:                                      ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i, %bb.i.i
  %470 = phi i32 [ %.rle58, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i ], [ 0, %bb.i.i ] ; <i32> [#uses=1]
  %indvar.i.i.i.i = phi i32 [ 0, %bb.i.i ], [ %tmp.i.i.i, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i ] ; <i32> [#uses=2]
  %__first_addr.01.i.i.i.i = getelementptr double* %19, i32 %indvar.i.i.i.i ; <double*> [#uses=5]
  %471 = icmp eq i32 %470, 0                      ; <i1> [#uses=1]
  br i1 %471, label %bb10.i.i.i.i, label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i1.i.i.i
  %472 = load %"struct.std::_Rb_tree_node_base"** %467, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %473 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %472, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %474 = bitcast %"struct.std::_Rb_tree_node_base"* %473 to double* ; <double*> [#uses=1]
  %475 = load double* %__first_addr.01.i.i.i.i, align 8 ; <double> [#uses=1]
  %476 = load double* %474, align 8               ; <double> [#uses=1]
  %477 = fcmp olt double %475, %476               ; <i1> [#uses=1]
  br i1 %477, label %bb10.i.i.i.i, label %bb13.i.i.i.i

bb10.i.i.i.i:                                     ; preds = %bb1.i.i.i.i, %bb.i1.i.i.i
  %__x.0.in3.i59.i.i.i.i = load %"struct.std::_Rb_tree_node_base"** %465 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %478 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in3.i59.i.i.i.i, null ; <i1> [#uses=1]
  br i1 %478, label %bb.i.i70.i.i.i.i, label %bb.nph.i60.i.i.i.i

bb.nph.i60.i.i.i.i:                               ; preds = %bb10.i.i.i.i
  %479 = load double* %__first_addr.01.i.i.i.i, align 8 ; <double> [#uses=1]
  br label %bb.i63.i.i.i.i

bb.i63.i.i.i.i:                                   ; preds = %bb4.backedge.i68.i.i.i.i, %bb.nph.i60.i.i.i.i
  %__x.06.in.i61.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in3.i59.i.i.i.i, %bb.nph.i60.i.i.i.i ], [ %__x.0.in.i67.i.i.i.i, %bb4.backedge.i68.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %__x.0.in4.i62.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in3.i59.i.i.i.i, %bb.nph.i60.i.i.i.i ], [ %__x.0.in.i67.i.i.i.i, %bb4.backedge.i68.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %480 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in4.i62.i.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %481 = bitcast %"struct.std::_Rb_tree_node_base"* %480 to double* ; <double*> [#uses=1]
  %482 = load double* %481, align 8               ; <double> [#uses=1]
  %483 = fcmp olt double %479, %482               ; <i1> [#uses=1]
  br i1 %483, label %bb1.i64.i.i.i.i, label %bb2.i65.i.i.i.i

bb1.i64.i.i.i.i:                                  ; preds = %bb.i63.i.i.i.i
  %484 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in4.i62.i.i.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge.i68.i.i.i.i

bb2.i65.i.i.i.i:                                  ; preds = %bb.i63.i.i.i.i
  %485 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in4.i62.i.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge.i68.i.i.i.i

bb4.backedge.i68.i.i.i.i:                         ; preds = %bb2.i65.i.i.i.i, %bb1.i64.i.i.i.i
  %__x.0.in.in.be.i66.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %484, %bb1.i64.i.i.i.i ], [ %485, %bb2.i65.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in.i67.i.i.i.i = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.be.i66.i.i.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %486 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in.i67.i.i.i.i, null ; <i1> [#uses=1]
  br i1 %486, label %bb.i.i70.i.i.i.i, label %bb.i63.i.i.i.i

bb.i.i70.i.i.i.i:                                 ; preds = %bb4.backedge.i68.i.i.i.i, %bb10.i.i.i.i
  %__y.0.lcssa.in.i69.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %469, %bb10.i.i.i.i ], [ %__x.06.in.i61.i.i.i.i, %bb4.backedge.i68.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %487 = icmp eq %"struct.std::_Rb_tree_node_base"* %469, %__y.0.lcssa.in.i69.i.i.i.i ; <i1> [#uses=1]
  br i1 %487, label %bb4.i.i74.i.i.i.i, label %bb1.i.i71.i.i.i.i

bb1.i.i71.i.i.i.i:                                ; preds = %bb.i.i70.i.i.i.i
  %488 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.i69.i.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %489 = bitcast %"struct.std::_Rb_tree_node_base"* %488 to double* ; <double*> [#uses=1]
  %490 = load double* %__first_addr.01.i.i.i.i, align 8 ; <double> [#uses=1]
  %491 = load double* %489, align 8               ; <double> [#uses=1]
  %492 = fcmp olt double %490, %491               ; <i1> [#uses=1]
  br i1 %492, label %bb4.i.i74.i.i.i.i, label %bb3.i.i72.i.i.i.i

bb3.i.i72.i.i.i.i:                                ; preds = %bb1.i.i71.i.i.i.i
  br label %bb4.i.i74.i.i.i.i

bb4.i.i74.i.i.i.i:                                ; preds = %bb3.i.i72.i.i.i.i, %bb1.i.i71.i.i.i.i, %bb.i.i70.i.i.i.i
  %iftmp.270.0.i.i73.i.i.i.i = phi i8 [ 0, %bb3.i.i72.i.i.i.i ], [ 1, %bb.i.i70.i.i.i.i ], [ 1, %bb1.i.i71.i.i.i.i ] ; <i8> [#uses=1]
  %493 = invoke i8* @_Znwj(i32 24)
          to label %.noexc4.i.i.i unwind label %lpad.i.i.i ; <i8*> [#uses=2]

.noexc4.i.i.i:                                    ; preds = %bb4.i.i74.i.i.i.i
  %494 = getelementptr inbounds i8* %493, i32 16  ; <i8*> [#uses=2]
  %495 = icmp eq i8* %494, null                   ; <i1> [#uses=1]
  br i1 %495, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalERKd.exit76.i.i.i.i, label %bb.i.i.i.i75.i.i.i.i

bb.i.i.i.i75.i.i.i.i:                             ; preds = %.noexc4.i.i.i
  %496 = bitcast i8* %494 to double*              ; <double*> [#uses=1]
  %497 = load double* %__first_addr.01.i.i.i.i, align 8 ; <double> [#uses=1]
  store double %497, double* %496, align 8
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalERKd.exit76.i.i.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalERKd.exit76.i.i.i.i: ; preds = %bb.i.i.i.i75.i.i.i.i, %.noexc4.i.i.i
  %498 = bitcast i8* %493 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.270.0.i.i73.i.i.i.i, %"struct.std::_Rb_tree_node_base"* %498, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.i69.i.i.i.i, %"struct.std::_Rb_tree_node_base"* %469)
          to label %.noexc5.i.i.i unwind label %lpad.i.i.i

.noexc5.i.i.i:                                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalERKd.exit76.i.i.i.i
  %499 = load i32* %468, align 4                  ; <i32> [#uses=1]
  %500 = add i32 %499, 1                          ; <i32> [#uses=2]
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i

bb13.i.i.i.i:                                     ; preds = %bb1.i.i.i.i
  %501 = icmp eq %"struct.std::_Rb_tree_node_base"* %469, %472 ; <i1> [#uses=1]
  %iftmp.270.0.i55.i.i.i.i = zext i1 %501 to i8   ; <i8> [#uses=1]
  %502 = invoke i8* @_Znwj(i32 24)
          to label %.noexc6.i.i.i unwind label %lpad.i.i.i ; <i8*> [#uses=2]

.noexc6.i.i.i:                                    ; preds = %bb13.i.i.i.i
  %503 = getelementptr inbounds i8* %502, i32 16  ; <i8*> [#uses=2]
  %504 = icmp eq i8* %503, null                   ; <i1> [#uses=1]
  br i1 %504, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit58.i.i.i.i, label %bb.i.i.i57.i.i.i.i

bb.i.i.i57.i.i.i.i:                               ; preds = %.noexc6.i.i.i
  %505 = bitcast i8* %503 to double*              ; <double*> [#uses=1]
  %506 = load double* %__first_addr.01.i.i.i.i, align 8 ; <double> [#uses=1]
  store double %506, double* %505, align 8
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit58.i.i.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit58.i.i.i.i: ; preds = %bb.i.i.i57.i.i.i.i, %.noexc6.i.i.i
  %507 = bitcast i8* %502 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.270.0.i55.i.i.i.i, %"struct.std::_Rb_tree_node_base"* %507, %"struct.std::_Rb_tree_node_base"* %472, %"struct.std::_Rb_tree_node_base"* %469)
          to label %.noexc7.i.i.i unwind label %lpad.i.i.i

.noexc7.i.i.i:                                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit58.i.i.i.i
  %508 = load i32* %468, align 4                  ; <i32> [#uses=1]
  %509 = add i32 %508, 1                          ; <i32> [#uses=2]
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i: ; preds = %.noexc7.i.i.i, %.noexc5.i.i.i
  %storemerge = phi i32 [ %500, %.noexc5.i.i.i ], [ %509, %.noexc7.i.i.i ] ; <i32> [#uses=1]
  %.rle58 = phi i32 [ %509, %.noexc7.i.i.i ], [ %500, %.noexc5.i.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge, i32* %468
  %tmp.i.i.i = add i32 %indvar.i.i.i.i, 1         ; <i32> [#uses=2]
  %scevgep.i.i.i7.i = getelementptr double* %19, i32 %tmp.i.i.i ; <double*> [#uses=1]
  %510 = icmp eq double* %scevgep.i.i.i7.i, %21   ; <i1> [#uses=1]
  br i1 %510, label %_ZNSt8multisetIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i, label %bb.i1.i.i.i

invcont1.i.i.i:                                   ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i8.i.i, %lpad.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc8.i unwind label %lpad18.i

.noexc8.i:                                        ; preds = %invcont1.i.i.i
  unreachable

lpad.i.i.i:                                       ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit58.i.i.i.i, %bb13.i.i.i.i, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalERKd.exit76.i.i.i.i, %bb4.i.i74.i.i.i.i
  %eh_ptr.i.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select5.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %511 = load %"struct.std::_Rb_tree_node_base"** %465, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %512 = icmp eq %"struct.std::_Rb_tree_node_base"* %511, null ; <i1> [#uses=1]
  br i1 %512, label %invcont1.i.i.i, label %bb.i.i.i3.i.i

bb.i.i.i3.i.i:                                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i8.i.i, %lpad.i.i.i
  %__x_addr.02.i.in.i.i2.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %523, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i8.i.i ], [ %511, %lpad.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %513 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i2.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %514 = load %"struct.std::_Rb_tree_node_base"** %513, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %515 = icmp eq %"struct.std::_Rb_tree_node_base"* %514, null ; <i1> [#uses=1]
  br i1 %515, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i8.i.i, label %bb.i.i.i.i6.i.i

bb.i.i.i.i6.i.i:                                  ; preds = %bb.i.i.i.i6.i.i, %bb.i.i.i3.i.i
  %__x_addr.0.i1.i.i.i4.i.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %520, %bb.i.i.i.i6.i.i ], [ %514, %bb.i.i.i3.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %516 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i4.i.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %517 = load %"struct.std::_Rb_tree_node_base"** %516, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %518 = bitcast %"struct.std::_Rb_tree_node_base"* %517 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %518) nounwind
  %519 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i4.i.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %520 = load %"struct.std::_Rb_tree_node_base"** %519, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %521 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i4.i.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %521) nounwind
  %phitmp4.i.i.i5.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %520, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i5.i.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i8.i.i, label %bb.i.i.i.i6.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i8.i.i: ; preds = %bb.i.i.i.i6.i.i, %bb.i.i.i3.i.i
  %522 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i2.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %523 = load %"struct.std::_Rb_tree_node_base"** %522, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %524 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i2.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %524) nounwind
  %phitmp.i.i.i7.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %523, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i7.i.i, label %invcont1.i.i.i, label %bb.i.i.i3.i.i

_ZNSt8multisetIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i: ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE15_M_insert_equalESt17_Rb_tree_iteratorIdERKd.exit.i.i.i
  %525 = load %"struct.std::_Rb_tree_node_base"** %466, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %bb11.outer.i.i

invcont4.i.i:                                     ; preds = %bb11.i.i
  %526 = icmp eq %"struct.std::_Rb_tree_node_base"* %540, %469 ; <i1> [#uses=1]
  br i1 %526, label %bb16.split.i.i, label %bb5.i.i

bb5.i.i:                                          ; preds = %invcont4.i.i
  %527 = load double* %539, align 8               ; <double> [#uses=1]
  %528 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %540, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %529 = bitcast %"struct.std::_Rb_tree_node_base"* %528 to double* ; <double*> [#uses=1]
  %530 = load double* %529, align 8               ; <double> [#uses=1]
  %531 = fcmp oeq double %527, %530               ; <i1> [#uses=1]
  br i1 %531, label %bb7.i.i, label %bb9.i.i

bb7.i.i:                                          ; preds = %bb5.i.i
  %532 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt28_Rb_tree_rebalance_for_erasePSt18_Rb_tree_node_baseRS_(%"struct.std::_Rb_tree_node_base"* %540, %"struct.std::_Rb_tree_node_base"* %469)
          to label %_ZNSt8multisetIdSt4lessIdESaIdEE5eraseESt23_Rb_tree_const_iteratorIdE.exit.i.i unwind label %lpad.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]

_ZNSt8multisetIdSt4lessIdESaIdEE5eraseESt23_Rb_tree_const_iteratorIdE.exit.i.i: ; preds = %bb7.i.i
  %533 = bitcast %"struct.std::_Rb_tree_node_base"* %532 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %533) nounwind
  %534 = load i32* %468, align 4                  ; <i32> [#uses=1]
  %535 = add i32 %534, -1                         ; <i32> [#uses=1]
  store i32 %535, i32* %468, align 4
  br label %bb11.i.i

bb9.i.i:                                          ; preds = %bb5.i.i
  %536 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %first2.0.0.ph.i.i)
          to label %bb11.outer.i.i unwind label %lpad.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]

bb11.outer.i.i:                                   ; preds = %bb9.i.i, %_ZNSt8multisetIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i
  %first2.0.0.ph.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %525, %_ZNSt8multisetIdSt4lessIdESaIdEEC1IPdEET_S6_.exit.i.i ], [ %536, %bb9.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %537 = icmp eq %"struct.std::_Rb_tree_node_base"* %first2.0.0.ph.i.i, %469 ; <i1> [#uses=1]
  %538 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %first2.0.0.ph.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %539 = bitcast %"struct.std::_Rb_tree_node_base"* %538 to double* ; <double*> [#uses=1]
  br i1 %537, label %bb16.split.i.i, label %bb11.i.i

bb11.i.i:                                         ; preds = %bb11.outer.i.i, %_ZNSt8multisetIdSt4lessIdESaIdEE5eraseESt23_Rb_tree_const_iteratorIdE.exit.i.i
  %540 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %first2.0.0.ph.i.i)
          to label %invcont4.i.i unwind label %lpad.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]

invcont14.i.i:                                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i.i, %lpad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc9.i unwind label %lpad18.i

.noexc9.i:                                        ; preds = %invcont14.i.i
  unreachable

bb16.split.i.i:                                   ; preds = %bb11.outer.i.i, %invcont4.i.i
  %541 = load %"struct.std::_Rb_tree_node_base"** %465, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %542 = icmp eq %"struct.std::_Rb_tree_node_base"* %541, null ; <i1> [#uses=1]
  br i1 %542, label %_Z13multiset_testPdS_i.exit.i, label %bb.i.i.i2.i.i

bb.i.i.i2.i.i:                                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i.i, %bb16.split.i.i
  %__x_addr.02.i.in.i.i1.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %553, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i.i ], [ %541, %bb16.split.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %543 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %544 = load %"struct.std::_Rb_tree_node_base"** %543, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %545 = icmp eq %"struct.std::_Rb_tree_node_base"* %544, null ; <i1> [#uses=1]
  br i1 %545, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i.i, label %bb.i.i.i.i5.i.i

bb.i.i.i.i5.i.i:                                  ; preds = %bb.i.i.i.i5.i.i, %bb.i.i.i2.i.i
  %__x_addr.0.i1.i.i.i3.i.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %550, %bb.i.i.i.i5.i.i ], [ %544, %bb.i.i.i2.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %546 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.i.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %547 = load %"struct.std::_Rb_tree_node_base"** %546, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %548 = bitcast %"struct.std::_Rb_tree_node_base"* %547 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %548) nounwind
  %549 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.i.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %550 = load %"struct.std::_Rb_tree_node_base"** %549, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %551 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.i.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %551) nounwind
  %phitmp4.i.i.i4.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %550, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i4.i.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i.i, label %bb.i.i.i.i5.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i.i: ; preds = %bb.i.i.i.i5.i.i, %bb.i.i.i2.i.i
  %552 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %553 = load %"struct.std::_Rb_tree_node_base"** %552, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %554 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %554) nounwind
  %phitmp.i.i.i6.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %553, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i6.i.i, label %_Z13multiset_testPdS_i.exit.i, label %bb.i.i.i2.i.i

lpad.i.i:                                         ; preds = %bb11.i.i, %bb9.i.i, %bb7.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select18.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %555 = load %"struct.std::_Rb_tree_node_base"** %465, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %556 = icmp eq %"struct.std::_Rb_tree_node_base"* %555, null ; <i1> [#uses=1]
  br i1 %556, label %invcont14.i.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i.i, %lpad.i.i
  %__x_addr.02.i.in.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %567, %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i.i ], [ %555, %lpad.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %557 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %558 = load %"struct.std::_Rb_tree_node_base"** %557, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %559 = icmp eq %"struct.std::_Rb_tree_node_base"* %558, null ; <i1> [#uses=1]
  br i1 %559, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i.i, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i.i, %bb.i.i.i.i.i
  %__x_addr.0.i1.i.i.i.i.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %564, %bb.i.i.i.i.i.i ], [ %558, %bb.i.i.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %560 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %561 = load %"struct.std::_Rb_tree_node_base"** %560, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %562 = bitcast %"struct.std::_Rb_tree_node_base"* %561 to %"struct.std::_Rb_tree_node<double>"* ; <%"struct.std::_Rb_tree_node<double>"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE(%"struct.std::_Rb_tree_node<double>"* %562) nounwind
  %563 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %564 = load %"struct.std::_Rb_tree_node_base"** %563, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %565 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.i.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %565) nounwind
  %phitmp4.i.i.i.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %564, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i.i.i, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i.i, label %bb.i.i.i.i.i.i

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i.i.i: ; preds = %bb.i.i.i.i.i.i, %bb.i.i.i.i.i
  %566 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %567 = load %"struct.std::_Rb_tree_node_base"** %566, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %568 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %568) nounwind
  %phitmp.i.i.i.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %567, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i.i, label %invcont14.i.i, label %bb.i.i.i.i.i

_Z13multiset_testPdS_i.exit.i:                    ; preds = %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE8_M_eraseEPSt13_Rb_tree_nodeIdE.exit.i.i.i7.i.i, %bb16.split.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=2]
  %exitcond.i.i = icmp eq i32 %indvar.next.i.i, %17 ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %bb15.i, label %bb.i.i

bb15.i:                                           ; preds = %_Z13multiset_testPdS_i.exit.i, %invcont8.i, %invcont7.i, %invcont6.i, %invcont5.i, %invcont4.i, %invcont2.i
  %569 = icmp eq i8* %18, null                    ; <i1> [#uses=1]
  br i1 %569, label %_Z9run_testsi.exit, label %bb.i.i.i1.i

bb.i.i.i1.i:                                      ; preds = %bb15.i
  tail call void @_ZdlPv(i8* %18) nounwind
  ret i32 0

lpad.i:                                           ; preds = %lpad.i.i.i.i
  %eh_ptr.i = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select17.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %Unwind.i

lpad18.i:                                         ; preds = %invcont14.i.i, %invcont1.i.i.i, %invcont1.i.i52.i, %Unwind.i.i, %Unwind.i133.i, %Unwind.i166.i, %Unwind.i207.i, %bb.i55.i
  %eh_ptr19.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=3]
  %eh_select21.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %570 = icmp eq i8* %18, null                    ; <i1> [#uses=1]
  br i1 %570, label %Unwind.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %lpad18.i
  tail call void @_ZdlPv(i8* %18) nounwind
  br label %Unwind.i

Unwind.i:                                         ; preds = %bb.i.i.i.i, %lpad18.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr19.i, %bb.i.i.i.i ], [ %eh_ptr19.i, %lpad18.i ] ; <i8*> [#uses=1]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

_Z9run_testsi.exit:                               ; preds = %bb15.i
  ret i32 0
}

declare %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*)

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_rethrow() noreturn

declare void @__cxa_end_catch()

declare void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*)

define internal fastcc void @_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE16_M_insert_uniqueERKd(%"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* noalias nocapture sret %agg.result, %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %this, double* nocapture %__v) {
entry:
  %0 = getelementptr inbounds %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %this, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %1 = getelementptr inbounds %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %this, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %__x.0.in13 = load %"struct.std::_Rb_tree_node_base"** %0 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %2 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in13, null ; <i1> [#uses=1]
  br i1 %2, label %bb7, label %bb.nph

bb.nph:                                           ; preds = %entry
  %3 = load double* %__v, align 8                 ; <double> [#uses=2]
  br label %bb

bb:                                               ; preds = %bb4.backedge, %bb.nph
  %__x.016.in = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in13, %bb.nph ], [ %__x.0.in, %bb4.backedge ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %__x.0.in14 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in13, %bb.nph ], [ %__x.0.in, %bb4.backedge ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %4 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in14, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %5 = bitcast %"struct.std::_Rb_tree_node_base"* %4 to double* ; <double*> [#uses=1]
  %6 = load double* %5, align 8                   ; <double> [#uses=1]
  %7 = fcmp olt double %3, %6                     ; <i1> [#uses=2]
  br i1 %7, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %8 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in14, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge

bb2:                                              ; preds = %bb
  %9 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in14, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge

bb4.backedge:                                     ; preds = %bb2, %bb1
  %__x.0.in.in.be = phi %"struct.std::_Rb_tree_node_base"** [ %8, %bb1 ], [ %9, %bb2 ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.be ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %10 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in, null ; <i1> [#uses=1]
  br i1 %10, label %bb5, label %bb

bb5:                                              ; preds = %bb4.backedge
  br i1 %7, label %bb7, label %bb11

bb7:                                              ; preds = %bb5, %entry
  %__x.0.in.lcssa.reg2mem.0 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in, %bb5 ], [ %__x.0.in13, %entry ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %__y.0.lcssa.in.reg2mem.0 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.016.in, %bb5 ], [ %1, %entry ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]
  %11 = getelementptr inbounds %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %this, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %12 = load %"struct.std::_Rb_tree_node_base"** %11, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %13 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, %12 ; <i1> [#uses=1]
  br i1 %13, label %bb9, label %bb10

bb9:                                              ; preds = %bb7
  %.not = icmp ne %"struct.std::_Rb_tree_node_base"* %__x.0.in.lcssa.reg2mem.0, null ; <i1> [#uses=1]
  %14 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %__y.0.lcssa.in.reg2mem.0 ; <i1> [#uses=1]
  %or.cond = or i1 %14, %.not                     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb4.i5, label %bb1.i2

bb1.i2:                                           ; preds = %bb9
  %15 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %16 = bitcast %"struct.std::_Rb_tree_node_base"* %15 to double* ; <double*> [#uses=1]
  %17 = load double* %__v, align 8                ; <double> [#uses=1]
  %18 = load double* %16, align 8                 ; <double> [#uses=1]
  %19 = fcmp olt double %17, %18                  ; <i1> [#uses=1]
  br i1 %19, label %bb4.i5, label %bb3.i3

bb3.i3:                                           ; preds = %bb1.i2
  br label %bb4.i5

bb4.i5:                                           ; preds = %bb3.i3, %bb1.i2, %bb9
  %iftmp.270.0.i4 = phi i8 [ 0, %bb3.i3 ], [ 1, %bb9 ], [ 1, %bb1.i2 ] ; <i8> [#uses=1]
  %20 = tail call i8* @_Znwj(i32 24)              ; <i8*> [#uses=2]
  %21 = getelementptr inbounds i8* %20, i32 16    ; <i8*> [#uses=2]
  %22 = icmp eq i8* %21, null                     ; <i1> [#uses=1]
  br i1 %22, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit7, label %bb.i.i.i6

bb.i.i.i6:                                        ; preds = %bb4.i5
  %23 = bitcast i8* %21 to double*                ; <double*> [#uses=1]
  %24 = load double* %__v, align 8                ; <double> [#uses=1]
  store double %24, double* %23, align 8
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit7

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit7: ; preds = %bb.i.i.i6, %bb4.i5
  %25 = bitcast i8* %20 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  tail call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.270.0.i4, %"struct.std::_Rb_tree_node_base"* %25, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, %"struct.std::_Rb_tree_node_base"* %1)
  %26 = getelementptr inbounds %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %this, i32 0, i32 0, i32 2 ; <i32*> [#uses=2]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=1]
  %28 = add i32 %27, 1                            ; <i32> [#uses=1]
  store i32 %28, i32* %26, align 4
  %29 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %25, %"struct.std::_Rb_tree_node_base"** %29, align 4
  %30 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 1, i8* %30, align 4
  ret void

bb10:                                             ; preds = %bb7
  %31 = tail call %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0) ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %.pre = load double* %__v, align 8              ; <double> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb10, %bb5
  %32 = phi double [ %.pre, %bb10 ], [ %3, %bb5 ] ; <double> [#uses=2]
  %__x.0.in.lcssa.reg2mem.1 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in.lcssa.reg2mem.0, %bb10 ], [ %__x.0.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %__y.0.lcssa.in.reg2mem.1 = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.lcssa.in.reg2mem.0, %bb10 ], [ %__x.016.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %__j.0.0 = phi %"struct.std::_Rb_tree_node_base"* [ %31, %bb10 ], [ %__x.016.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %33 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__j.0.0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %34 = bitcast %"struct.std::_Rb_tree_node_base"* %33 to double* ; <double*> [#uses=1]
  %35 = load double* %34, align 8                 ; <double> [#uses=1]
  %36 = fcmp olt double %35, %32                  ; <i1> [#uses=1]
  br i1 %36, label %bb13, label %bb14

bb13:                                             ; preds = %bb11
  %.not21 = icmp ne %"struct.std::_Rb_tree_node_base"* %__x.0.in.lcssa.reg2mem.1, null ; <i1> [#uses=1]
  %37 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %__y.0.lcssa.in.reg2mem.1 ; <i1> [#uses=1]
  %or.cond22 = or i1 %37, %.not21                 ; <i1> [#uses=1]
  br i1 %or.cond22, label %bb4.i, label %bb1.i

bb1.i:                                            ; preds = %bb13
  %38 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %39 = bitcast %"struct.std::_Rb_tree_node_base"* %38 to double* ; <double*> [#uses=1]
  %40 = load double* %39, align 8                 ; <double> [#uses=1]
  %41 = fcmp olt double %32, %40                  ; <i1> [#uses=1]
  br i1 %41, label %bb4.i, label %bb3.i

bb3.i:                                            ; preds = %bb1.i
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %bb1.i, %bb13
  %iftmp.270.0.i = phi i8 [ 0, %bb3.i ], [ 1, %bb13 ], [ 1, %bb1.i ] ; <i8> [#uses=1]
  %42 = tail call i8* @_Znwj(i32 24)              ; <i8*> [#uses=2]
  %43 = getelementptr inbounds i8* %42, i32 16    ; <i8*> [#uses=2]
  %44 = icmp eq i8* %43, null                     ; <i1> [#uses=1]
  br i1 %44, label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb4.i
  %45 = bitcast i8* %43 to double*                ; <double*> [#uses=1]
  %46 = load double* %__v, align 8                ; <double> [#uses=1]
  store double %46, double* %45, align 8
  br label %_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit

_ZNSt8_Rb_treeIddSt9_IdentityIdESt4lessIdESaIdEE9_M_insertEPSt18_Rb_tree_node_baseS7_RKd.exit: ; preds = %bb.i.i.i, %bb4.i
  %47 = bitcast i8* %42 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  tail call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.270.0.i, %"struct.std::_Rb_tree_node_base"* %47, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, %"struct.std::_Rb_tree_node_base"* %1)
  %48 = getelementptr inbounds %"struct.std::_Rb_tree<double,double,std::_Identity<double>,std::less<double>,std::allocator<double> >"* %this, i32 0, i32 0, i32 2 ; <i32*> [#uses=2]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=1]
  %50 = add i32 %49, 1                            ; <i32> [#uses=1]
  store i32 %50, i32* %48, align 4
  %51 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %47, %"struct.std::_Rb_tree_node_base"** %51, align 4
  %52 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 1, i8* %52, align 4
  ret void

bb14:                                             ; preds = %bb11
  %53 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %__j.0.0, %"struct.std::_Rb_tree_node_base"** %53, align 4
  %54 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<double>,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 0, i8* %54, align 4
  ret void
}

declare %"struct.std::_Rb_tree_node_base"* @_ZSt28_Rb_tree_rebalance_for_erasePSt18_Rb_tree_node_baseRS_(%"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*)

declare %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*)

declare void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

declare void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

declare void @_ZNSt15_List_node_base4swapERS_S0_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

declare void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"*)

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define internal fastcc void @_ZSt22__final_insertion_sortIPdEvT_S1_(double* %__first, double* %__last) nounwind {
entry:
  %0 = ptrtoint double* %__last to i32            ; <i32> [#uses=1]
  %1 = ptrtoint double* %__first to i32           ; <i32> [#uses=3]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 135                       ; <i1> [#uses=1]
  br i1 %3, label %bb.nph.i, label %bb1

bb.nph.i:                                         ; preds = %entry
  %4 = bitcast double* %__first to i8*            ; <i8*> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb5.backedge.i, %bb.nph.i
  %5 = phi i32 [ 0, %bb.nph.i ], [ %tmp71, %bb5.backedge.i ] ; <i32> [#uses=5]
  %tmp71 = add i32 %5, 1                          ; <i32> [#uses=4]
  %tmp69 = add i32 %5, -1                         ; <i32> [#uses=1]
  %__i.05.i = getelementptr double* %__first, i32 %tmp71 ; <double*> [#uses=3]
  %6 = load double* %__i.05.i, align 8            ; <double> [#uses=5]
  %7 = load double* %__first, align 8             ; <double> [#uses=1]
  %8 = fcmp ogt double %7, %6                     ; <i1> [#uses=1]
  br i1 %8, label %bb2.i, label %bb3.i

bb2.i:                                            ; preds = %bb1.i
  %tmp76 = add i32 %5, 2                          ; <i32> [#uses=1]
  %9 = ptrtoint double* %__i.05.i to i32          ; <i32> [#uses=1]
  %10 = sub i32 %9, %1                            ; <i32> [#uses=2]
  %11 = ashr i32 %10, 3                           ; <i32> [#uses=1]
  %12 = and i32 %10, -8                           ; <i32> [#uses=1]
  %__i.0.sum.i = sub i32 %tmp76, %11              ; <i32> [#uses=1]
  %scevgep.i = getelementptr double* %__first, i32 %__i.0.sum.i ; <double*> [#uses=1]
  %scevgep15.i = bitcast double* %scevgep.i to i8* ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %scevgep15.i, i8* %4, i32 %12, i32 8) nounwind
  store double %6, double* %__first, align 8
  br label %bb5.backedge.i

bb3.i:                                            ; preds = %bb1.i
  %__first.pn3.i = getelementptr double* %__first, i32 %5 ; <double*> [#uses=1]
  %13 = load double* %__first.pn3.i, align 8      ; <double> [#uses=1]
  %14 = fcmp ogt double %13, %6                   ; <i1> [#uses=1]
  br i1 %14, label %bb.i.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i

bb.i.i:                                           ; preds = %bb.i.i, %bb3.i
  %indvar.i.i = phi i32 [ %indvar.next.i.i, %bb.i.i ], [ 0, %bb3.i ] ; <i32> [#uses=4]
  %tmp70 = sub i32 %tmp69, %indvar.i.i            ; <i32> [#uses=1]
  %__next.0.i.i = getelementptr double* %__first, i32 %tmp70 ; <double*> [#uses=1]
  %tmp72 = sub i32 %tmp71, %indvar.i.i            ; <i32> [#uses=1]
  %__last_addr.02.i.i = getelementptr double* %__first, i32 %tmp72 ; <double*> [#uses=1]
  %tmp73 = sub i32 %5, %indvar.i.i                ; <i32> [#uses=1]
  %__next.04.i.i = getelementptr double* %__first, i32 %tmp73 ; <double*> [#uses=2]
  %15 = load double* %__next.04.i.i, align 8      ; <double> [#uses=1]
  store double %15, double* %__last_addr.02.i.i, align 8
  %16 = load double* %__next.0.i.i, align 8       ; <double> [#uses=1]
  %17 = fcmp ogt double %16, %6                   ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %17, label %bb.i.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i

_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i: ; preds = %bb.i.i, %bb3.i
  %__last_addr.0.lcssa.i.i = phi double* [ %__i.05.i, %bb3.i ], [ %__next.04.i.i, %bb.i.i ] ; <double*> [#uses=1]
  store double %6, double* %__last_addr.0.lcssa.i.i, align 8
  br label %bb5.backedge.i

bb5.backedge.i:                                   ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i, %bb2.i
  %exitcond = icmp eq i32 %tmp71, 15              ; <i1> [#uses=1]
  br i1 %exitcond, label %_ZSt16__insertion_sortIPdEvT_S1_.exit, label %bb1.i

_ZSt16__insertion_sortIPdEvT_S1_.exit:            ; preds = %bb5.backedge.i
  %18 = getelementptr inbounds double* %__first, i32 16 ; <double*> [#uses=1]
  %19 = icmp eq double* %18, %__last              ; <i1> [#uses=1]
  br i1 %19, label %_ZSt26__unguarded_insertion_sortIPdEvT_S1_.exit, label %bb.i

bb.i:                                             ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39, %_ZSt16__insertion_sortIPdEvT_S1_.exit
  %20 = phi i32 [ %tmp9.i29, %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39 ], [ 0, %_ZSt16__insertion_sortIPdEvT_S1_.exit ] ; <i32> [#uses=5]
  %tmp62 = add i32 %20, 16                        ; <i32> [#uses=2]
  %tmp60 = add i32 %20, 14                        ; <i32> [#uses=1]
  %tmp58 = add i32 %20, 15                        ; <i32> [#uses=2]
  %__next.03.i.i = getelementptr double* %__first, i32 %tmp58 ; <double*> [#uses=1]
  %tmp67 = add i32 %20, 17                        ; <i32> [#uses=1]
  %scevgep.i30 = getelementptr double* %__first, i32 %tmp67 ; <double*> [#uses=1]
  %__i.01.i = getelementptr double* %__first, i32 %tmp62 ; <double*> [#uses=2]
  %tmp9.i29 = add i32 %20, 1                      ; <i32> [#uses=1]
  %21 = load double* %__i.01.i, align 8           ; <double> [#uses=3]
  %22 = load double* %__next.03.i.i, align 8      ; <double> [#uses=1]
  %23 = fcmp ogt double %22, %21                  ; <i1> [#uses=1]
  br i1 %23, label %bb.i.i37, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39

bb.i.i37:                                         ; preds = %bb.i.i37, %bb.i
  %indvar.i.i31 = phi i32 [ %indvar.next.i.i36, %bb.i.i37 ], [ 0, %bb.i ] ; <i32> [#uses=4]
  %tmp59 = sub i32 %tmp58, %indvar.i.i31          ; <i32> [#uses=1]
  %__next.04.i.i32 = getelementptr double* %__first, i32 %tmp59 ; <double*> [#uses=2]
  %tmp61 = sub i32 %tmp60, %indvar.i.i31          ; <i32> [#uses=1]
  %__next.0.i.i33 = getelementptr double* %__first, i32 %tmp61 ; <double*> [#uses=1]
  %tmp63 = sub i32 %tmp62, %indvar.i.i31          ; <i32> [#uses=1]
  %__last_addr.02.i.i35 = getelementptr double* %__first, i32 %tmp63 ; <double*> [#uses=1]
  %24 = load double* %__next.04.i.i32, align 8    ; <double> [#uses=1]
  store double %24, double* %__last_addr.02.i.i35, align 8
  %25 = load double* %__next.0.i.i33, align 8     ; <double> [#uses=1]
  %26 = fcmp ogt double %25, %21                  ; <i1> [#uses=1]
  %indvar.next.i.i36 = add i32 %indvar.i.i31, 1   ; <i32> [#uses=1]
  br i1 %26, label %bb.i.i37, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39

_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39: ; preds = %bb.i.i37, %bb.i
  %__last_addr.0.lcssa.i.i38 = phi double* [ %__i.01.i, %bb.i ], [ %__next.04.i.i32, %bb.i.i37 ] ; <double*> [#uses=1]
  store double %21, double* %__last_addr.0.lcssa.i.i38, align 8
  %27 = icmp eq double* %scevgep.i30, %__last     ; <i1> [#uses=1]
  br i1 %27, label %_ZSt26__unguarded_insertion_sortIPdEvT_S1_.exit, label %bb.i

_ZSt26__unguarded_insertion_sortIPdEvT_S1_.exit:  ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39, %_ZSt16__insertion_sortIPdEvT_S1_.exit
  ret void

bb1:                                              ; preds = %entry
  %28 = icmp eq double* %__first, %__last         ; <i1> [#uses=1]
  br i1 %28, label %_ZSt16__insertion_sortIPdEvT_S1_.exit28, label %bb5.preheader.i2

bb5.preheader.i2:                                 ; preds = %bb1
  %__i.04.i1 = getelementptr inbounds double* %__first, i32 1 ; <double*> [#uses=1]
  %29 = icmp eq double* %__i.04.i1, %__last       ; <i1> [#uses=1]
  br i1 %29, label %_ZSt16__insertion_sortIPdEvT_S1_.exit28, label %bb.nph.i3

bb.nph.i3:                                        ; preds = %bb5.preheader.i2
  %30 = bitcast double* %__first to i8*           ; <i8*> [#uses=1]
  br label %bb1.i9

bb1.i9:                                           ; preds = %bb5.backedge.i27, %bb.nph.i3
  %31 = phi i32 [ 0, %bb.nph.i3 ], [ %tmp49, %bb5.backedge.i27 ] ; <i32> [#uses=5]
  %tmp49 = add i32 %31, 1                         ; <i32> [#uses=3]
  %tmp47 = add i32 %31, -1                        ; <i32> [#uses=1]
  %tmp54 = add i32 %31, 2                         ; <i32> [#uses=2]
  %__i.0.i7 = getelementptr double* %__first, i32 %tmp54 ; <double*> [#uses=1]
  %__i.05.i8 = getelementptr double* %__first, i32 %tmp49 ; <double*> [#uses=3]
  %32 = load double* %__i.05.i8, align 8          ; <double> [#uses=5]
  %33 = load double* %__first, align 8            ; <double> [#uses=1]
  %34 = fcmp ogt double %33, %32                  ; <i1> [#uses=1]
  br i1 %34, label %bb2.i13, label %bb3.i15

bb2.i13:                                          ; preds = %bb1.i9
  %35 = ptrtoint double* %__i.05.i8 to i32        ; <i32> [#uses=1]
  %36 = sub i32 %35, %1                           ; <i32> [#uses=2]
  %37 = ashr i32 %36, 3                           ; <i32> [#uses=1]
  %38 = and i32 %36, -8                           ; <i32> [#uses=1]
  %__i.0.sum.i10 = sub i32 %tmp54, %37            ; <i32> [#uses=1]
  %scevgep.i11 = getelementptr double* %__first, i32 %__i.0.sum.i10 ; <double*> [#uses=1]
  %scevgep15.i12 = bitcast double* %scevgep.i11 to i8* ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %scevgep15.i12, i8* %30, i32 %38, i32 8) nounwind
  store double %32, double* %__first, align 8
  br label %bb5.backedge.i27

bb3.i15:                                          ; preds = %bb1.i9
  %__first.pn3.i14 = getelementptr double* %__first, i32 %31 ; <double*> [#uses=1]
  %39 = load double* %__first.pn3.i14, align 8    ; <double> [#uses=1]
  %40 = fcmp ogt double %39, %32                  ; <i1> [#uses=1]
  br i1 %40, label %bb.i.i24, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26

bb.i.i24:                                         ; preds = %bb.i.i24, %bb3.i15
  %indvar.i.i16 = phi i32 [ %indvar.next.i.i23, %bb.i.i24 ], [ 0, %bb3.i15 ] ; <i32> [#uses=4]
  %tmp48 = sub i32 %tmp47, %indvar.i.i16          ; <i32> [#uses=1]
  %__next.0.i.i18 = getelementptr double* %__first, i32 %tmp48 ; <double*> [#uses=1]
  %tmp50 = sub i32 %tmp49, %indvar.i.i16          ; <i32> [#uses=1]
  %__last_addr.02.i.i22 = getelementptr double* %__first, i32 %tmp50 ; <double*> [#uses=1]
  %tmp51 = sub i32 %31, %indvar.i.i16             ; <i32> [#uses=1]
  %__next.04.i.i20 = getelementptr double* %__first, i32 %tmp51 ; <double*> [#uses=2]
  %41 = load double* %__next.04.i.i20, align 8    ; <double> [#uses=1]
  store double %41, double* %__last_addr.02.i.i22, align 8
  %42 = load double* %__next.0.i.i18, align 8     ; <double> [#uses=1]
  %43 = fcmp ogt double %42, %32                  ; <i1> [#uses=1]
  %indvar.next.i.i23 = add i32 %indvar.i.i16, 1   ; <i32> [#uses=1]
  br i1 %43, label %bb.i.i24, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26

_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26: ; preds = %bb.i.i24, %bb3.i15
  %__last_addr.0.lcssa.i.i25 = phi double* [ %__i.05.i8, %bb3.i15 ], [ %__next.04.i.i20, %bb.i.i24 ] ; <double*> [#uses=1]
  store double %32, double* %__last_addr.0.lcssa.i.i25, align 8
  br label %bb5.backedge.i27

bb5.backedge.i27:                                 ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26, %bb2.i13
  %44 = icmp eq double* %__i.0.i7, %__last        ; <i1> [#uses=1]
  br i1 %44, label %_ZSt16__insertion_sortIPdEvT_S1_.exit28, label %bb1.i9

_ZSt16__insertion_sortIPdEvT_S1_.exit28:          ; preds = %bb5.backedge.i27, %bb5.preheader.i2, %bb1
  ret void
}

declare i8* @_Znaj(i32)

declare void @_ZdaPv(i8*) nounwind

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
