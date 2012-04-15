; ModuleID = 'wordfreq.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct..0._16 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._16 }
%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
%"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const char* const, int> > >" = type <{ i8 }>
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >" = type { %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >::_Rb_tree_impl<std::less<const char*>,false>" }
%"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >::_Rb_tree_impl<std::less<const char*>,false>" = type { %"struct.__gnu_cxx::new_allocator<std::_Rb_tree_node<std::pair<const char* const, int> > >", %"struct.std::_Rb_tree_node_base", i32 }
%"struct.std::_Rb_tree_iterator<std::pair<const char* const, int> >" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >" = type { %"struct.std::_Rb_tree_node_base", %"struct.std::pair<const char* const,int>" }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Vector_base<std::pair<const char*, int>,std::allocator<std::pair<const char*, int> > >" = type { %"struct.std::_Vector_base<std::pair<const char*, int>,std::allocator<std::pair<const char*, int> > >::_Vector_impl" }
%"struct.std::_Vector_base<std::pair<const char*, int>,std::allocator<std::pair<const char*, int> > >::_Vector_impl" = type { %"struct.std::pair<const char* const,int>"*, %"struct.std::pair<const char* const,int>"*, %"struct.std::pair<const char* const,int>"* }
%"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >" = type { %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >" }
%"struct.std::pair<const char* const,int>" = type { i8*, i32 }
%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>" = type { %"struct.std::_Rb_tree_iterator<std::pair<const char* const, int> >", i8 }
%"struct.std::vector<std::pair<const char*, int>,std::allocator<std::pair<const char*, int> > >" = type { %"struct.std::_Vector_base<std::pair<const char*, int>,std::allocator<std::pair<const char*, int> > >" }
%struct.word_reader = type { i32, [4097 x i8], i8*, i8*, %struct.FILE* }

@stdin = external global %struct.FILE*            ; <%struct.FILE**> [#uses=1]
@.str = private constant [8 x i8] c"%7d\09%s\0A\00", align 1 ; <[8 x i8]*> [#uses=1]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._16*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._16*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._16*)* @pthread_mutexattr_init ; <i32 (%struct..0._16*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._16*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._16*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._16*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._16*)*> [#uses=0]

define internal fastcc %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x.0.2.val) nounwind readnone {
entry:
  %0 = bitcast %"struct.std::_Rb_tree_node_base"* %__x.0.2.val to %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=1]
  ret %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %0
}

declare i8* @_Znaj(i32)

declare %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*)

declare %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*)

declare i8* @__cxa_begin_catch(i8*) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare void @__cxa_rethrow() noreturn

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare void @_ZdlPv(i8*) nounwind

declare void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*)

define internal fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE16_M_insert_uniqueERKS4_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* noalias nocapture sret %agg.result, %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %this, %"struct.std::pair<const char* const,int>"* nocapture %__v) {
entry:
  %0 = getelementptr inbounds %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %this, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %1 = getelementptr inbounds %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %this, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %__x.0.in13 = load %"struct.std::_Rb_tree_node_base"** %0 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %2 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in13, null ; <i1> [#uses=1]
  br i1 %2, label %bb7, label %bb.nph

bb.nph:                                           ; preds = %entry
  %3 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__v, i32 0, i32 0 ; <i8**> [#uses=1]
  %4 = load i8** %3, align 4                      ; <i8*> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb4.backedge, %bb.nph
  %__x.016.in = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in13, %bb.nph ], [ %__x.0.in, %bb4.backedge ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %__x.0.in14 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in13, %bb.nph ], [ %__x.0.in, %bb4.backedge ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %5 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in14, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %6 = bitcast %"struct.std::_Rb_tree_node_base"* %5 to i8** ; <i8**> [#uses=1]
  %7 = load i8** %6, align 4                      ; <i8*> [#uses=1]
  %8 = icmp ult i8* %4, %7                        ; <i1> [#uses=2]
  br i1 %8, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %9 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in14, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge

bb2:                                              ; preds = %bb
  %10 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in14, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb4.backedge

bb4.backedge:                                     ; preds = %bb2, %bb1
  %__x.0.in.in.be = phi %"struct.std::_Rb_tree_node_base"** [ %9, %bb1 ], [ %10, %bb2 ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.be ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %11 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in, null ; <i1> [#uses=1]
  br i1 %11, label %bb5, label %bb

bb5:                                              ; preds = %bb4.backedge
  br i1 %8, label %bb7, label %bb11

bb7:                                              ; preds = %bb5, %entry
  %__x.0.in.lcssa.reg2mem.0 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in, %bb5 ], [ %__x.0.in13, %entry ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %__y.0.lcssa.in.reg2mem.0 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.016.in, %bb5 ], [ %1, %entry ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=6]
  %12 = getelementptr inbounds %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %this, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %13 = load %"struct.std::_Rb_tree_node_base"** %12, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %14 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, %13 ; <i1> [#uses=1]
  br i1 %14, label %bb9, label %bb10

bb9:                                              ; preds = %bb7
  %.not = icmp ne %"struct.std::_Rb_tree_node_base"* %__x.0.in.lcssa.reg2mem.0, null ; <i1> [#uses=1]
  %15 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %__y.0.lcssa.in.reg2mem.0 ; <i1> [#uses=1]
  %or.cond = or i1 %15, %.not                     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb4.i5, label %bb1.i2

bb1.i2:                                           ; preds = %bb9
  %16 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %17 = bitcast %"struct.std::_Rb_tree_node_base"* %16 to i8** ; <i8**> [#uses=1]
  %18 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__v, i32 0, i32 0 ; <i8**> [#uses=1]
  %19 = load i8** %18, align 4                    ; <i8*> [#uses=1]
  %20 = load i8** %17, align 4                    ; <i8*> [#uses=1]
  %21 = icmp ult i8* %19, %20                     ; <i1> [#uses=1]
  br i1 %21, label %bb4.i5, label %bb3.i3

bb3.i3:                                           ; preds = %bb1.i2
  br label %bb4.i5

bb4.i5:                                           ; preds = %bb3.i3, %bb1.i2, %bb9
  %iftmp.117.0.i4 = phi i8 [ 0, %bb3.i3 ], [ 1, %bb9 ], [ 1, %bb1.i2 ] ; <i8> [#uses=1]
  %22 = tail call i8* @_Znwj(i32 24)              ; <i8*> [#uses=3]
  %23 = getelementptr inbounds i8* %22, i32 16    ; <i8*> [#uses=2]
  %24 = icmp eq i8* %23, null                     ; <i1> [#uses=1]
  br i1 %24, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7, label %bb.i.i.i6

bb.i.i.i6:                                        ; preds = %bb4.i5
  %25 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__v, i32 0, i32 0 ; <i8**> [#uses=1]
  %26 = load i8** %25, align 4                    ; <i8*> [#uses=1]
  %27 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__v, i32 0, i32 1 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=1]
  %29 = bitcast i8* %23 to i8**                   ; <i8**> [#uses=1]
  store i8* %26, i8** %29
  %30 = getelementptr i8* %22, i32 20             ; <i8*> [#uses=1]
  %31 = bitcast i8* %30 to i32*                   ; <i32*> [#uses=1]
  store i32 %28, i32* %31, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7: ; preds = %bb.i.i.i6, %bb4.i5
  %32 = bitcast i8* %22 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  tail call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i4, %"struct.std::_Rb_tree_node_base"* %32, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0, %"struct.std::_Rb_tree_node_base"* %1)
  %33 = getelementptr inbounds %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %this, i32 0, i32 0, i32 2 ; <i32*> [#uses=2]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  %35 = add i32 %34, 1                            ; <i32> [#uses=1]
  store i32 %35, i32* %33, align 4
  %36 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %32, %"struct.std::_Rb_tree_node_base"** %36, align 4
  %37 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 1, i8* %37, align 4
  ret void

bb10:                                             ; preds = %bb7
  %38 = tail call %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.0) ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb10, %bb5
  %__x.0.in.lcssa.reg2mem.1 = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in.lcssa.reg2mem.0, %bb10 ], [ %__x.0.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %__y.0.lcssa.in.reg2mem.1 = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.lcssa.in.reg2mem.0, %bb10 ], [ %__x.016.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %__j.0.0 = phi %"struct.std::_Rb_tree_node_base"* [ %38, %bb10 ], [ %__x.016.in, %bb5 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %39 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__v, i32 0, i32 0 ; <i8**> [#uses=2]
  %40 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__j.0.0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %41 = bitcast %"struct.std::_Rb_tree_node_base"* %40 to i8** ; <i8**> [#uses=1]
  %42 = load i8** %41, align 4                    ; <i8*> [#uses=1]
  %43 = load i8** %39, align 4                    ; <i8*> [#uses=2]
  %44 = icmp ult i8* %42, %43                     ; <i1> [#uses=1]
  br i1 %44, label %bb13, label %bb14

bb13:                                             ; preds = %bb11
  %.not21 = icmp ne %"struct.std::_Rb_tree_node_base"* %__x.0.in.lcssa.reg2mem.1, null ; <i1> [#uses=1]
  %45 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %__y.0.lcssa.in.reg2mem.1 ; <i1> [#uses=1]
  %or.cond22 = or i1 %45, %.not21                 ; <i1> [#uses=1]
  br i1 %or.cond22, label %bb4.i, label %bb1.i

bb1.i:                                            ; preds = %bb13
  %46 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %47 = bitcast %"struct.std::_Rb_tree_node_base"* %46 to i8** ; <i8**> [#uses=1]
  %48 = load i8** %47, align 4                    ; <i8*> [#uses=1]
  %49 = icmp ult i8* %43, %48                     ; <i1> [#uses=1]
  br i1 %49, label %bb4.i, label %bb3.i

bb3.i:                                            ; preds = %bb1.i
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i, %bb1.i, %bb13
  %iftmp.117.0.i = phi i8 [ 0, %bb3.i ], [ 1, %bb13 ], [ 1, %bb1.i ] ; <i8> [#uses=1]
  %50 = tail call i8* @_Znwj(i32 24)              ; <i8*> [#uses=3]
  %51 = getelementptr inbounds i8* %50, i32 16    ; <i8*> [#uses=2]
  %52 = icmp eq i8* %51, null                     ; <i1> [#uses=1]
  br i1 %52, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb4.i
  %53 = load i8** %39, align 4                    ; <i8*> [#uses=1]
  %54 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__v, i32 0, i32 1 ; <i32*> [#uses=1]
  %55 = load i32* %54, align 4                    ; <i32> [#uses=1]
  %56 = bitcast i8* %51 to i8**                   ; <i8**> [#uses=1]
  store i8* %53, i8** %56
  %57 = getelementptr i8* %50, i32 20             ; <i8*> [#uses=1]
  %58 = bitcast i8* %57 to i32*                   ; <i32*> [#uses=1]
  store i32 %55, i32* %58, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit: ; preds = %bb.i.i.i, %bb4.i
  %59 = bitcast i8* %50 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  tail call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i, %"struct.std::_Rb_tree_node_base"* %59, %"struct.std::_Rb_tree_node_base"* %__y.0.lcssa.in.reg2mem.1, %"struct.std::_Rb_tree_node_base"* %1)
  %60 = getelementptr inbounds %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %this, i32 0, i32 0, i32 2 ; <i32*> [#uses=2]
  %61 = load i32* %60, align 4                    ; <i32> [#uses=1]
  %62 = add i32 %61, 1                            ; <i32> [#uses=1]
  store i32 %62, i32* %60, align 4
  %63 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %59, %"struct.std::_Rb_tree_node_base"** %63, align 4
  %64 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 1, i8* %64, align 4
  ret void

bb14:                                             ; preds = %bb11
  %65 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %agg.result, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %__j.0.0, %"struct.std::_Rb_tree_node_base"** %65, align 4
  %66 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %agg.result, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 0, i8* %66, align 4
  ret void
}

define internal fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x) nounwind {
entry:
  %0 = icmp eq %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x, null ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb

bb:                                               ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit, %entry
  %__x_addr.02 = phi %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* [ %24, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit ], [ %__x, %entry ] ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=3]
  %1 = getelementptr inbounds %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x_addr.02, i32 0, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %2 = load %"struct.std::_Rb_tree_node_base"** %1, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %3 = icmp eq %"struct.std::_Rb_tree_node_base"* %2, null ; <i1> [#uses=1]
  br i1 %3, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit, label %bb.i

bb.i:                                             ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit2, %bb
  %__x_addr.0.i1.in = phi %"struct.std::_Rb_tree_node_base"* [ %20, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit2 ], [ %2, %bb ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %4 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %5 = load %"struct.std::_Rb_tree_node_base"** %4, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %6 = icmp eq %"struct.std::_Rb_tree_node_base"* %5, null ; <i1> [#uses=1]
  br i1 %6, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit2, label %bb.i1

bb.i1:                                            ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i, %bb.i
  %__x_addr.02.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %17, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i ], [ %5, %bb.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %7 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %8 = load %"struct.std::_Rb_tree_node_base"** %7, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %9 = bitcast %"struct.std::_Rb_tree_node_base"* %8 to %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=1]
  %10 = icmp eq %"struct.std::_Rb_tree_node_base"* %8, null ; <i1> [#uses=1]
  br i1 %10, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i1
  %__x_addr.0.i1.i = phi %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* [ %14, %bb.i.i ], [ %9, %bb.i1 ] ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=3]
  %11 = getelementptr inbounds %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x_addr.0.i1.i, i32 0, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %12 = load %"struct.std::_Rb_tree_node_base"** %11, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %13 = bitcast %"struct.std::_Rb_tree_node_base"* %12 to %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=1]
  tail call fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %13) nounwind
  %.idx = getelementptr %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x_addr.0.i1.i, i32 0, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %.idx.val = load %"struct.std::_Rb_tree_node_base"** %.idx ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %14 = tail call fastcc %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %.idx.val) nounwind ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=2]
  %15 = bitcast %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x_addr.0.i1.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %15) nounwind
  %phitmp4.i = icmp eq %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %14, null ; <i1> [#uses=1]
  br i1 %phitmp4.i, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i, label %bb.i.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i: ; preds = %bb.i.i, %bb.i1
  %16 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %17 = load %"struct.std::_Rb_tree_node_base"** %16, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %18 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %18) nounwind
  %phitmp.i = icmp eq %"struct.std::_Rb_tree_node_base"* %17, null ; <i1> [#uses=1]
  br i1 %phitmp.i, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit2, label %bb.i1

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit2: ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i, %bb.i
  %19 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %20 = load %"struct.std::_Rb_tree_node_base"** %19, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %21 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.in to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %21) nounwind
  %phitmp4 = icmp eq %"struct.std::_Rb_tree_node_base"* %20, null ; <i1> [#uses=1]
  br i1 %phitmp4, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit, label %bb.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit: ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit2, %bb
  %22 = getelementptr inbounds %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x_addr.02, i32 0, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %23 = load %"struct.std::_Rb_tree_node_base"** %22, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %24 = bitcast %"struct.std::_Rb_tree_node_base"* %23 to %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=1]
  %25 = bitcast %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %__x_addr.02 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %25) nounwind
  %phitmp = icmp eq %"struct.std::_Rb_tree_node_base"* %23, null ; <i1> [#uses=1]
  br i1 %phitmp, label %return, label %bb

return:                                           ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit, %entry
  ret void
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define internal fastcc void @_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_(%"struct.std::pair<const char* const,int>"* nocapture %__first.0, i32 %__holeIndex, i32 %__len, i8* %__value.0, i32 %__value.1) nounwind {
entry:
  %storemerge.in7 = shl i32 %__holeIndex, 1       ; <i32> [#uses=3]
  %storemerge9 = add i32 %storemerge.in7, 2       ; <i32> [#uses=3]
  %0 = icmp slt i32 %storemerge9, %__len          ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb4

bb:                                               ; preds = %_ZStltRKSt4pairIPKciES4_.exit, %entry
  %storemerge10 = phi i32 [ %storemerge, %_ZStltRKSt4pairIPKciES4_.exit ], [ %storemerge9, %entry ] ; <i32> [#uses=3]
  %storemerge.in8 = phi i32 [ %phitmp, %_ZStltRKSt4pairIPKciES4_.exit ], [ %storemerge.in7, %entry ] ; <i32> [#uses=1]
  %__holeIndex_addr.05 = phi i32 [ %.storemerge, %_ZStltRKSt4pairIPKciES4_.exit ], [ %__holeIndex, %entry ] ; <i32> [#uses=2]
  %1 = or i32 %storemerge.in8, 1                  ; <i32> [#uses=3]
  %2 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %storemerge10, i32 1 ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %1, i32 1 ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4                      ; <i32> [#uses=2]
  %6 = icmp eq i32 %3, %5                         ; <i1> [#uses=1]
  br i1 %6, label %bb1.i1, label %_ZStltRKSt4pairIPKciES4_.exit

bb1.i1:                                           ; preds = %bb
  %7 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %1, i32 0 ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=1]
  %9 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %storemerge10, i32 0 ; <i8**> [#uses=1]
  %10 = load i8** %9, align 4                     ; <i8*> [#uses=1]
  %11 = tail call i32 @strcmp(i8* %10, i8* %8) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit

_ZStltRKSt4pairIPKciES4_.exit:                    ; preds = %bb1.i1, %bb
  %.pn.i = phi i32 [ %11, %bb1.i1 ], [ %3, %bb ]  ; <i32> [#uses=1]
  %.pn1.i = phi i32 [ 0, %bb1.i1 ], [ %5, %bb ]   ; <i32> [#uses=1]
  %iftmp.51.0.in.i = icmp sgt i32 %.pn.i, %.pn1.i ; <i1> [#uses=1]
  %.storemerge = select i1 %iftmp.51.0.in.i, i32 %1, i32 %storemerge10 ; <i32> [#uses=5]
  %12 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %.storemerge, i32 0 ; <i8**> [#uses=1]
  %13 = load i8** %12, align 4                    ; <i8*> [#uses=1]
  %14 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %.storemerge, i32 1 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.05, i32 0 ; <i8**> [#uses=1]
  store i8* %13, i8** %16, align 4
  %17 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.05, i32 1 ; <i32*> [#uses=1]
  store i32 %15, i32* %17, align 4
  %phitmp = shl i32 %.storemerge, 1               ; <i32> [#uses=3]
  %storemerge = add i32 %phitmp, 2                ; <i32> [#uses=3]
  %18 = icmp slt i32 %storemerge, %__len          ; <i1> [#uses=1]
  br i1 %18, label %bb, label %bb4

bb4:                                              ; preds = %_ZStltRKSt4pairIPKciES4_.exit, %entry
  %storemerge.lcssa = phi i32 [ %storemerge9, %entry ], [ %storemerge, %_ZStltRKSt4pairIPKciES4_.exit ] ; <i32> [#uses=1]
  %storemerge.in.lcssa = phi i32 [ %storemerge.in7, %entry ], [ %phitmp, %_ZStltRKSt4pairIPKciES4_.exit ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa = phi i32 [ %__holeIndex, %entry ], [ %.storemerge, %_ZStltRKSt4pairIPKciES4_.exit ] ; <i32> [#uses=4]
  %19 = icmp eq i32 %storemerge.lcssa, %__len     ; <i1> [#uses=1]
  br i1 %19, label %bb5, label %bb1.i

bb5:                                              ; preds = %bb4
  %20 = or i32 %storemerge.in.lcssa, 1            ; <i32> [#uses=4]
  %21 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %20, i32 0 ; <i8**> [#uses=1]
  %22 = load i8** %21, align 4                    ; <i8*> [#uses=1]
  %23 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %20, i32 1 ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.0.lcssa, i32 0 ; <i8**> [#uses=1]
  store i8* %22, i8** %25, align 4
  %26 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.0.lcssa, i32 1 ; <i32*> [#uses=1]
  store i32 %24, i32* %26, align 4
  br label %bb1.i

bb.i:                                             ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i
  %27 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %storemerge.i, i32 0 ; <i8**> [#uses=1]
  %28 = load i8** %27, align 4                    ; <i8*> [#uses=1]
  %29 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.0.i, i32 0 ; <i8**> [#uses=1]
  store i8* %28, i8** %29, align 4
  %30 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.0.i, i32 1 ; <i32*> [#uses=1]
  store i32 %33, i32* %30, align 4
  br label %bb1.i

bb1.i:                                            ; preds = %bb.i, %bb5, %bb4
  %__holeIndex_addr.0.i = phi i32 [ %storemerge.i, %bb.i ], [ %20, %bb5 ], [ %__holeIndex_addr.0.lcssa, %bb4 ] ; <i32> [#uses=5]
  %storemerge.in.in.i = phi i32 [ %storemerge.i, %bb.i ], [ %20, %bb5 ], [ %__holeIndex_addr.0.lcssa, %bb4 ] ; <i32> [#uses=1]
  %storemerge.in.i = add i32 %storemerge.in.in.i, -1 ; <i32> [#uses=1]
  %storemerge.i = sdiv i32 %storemerge.in.i, 2    ; <i32> [#uses=5]
  %31 = icmp sgt i32 %__holeIndex_addr.0.i, %__holeIndex ; <i1> [#uses=1]
  br i1 %31, label %bb2.i, label %_ZSt11__push_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_.exit

bb2.i:                                            ; preds = %bb1.i
  %32 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %storemerge.i, i32 1 ; <i32*> [#uses=1]
  %33 = load i32* %32, align 4                    ; <i32> [#uses=3]
  %34 = icmp eq i32 %33, %__value.1               ; <i1> [#uses=1]
  br i1 %34, label %bb1.i.i, label %_ZStltRKSt4pairIPKciES4_.exit.i

bb1.i.i:                                          ; preds = %bb2.i
  %35 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %storemerge.i, i32 0 ; <i8**> [#uses=1]
  %36 = load i8** %35, align 4                    ; <i8*> [#uses=1]
  %37 = tail call i32 @strcmp(i8* %36, i8* %__value.0) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit.i

_ZStltRKSt4pairIPKciES4_.exit.i:                  ; preds = %bb1.i.i, %bb2.i
  %.pn.i.i = phi i32 [ %37, %bb1.i.i ], [ %33, %bb2.i ] ; <i32> [#uses=1]
  %.pn1.i.i = phi i32 [ 0, %bb1.i.i ], [ %__value.1, %bb2.i ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i.i = icmp sgt i32 %.pn.i.i, %.pn1.i.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i.i, label %bb.i, label %_ZSt11__push_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_.exit

_ZSt11__push_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_.exit: ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i, %bb1.i
  %38 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.0.i, i32 0 ; <i8**> [#uses=1]
  store i8* %__value.0, i8** %38, align 4
  %39 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %__holeIndex_addr.0.i, i32 1 ; <i32*> [#uses=1]
  store i32 %__value.1, i32* %39, align 4
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiEvT_SB_T0_(%"struct.std::pair<const char* const,int>"* %__first.0, %"struct.std::pair<const char* const,int>"* %__last.0, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint %"struct.std::pair<const char* const,int>"* %__first.0 to i32 ; <i32> [#uses=2]
  %tmp22 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  %1 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 0, i32 1 ; <i32*> [#uses=2]
  %2 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 0, i32 0 ; <i8**> [#uses=4]
  br label %bb19

bb:                                               ; preds = %bb19
  %3 = icmp eq i32 %indvar, %__depth_limit        ; <i1> [#uses=1]
  br i1 %3, label %bb1, label %bb6

bb1:                                              ; preds = %bb
  %4 = icmp slt i32 %82, 2                        ; <i1> [#uses=1]
  br i1 %4, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit, label %bb.i.i1

bb.i.i1:                                          ; preds = %bb1
  %5 = add i32 %82, -2                            ; <i32> [#uses=1]
  %6 = sdiv i32 %5, 2                             ; <i32> [#uses=6]
  %7 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %6, i32 0 ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=1]
  %9 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %6, i32 1 ; <i32*> [#uses=1]
  %10 = load i32* %9, align 4                     ; <i32> [#uses=1]
  tail call fastcc void @_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_(%"struct.std::pair<const char* const,int>"* %__first.0, i32 %6, i32 %82, i8* %8, i32 %10) nounwind
  %.off.i.i = add i32 %82, -1                     ; <i32> [#uses=1]
  %11 = icmp ult i32 %.off.i.i, 3                 ; <i1> [#uses=1]
  br i1 %11, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit, label %bb.nph.i.i2

bb.nph.i.i2:                                      ; preds = %bb.i.i1
  %tmp4.i.i = add i32 %6, -1                      ; <i32> [#uses=1]
  br label %bb6.i.i

bb6.i.i:                                          ; preds = %bb6.i.i, %bb.nph.i.i2
  %indvar.i.i3 = phi i32 [ 0, %bb.nph.i.i2 ], [ %indvar.next.i.i4, %bb6.i.i ] ; <i32> [#uses=3]
  %tmp5.i.i = sub i32 %tmp4.i.i, %indvar.i.i3     ; <i32> [#uses=2]
  %scevgep6.i.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp5.i.i, i32 0 ; <i8**> [#uses=1]
  %tmp6.i = sub i32 %6, %indvar.i.i3              ; <i32> [#uses=1]
  %scevgep7.i = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp6.i, i32 0 ; <i8**> [#uses=1]
  %scevgep8.i = getelementptr i8** %scevgep7.i, i32 -1 ; <i8**> [#uses=1]
  %scevgep910.i.i = bitcast i8** %scevgep8.i to i32* ; <i32*> [#uses=1]
  %12 = load i8** %scevgep6.i.i, align 4          ; <i8*> [#uses=1]
  %13 = load i32* %scevgep910.i.i, align 4        ; <i32> [#uses=1]
  tail call fastcc void @_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_(%"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp5.i.i, i32 %82, i8* %12, i32 %13) nounwind
  %indvar.next.i.i4 = add i32 %indvar.i.i3, 1     ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i4, %6 ; <i1> [#uses=1]
  br i1 %exitcond.i, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit, label %bb6.i.i

_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit: ; preds = %bb6.i.i, %bb.i.i1, %bb1
  %14 = icmp sgt i32 %82, 1                       ; <i1> [#uses=1]
  br i1 %14, label %bb.i.i, label %_ZSt12partial_sortIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit

bb.i.i:                                           ; preds = %bb.i.i, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit
  %indvar.i.i = phi i32 [ %indvar.next.i.i, %bb.i.i ], [ 0, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit ] ; <i32> [#uses=3]
  %tmp = sub i32 0, %indvar.i.i                   ; <i32> [#uses=1]
  %tmp6 = xor i32 %indvar.i.i, -1                 ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 %tmp6 ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  %scevgep3.i.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 %tmp6, i32 0 ; <i8**> [#uses=2]
  %scevgep = getelementptr %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 %tmp, i32 0 ; <i8**> [#uses=1]
  %scevgep5.i.i = getelementptr i8** %scevgep, i32 -1 ; <i8**> [#uses=2]
  %scevgep56.i.i = bitcast i8** %scevgep5.i.i to i32* ; <i32*> [#uses=1]
  %15 = load i8** %scevgep3.i.i, align 4          ; <i8*> [#uses=1]
  %16 = load i32* %scevgep56.i.i, align 4         ; <i32> [#uses=1]
  %17 = load i8** %2, align 4                     ; <i8*> [#uses=1]
  %18 = load i32* %1, align 4                     ; <i32> [#uses=1]
  store i8* %17, i8** %scevgep3.i.i
  %.c.i.i = inttoptr i32 %18 to i8*               ; <i8*> [#uses=1]
  store i8* %.c.i.i, i8** %scevgep5.i.i
  %19 = ptrtoint %"struct.std::pair<const char* const,int>"* %scevgep.i.i to i32 ; <i32> [#uses=1]
  %20 = sub i32 %19, %0                           ; <i32> [#uses=1]
  %21 = ashr i32 %20, 3                           ; <i32> [#uses=2]
  tail call fastcc void @_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiS5_EvT_T0_SC_T1_(%"struct.std::pair<const char* const,int>"* %__first.0, i32 0, i32 %21, i8* %15, i32 %16) nounwind
  %22 = icmp sgt i32 %21, 1                       ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %22, label %bb.i.i, label %_ZSt12partial_sortIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit

_ZSt12partial_sortIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit: ; preds = %bb.i.i, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_SB_.exit
  ret void

bb6:                                              ; preds = %bb
  %23 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 -1 ; <%"struct.std::pair<const char* const,int>"*> [#uses=2]
  %24 = sdiv i32 %82, 2                           ; <i32> [#uses=5]
  %25 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %24 ; <%"struct.std::pair<const char* const,int>"*> [#uses=2]
  %26 = load i32* %1, align 4                     ; <i32> [#uses=6]
  %27 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %24, i32 1 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=6]
  %29 = icmp eq i32 %26, %28                      ; <i1> [#uses=1]
  br i1 %29, label %bb1.i.i11, label %_ZStltRKSt4pairIPKciES4_.exit.i15

bb1.i.i11:                                        ; preds = %bb6
  %30 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %24, i32 0 ; <i8**> [#uses=1]
  %31 = load i8** %30, align 4                    ; <i8*> [#uses=1]
  %32 = load i8** %2, align 4                     ; <i8*> [#uses=1]
  %33 = tail call i32 @strcmp(i8* %32, i8* %31) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit.i15

_ZStltRKSt4pairIPKciES4_.exit.i15:                ; preds = %bb1.i.i11, %bb6
  %.pn.i.i12 = phi i32 [ %33, %bb1.i.i11 ], [ %26, %bb6 ] ; <i32> [#uses=1]
  %.pn1.i.i13 = phi i32 [ 0, %bb1.i.i11 ], [ %28, %bb6 ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i.i14 = icmp sgt i32 %.pn.i.i12, %.pn1.i.i13 ; <i1> [#uses=1]
  %34 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 -1, i32 1 ; <i32*> [#uses=1]
  %35 = load i32* %34, align 4                    ; <i32> [#uses=8]
  br i1 %iftmp.51.0.in.i.i14, label %bb.i16, label %bb7.i18

bb.i16:                                           ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i15
  %36 = icmp eq i32 %28, %35                      ; <i1> [#uses=1]
  br i1 %36, label %bb1.i20.i, label %_ZStltRKSt4pairIPKciES4_.exit25.i

bb1.i20.i:                                        ; preds = %bb.i16
  %37 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 -1, i32 0 ; <i8**> [#uses=1]
  %38 = load i8** %37, align 4                    ; <i8*> [#uses=1]
  %39 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %24, i32 0 ; <i8**> [#uses=1]
  %40 = load i8** %39, align 4                    ; <i8*> [#uses=1]
  %41 = tail call i32 @strcmp(i8* %40, i8* %38) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit25.i

_ZStltRKSt4pairIPKciES4_.exit25.i:                ; preds = %bb1.i20.i, %bb.i16
  %.pn.i21.i = phi i32 [ %41, %bb1.i20.i ], [ %28, %bb.i16 ] ; <i32> [#uses=1]
  %.pn1.i22.i = phi i32 [ 0, %bb1.i20.i ], [ %35, %bb.i16 ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i23.i = icmp sgt i32 %.pn.i21.i, %.pn1.i22.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i23.i, label %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit, label %bb3.i17

bb3.i17:                                          ; preds = %_ZStltRKSt4pairIPKciES4_.exit25.i
  %42 = icmp eq i32 %26, %35                      ; <i1> [#uses=1]
  br i1 %42, label %bb1.i14.i, label %_ZStltRKSt4pairIPKciES4_.exit19.i

bb1.i14.i:                                        ; preds = %bb3.i17
  %43 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 -1, i32 0 ; <i8**> [#uses=1]
  %44 = load i8** %43, align 4                    ; <i8*> [#uses=1]
  %45 = load i8** %2, align 4                     ; <i8*> [#uses=1]
  %46 = tail call i32 @strcmp(i8* %45, i8* %44) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit19.i

_ZStltRKSt4pairIPKciES4_.exit19.i:                ; preds = %bb1.i14.i, %bb3.i17
  %.pn.i15.i = phi i32 [ %46, %bb1.i14.i ], [ %26, %bb3.i17 ] ; <i32> [#uses=1]
  %.pn1.i16.i = phi i32 [ 0, %bb1.i14.i ], [ %35, %bb3.i17 ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i17.i = icmp sgt i32 %.pn.i15.i, %.pn1.i16.i ; <i1> [#uses=1]
  %retval.i = select i1 %iftmp.51.0.in.i17.i, %"struct.std::pair<const char* const,int>"* %23, %"struct.std::pair<const char* const,int>"* %__first.0 ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  br label %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit

bb7.i18:                                          ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i15
  %47 = icmp eq i32 %26, %35                      ; <i1> [#uses=1]
  br i1 %47, label %bb1.i8.i, label %_ZStltRKSt4pairIPKciES4_.exit13.i

bb1.i8.i:                                         ; preds = %bb7.i18
  %48 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 -1, i32 0 ; <i8**> [#uses=1]
  %49 = load i8** %48, align 4                    ; <i8*> [#uses=1]
  %50 = load i8** %2, align 4                     ; <i8*> [#uses=1]
  %51 = tail call i32 @strcmp(i8* %50, i8* %49) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit13.i

_ZStltRKSt4pairIPKciES4_.exit13.i:                ; preds = %bb1.i8.i, %bb7.i18
  %.pn.i9.i = phi i32 [ %51, %bb1.i8.i ], [ %26, %bb7.i18 ] ; <i32> [#uses=1]
  %.pn1.i10.i = phi i32 [ 0, %bb1.i8.i ], [ %35, %bb7.i18 ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i11.i = icmp sgt i32 %.pn.i9.i, %.pn1.i10.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i11.i, label %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit, label %bb10.i

bb10.i:                                           ; preds = %_ZStltRKSt4pairIPKciES4_.exit13.i
  %52 = icmp eq i32 %28, %35                      ; <i1> [#uses=1]
  br i1 %52, label %bb1.i2.i, label %_ZStltRKSt4pairIPKciES4_.exit7.i

bb1.i2.i:                                         ; preds = %bb10.i
  %53 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 -1, i32 0 ; <i8**> [#uses=1]
  %54 = load i8** %53, align 4                    ; <i8*> [#uses=1]
  %55 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %24, i32 0 ; <i8**> [#uses=1]
  %56 = load i8** %55, align 4                    ; <i8*> [#uses=1]
  %57 = tail call i32 @strcmp(i8* %56, i8* %54) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit7.i

_ZStltRKSt4pairIPKciES4_.exit7.i:                 ; preds = %bb1.i2.i, %bb10.i
  %.pn.i3.i = phi i32 [ %57, %bb1.i2.i ], [ %28, %bb10.i ] ; <i32> [#uses=1]
  %.pn1.i4.i = phi i32 [ 0, %bb1.i2.i ], [ %35, %bb10.i ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i5.i = icmp sgt i32 %.pn.i3.i, %.pn1.i4.i ; <i1> [#uses=1]
  %retval1.i = select i1 %iftmp.51.0.in.i5.i, %"struct.std::pair<const char* const,int>"* %23, %"struct.std::pair<const char* const,int>"* %25 ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  br label %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit

_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit:   ; preds = %_ZStltRKSt4pairIPKciES4_.exit7.i, %_ZStltRKSt4pairIPKciES4_.exit13.i, %_ZStltRKSt4pairIPKciES4_.exit19.i, %_ZStltRKSt4pairIPKciES4_.exit25.i
  %58 = phi %"struct.std::pair<const char* const,int>"* [ %retval1.i, %_ZStltRKSt4pairIPKciES4_.exit7.i ], [ %retval.i, %_ZStltRKSt4pairIPKciES4_.exit19.i ], [ %25, %_ZStltRKSt4pairIPKciES4_.exit25.i ], [ %__first.0, %_ZStltRKSt4pairIPKciES4_.exit13.i ] ; <%"struct.std::pair<const char* const,int>"*> [#uses=2]
  %59 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %58, i32 0, i32 0 ; <i8**> [#uses=1]
  %60 = load i8** %59, align 4                    ; <i8*> [#uses=2]
  %61 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %58, i32 0, i32 1 ; <i32*> [#uses=1]
  %62 = load i32* %61, align 4                    ; <i32> [#uses=4]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb12.i, %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit
  %__last_addr.0.0.ph.i = phi %"struct.std::pair<const char* const,int>"* [ %__last_addr.0.0, %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit ], [ %__last_addr.0.1.i, %bb12.i ] ; <%"struct.std::pair<const char* const,int>"*> [#uses=5]
  %__first_addr.0.0.ph.i = phi %"struct.std::pair<const char* const,int>"* [ %__first.0, %_ZSt8__medianISt4pairIPKciEERKT_S6_S6_S6_.exit ], [ %79, %bb12.i ] ; <%"struct.std::pair<const char* const,int>"*> [#uses=5]
  br label %bb2.i

bb1.i:                                            ; preds = %_ZStltRKSt4pairIPKciES4_.exit6.i
  %indvar.next13.i = add i32 %63, 1               ; <i32> [#uses=1]
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i, %bb2.outer.i
  %63 = phi i32 [ 0, %bb2.outer.i ], [ %indvar.next13.i, %bb1.i ] ; <i32> [#uses=6]
  %scevgep16.i = getelementptr %"struct.std::pair<const char* const,int>"* %__first_addr.0.0.ph.i, i32 %63, i32 1 ; <i32*> [#uses=2]
  %64 = load i32* %scevgep16.i, align 4           ; <i32> [#uses=3]
  %65 = icmp eq i32 %64, %62                      ; <i1> [#uses=1]
  br i1 %65, label %bb1.i1.i, label %_ZStltRKSt4pairIPKciES4_.exit6.i

bb1.i1.i:                                         ; preds = %bb2.i
  %__first_addr.0.015.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first_addr.0.0.ph.i, i32 %63, i32 0 ; <i8**> [#uses=1]
  %66 = load i8** %__first_addr.0.015.i, align 4  ; <i8*> [#uses=1]
  %67 = tail call i32 @strcmp(i8* %66, i8* %60) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit6.i

_ZStltRKSt4pairIPKciES4_.exit6.i:                 ; preds = %bb1.i1.i, %bb2.i
  %.pn.i2.i = phi i32 [ %67, %bb1.i1.i ], [ %64, %bb2.i ] ; <i32> [#uses=1]
  %.pn1.i3.i = phi i32 [ 0, %bb1.i1.i ], [ %62, %bb2.i ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i4.i = icmp sgt i32 %.pn.i2.i, %.pn1.i3.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i4.i, label %bb1.i, label %bb5.i.preheader

bb5.i.preheader:                                  ; preds = %_ZStltRKSt4pairIPKciES4_.exit6.i
  %__first_addr.0.0.i = getelementptr %"struct.std::pair<const char* const,int>"* %__first_addr.0.0.ph.i, i32 %63 ; <%"struct.std::pair<const char* const,int>"*> [#uses=3]
  br label %bb5.i

bb5.i:                                            ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i, %bb5.i.preheader
  %indvar.i = phi i32 [ %indvar.next.i, %_ZStltRKSt4pairIPKciES4_.exit.i ], [ 0, %bb5.i.preheader ] ; <i32> [#uses=3]
  %tmp13 = sub i32 0, %indvar.i                   ; <i32> [#uses=1]
  %tmp9.i = xor i32 %indvar.i, -1                 ; <i32> [#uses=4]
  %scevgep17 = getelementptr %"struct.std::pair<const char* const,int>"* %__last_addr.0.0.ph.i, i32 %tmp13, i32 0 ; <i8**> [#uses=1]
  %scevgep18 = getelementptr i8** %scevgep17, i32 -1 ; <i8**> [#uses=1]
  %scevgep78.i = bitcast i8** %scevgep18 to i32*  ; <i32*> [#uses=1]
  %68 = load i32* %scevgep78.i, align 4           ; <i32> [#uses=2]
  %69 = icmp eq i32 %68, %62                      ; <i1> [#uses=1]
  br i1 %69, label %bb1.i.i, label %_ZStltRKSt4pairIPKciES4_.exit.i

bb1.i.i:                                          ; preds = %bb5.i
  %scevgep1011.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0.ph.i, i32 %tmp9.i, i32 0 ; <i8**> [#uses=1]
  %70 = load i8** %scevgep1011.i, align 4         ; <i8*> [#uses=1]
  %71 = tail call i32 @strcmp(i8* %60, i8* %70) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit.i

_ZStltRKSt4pairIPKciES4_.exit.i:                  ; preds = %bb1.i.i, %bb5.i
  %.pn.i.i = phi i32 [ %71, %bb1.i.i ], [ %62, %bb5.i ] ; <i32> [#uses=1]
  %.pn1.i.i = phi i32 [ 0, %bb1.i.i ], [ %68, %bb5.i ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i.i = icmp sgt i32 %.pn.i.i, %.pn1.i.i ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %iftmp.51.0.in.i.i, label %bb5.i, label %bb7.i

bb7.i:                                            ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i
  %__last_addr.0.1.i = getelementptr %"struct.std::pair<const char* const,int>"* %__last_addr.0.0.ph.i, i32 %tmp9.i ; <%"struct.std::pair<const char* const,int>"*> [#uses=2]
  %72 = icmp ult %"struct.std::pair<const char* const,int>"* %__first_addr.0.0.i, %__last_addr.0.1.i ; <i1> [#uses=1]
  br i1 %72, label %bb12.i, label %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_ET_SB_SB_T0_.exit

bb12.i:                                           ; preds = %bb7.i
  %73 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first_addr.0.0.ph.i, i32 %63, i32 0 ; <i8**> [#uses=2]
  %74 = load i8** %73, align 4                    ; <i8*> [#uses=1]
  %75 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0.ph.i, i32 %tmp9.i, i32 0 ; <i8**> [#uses=2]
  %76 = load i8** %75, align 4                    ; <i8*> [#uses=1]
  %77 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__last_addr.0.0.ph.i, i32 %tmp9.i, i32 1 ; <i32*> [#uses=2]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=1]
  store i8* %76, i8** %73, align 4
  store i32 %78, i32* %scevgep16.i, align 4
  store i8* %74, i8** %75, align 4
  store i32 %64, i32* %77, align 4
  %__first_addr.0.0.sum.i = add i32 %63, 1        ; <i32> [#uses=1]
  %79 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first_addr.0.0.ph.i, i32 %__first_addr.0.0.sum.i ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  br label %bb2.outer.i

_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_ET_SB_SB_T0_.exit: ; preds = %bb7.i
  tail call fastcc void @_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiEvT_SB_T0_(%"struct.std::pair<const char* const,int>"* %__first_addr.0.0.i, %"struct.std::pair<const char* const,int>"* %__last_addr.0.0, i32 %tmp23)
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb19

bb19:                                             ; preds = %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_ET_SB_SB_T0_.exit, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_ET_SB_SB_T0_.exit ] ; <i32> [#uses=3]
  %__last_addr.0.0 = phi %"struct.std::pair<const char* const,int>"* [ %__last.0, %entry ], [ %__first_addr.0.0.i, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_ET_SB_SB_T0_.exit ] ; <%"struct.std::pair<const char* const,int>"*> [#uses=12]
  %tmp23 = sub i32 %tmp22, %indvar                ; <i32> [#uses=1]
  %80 = ptrtoint %"struct.std::pair<const char* const,int>"* %__last_addr.0.0 to i32 ; <i32> [#uses=1]
  %81 = sub i32 %80, %0                           ; <i32> [#uses=1]
  %82 = ashr i32 %81, 3                           ; <i32> [#uses=8]
  %83 = icmp sgt i32 %82, 16                      ; <i1> [#uses=1]
  br i1 %83, label %bb, label %return

return:                                           ; preds = %bb19
  ret void
}

define internal fastcc void @_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_(%"struct.std::pair<const char* const,int>"* %__first.0, %"struct.std::pair<const char* const,int>"* %__last.0) nounwind {
entry:
  %0 = icmp eq %"struct.std::pair<const char* const,int>"* %__first.0, %__last.0 ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb16.preheader

bb16.preheader:                                   ; preds = %entry
  %__i.0.013 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 1 ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  %1 = icmp eq %"struct.std::pair<const char* const,int>"* %__i.0.013, %__last.0 ; <i1> [#uses=1]
  br i1 %1, label %return, label %bb.nph

bb.nph:                                           ; preds = %bb16.preheader
  %2 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 0, i32 1 ; <i32*> [#uses=2]
  %3 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 0, i32 0 ; <i8**> [#uses=2]
  %4 = ptrtoint %"struct.std::pair<const char* const,int>"* %__first.0 to i32 ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb16.backedge, %bb.nph
  %5 = phi i32 [ 0, %bb.nph ], [ %tmp15, %bb16.backedge ] ; <i32> [#uses=4]
  %tmp15 = add i32 %5, 1                          ; <i32> [#uses=6]
  %tmp35 = add i32 %5, 2                          ; <i32> [#uses=1]
  %__i.0.0 = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp35 ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  %__i.0.014 = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp15 ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  %__i.0.01439 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp15, i32 0 ; <i8**> [#uses=1]
  %scevgep38 = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp15, i32 1 ; <i32*> [#uses=1]
  %6 = load i8** %__i.0.01439, align 4            ; <i8*> [#uses=4]
  %7 = load i32* %scevgep38, align 4              ; <i32> [#uses=6]
  %8 = load i32* %2, align 4                      ; <i32> [#uses=2]
  %9 = icmp eq i32 %7, %8                         ; <i1> [#uses=1]
  br i1 %9, label %bb1.i4, label %_ZStltRKSt4pairIPKciES4_.exit

bb1.i4:                                           ; preds = %bb1
  %10 = load i8** %3, align 4                     ; <i8*> [#uses=1]
  %11 = tail call i32 @strcmp(i8* %6, i8* %10) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit

_ZStltRKSt4pairIPKciES4_.exit:                    ; preds = %bb1.i4, %bb1
  %.pn.i = phi i32 [ %11, %bb1.i4 ], [ %7, %bb1 ] ; <i32> [#uses=1]
  %.pn1.i = phi i32 [ 0, %bb1.i4 ], [ %8, %bb1 ]  ; <i32> [#uses=1]
  %iftmp.51.0.in.i = icmp sgt i32 %.pn.i, %.pn1.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i, label %bb3, label %bb1.i

bb3:                                              ; preds = %_ZStltRKSt4pairIPKciES4_.exit
  %12 = ptrtoint %"struct.std::pair<const char* const,int>"* %__i.0.014 to i32 ; <i32> [#uses=1]
  %13 = sub i32 %12, %4                           ; <i32> [#uses=1]
  %14 = ashr i32 %13, 3                           ; <i32> [#uses=2]
  %15 = icmp sgt i32 %14, 0                       ; <i1> [#uses=1]
  br i1 %15, label %bb.i.i.i.i, label %_ZSt13copy_backwardIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEESA_ET0_T_SC_SB_.exit

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %bb3
  %indvar.i.i.i.i = phi i32 [ %indvar.next.i.i.i.i, %bb.i.i.i.i ], [ 0, %bb3 ] ; <i32> [#uses=3]
  %tmp16 = sub i32 %tmp15, %indvar.i.i.i.i        ; <i32> [#uses=2]
  %scevgep = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp16, i32 1 ; <i32*> [#uses=1]
  %tmp18 = sub i32 %5, %indvar.i.i.i.i            ; <i32> [#uses=2]
  %scevgep1011.i.i.i.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp18, i32 0 ; <i8**> [#uses=1]
  %scevgep78.i.i.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp18, i32 1 ; <i32*> [#uses=1]
  %16 = load i8** %scevgep1011.i.i.i.i, align 4   ; <i8*> [#uses=1]
  %17 = load i32* %scevgep78.i.i.i.i, align 4     ; <i32> [#uses=1]
  %18 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp16, i32 0 ; <i8**> [#uses=1]
  store i8* %16, i8** %18
  store i32 %17, i32* %scevgep
  %indvar.next.i.i.i.i = add i32 %indvar.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i.i.i.i, %14 ; <i1> [#uses=1]
  br i1 %exitcond, label %_ZSt13copy_backwardIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEESA_ET0_T_SC_SB_.exit, label %bb.i.i.i.i

_ZSt13copy_backwardIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEESA_ET0_T_SC_SB_.exit: ; preds = %bb.i.i.i.i, %bb3
  store i8* %6, i8** %3, align 4
  store i32 %7, i32* %2, align 4
  br label %bb16.backedge

bb.i:                                             ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i
  %19 = load i8** %scevgep45.i, align 4           ; <i8*> [#uses=1]
  %20 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp26, i32 0 ; <i8**> [#uses=1]
  store i8* %19, i8** %20
  store i32 %21, i32* %scevgep8.i, align 4
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb.i, %_ZStltRKSt4pairIPKciES4_.exit
  %indvar.i = phi i32 [ %indvar.next.i, %bb.i ], [ 0, %_ZStltRKSt4pairIPKciES4_.exit ] ; <i32> [#uses=3]
  %tmp26 = sub i32 %tmp15, %indvar.i              ; <i32> [#uses=3]
  %tmp29 = sub i32 %5, %indvar.i                  ; <i32> [#uses=2]
  %scevgep12.i = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp29, i32 1 ; <i32*> [#uses=1]
  %scevgep45.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp29, i32 0 ; <i8**> [#uses=2]
  %scevgep8.i = getelementptr %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp26, i32 1 ; <i32*> [#uses=2]
  %21 = load i32* %scevgep12.i, align 4           ; <i32> [#uses=3]
  %22 = icmp eq i32 %21, %7                       ; <i1> [#uses=1]
  br i1 %22, label %bb1.i.i, label %_ZStltRKSt4pairIPKciES4_.exit.i

bb1.i.i:                                          ; preds = %bb1.i
  %23 = load i8** %scevgep45.i, align 4           ; <i8*> [#uses=1]
  %24 = tail call i32 @strcmp(i8* %6, i8* %23) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit.i

_ZStltRKSt4pairIPKciES4_.exit.i:                  ; preds = %bb1.i.i, %bb1.i
  %.pn.i.i = phi i32 [ %24, %bb1.i.i ], [ %7, %bb1.i ] ; <i32> [#uses=1]
  %.pn1.i.i = phi i32 [ 0, %bb1.i.i ], [ %21, %bb1.i ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i.i = icmp sgt i32 %.pn.i.i, %.pn1.i.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i.i, label %bb.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit: ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i
  %25 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %__first.0, i32 %tmp26, i32 0 ; <i8**> [#uses=1]
  store i8* %6, i8** %25
  store i32 %7, i32* %scevgep8.i, align 4
  br label %bb16.backedge

bb16.backedge:                                    ; preds = %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit, %_ZSt13copy_backwardIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEESA_ET0_T_SC_SB_.exit
  %26 = icmp eq %"struct.std::pair<const char* const,int>"* %__i.0.0, %__last.0 ; <i1> [#uses=1]
  br i1 %26, label %return, label %bb1

return:                                           ; preds = %bb16.backedge, %bb16.preheader, %entry
  ret void
}

declare i32 @fread(i8* noalias nocapture, i32, i32, %struct.FILE* noalias nocapture) nounwind

declare i32 @isalpha(i32) nounwind readonly

declare i32 @tolower(i32) nounwind readonly

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @_ZdaPv(i8*) nounwind

define i32 @main() {
entry:
  %0 = alloca %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"*> [#uses=2]
  %1 = alloca %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"*> [#uses=2]
  %2 = alloca %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>", align 8 ; <%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"*> [#uses=2]
  %3 = alloca %"struct.std::pair<const char* const,int>", align 8 ; <%"struct.std::pair<const char* const,int>"*> [#uses=5]
  %wr = alloca %struct.word_reader, align 8       ; <%struct.word_reader*> [#uses=7]
  %hist = alloca %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >", align 8 ; <%"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"*> [#uses=8]
  %4 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %4, align 8
  %5 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %6 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=5]
  %7 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 1, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=3]
  %8 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 1, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=3]
  %9 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 2 ; <i32*> [#uses=16]
  store i32 0, i32* %9, align 4
  store i32 0, i32* %5, align 4
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %6, align 4
  %10 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=21]
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %7, align 4
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %8, align 4
  %11 = load %struct.FILE** @stdin, align 4       ; <%struct.FILE*> [#uses=1]
  %12 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 0 ; <i32*> [#uses=3]
  store i32 64, i32* %12, align 8
  %13 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 1, i32 0 ; <i8*> [#uses=7]
  %14 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 2 ; <i8**> [#uses=7]
  store i8* %13, i8** %14, align 8
  %15 = invoke i8* @_Znaj(i32 65)
          to label %_ZN11word_readerC1EP8_IO_FILE.exit unwind label %lpad ; <i8*> [#uses=2]

_ZN11word_readerC1EP8_IO_FILE.exit:               ; preds = %entry
  %16 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 3 ; <i8**> [#uses=6]
  store i8* %15, i8** %16, align 4
  %17 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 4 ; <%struct.FILE**> [#uses=3]
  store %struct.FILE* %11, %struct.FILE** %17, align 8
  %18 = load i8** %14, align 8                    ; <i8*> [#uses=1]
  store i8 0, i8* %15, align 1
  store i8 0, i8* %18, align 1
  %19 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %3, i32 0, i32 0 ; <i8**> [#uses=3]
  %20 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %3, i32 0, i32 1 ; <i32*> [#uses=5]
  %21 = getelementptr inbounds %"struct.std::map<const char*,int,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %hist, i32 0, i32 0 ; <%"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"*> [#uses=3]
  %22 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %2, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %23 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %1, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %24 = getelementptr inbounds %"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* %0, i32 0, i32 0, i32 0 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb7.outer.i

bb5.outer.i.i:                                    ; preds = %invcont9, %bb3.i.i
  %__y.0.ph.in.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %__x.0.in.i.i, %bb3.i.i ], [ %10, %invcont9 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %__x.0.in.in.ph.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %29, %bb3.i.i ], [ %6, %invcont9 ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i

bb.i.i11:                                         ; preds = %bb5.i.i
  %25 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %26 = bitcast %"struct.std::_Rb_tree_node_base"* %25 to i8** ; <i8**> [#uses=1]
  %27 = load i8** %26, align 4                    ; <i8*> [#uses=1]
  %28 = icmp ult i8* %27, %219                    ; <i1> [#uses=1]
  br i1 %28, label %bb4.i.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb.i.i11
  %29 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.outer.i.i

bb4.i.i:                                          ; preds = %bb.i.i11
  %30 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i

bb5.i.i:                                          ; preds = %bb4.i.i, %bb5.outer.i.i
  %__x.0.in.in.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %30, %bb4.i.i ], [ %__x.0.in.in.ph.i.i, %bb5.outer.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in.i.i = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %31 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i, null ; <i1> [#uses=1]
  br i1 %31, label %bb6.i.i, label %bb.i.i11

bb6.i.i:                                          ; preds = %bb5.i.i
  %32 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i, %10 ; <i1> [#uses=1]
  br i1 %32, label %bb4, label %bb8.i.i

bb8.i.i:                                          ; preds = %bb6.i.i
  %33 = getelementptr %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %34 = bitcast %"struct.std::_Rb_tree_node_base"* %33 to i8** ; <i8**> [#uses=1]
  %35 = load i8** %34, align 4                    ; <i8*> [#uses=1]
  %36 = icmp ult i8* %219, %35                    ; <i1> [#uses=1]
  br i1 %36, label %bb4, label %bb7

bb4:                                              ; preds = %bb8.i.i, %bb6.i.i
  %37 = invoke i8* @_Znaj(i32 %tmp.i)
          to label %invcont5 unwind label %lpad   ; <i8*> [#uses=1]

invcont5:                                         ; preds = %bb4
  %38 = call i8* @strcpy(i8* noalias %37, i8* noalias %219) nounwind ; <i8*> [#uses=12]
  br label %bb5.outer.i.i.i

bb5.outer.i.i.i:                                  ; preds = %bb3.i.i.i, %invcont5
  %__y.0.ph.in.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %10, %invcont5 ], [ %__x.0.in.i.i.i, %bb3.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=14]
  %__x.0.in.in.ph.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %6, %invcont5 ], [ %43, %bb3.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i

bb.i.i.i12:                                       ; preds = %bb5.i.i.i
  %39 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %40 = bitcast %"struct.std::_Rb_tree_node_base"* %39 to i8** ; <i8**> [#uses=1]
  %41 = load i8** %40, align 4                    ; <i8*> [#uses=1]
  %42 = icmp ult i8* %41, %38                     ; <i1> [#uses=1]
  br i1 %42, label %bb4.i.i.i, label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb.i.i.i12
  %43 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.outer.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i.i.i12
  %44 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  br label %bb5.i.i.i

bb5.i.i.i:                                        ; preds = %bb4.i.i.i, %bb5.outer.i.i.i
  %__x.0.in.in.i.i.i = phi %"struct.std::_Rb_tree_node_base"** [ %44, %bb4.i.i.i ], [ %__x.0.in.in.ph.i.i.i, %bb5.outer.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %__x.0.in.i.i.i = load %"struct.std::_Rb_tree_node_base"** %__x.0.in.in.i.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %45 = icmp eq %"struct.std::_Rb_tree_node_base"* %__x.0.in.i.i.i, null ; <i1> [#uses=1]
  br i1 %45, label %_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEE11lower_boundERS5_.exit.i, label %bb.i.i.i12

_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEE11lower_boundERS5_.exit.i: ; preds = %bb5.i.i.i
  %46 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, %10 ; <i1> [#uses=1]
  br i1 %46, label %bb6.i, label %bb.i13

bb.i13:                                           ; preds = %_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEE11lower_boundERS5_.exit.i
  %47 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %48 = bitcast %"struct.std::_Rb_tree_node_base"* %47 to i8** ; <i8**> [#uses=1]
  %49 = load i8** %48, align 4                    ; <i8*> [#uses=1]
  %50 = icmp ult i8* %38, %49                     ; <i1> [#uses=1]
  br i1 %50, label %bb6.i, label %invcont6

bb6.i:                                            ; preds = %bb.i13, %_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEE11lower_boundERS5_.exit.i
  store i8* %38, i8** %19, align 8
  store i32 0, i32* %20, align 4
  %51 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %__y.0.ph.in.i.i.i ; <i1> [#uses=1]
  br i1 %51, label %bb.i1, label %bb12.i

bb.i1:                                            ; preds = %bb6.i
  %52 = load i32* %9, align 4                     ; <i32> [#uses=1]
  %53 = icmp eq i32 %52, 0                        ; <i1> [#uses=1]
  br i1 %53, label %bb7.i, label %bb1.i2

bb1.i2:                                           ; preds = %bb.i1
  %54 = load %"struct.std::_Rb_tree_node_base"** %8, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %55 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %54, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %56 = bitcast %"struct.std::_Rb_tree_node_base"* %55 to i8** ; <i8**> [#uses=1]
  %57 = load i8** %56, align 4                    ; <i8*> [#uses=2]
  %58 = icmp ult i8* %57, %38                     ; <i1> [#uses=1]
  br i1 %58, label %bb10.i, label %bb7.i

bb7.i:                                            ; preds = %bb1.i2, %bb.i1
  invoke fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE16_M_insert_uniqueERKS4_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* noalias sret %2, %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %21, %"struct.std::pair<const char* const,int>"* %3)
          to label %.noexc7 unwind label %lpad

.noexc7:                                          ; preds = %bb7.i
  %59 = load %"struct.std::_Rb_tree_node_base"** %22, align 8 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %invcont6

bb10.i:                                           ; preds = %bb1.i2
  %60 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %54 ; <i1> [#uses=1]
  %61 = icmp ult i8* %38, %57                     ; <i1> [#uses=1]
  %or.cond.i = or i1 %60, %61                     ; <i1> [#uses=1]
  %iftmp.117.0.i42.i = zext i1 %or.cond.i to i8   ; <i8> [#uses=1]
  %62 = invoke i8* @_Znwj(i32 24)
          to label %.noexc8 unwind label %lpad    ; <i8*> [#uses=3]

.noexc8:                                          ; preds = %bb10.i
  %63 = getelementptr inbounds i8* %62, i32 16    ; <i8*> [#uses=2]
  %64 = icmp eq i8* %63, null                     ; <i1> [#uses=1]
  br i1 %64, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit45.i, label %bb.i.i.i44.i

bb.i.i.i44.i:                                     ; preds = %.noexc8
  %65 = bitcast i8* %63 to i8**                   ; <i8**> [#uses=1]
  store i8* %38, i8** %65
  %66 = getelementptr i8* %62, i32 20             ; <i8*> [#uses=1]
  %67 = bitcast i8* %66 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %67, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit45.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit45.i: ; preds = %bb.i.i.i44.i, %.noexc8
  %68 = bitcast i8* %62 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i42.i, %"struct.std::_Rb_tree_node_base"* %68, %"struct.std::_Rb_tree_node_base"* %54, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc9 unwind label %lpad

.noexc9:                                          ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit45.i
  %69 = load i32* %9, align 4                     ; <i32> [#uses=1]
  %70 = add i32 %69, 1                            ; <i32> [#uses=1]
  store i32 %70, i32* %9, align 4
  br label %invcont6

bb12.i:                                           ; preds = %bb6.i
  %71 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %72 = bitcast %"struct.std::_Rb_tree_node_base"* %71 to i8** ; <i8**> [#uses=3]
  %73 = load i8** %72, align 4                    ; <i8*> [#uses=2]
  %74 = icmp ult i8* %38, %73                     ; <i1> [#uses=1]
  br i1 %74, label %bb14.i, label %bb24.i

bb14.i:                                           ; preds = %bb12.i
  %75 = load %"struct.std::_Rb_tree_node_base"** %7, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=5]
  %76 = icmp eq %"struct.std::_Rb_tree_node_base"* %75, %__y.0.ph.in.i.i.i ; <i1> [#uses=1]
  br i1 %76, label %bb16.i, label %bb17.i

bb16.i:                                           ; preds = %bb14.i
  %.not.i = icmp ne %"struct.std::_Rb_tree_node_base"* %75, null ; <i1> [#uses=1]
  %77 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %75 ; <i1> [#uses=1]
  %or.cond47.i = or i1 %77, %.not.i               ; <i1> [#uses=1]
  br i1 %or.cond47.i, label %bb4.i35.i, label %bb1.i32.i

bb1.i32.i:                                        ; preds = %bb16.i
  %78 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %75, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %79 = bitcast %"struct.std::_Rb_tree_node_base"* %78 to i8** ; <i8**> [#uses=1]
  %80 = load i8** %79, align 4                    ; <i8*> [#uses=1]
  %81 = icmp ult i8* %38, %80                     ; <i1> [#uses=1]
  br i1 %81, label %bb4.i35.i, label %bb3.i33.i

bb3.i33.i:                                        ; preds = %bb1.i32.i
  br label %bb4.i35.i

bb4.i35.i:                                        ; preds = %bb3.i33.i, %bb1.i32.i, %bb16.i
  %iftmp.117.0.i34.i = phi i8 [ 0, %bb3.i33.i ], [ 1, %bb16.i ], [ 1, %bb1.i32.i ] ; <i8> [#uses=1]
  %82 = invoke i8* @_Znwj(i32 24)
          to label %.noexc10 unwind label %lpad   ; <i8*> [#uses=3]

.noexc10:                                         ; preds = %bb4.i35.i
  %83 = getelementptr inbounds i8* %82, i32 16    ; <i8*> [#uses=2]
  %84 = icmp eq i8* %83, null                     ; <i1> [#uses=1]
  br i1 %84, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit37.i, label %bb.i.i.i36.i

bb.i.i.i36.i:                                     ; preds = %.noexc10
  %85 = bitcast i8* %83 to i8**                   ; <i8**> [#uses=1]
  store i8* %38, i8** %85
  %86 = getelementptr i8* %82, i32 20             ; <i8*> [#uses=1]
  %87 = bitcast i8* %86 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %87, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit37.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit37.i: ; preds = %bb.i.i.i36.i, %.noexc10
  %88 = bitcast i8* %82 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i34.i, %"struct.std::_Rb_tree_node_base"* %88, %"struct.std::_Rb_tree_node_base"* %75, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc11 unwind label %lpad

.noexc11:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit37.i
  %89 = load i32* %9, align 4                     ; <i32> [#uses=1]
  %90 = add i32 %89, 1                            ; <i32> [#uses=1]
  store i32 %90, i32* %9, align 4
  br label %invcont6

bb17.i:                                           ; preds = %bb14.i
  %91 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i)
          to label %.noexc12 unwind label %lpad   ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]

.noexc12:                                         ; preds = %bb17.i
  %92 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %91, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %93 = bitcast %"struct.std::_Rb_tree_node_base"* %92 to i8** ; <i8**> [#uses=1]
  %94 = load i8** %93, align 4                    ; <i8*> [#uses=2]
  %95 = load i8** %19, align 8                    ; <i8*> [#uses=5]
  %96 = icmp ult i8* %94, %95                     ; <i1> [#uses=1]
  br i1 %96, label %bb19.i, label %bb23.i

bb19.i:                                           ; preds = %.noexc12
  %97 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %91, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %98 = load %"struct.std::_Rb_tree_node_base"** %97, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %99 = icmp eq %"struct.std::_Rb_tree_node_base"* %98, null ; <i1> [#uses=1]
  br i1 %99, label %bb21.i, label %bb22.i

bb21.i:                                           ; preds = %bb19.i
  %100 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %91 ; <i1> [#uses=1]
  %101 = icmp ult i8* %95, %94                    ; <i1> [#uses=1]
  %or.cond48.i = or i1 %100, %101                 ; <i1> [#uses=1]
  %iftmp.117.0.i26.i = zext i1 %or.cond48.i to i8 ; <i8> [#uses=1]
  %102 = invoke i8* @_Znwj(i32 24)
          to label %.noexc13 unwind label %lpad   ; <i8*> [#uses=3]

.noexc13:                                         ; preds = %bb21.i
  %103 = getelementptr inbounds i8* %102, i32 16  ; <i8*> [#uses=2]
  %104 = icmp eq i8* %103, null                   ; <i1> [#uses=1]
  br i1 %104, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit29.i, label %bb.i.i.i28.i

bb.i.i.i28.i:                                     ; preds = %.noexc13
  %105 = load i32* %20, align 4                   ; <i32> [#uses=1]
  %106 = bitcast i8* %103 to i8**                 ; <i8**> [#uses=1]
  store i8* %95, i8** %106
  %107 = getelementptr i8* %102, i32 20           ; <i8*> [#uses=1]
  %108 = bitcast i8* %107 to i32*                 ; <i32*> [#uses=1]
  store i32 %105, i32* %108, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit29.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit29.i: ; preds = %bb.i.i.i28.i, %.noexc13
  %109 = bitcast i8* %102 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i26.i, %"struct.std::_Rb_tree_node_base"* %109, %"struct.std::_Rb_tree_node_base"* %91, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc14 unwind label %lpad

.noexc14:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit29.i
  %110 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %111 = add i32 %110, 1                          ; <i32> [#uses=1]
  store i32 %111, i32* %9, align 4
  br label %invcont6

bb22.i:                                           ; preds = %bb19.i
  %112 = icmp eq %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, null ; <i1> [#uses=1]
  br i1 %112, label %bb.i16.i, label %bb4.i20.i

bb.i16.i:                                         ; preds = %bb22.i
  %113 = load i8** %72, align 4                   ; <i8*> [#uses=1]
  %114 = icmp ult i8* %95, %113                   ; <i1> [#uses=1]
  br i1 %114, label %bb4.i20.i, label %bb3.i18.i

bb3.i18.i:                                        ; preds = %bb.i16.i
  br label %bb4.i20.i

bb4.i20.i:                                        ; preds = %bb3.i18.i, %bb.i16.i, %bb22.i
  %iftmp.117.0.i19.i = phi i8 [ 0, %bb3.i18.i ], [ 1, %bb22.i ], [ 1, %bb.i16.i ] ; <i8> [#uses=1]
  %115 = invoke i8* @_Znwj(i32 24)
          to label %.noexc15 unwind label %lpad   ; <i8*> [#uses=3]

.noexc15:                                         ; preds = %bb4.i20.i
  %116 = getelementptr inbounds i8* %115, i32 16  ; <i8*> [#uses=2]
  %117 = icmp eq i8* %116, null                   ; <i1> [#uses=1]
  br i1 %117, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit22.i, label %bb.i.i.i21.i

bb.i.i.i21.i:                                     ; preds = %.noexc15
  %118 = load i32* %20, align 4                   ; <i32> [#uses=1]
  %119 = bitcast i8* %116 to i8**                 ; <i8**> [#uses=1]
  store i8* %95, i8** %119
  %120 = getelementptr i8* %115, i32 20           ; <i8*> [#uses=1]
  %121 = bitcast i8* %120 to i32*                 ; <i32*> [#uses=1]
  store i32 %118, i32* %121, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit22.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit22.i: ; preds = %bb.i.i.i21.i, %.noexc15
  %122 = bitcast i8* %115 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i19.i, %"struct.std::_Rb_tree_node_base"* %122, %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc16 unwind label %lpad

.noexc16:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit22.i
  %123 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %124 = add i32 %123, 1                          ; <i32> [#uses=1]
  store i32 %124, i32* %9, align 4
  br label %invcont6

bb23.i:                                           ; preds = %.noexc12
  invoke fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE16_M_insert_uniqueERKS4_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* noalias sret %1, %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %21, %"struct.std::pair<const char* const,int>"* %3)
          to label %.noexc17 unwind label %lpad

.noexc17:                                         ; preds = %bb23.i
  %125 = load %"struct.std::_Rb_tree_node_base"** %23, align 8 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %invcont6

bb24.i:                                           ; preds = %bb12.i
  %126 = icmp ult i8* %73, %38                    ; <i1> [#uses=1]
  br i1 %126, label %bb26.i, label %invcont6

bb26.i:                                           ; preds = %bb24.i
  %127 = load %"struct.std::_Rb_tree_node_base"** %8, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %128 = icmp eq %"struct.std::_Rb_tree_node_base"* %127, %__y.0.ph.in.i.i.i ; <i1> [#uses=1]
  br i1 %128, label %bb28.i, label %bb29.i

bb28.i:                                           ; preds = %bb26.i
  %129 = icmp eq %"struct.std::_Rb_tree_node_base"* %10, %127 ; <i1> [#uses=1]
  br i1 %129, label %bb4.i12.i, label %bb1.i9.i

bb1.i9.i:                                         ; preds = %bb28.i
  %130 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %127, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %131 = bitcast %"struct.std::_Rb_tree_node_base"* %130 to i8** ; <i8**> [#uses=1]
  %132 = load i8** %131, align 4                  ; <i8*> [#uses=1]
  %133 = icmp ult i8* %38, %132                   ; <i1> [#uses=1]
  br i1 %133, label %bb4.i12.i, label %bb3.i10.i

bb3.i10.i:                                        ; preds = %bb1.i9.i
  br label %bb4.i12.i

bb4.i12.i:                                        ; preds = %bb3.i10.i, %bb1.i9.i, %bb28.i
  %iftmp.117.0.i11.i = phi i8 [ 0, %bb3.i10.i ], [ 1, %bb28.i ], [ 1, %bb1.i9.i ] ; <i8> [#uses=1]
  %134 = invoke i8* @_Znwj(i32 24)
          to label %.noexc18 unwind label %lpad   ; <i8*> [#uses=3]

.noexc18:                                         ; preds = %bb4.i12.i
  %135 = getelementptr inbounds i8* %134, i32 16  ; <i8*> [#uses=2]
  %136 = icmp eq i8* %135, null                   ; <i1> [#uses=1]
  br i1 %136, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit14.i, label %bb.i.i.i13.i

bb.i.i.i13.i:                                     ; preds = %.noexc18
  %137 = bitcast i8* %135 to i8**                 ; <i8**> [#uses=1]
  store i8* %38, i8** %137
  %138 = getelementptr i8* %134, i32 20           ; <i8*> [#uses=1]
  %139 = bitcast i8* %138 to i32*                 ; <i32*> [#uses=1]
  store i32 0, i32* %139, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit14.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit14.i: ; preds = %bb.i.i.i13.i, %.noexc18
  %140 = bitcast i8* %134 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i11.i, %"struct.std::_Rb_tree_node_base"* %140, %"struct.std::_Rb_tree_node_base"* %127, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc19 unwind label %lpad

.noexc19:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit14.i
  %141 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %142 = add i32 %141, 1                          ; <i32> [#uses=1]
  store i32 %142, i32* %9, align 4
  br label %invcont6

bb29.i:                                           ; preds = %bb26.i
  %143 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i)
          to label %.noexc20 unwind label %lpad   ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]

.noexc20:                                         ; preds = %bb29.i
  %144 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %143, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %145 = bitcast %"struct.std::_Rb_tree_node_base"* %144 to i8** ; <i8**> [#uses=1]
  %146 = load i8** %19, align 8                   ; <i8*> [#uses=4]
  %147 = load i8** %145, align 4                  ; <i8*> [#uses=1]
  %148 = icmp ult i8* %146, %147                  ; <i1> [#uses=1]
  br i1 %148, label %bb31.i, label %bb35.i

bb31.i:                                           ; preds = %.noexc20
  %149 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %150 = load %"struct.std::_Rb_tree_node_base"** %149, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %151 = icmp eq %"struct.std::_Rb_tree_node_base"* %150, null ; <i1> [#uses=1]
  br i1 %151, label %bb33.i, label %bb34.i

bb33.i:                                           ; preds = %bb31.i
  %152 = load i8** %72, align 4                   ; <i8*> [#uses=1]
  %153 = icmp ult i8* %146, %152                  ; <i1> [#uses=1]
  %iftmp.117.0.i4.i = zext i1 %153 to i8          ; <i8> [#uses=1]
  %154 = invoke i8* @_Znwj(i32 24)
          to label %.noexc21 unwind label %lpad   ; <i8*> [#uses=3]

.noexc21:                                         ; preds = %bb33.i
  %155 = getelementptr inbounds i8* %154, i32 16  ; <i8*> [#uses=2]
  %156 = icmp eq i8* %155, null                   ; <i1> [#uses=1]
  br i1 %156, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7.i, label %bb.i.i.i6.i

bb.i.i.i6.i:                                      ; preds = %.noexc21
  %157 = load i32* %20, align 4                   ; <i32> [#uses=1]
  %158 = bitcast i8* %155 to i8**                 ; <i8**> [#uses=1]
  store i8* %146, i8** %158
  %159 = getelementptr i8* %154, i32 20           ; <i8*> [#uses=1]
  %160 = bitcast i8* %159 to i32*                 ; <i32*> [#uses=1]
  store i32 %157, i32* %160, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7.i: ; preds = %bb.i.i.i6.i, %.noexc21
  %161 = bitcast i8* %154 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext %iftmp.117.0.i4.i, %"struct.std::_Rb_tree_node_base"* %161, %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i.i, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc22 unwind label %lpad

.noexc22:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7.i
  %162 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %163 = add i32 %162, 1                          ; <i32> [#uses=1]
  store i32 %163, i32* %9, align 4
  br label %invcont6

bb34.i:                                           ; preds = %bb31.i
  %164 = invoke i8* @_Znwj(i32 24)
          to label %.noexc23 unwind label %lpad   ; <i8*> [#uses=3]

.noexc23:                                         ; preds = %bb34.i
  %165 = getelementptr inbounds i8* %164, i32 16  ; <i8*> [#uses=2]
  %166 = icmp eq i8* %165, null                   ; <i1> [#uses=1]
  br i1 %166, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit.i, label %bb.i.i.i.i6

bb.i.i.i.i6:                                      ; preds = %.noexc23
  %167 = load i32* %20, align 4                   ; <i32> [#uses=1]
  %168 = bitcast i8* %165 to i8**                 ; <i8**> [#uses=1]
  store i8* %146, i8** %168
  %169 = getelementptr i8* %164, i32 20           ; <i8*> [#uses=1]
  %170 = bitcast i8* %169 to i32*                 ; <i32*> [#uses=1]
  store i32 %167, i32* %170, align 4
  br label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit.i: ; preds = %bb.i.i.i.i6, %.noexc23
  %171 = bitcast i8* %164 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  invoke void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i8 zeroext 1, %"struct.std::_Rb_tree_node_base"* %171, %"struct.std::_Rb_tree_node_base"* %143, %"struct.std::_Rb_tree_node_base"* %10)
          to label %.noexc24 unwind label %lpad

.noexc24:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit.i
  %172 = load i32* %9, align 4                    ; <i32> [#uses=1]
  %173 = add i32 %172, 1                          ; <i32> [#uses=1]
  store i32 %173, i32* %9, align 4
  br label %invcont6

bb35.i:                                           ; preds = %.noexc20
  invoke fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE16_M_insert_uniqueERKS4_(%"struct.std::pair<std::_Rb_tree_iterator<std::pair<const char* const, int> >,bool>"* noalias sret %0, %"struct.std::_Rb_tree<const char*,std::pair<const char* const, int>,std::_Select1st<std::pair<const char* const, int> >,std::less<const char*>,std::allocator<std::pair<const char* const, int> > >"* %21, %"struct.std::pair<const char* const,int>"* %3)
          to label %.noexc25 unwind label %lpad

.noexc25:                                         ; preds = %bb35.i
  %174 = load %"struct.std::_Rb_tree_node_base"** %24, align 8 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  br label %invcont6

invcont6:                                         ; preds = %.noexc25, %.noexc24, %.noexc22, %.noexc19, %bb24.i, %.noexc17, %.noexc16, %.noexc14, %.noexc11, %.noexc9, %.noexc7, %bb.i13
  %__i.0.0.i = phi %"struct.std::_Rb_tree_node_base"* [ %__y.0.ph.in.i.i.i, %bb.i13 ], [ %59, %.noexc7 ], [ %68, %.noexc9 ], [ %88, %.noexc11 ], [ %109, %.noexc14 ], [ %122, %.noexc16 ], [ %125, %.noexc17 ], [ %140, %.noexc19 ], [ %161, %.noexc22 ], [ %171, %.noexc24 ], [ %174, %.noexc25 ], [ %__y.0.ph.in.i.i.i, %bb24.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %175 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__i.0.0.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* inttoptr (i32 1 to %"struct.std::_Rb_tree_node_base"*), %"struct.std::_Rb_tree_node_base"** %175
  br label %bb7.outer.i

bb7:                                              ; preds = %bb8.i.i
  %176 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__y.0.ph.in.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=2]
  %177 = bitcast %"struct.std::_Rb_tree_node_base"** %176 to i32* ; <i32*> [#uses=1]
  %178 = load i32* %177, align 4                  ; <i32> [#uses=1]
  %179 = add nsw i32 %178, 1                      ; <i32> [#uses=1]
  %.c = inttoptr i32 %179 to %"struct.std::_Rb_tree_node_base"* ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  store %"struct.std::_Rb_tree_node_base"* %.c, %"struct.std::_Rb_tree_node_base"** %176
  br label %bb7.outer.i

bb7.outer.i:                                      ; preds = %bb5.i, %bb1.split.i, %bb7, %invcont6, %_ZN11word_readerC1EP8_IO_FILE.exit
  %180 = phi i32 [ 0, %bb7 ], [ 0, %invcont6 ], [ 0, %_ZN11word_readerC1EP8_IO_FILE.exit ], [ %tmp.i, %bb1.split.i ], [ %tmp.i, %bb5.i ] ; <i32> [#uses=4]
  %tmp.i = add i32 %180, 1                        ; <i32> [#uses=5]
  %181 = icmp sgt i32 %180, 0                     ; <i1> [#uses=2]
  %.pre.i = load i8** %14, align 8                ; <i8*> [#uses=4]
  br i1 %181, label %bb7.outer.split.us.i, label %bb7.i27

bb7.outer.split.us.i:                             ; preds = %bb7.outer.i
  %182 = load i8* %.pre.i, align 1                ; <i8> [#uses=1]
  %183 = icmp eq i8 %182, 0                       ; <i1> [#uses=1]
  br i1 %183, label %bb8.us.i, label %bb.us.i

bb.us.i:                                          ; preds = %bb8.us.i, %bb7.outer.split.us.i
  %184 = phi i8* [ %13, %bb8.us.i ], [ %.pre.i, %bb7.outer.split.us.i ] ; <i8*> [#uses=2]
  %185 = load i8* %184, align 1                   ; <i8> [#uses=2]
  %186 = sext i8 %185 to i32                      ; <i32> [#uses=1]
  %187 = getelementptr inbounds i8* %184, i32 1   ; <i8*> [#uses=1]
  store i8* %187, i8** %14, align 8
  %188 = call i32 @isalpha(i32 %186) nounwind readonly ; <i32> [#uses=1]
  %189 = icmp eq i32 %188, 0                      ; <i1> [#uses=1]
  br i1 %189, label %invcont9, label %bb1.split.i

bb8.us.i:                                         ; preds = %bb7.outer.split.us.i
  %190 = load %struct.FILE** %17, align 8         ; <%struct.FILE*> [#uses=1]
  %191 = call i32 @fread(i8* noalias %13, i32 1, i32 4096, %struct.FILE* noalias %190) nounwind ; <i32> [#uses=2]
  %192 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 1, i32 %191 ; <i8*> [#uses=1]
  store i8 0, i8* %192, align 1
  store i8* %13, i8** %14, align 8
  %193 = icmp sgt i32 %191, 0                     ; <i1> [#uses=1]
  br i1 %193, label %bb.us.i, label %invcont9

bb.i26:                                           ; preds = %bb8.i, %bb7.i27
  %194 = phi i8* [ %13, %bb8.i ], [ %.rle44, %bb7.i27 ] ; <i8*> [#uses=2]
  %195 = load i8* %194, align 1                   ; <i8> [#uses=2]
  %196 = sext i8 %195 to i32                      ; <i32> [#uses=1]
  %197 = getelementptr inbounds i8* %194, i32 1   ; <i8*> [#uses=3]
  store i8* %197, i8** %14, align 8
  %198 = call i32 @isalpha(i32 %196) nounwind readonly ; <i32> [#uses=1]
  %199 = icmp eq i32 %198, 0                      ; <i1> [#uses=1]
  br i1 %199, label %bb7.i27, label %bb1.split.i

bb1.split.i:                                      ; preds = %bb.i26, %bb.us.i
  %.lcssa.us-lcssa.i = phi i8 [ %185, %bb.us.i ], [ %195, %bb.i26 ] ; <i8> [#uses=1]
  %200 = load i8** %16, align 4                   ; <i8*> [#uses=1]
  %201 = sext i8 %.lcssa.us-lcssa.i to i32        ; <i32> [#uses=1]
  %202 = call i32 @tolower(i32 %201) nounwind readonly ; <i32> [#uses=1]
  %203 = trunc i32 %202 to i8                     ; <i8> [#uses=1]
  %scevgep.i = getelementptr i8* %200, i32 %180   ; <i8*> [#uses=1]
  store i8 %203, i8* %scevgep.i, align 1
  %204 = load i32* %12, align 8                   ; <i32> [#uses=2]
  %205 = icmp eq i32 %tmp.i, %204                 ; <i1> [#uses=1]
  br i1 %205, label %bb3.i, label %bb7.outer.i

bb3.i:                                            ; preds = %bb1.split.i
  %206 = shl i32 %204, 1                          ; <i32> [#uses=2]
  store i32 %206, i32* %12, align 8
  %207 = or i32 %206, 1                           ; <i32> [#uses=1]
  %208 = invoke i8* @_Znaj(i32 %207)
          to label %.noexc29 unwind label %lpad   ; <i8*> [#uses=2]

.noexc29:                                         ; preds = %bb3.i
  %209 = load i8** %16, align 4                   ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %208, i8* %209, i32 %tmp.i, i32 1)
  %210 = load i8** %16, align 4                   ; <i8*> [#uses=2]
  %211 = icmp eq i8* %210, null                   ; <i1> [#uses=1]
  br i1 %211, label %bb5.i, label %bb4.i

bb4.i:                                            ; preds = %.noexc29
  call void @_ZdaPv(i8* %210) nounwind
  br label %bb5.i

bb5.i:                                            ; preds = %bb4.i, %.noexc29
  store i8* %208, i8** %16, align 4
  br label %bb7.outer.i

bb7.i27:                                          ; preds = %bb.i26, %bb7.outer.i
  %.rle44 = phi i8* [ %197, %bb.i26 ], [ %.pre.i, %bb7.outer.i ] ; <i8*> [#uses=1]
  %212 = phi i8* [ %197, %bb.i26 ], [ %.pre.i, %bb7.outer.i ] ; <i8*> [#uses=1]
  %213 = load i8* %212, align 1                   ; <i8> [#uses=1]
  %214 = icmp eq i8 %213, 0                       ; <i1> [#uses=1]
  br i1 %214, label %bb8.i, label %bb.i26

bb8.i:                                            ; preds = %bb7.i27
  %215 = load %struct.FILE** %17, align 8         ; <%struct.FILE*> [#uses=1]
  %216 = call i32 @fread(i8* noalias %13, i32 1, i32 4096, %struct.FILE* noalias %215) nounwind ; <i32> [#uses=2]
  %217 = getelementptr inbounds %struct.word_reader* %wr, i32 0, i32 1, i32 %216 ; <i8*> [#uses=1]
  store i8 0, i8* %217, align 1
  store i8* %13, i8** %14, align 8
  %218 = icmp sgt i32 %216, 0                     ; <i1> [#uses=1]
  br i1 %218, label %bb.i26, label %invcont9

invcont9:                                         ; preds = %bb8.i, %bb8.us.i, %bb.us.i
  %219 = load i8** %16, align 4                   ; <i8*> [#uses=4]
  %220 = getelementptr inbounds i8* %219, i32 %180 ; <i8*> [#uses=1]
  store i8 0, i8* %220, align 1
  br i1 %181, label %bb5.outer.i.i, label %invcont13

invcont13:                                        ; preds = %invcont9
  %221 = load %"struct.std::_Rb_tree_node_base"** %7, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %222 = icmp eq %"struct.std::_Rb_tree_node_base"* %221, %10 ; <i1> [#uses=1]
  br i1 %222, label %_ZNSt12_Vector_baseISt4pairIPKciESaIS3_EE11_M_allocateEj.exit.i.i.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %.noexc.i, %invcont13
  %__n.02.i.i.i.i.i = phi i32 [ %tmp.i.i.i.i.i, %.noexc.i ], [ 0, %invcont13 ] ; <i32> [#uses=1]
  %__first_addr.0.01.i.i.i.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %223, %.noexc.i ], [ %221, %invcont13 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %tmp.i.i.i.i.i = add i32 %__n.02.i.i.i.i.i, 1   ; <i32> [#uses=3]
  %223 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__first_addr.0.01.i.i.i.i.i)
          to label %.noexc.i unwind label %lpad.i.thread ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]

.noexc.i:                                         ; preds = %bb.i.i.i.i.i
  %224 = icmp eq %"struct.std::_Rb_tree_node_base"* %223, %10 ; <i1> [#uses=1]
  br i1 %224, label %_ZSt8distanceISt17_Rb_tree_iteratorISt4pairIKPKciEEENSt15iterator_traitsIT_E15difference_typeES8_S8_.exit.i.i.i, label %bb.i.i.i.i.i

_ZSt8distanceISt17_Rb_tree_iteratorISt4pairIKPKciEEENSt15iterator_traitsIT_E15difference_typeES8_S8_.exit.i.i.i: ; preds = %.noexc.i
  %225 = icmp ugt i32 %tmp.i.i.i.i.i, 536870911   ; <i1> [#uses=1]
  br i1 %225, label %bb.i.i1.i.i.i, label %_ZNSt12_Vector_baseISt4pairIPKciESaIS3_EE11_M_allocateEj.exit.i.i.i

bb.i.i1.i.i.i:                                    ; preds = %_ZSt8distanceISt17_Rb_tree_iteratorISt4pairIKPKciEEENSt15iterator_traitsIT_E15difference_typeES8_S8_.exit.i.i.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc2.i unwind label %lpad.i.thread

.noexc2.i:                                        ; preds = %bb.i.i1.i.i.i
  unreachable

_ZNSt12_Vector_baseISt4pairIPKciESaIS3_EE11_M_allocateEj.exit.i.i.i: ; preds = %_ZSt8distanceISt17_Rb_tree_iteratorISt4pairIKPKciEEENSt15iterator_traitsIT_E15difference_typeES8_S8_.exit.i.i.i, %invcont13
  %__n.0.lcssa.i.i.reg2mem.0.i.i.i = phi i32 [ 0, %invcont13 ], [ %tmp.i.i.i.i.i, %_ZSt8distanceISt17_Rb_tree_iteratorISt4pairIKPKciEEENSt15iterator_traitsIT_E15difference_typeES8_S8_.exit.i.i.i ] ; <i32> [#uses=1]
  %226 = shl i32 %__n.0.lcssa.i.i.reg2mem.0.i.i.i, 3 ; <i32> [#uses=1]
  %227 = invoke i8* @_Znwj(i32 %226)
          to label %.noexc3.i unwind label %lpad.i.thread ; <i8*> [#uses=8]

.noexc3.i:                                        ; preds = %_ZNSt12_Vector_baseISt4pairIPKciESaIS3_EE11_M_allocateEj.exit.i.i.i
  %228 = bitcast i8* %227 to %"struct.std::pair<const char* const,int>"* ; <%"struct.std::pair<const char* const,int>"*> [#uses=17]
  br label %bb2.i.i

bb.i.i30:                                         ; preds = %bb2.i.i
  %229 = icmp eq %"struct.std::pair<const char* const,int>"* %__cur.0.i.i, null ; <i1> [#uses=1]
  br i1 %229, label %invcont.i.i, label %bb.i.i1.i

bb.i.i1.i:                                        ; preds = %bb.i.i30
  %230 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__first_addr.0.0.i.i, i32 1 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %231 = bitcast %"struct.std::_Rb_tree_node_base"* %230 to i8** ; <i8**> [#uses=1]
  %232 = load i8** %231, align 4                  ; <i8*> [#uses=1]
  %233 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %228, i32 %indvar.i.i, i32 0 ; <i8**> [#uses=1]
  store i8* %232, i8** %233
  %234 = getelementptr inbounds %"struct.std::_Rb_tree_node_base"* %__first_addr.0.0.i.i, i32 1, i32 1 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %235 = bitcast %"struct.std::_Rb_tree_node_base"** %234 to i32* ; <i32*> [#uses=1]
  %236 = load i32* %235, align 4                  ; <i32> [#uses=1]
  store i32 %236, i32* %scevgep.i.i, align 4
  br label %invcont.i.i

invcont.i.i:                                      ; preds = %bb.i.i1.i, %bb.i.i30
  %237 = invoke %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__first_addr.0.0.i.i)
          to label %invcont1.i.i unwind label %lpad.i.i ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]

invcont1.i.i:                                     ; preds = %invcont.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %invcont1.i.i, %.noexc3.i
  %indvar.i.i = phi i32 [ 0, %.noexc3.i ], [ %indvar.next.i.i, %invcont1.i.i ] ; <i32> [#uses=8]
  %__first_addr.0.0.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %221, %.noexc3.i ], [ %237, %invcont1.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=4]
  %__cur.0.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %228, i32 %indvar.i.i ; <%"struct.std::pair<const char* const,int>"*> [#uses=7]
  %scevgep.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %228, i32 %indvar.i.i, i32 1 ; <i32*> [#uses=1]
  %238 = icmp eq %"struct.std::_Rb_tree_node_base"* %__first_addr.0.0.i.i, %10 ; <i1> [#uses=1]
  br i1 %238, label %invcont20, label %bb.i.i30

invcont5.i.i:                                     ; preds = %bb.i.i.i.i33, %lpad.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %invcont6.i.i unwind label %lpad14.i.i

invcont6.i.i:                                     ; preds = %invcont5.i.i
  unreachable

invcont9.i.i:                                     ; preds = %lpad14.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr15.i.i)
          to label %.noexc5.i unwind label %lpad.i.i.i

.noexc5.i:                                        ; preds = %invcont9.i.i
  unreachable

lpad.i.i:                                         ; preds = %invcont.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select13.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %239 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i.i) nounwind ; <i8*> [#uses=0]
  %240 = icmp eq %"struct.std::pair<const char* const,int>"* %__cur.0.i.i, %228 ; <i1> [#uses=1]
  br i1 %240, label %invcont5.i.i, label %bb.i.i.i.i33

bb.i.i.i.i33:                                     ; preds = %bb.i.i.i.i33, %lpad.i.i
  %indvar.i.i.i.i31 = phi i32 [ %tmp.i.i32, %bb.i.i.i.i33 ], [ 0, %lpad.i.i ] ; <i32> [#uses=1]
  %tmp.i.i32 = add i32 %indvar.i.i.i.i31, 1       ; <i32> [#uses=2]
  %241 = icmp eq i32 %tmp.i.i32, %indvar.i.i      ; <i1> [#uses=1]
  br i1 %241, label %invcont5.i.i, label %bb.i.i.i.i33

lpad14.i.i:                                       ; preds = %invcont5.i.i
  %eh_ptr15.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select17.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont9.i.i unwind label %lpad18.i.i

lpad18.i.i:                                       ; preds = %lpad14.i.i
  %eh_ptr19.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select21.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad.i.i.i:                                       ; preds = %invcont9.i.i
  %eh_ptr.i.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select8.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc4.i unwind label %lpad.i

.noexc4.i:                                        ; preds = %lpad.i.i.i
  unreachable

invcont3.i:                                       ; preds = %bb.i.i.i34, %lpad.i, %lpad.i.thread
  %eh_ptr.i.reg2mem.0 = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr.i, %bb.i.i.i34 ], [ %eh_ptr.i47, %lpad.i.thread ] ; <i8*> [#uses=1]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.reg2mem.0)
          to label %.noexc35 unwind label %lpad46

.noexc35:                                         ; preds = %invcont3.i
  unreachable

lpad.i.thread:                                    ; preds = %_ZNSt12_Vector_baseISt4pairIPKciESaIS3_EE11_M_allocateEj.exit.i.i.i, %bb.i.i1.i.i.i, %bb.i.i.i.i.i
  %eh_ptr.i47 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select7.i49 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i47, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %invcont3.i

lpad.i:                                           ; preds = %lpad.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select7.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %242 = icmp eq i8* %227, null                   ; <i1> [#uses=1]
  br i1 %242, label %invcont3.i, label %bb.i.i.i34

bb.i.i.i34:                                       ; preds = %lpad.i
  call void @_ZdlPv(i8* %227) nounwind
  br label %invcont3.i

invcont20:                                        ; preds = %bb2.i.i
  %243 = icmp eq %"struct.std::pair<const char* const,int>"* %228, %__cur.0.i.i ; <i1> [#uses=2]
  br i1 %243, label %bb28.preheader, label %bb.i

bb.i:                                             ; preds = %invcont20
  %244 = ptrtoint %"struct.std::pair<const char* const,int>"* %__cur.0.i.i to i32 ; <i32> [#uses=1]
  %245 = ptrtoint i8* %227 to i32                 ; <i32> [#uses=1]
  %246 = sub i32 %244, %245                       ; <i32> [#uses=1]
  %247 = ashr i32 %246, 3                         ; <i32> [#uses=3]
  %248 = icmp eq i32 %247, 1                      ; <i1> [#uses=1]
  br i1 %248, label %_ZSt4__lgIiET_S0_.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i
  %__n_addr.02.i.i = phi i32 [ %251, %bb.i.i ], [ %247, %bb.i ] ; <i32> [#uses=1]
  %249 = phi i32 [ %250, %bb.i.i ], [ 0, %bb.i ]  ; <i32> [#uses=2]
  %250 = add i32 %249, 1                          ; <i32> [#uses=1]
  %251 = ashr i32 %__n_addr.02.i.i, 1             ; <i32> [#uses=2]
  %phitmp.i.i = icmp eq i32 %251, 1               ; <i1> [#uses=1]
  br i1 %phitmp.i.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i, label %bb.i.i

_ZSt4__lgIiET_S0_.exit.loopexit.i:                ; preds = %bb.i.i
  %tmp.i.i = shl i32 %249, 1                      ; <i32> [#uses=1]
  %phitmp.i = add i32 %tmp.i.i, 2                 ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i

_ZSt4__lgIiET_S0_.exit.i:                         ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i, %bb.i
  %__k.0.lcssa.i.i = phi i32 [ %phitmp.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i ], [ 0, %bb.i ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEiEvT_SB_T0_(%"struct.std::pair<const char* const,int>"* %228, %"struct.std::pair<const char* const,int>"* %__cur.0.i.i, i32 %__k.0.lcssa.i.i) nounwind
  %252 = icmp sgt i32 %247, 16                    ; <i1> [#uses=1]
  br i1 %252, label %bb.i36, label %bb7.i39

bb.i36:                                           ; preds = %_ZSt4__lgIiET_S0_.exit.i
  %253 = getelementptr inbounds i8* %227, i32 128 ; <i8*> [#uses=1]
  %254 = bitcast i8* %253 to %"struct.std::pair<const char* const,int>"* ; <%"struct.std::pair<const char* const,int>"*> [#uses=1]
  call fastcc void @_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_(%"struct.std::pair<const char* const,int>"* %228, %"struct.std::pair<const char* const,int>"* %254) nounwind
  %255 = icmp eq i32 %indvar.i.i, 16              ; <i1> [#uses=1]
  br i1 %255, label %bb28.preheader, label %bb.i.i37

bb.i.i37:                                         ; preds = %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit.i.i, %bb.i36
  %256 = phi i32 [ %tmp18.i.i, %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit.i.i ], [ 0, %bb.i36 ] ; <i32> [#uses=4]
  %tmp9.i = add i32 %256, 16                      ; <i32> [#uses=3]
  %tmp6.i = add i32 %256, 15                      ; <i32> [#uses=1]
  %tmp17.i = add i32 %256, 17                     ; <i32> [#uses=1]
  %scevgep17.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %228, i32 %tmp9.i, i32 1 ; <i32*> [#uses=1]
  %scevgep1516.i.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %228, i32 %tmp9.i, i32 0 ; <i8**> [#uses=1]
  %257 = load i8** %scevgep1516.i.i, align 4      ; <i8*> [#uses=2]
  %258 = load i32* %scevgep17.i.i, align 4        ; <i32> [#uses=3]
  br label %bb1.i.i.i

bb.i.i.i38:                                       ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i.i.i
  %259 = load i8** %scevgep45.i.i.i, align 4      ; <i8*> [#uses=1]
  %260 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %228, i32 %tmp10.i, i32 0 ; <i8**> [#uses=1]
  store i8* %259, i8** %260
  store i32 %261, i32* %scevgep8.i.i.i, align 4
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=1]
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i38, %bb.i.i37
  %indvar.i.i.i = phi i32 [ 0, %bb.i.i37 ], [ %indvar.next.i.i.i, %bb.i.i.i38 ] ; <i32> [#uses=3]
  %tmp7.i = sub i32 %tmp6.i, %indvar.i.i.i        ; <i32> [#uses=2]
  %scevgep45.i.i.i = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %228, i32 %tmp7.i, i32 0 ; <i8**> [#uses=2]
  %tmp10.i = sub i32 %tmp9.i, %indvar.i.i.i       ; <i32> [#uses=3]
  %scevgep12.i.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %228, i32 %tmp7.i, i32 1 ; <i32*> [#uses=1]
  %scevgep8.i.i.i = getelementptr %"struct.std::pair<const char* const,int>"* %228, i32 %tmp10.i, i32 1 ; <i32*> [#uses=2]
  %261 = load i32* %scevgep12.i.i.i, align 4      ; <i32> [#uses=3]
  %262 = icmp eq i32 %261, %258                   ; <i1> [#uses=1]
  br i1 %262, label %bb1.i.i.i.i, label %_ZStltRKSt4pairIPKciES4_.exit.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb1.i.i.i
  %263 = load i8** %scevgep45.i.i.i, align 4      ; <i8*> [#uses=1]
  %264 = call i32 @strcmp(i8* %257, i8* %263) nounwind readonly ; <i32> [#uses=1]
  br label %_ZStltRKSt4pairIPKciES4_.exit.i.i.i

_ZStltRKSt4pairIPKciES4_.exit.i.i.i:              ; preds = %bb1.i.i.i.i, %bb1.i.i.i
  %.pn.i.i.i.i = phi i32 [ %264, %bb1.i.i.i.i ], [ %258, %bb1.i.i.i ] ; <i32> [#uses=1]
  %.pn1.i.i.i.i = phi i32 [ 0, %bb1.i.i.i.i ], [ %261, %bb1.i.i.i ] ; <i32> [#uses=1]
  %iftmp.51.0.in.i.i.i.i = icmp sgt i32 %.pn.i.i.i.i, %.pn1.i.i.i.i ; <i1> [#uses=1]
  br i1 %iftmp.51.0.in.i.i.i.i, label %bb.i.i.i38, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit.i.i

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit.i.i: ; preds = %_ZStltRKSt4pairIPKciES4_.exit.i.i.i
  %tmp18.i.i = add i32 %256, 1                    ; <i32> [#uses=1]
  %265 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %228, i32 %tmp10.i, i32 0 ; <i8**> [#uses=1]
  store i8* %257, i8** %265
  store i32 %258, i32* %scevgep8.i.i.i, align 4
  %266 = icmp eq i32 %tmp17.i, %indvar.i.i        ; <i1> [#uses=1]
  br i1 %266, label %bb28.preheader, label %bb.i.i37

bb7.i39:                                          ; preds = %_ZSt4__lgIiET_S0_.exit.i
  call fastcc void @_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEEEvT_SB_(%"struct.std::pair<const char* const,int>"* %228, %"struct.std::pair<const char* const,int>"* %__cur.0.i.i) nounwind
  br label %bb28.preheader

bb28.preheader:                                   ; preds = %bb7.i39, %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPSt4pairIPKciESt6vectorIS5_SaIS5_EEEES5_EvT_T0_.exit.i.i, %bb.i36, %invcont20
  %267 = ptrtoint %"struct.std::pair<const char* const,int>"* %__cur.0.i.i to i32 ; <i32> [#uses=1]
  %268 = ptrtoint i8* %227 to i32                 ; <i32> [#uses=1]
  %269 = sub i32 %267, %268                       ; <i32> [#uses=2]
  %270 = icmp ult i32 %269, 8                     ; <i1> [#uses=1]
  br i1 %270, label %bb30, label %invcont27.preheader

invcont27.preheader:                              ; preds = %bb28.preheader
  %271 = ashr i32 %269, 3                         ; <i32> [#uses=1]
  br label %invcont27

invcont27:                                        ; preds = %invcont27, %invcont27.preheader
  %i.018 = phi i32 [ %275, %invcont27 ], [ 0, %invcont27.preheader ] ; <i32> [#uses=3]
  %scevgep2122 = getelementptr inbounds %"struct.std::pair<const char* const,int>"* %228, i32 %i.018, i32 0 ; <i8**> [#uses=1]
  %272 = load i8** %scevgep2122, align 4          ; <i8*> [#uses=1]
  %scevgep = getelementptr %"struct.std::pair<const char* const,int>"* %228, i32 %i.018, i32 1 ; <i32*> [#uses=1]
  %273 = load i32* %scevgep, align 4              ; <i32> [#uses=1]
  %274 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %273, i8* %272) ; <i32> [#uses=0]
  %275 = add i32 %i.018, 1                        ; <i32> [#uses=2]
  %276 = icmp ugt i32 %271, %275                  ; <i1> [#uses=1]
  br i1 %276, label %invcont27, label %bb30

bb30:                                             ; preds = %invcont27, %bb28.preheader
  br i1 %243, label %bb1.i, label %bb.i.i.i.i9

bb.i.i.i.i9:                                      ; preds = %bb.i.i.i.i9, %bb30
  %indvar.i.i.i.i = phi i32 [ %tmp, %bb.i.i.i.i9 ], [ 0, %bb30 ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar.i.i.i.i, 1               ; <i32> [#uses=2]
  %277 = icmp eq i32 %tmp, %indvar.i.i            ; <i1> [#uses=1]
  br i1 %277, label %bb1.i, label %bb.i.i.i.i9

bb1.i:                                            ; preds = %bb.i.i.i.i9, %bb30
  %278 = icmp eq i8* %227, null                   ; <i1> [#uses=1]
  br i1 %278, label %bb42, label %bb.i.i.i10

bb.i.i.i10:                                       ; preds = %bb1.i
  call void @_ZdlPv(i8* %227) nounwind
  br label %bb42

invcont40:                                        ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

bb42:                                             ; preds = %bb.i.i.i10, %bb1.i
  %279 = load %"struct.std::_Rb_tree_node_base"** %6, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %280 = icmp eq %"struct.std::_Rb_tree_node_base"* %279, null ; <i1> [#uses=1]
  br i1 %280, label %_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEED1Ev.exit8, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i7, %bb42
  %__x_addr.02.i.in.i.i1 = phi %"struct.std::_Rb_tree_node_base"* [ %291, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i7 ], [ %279, %bb42 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %281 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %282 = load %"struct.std::_Rb_tree_node_base"** %281, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %283 = icmp eq %"struct.std::_Rb_tree_node_base"* %282, null ; <i1> [#uses=1]
  br i1 %283, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i7, label %bb.i.i.i.i5

bb.i.i.i.i5:                                      ; preds = %bb.i.i.i.i5, %bb.i.i.i2
  %__x_addr.0.i1.i.i.i3.in = phi %"struct.std::_Rb_tree_node_base"* [ %288, %bb.i.i.i.i5 ], [ %282, %bb.i.i.i2 ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %284 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %285 = load %"struct.std::_Rb_tree_node_base"** %284, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %286 = bitcast %"struct.std::_Rb_tree_node_base"* %285 to %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %286) nounwind
  %287 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %288 = load %"struct.std::_Rb_tree_node_base"** %287, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %289 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i3.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %289) nounwind
  %phitmp4.i.i.i4 = icmp eq %"struct.std::_Rb_tree_node_base"* %288, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i4, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i7, label %bb.i.i.i.i5

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i7: ; preds = %bb.i.i.i.i5, %bb.i.i.i2
  %290 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %291 = load %"struct.std::_Rb_tree_node_base"** %290, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %292 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i1 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %292) nounwind
  %phitmp.i.i.i6 = icmp eq %"struct.std::_Rb_tree_node_base"* %291, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i6, label %_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEED1Ev.exit8, label %bb.i.i.i2

_ZNSt3mapIPKciSt4lessIS1_ESaISt4pairIKS1_iEEED1Ev.exit8: ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i7, %bb42
  ret i32 0

lpad:                                             ; preds = %bb3.i, %bb35.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit.i, %bb34.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit7.i, %bb33.i, %bb29.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit14.i, %bb4.i12.i, %bb23.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit22.i, %bb4.i20.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit29.i, %bb21.i, %bb17.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit37.i, %bb4.i35.i, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE9_M_insertEPSt18_Rb_tree_node_baseSC_RKS4_.exit45.i, %bb10.i, %bb7.i, %bb4, %entry
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select45 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad46:                                           ; preds = %invcont3.i
  %eh_ptr47 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select49 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr47, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

ppad:                                             ; preds = %lpad46, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr47, %lpad46 ] ; <i8*> [#uses=1]
  %293 = load %"struct.std::_Rb_tree_node_base"** %6, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %294 = icmp eq %"struct.std::_Rb_tree_node_base"* %293, null ; <i1> [#uses=1]
  br i1 %294, label %invcont40, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i, %ppad
  %__x_addr.02.i.in.i.i = phi %"struct.std::_Rb_tree_node_base"* [ %305, %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i ], [ %293, %ppad ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %295 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %296 = load %"struct.std::_Rb_tree_node_base"** %295, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %297 = icmp eq %"struct.std::_Rb_tree_node_base"* %296, null ; <i1> [#uses=1]
  br i1 %297, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %bb.i.i.i
  %__x_addr.0.i1.i.i.i.in = phi %"struct.std::_Rb_tree_node_base"* [ %302, %bb.i.i.i.i ], [ %296, %bb.i.i.i ] ; <%"struct.std::_Rb_tree_node_base"*> [#uses=3]
  %298 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.in, i32 0, i32 3 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %299 = load %"struct.std::_Rb_tree_node_base"** %298, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=1]
  %300 = bitcast %"struct.std::_Rb_tree_node_base"* %299 to %"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* ; <%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"*> [#uses=1]
  call fastcc void @_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node<std::pair<const char* const, int> >"* %300) nounwind
  %301 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.in, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %302 = load %"struct.std::_Rb_tree_node_base"** %301, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %303 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.0.i1.i.i.i.in to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %303) nounwind
  %phitmp4.i.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %302, null ; <i1> [#uses=1]
  br i1 %phitmp4.i.i.i, label %_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i, label %bb.i.i.i.i

_ZNSt8_Rb_treeIPKcSt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E.exit.i.i.i: ; preds = %bb.i.i.i.i, %bb.i.i.i
  %304 = getelementptr %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i, i32 0, i32 2 ; <%"struct.std::_Rb_tree_node_base"**> [#uses=1]
  %305 = load %"struct.std::_Rb_tree_node_base"** %304, align 4 ; <%"struct.std::_Rb_tree_node_base"*> [#uses=2]
  %306 = bitcast %"struct.std::_Rb_tree_node_base"* %__x_addr.02.i.in.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %306) nounwind
  %phitmp.i.i.i = icmp eq %"struct.std::_Rb_tree_node_base"* %305, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i, label %invcont40, label %bb.i.i.i
}

declare i8* @strcpy(i8* noalias, i8* noalias nocapture) nounwind

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare extern_weak i32 @pthread_once(i32*, void ()*)

declare extern_weak i8* @pthread_getspecific(i32)

declare extern_weak i32 @pthread_setspecific(i32, i8*)

declare extern_weak i32 @pthread_create(i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)

declare extern_weak i32 @pthread_cancel(i32)

declare extern_weak i32 @pthread_mutex_lock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_trylock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._16*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._16*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._16*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._16*)
