; ModuleID = 'ary2.llvm.bc'
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
  %4 = tail call i32 @atoi(i8* %3) nounwind readonly ; <i32> [#uses=1]
  %5 = mul i32 %4, 10                             ; <i32> [#uses=2]
  %6 = icmp ugt i32 %5, 1073741823                ; <i1> [#uses=1]
  br i1 %6, label %bb.i.i.i.i.i10, label %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12

bb.i.i.i.i.i10:                                   ; preds = %bb3
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i11 unwind label %lpad.i.i.i15

.noexc.i.i.i11:                                   ; preds = %bb.i.i.i.i.i10
  unreachable

_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12: ; preds = %bb3, %entry
  %iftmp.98.0.reg2mem.0 = phi i32 [ %5, %bb3 ], [ 9000000, %entry ] ; <i32> [#uses=8]
  %7 = shl i32 %iftmp.98.0.reg2mem.0, 2           ; <i32> [#uses=12]
  %8 = invoke i8* @_Znwj(i32 %7)
          to label %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16 unwind label %lpad.i.i.i15 ; <i8*> [#uses=25]

lpad.i.i.i15:                                     ; preds = %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12, %bb.i.i.i.i.i10
  %eh_ptr.i.i.i13 = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i14 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i13, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i13)
          to label %.noexc26 unwind label %lpad

.noexc26:                                         ; preds = %lpad.i.i.i15
  unreachable

_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16:  ; preds = %_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv.exit.i.i.i.i12
  %9 = icmp eq i32 %iftmp.98.0.reg2mem.0, 0       ; <i1> [#uses=2]
  br i1 %9, label %bb5, label %bb.i.i.i.i.i.i.i23

bb.i.i.i.i.i.i.i23:                               ; preds = %bb.i.i.i.i.i.i.i23, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16
  %indvar.i.i.i.i.i.i.i17 = phi i32 [ %indvar.next.i.i.i.i.i.i.i21, %bb.i.i.i.i.i.i.i23 ], [ 0, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16 ] ; <i32> [#uses=2]
  %tmp = shl i32 %indvar.i.i.i.i.i.i.i17, 2       ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %8, i32 %tmp       ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i20 = bitcast i8* %scevgep to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %__first_addr.02.i.i.i.i.i.i.i20, align 4
  %indvar.next.i.i.i.i.i.i.i21 = add i32 %indvar.i.i.i.i.i.i.i17, 1 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i.i.i.i.i.i.i21, %iftmp.98.0.reg2mem.0 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb.i.i.i.i.i.i.i23

bb5:                                              ; preds = %bb.i.i.i.i.i.i.i23, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i16
  %10 = invoke i8* @_Znwj(i32 %7)
          to label %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i unwind label %lpad.i.i.i ; <i8*> [#uses=16]

lpad.i.i.i:                                       ; preds = %bb5
  %eh_ptr.i.i.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc unwind label %lpad40

.noexc:                                           ; preds = %lpad.i.i.i
  unreachable

_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i:    ; preds = %bb5
  %11 = bitcast i8* %10 to i32*                   ; <i32*> [#uses=1]
  br i1 %9, label %bb12.preheader, label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i
  %indvar.i.i.i.i.i.i.i = phi i32 [ %indvar.next.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i ], [ 0, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i ] ; <i32> [#uses=2]
  %tmp33 = shl i32 %indvar.i.i.i.i.i.i.i, 2       ; <i32> [#uses=1]
  %scevgep34 = getelementptr i8* %10, i32 %tmp33  ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i.i.i = bitcast i8* %scevgep34 to i32* ; <i32*> [#uses=1]
  store i32 0, i32* %__first_addr.02.i.i.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i.i.i = add i32 %indvar.i.i.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond32 = icmp eq i32 %indvar.next.i.i.i.i.i.i.i, %iftmp.98.0.reg2mem.0 ; <i1> [#uses=1]
  br i1 %exitcond32, label %bb12.preheader, label %bb.i.i.i.i.i.i.i

bb12.preheader:                                   ; preds = %bb.i.i.i.i.i.i.i, %_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_.exit.i.i
  %12 = icmp sgt i32 %iftmp.98.0.reg2mem.0, 0     ; <i1> [#uses=1]
  br i1 %12, label %bb11, label %bb13

bb11:                                             ; preds = %bb11, %bb12.preheader
  %indvar101 = phi i32 [ %indvar.next102, %bb11 ], [ 0, %bb12.preheader ] ; <i32> [#uses=3]
  %i1.029 = mul i32 %indvar101, 10                ; <i32> [#uses=11]
  %tmp104145 = or i32 %i1.029, 1                  ; <i32> [#uses=1]
  %tmp105 = add i32 %i1.029, 2                    ; <i32> [#uses=1]
  %tmp106 = add i32 %i1.029, 3                    ; <i32> [#uses=1]
  %tmp107 = add i32 %i1.029, 4                    ; <i32> [#uses=1]
  %tmp108 = add i32 %i1.029, 5                    ; <i32> [#uses=1]
  %tmp109 = add i32 %i1.029, 6                    ; <i32> [#uses=1]
  %tmp110 = add i32 %i1.029, 7                    ; <i32> [#uses=1]
  %tmp111 = add i32 %i1.029, 8                    ; <i32> [#uses=1]
  %tmp112 = add i32 %i1.029, 9                    ; <i32> [#uses=1]
  %tmp114 = mul i32 %indvar101, 40                ; <i32> [#uses=10]
  %scevgep115 = getelementptr i8* %8, i32 %tmp114 ; <i8*> [#uses=1]
  %scevgep115116 = bitcast i8* %scevgep115 to i32* ; <i32*> [#uses=1]
  %tmp117144 = or i32 %tmp114, 4                  ; <i32> [#uses=1]
  %scevgep118 = getelementptr i8* %8, i32 %tmp117144 ; <i8*> [#uses=1]
  %scevgep118119 = bitcast i8* %scevgep118 to i32* ; <i32*> [#uses=1]
  %tmp120 = add i32 %tmp114, 8                    ; <i32> [#uses=1]
  %scevgep121 = getelementptr i8* %8, i32 %tmp120 ; <i8*> [#uses=1]
  %scevgep121122 = bitcast i8* %scevgep121 to i32* ; <i32*> [#uses=1]
  %tmp123 = add i32 %tmp114, 12                   ; <i32> [#uses=1]
  %scevgep124 = getelementptr i8* %8, i32 %tmp123 ; <i8*> [#uses=1]
  %scevgep124125 = bitcast i8* %scevgep124 to i32* ; <i32*> [#uses=1]
  %tmp126 = add i32 %tmp114, 16                   ; <i32> [#uses=1]
  %scevgep127 = getelementptr i8* %8, i32 %tmp126 ; <i8*> [#uses=1]
  %scevgep127128 = bitcast i8* %scevgep127 to i32* ; <i32*> [#uses=1]
  %tmp129 = add i32 %tmp114, 20                   ; <i32> [#uses=1]
  %scevgep130 = getelementptr i8* %8, i32 %tmp129 ; <i8*> [#uses=1]
  %scevgep130131 = bitcast i8* %scevgep130 to i32* ; <i32*> [#uses=1]
  %tmp132 = add i32 %tmp114, 24                   ; <i32> [#uses=1]
  %scevgep133 = getelementptr i8* %8, i32 %tmp132 ; <i8*> [#uses=1]
  %scevgep133134 = bitcast i8* %scevgep133 to i32* ; <i32*> [#uses=1]
  %tmp135 = add i32 %tmp114, 28                   ; <i32> [#uses=1]
  %scevgep136 = getelementptr i8* %8, i32 %tmp135 ; <i8*> [#uses=1]
  %scevgep136137 = bitcast i8* %scevgep136 to i32* ; <i32*> [#uses=1]
  %tmp138 = add i32 %tmp114, 32                   ; <i32> [#uses=1]
  %scevgep139 = getelementptr i8* %8, i32 %tmp138 ; <i8*> [#uses=1]
  %scevgep139140 = bitcast i8* %scevgep139 to i32* ; <i32*> [#uses=1]
  %tmp141 = add i32 %tmp114, 36                   ; <i32> [#uses=1]
  %scevgep142 = getelementptr i8* %8, i32 %tmp141 ; <i8*> [#uses=1]
  %scevgep142143 = bitcast i8* %scevgep142 to i32* ; <i32*> [#uses=1]
  store i32 %i1.029, i32* %scevgep115116, align 4
  store i32 %tmp104145, i32* %scevgep118119, align 4
  store i32 %tmp105, i32* %scevgep121122, align 4
  store i32 %tmp106, i32* %scevgep124125, align 4
  store i32 %tmp107, i32* %scevgep127128, align 4
  store i32 %tmp108, i32* %scevgep130131, align 4
  store i32 %tmp109, i32* %scevgep133134, align 4
  store i32 %tmp110, i32* %scevgep136137, align 4
  store i32 %tmp111, i32* %scevgep139140, align 4
  store i32 %tmp112, i32* %scevgep142143, align 4
  %tmp113 = add i32 %i1.029, 10                   ; <i32> [#uses=1]
  %13 = icmp slt i32 %tmp113, %iftmp.98.0.reg2mem.0 ; <i1> [#uses=1]
  %indvar.next102 = add i32 %indvar101, 1         ; <i32> [#uses=1]
  br i1 %13, label %bb11, label %bb13

bb13:                                             ; preds = %bb11, %bb12.preheader
  %14 = add i32 %iftmp.98.0.reg2mem.0, -1         ; <i32> [#uses=2]
  %15 = icmp slt i32 %14, 0                       ; <i1> [#uses=1]
  br i1 %15, label %invcont17, label %bb.nph

bb.nph:                                           ; preds = %bb13
  %tmp38 = add i32 %7, -4                         ; <i32> [#uses=1]
  %tmp44 = add i32 %7, -8                         ; <i32> [#uses=1]
  %tmp50 = add i32 %7, -12                        ; <i32> [#uses=1]
  %tmp56 = add i32 %7, -16                        ; <i32> [#uses=1]
  %tmp62 = add i32 %7, -20                        ; <i32> [#uses=1]
  %tmp68 = add i32 %7, -24                        ; <i32> [#uses=1]
  %tmp74 = add i32 %7, -28                        ; <i32> [#uses=1]
  %tmp80 = add i32 %7, -32                        ; <i32> [#uses=1]
  %tmp86 = add i32 %7, -36                        ; <i32> [#uses=1]
  %tmp92 = add i32 %7, -40                        ; <i32> [#uses=1]
  %tmp99 = add i32 %iftmp.98.0.reg2mem.0, -11     ; <i32> [#uses=1]
  br label %bb14

bb14:                                             ; preds = %bb14, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb14 ] ; <i32> [#uses=3]
  %tmp36 = mul i32 %indvar, -40                   ; <i32> [#uses=10]
  %tmp39 = add i32 %tmp36, %tmp38                 ; <i32> [#uses=2]
  %scevgep40 = getelementptr i8* %8, i32 %tmp39   ; <i8*> [#uses=1]
  %scevgep4041 = bitcast i8* %scevgep40 to i32*   ; <i32*> [#uses=1]
  %scevgep42 = getelementptr i8* %10, i32 %tmp39  ; <i8*> [#uses=1]
  %scevgep4243 = bitcast i8* %scevgep42 to i32*   ; <i32*> [#uses=1]
  %tmp45 = add i32 %tmp36, %tmp44                 ; <i32> [#uses=2]
  %scevgep46 = getelementptr i8* %10, i32 %tmp45  ; <i8*> [#uses=1]
  %scevgep4647 = bitcast i8* %scevgep46 to i32*   ; <i32*> [#uses=1]
  %scevgep48 = getelementptr i8* %8, i32 %tmp45   ; <i8*> [#uses=1]
  %scevgep4849 = bitcast i8* %scevgep48 to i32*   ; <i32*> [#uses=1]
  %tmp51 = add i32 %tmp36, %tmp50                 ; <i32> [#uses=2]
  %scevgep52 = getelementptr i8* %10, i32 %tmp51  ; <i8*> [#uses=1]
  %scevgep5253 = bitcast i8* %scevgep52 to i32*   ; <i32*> [#uses=1]
  %scevgep54 = getelementptr i8* %8, i32 %tmp51   ; <i8*> [#uses=1]
  %scevgep5455 = bitcast i8* %scevgep54 to i32*   ; <i32*> [#uses=1]
  %tmp57 = add i32 %tmp36, %tmp56                 ; <i32> [#uses=2]
  %scevgep58 = getelementptr i8* %10, i32 %tmp57  ; <i8*> [#uses=1]
  %scevgep5859 = bitcast i8* %scevgep58 to i32*   ; <i32*> [#uses=1]
  %scevgep60 = getelementptr i8* %8, i32 %tmp57   ; <i8*> [#uses=1]
  %scevgep6061 = bitcast i8* %scevgep60 to i32*   ; <i32*> [#uses=1]
  %tmp63 = add i32 %tmp36, %tmp62                 ; <i32> [#uses=2]
  %scevgep64 = getelementptr i8* %10, i32 %tmp63  ; <i8*> [#uses=1]
  %scevgep6465 = bitcast i8* %scevgep64 to i32*   ; <i32*> [#uses=1]
  %scevgep66 = getelementptr i8* %8, i32 %tmp63   ; <i8*> [#uses=1]
  %scevgep6667 = bitcast i8* %scevgep66 to i32*   ; <i32*> [#uses=1]
  %tmp69 = add i32 %tmp36, %tmp68                 ; <i32> [#uses=2]
  %scevgep70 = getelementptr i8* %10, i32 %tmp69  ; <i8*> [#uses=1]
  %scevgep7071 = bitcast i8* %scevgep70 to i32*   ; <i32*> [#uses=1]
  %scevgep72 = getelementptr i8* %8, i32 %tmp69   ; <i8*> [#uses=1]
  %scevgep7273 = bitcast i8* %scevgep72 to i32*   ; <i32*> [#uses=1]
  %tmp75 = add i32 %tmp36, %tmp74                 ; <i32> [#uses=2]
  %scevgep76 = getelementptr i8* %10, i32 %tmp75  ; <i8*> [#uses=1]
  %scevgep7677 = bitcast i8* %scevgep76 to i32*   ; <i32*> [#uses=1]
  %scevgep78 = getelementptr i8* %8, i32 %tmp75   ; <i8*> [#uses=1]
  %scevgep7879 = bitcast i8* %scevgep78 to i32*   ; <i32*> [#uses=1]
  %tmp81 = add i32 %tmp36, %tmp80                 ; <i32> [#uses=2]
  %scevgep82 = getelementptr i8* %10, i32 %tmp81  ; <i8*> [#uses=1]
  %scevgep8283 = bitcast i8* %scevgep82 to i32*   ; <i32*> [#uses=1]
  %scevgep84 = getelementptr i8* %8, i32 %tmp81   ; <i8*> [#uses=1]
  %scevgep8485 = bitcast i8* %scevgep84 to i32*   ; <i32*> [#uses=1]
  %tmp87 = add i32 %tmp36, %tmp86                 ; <i32> [#uses=2]
  %scevgep88 = getelementptr i8* %10, i32 %tmp87  ; <i8*> [#uses=1]
  %scevgep8889 = bitcast i8* %scevgep88 to i32*   ; <i32*> [#uses=1]
  %scevgep90 = getelementptr i8* %8, i32 %tmp87   ; <i8*> [#uses=1]
  %scevgep9091 = bitcast i8* %scevgep90 to i32*   ; <i32*> [#uses=1]
  %tmp93 = add i32 %tmp36, %tmp92                 ; <i32> [#uses=2]
  %scevgep94 = getelementptr i8* %10, i32 %tmp93  ; <i8*> [#uses=1]
  %scevgep9495 = bitcast i8* %scevgep94 to i32*   ; <i32*> [#uses=1]
  %scevgep96 = getelementptr i8* %8, i32 %tmp93   ; <i8*> [#uses=1]
  %scevgep9697 = bitcast i8* %scevgep96 to i32*   ; <i32*> [#uses=1]
  %16 = load i32* %scevgep4041, align 4           ; <i32> [#uses=1]
  store i32 %16, i32* %scevgep4243, align 4
  %17 = load i32* %scevgep4849, align 4           ; <i32> [#uses=1]
  store i32 %17, i32* %scevgep4647, align 4
  %18 = load i32* %scevgep5455, align 4           ; <i32> [#uses=1]
  store i32 %18, i32* %scevgep5253, align 4
  %19 = load i32* %scevgep6061, align 4           ; <i32> [#uses=1]
  store i32 %19, i32* %scevgep5859, align 4
  %20 = load i32* %scevgep6667, align 4           ; <i32> [#uses=1]
  store i32 %20, i32* %scevgep6465, align 4
  %21 = load i32* %scevgep7273, align 4           ; <i32> [#uses=1]
  store i32 %21, i32* %scevgep7071, align 4
  %22 = load i32* %scevgep7879, align 4           ; <i32> [#uses=1]
  store i32 %22, i32* %scevgep7677, align 4
  %23 = load i32* %scevgep8485, align 4           ; <i32> [#uses=1]
  store i32 %23, i32* %scevgep8283, align 4
  %24 = load i32* %scevgep9091, align 4           ; <i32> [#uses=1]
  store i32 %24, i32* %scevgep8889, align 4
  %25 = load i32* %scevgep9697, align 4           ; <i32> [#uses=1]
  store i32 %25, i32* %scevgep9495, align 4
  %tmp98 = mul i32 %indvar, -10                   ; <i32> [#uses=1]
  %tmp100 = add i32 %tmp98, %tmp99                ; <i32> [#uses=1]
  %phitmp = icmp slt i32 %tmp100, 0               ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %phitmp, label %invcont17, label %bb14

invcont17:                                        ; preds = %bb14, %bb13
  %26 = getelementptr inbounds i32* %11, i32 %14  ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=1]
  %28 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %28, align 8
  %29 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %29, align 4
  %30 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %31 = getelementptr inbounds i32 (...)** %30, i32 -3 ; <i32 (...)**> [#uses=1]
  %32 = bitcast i32 (...)** %31 to i32*           ; <i32*> [#uses=1]
  %33 = load i32* %32, align 4                    ; <i32> [#uses=1]
  %34 = add i32 %33, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %35 = inttoptr i32 %34 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %36 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %35, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %37 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %36, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %38 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %37, null ; <i1> [#uses=1]
  br i1 %38, label %bb9.i.i.i, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %invcont17
  %39 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %35, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = icmp eq i32 %40, 0                        ; <i1> [#uses=1]
  br i1 %41, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i2
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %37)
          to label %.noexc3 unwind label %lpad44

.noexc3:                                          ; preds = %bb8.i.i.i
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %.noexc3, %bb.i.i.i2, %invcont17
  %42 = phi i32 (...)** [ %.pre.i.i.i, %.noexc3 ], [ %30, %invcont17 ], [ %30, %bb.i.i.i2 ] ; <i32 (...)**> [#uses=1]
  %43 = getelementptr inbounds i32 (...)** %42, i32 -3 ; <i32 (...)**> [#uses=1]
  %44 = bitcast i32 (...)** %43 to i32*           ; <i32*> [#uses=1]
  %45 = load i32* %44, align 4                    ; <i32> [#uses=1]
  %46 = add i32 %45, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %47 = inttoptr i32 %46 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %48 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %47, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=2]
  %50 = icmp eq i32 %49, 0                        ; <i1> [#uses=1]
  br i1 %50, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %28, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %51 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %47, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %52 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %51, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %53 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %52, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %53, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %49 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %48
  %54 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %47, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %55 = load i32* %54, align 4                    ; <i32> [#uses=1]
  %56 = and i32 %storemerge.i.i.i.i, %55          ; <i32> [#uses=1]
  %57 = icmp eq i32 %56, 0                        ; <i1> [#uses=1]
  br i1 %57, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc4 unwind label %lpad44

.noexc4:                                          ; preds = %bb4.i.i.i.i.i
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %28, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb17.i, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %58 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %59 = getelementptr inbounds i32 (...)** %58, i32 -3 ; <i32 (...)**> [#uses=1]
  %60 = bitcast i32 (...)** %59 to i32*           ; <i32*> [#uses=1]
  %61 = load i32* %60, align 4                    ; <i32> [#uses=1]
  %62 = add i32 %61, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %63 = inttoptr i32 %62 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %64 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %65 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %64, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %66 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %65, null ; <i1> [#uses=1]
  br i1 %66, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %67 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 3 ; <i8*> [#uses=2]
  %68 = load i8* %67, align 1                     ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %68, 0                 ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx15 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx15.val = load %"struct.std::ctype<char>"** %.idx15 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %69 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx15.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %70 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %69, i8* %70, align 4
  store i8 1, i8* %67, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %71 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %58, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %72 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %63, i32 0, i32 2 ; <i8*> [#uses=1]
  %73 = load i8* %72, align 4                     ; <i8> [#uses=1]
  %74 = getelementptr inbounds i32 (...)** %71, i32 -3 ; <i32 (...)**> [#uses=1]
  %75 = bitcast i32 (...)** %74 to i32*           ; <i32*> [#uses=1]
  %76 = load i32* %75, align 4                    ; <i32> [#uses=1]
  %77 = add i32 %76, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %78 = inttoptr i32 %77 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %79 = inttoptr i32 %77 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %80 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %79, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %81 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %80, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %81 to i32 ; <i32> [#uses=1]
  %82 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %81, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %83 = zext i32 %tmp.i to i64                    ; <i64> [#uses=1]
  %84 = zext i1 %82 to i64                        ; <i64> [#uses=1]
  %85 = shl i64 %84, 32                           ; <i64> [#uses=1]
  %86 = or i64 %85, %83                           ; <i64> [#uses=1]
  store i64 %86, i64* %tmp9.i, align 8
  %87 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %65, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %88 = load i32 (...)*** %87, align 4            ; <i32 (...)**> [#uses=1]
  %89 = getelementptr inbounds i32 (...)** %88, i32 3 ; <i32 (...)**> [#uses=1]
  %90 = load i32 (...)** %89, align 4             ; <i32 (...)*> [#uses=1]
  %91 = bitcast i32 (...)* %90 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %91(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %65, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %78, i8 signext %73, i32 %27)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %92 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %93 = load i8* %92, align 4                     ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %93, 0                  ; <i1> [#uses=1]
  br i1 %toBool4.i, label %bb17.i, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %bb17.i unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %94 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %95 = getelementptr inbounds i32 (...)** %94, i32 -3 ; <i32 (...)**> [#uses=1]
  %96 = bitcast i32 (...)** %95 to i32*           ; <i32*> [#uses=1]
  %97 = load i32* %96, align 4                    ; <i32> [#uses=1]
  %98 = add i32 %97, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %99 = inttoptr i32 %98 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %100 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %99, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %101 = load i32* %100, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %101, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %100
  %102 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %99, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %103 = load i32* %102, align 4                  ; <i32> [#uses=1]
  %104 = and i32 %storemerge.i.i, %103            ; <i32> [#uses=1]
  %105 = icmp eq i32 %104, 0                      ; <i1> [#uses=1]
  br i1 %105, label %bb17.i, label %bb4.i.i.i

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
  %106 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %107 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %108 = getelementptr inbounds i32 (...)** %107, i32 -3 ; <i32 (...)**> [#uses=1]
  %109 = bitcast i32 (...)** %108 to i32*         ; <i32*> [#uses=1]
  %110 = load i32* %109, align 4                  ; <i32> [#uses=1]
  %111 = add i32 %110, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %112 = inttoptr i32 %111 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %113 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %112, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %114 = load i32* %113, align 4                  ; <i32> [#uses=1]
  %115 = or i32 %114, 1                           ; <i32> [#uses=1]
  store i32 %115, i32* %113, align 4
  %116 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %112, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %117 = load i32* %116, align 4                  ; <i32> [#uses=1]
  %118 = and i32 %117, 1                          ; <i32> [#uses=1]
  %119 = icmp eq i32 %118, 0                      ; <i1> [#uses=1]
  br i1 %119, label %bb12.i, label %bb.i.i

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
  %120 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %121 = getelementptr inbounds i32 (...)** %120, i32 -3 ; <i32 (...)**> [#uses=1]
  %122 = bitcast i32 (...)** %121 to i32*         ; <i32*> [#uses=1]
  %123 = load i32* %122, align 4                  ; <i32> [#uses=1]
  %124 = add i32 %123, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %125 = inttoptr i32 %124 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %125, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %126 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10)
          to label %.noexc9 unwind label %lpad44  ; <i8> [#uses=3]

.noexc9:                                          ; preds = %invcont18
  %127 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %127, align 8
  %128 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %128, align 4
  %129 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %130 = getelementptr inbounds i32 (...)** %129, i32 -3 ; <i32 (...)**> [#uses=1]
  %131 = bitcast i32 (...)** %130 to i32*         ; <i32*> [#uses=1]
  %132 = load i32* %131, align 4                  ; <i32> [#uses=1]
  %133 = add i32 %132, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %134 = inttoptr i32 %133 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %135 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %134, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %136 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %135, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %137 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %136, null ; <i1> [#uses=1]
  br i1 %137, label %bb9.i.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %.noexc9
  %138 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %134, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %139 = load i32* %138, align 4                  ; <i32> [#uses=1]
  %140 = icmp eq i32 %139, 0                      ; <i1> [#uses=1]
  br i1 %140, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %136)
          to label %.noexc10 unwind label %lpad44

.noexc10:                                         ; preds = %bb8.i.i.i.i
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %.noexc10, %bb.i.i.i.i, %.noexc9
  %141 = phi i32 (...)** [ %.pre.i.i.i.i, %.noexc10 ], [ %129, %.noexc9 ], [ %129, %bb.i.i.i.i ] ; <i32 (...)**> [#uses=1]
  %142 = getelementptr inbounds i32 (...)** %141, i32 -3 ; <i32 (...)**> [#uses=1]
  %143 = bitcast i32 (...)** %142 to i32*         ; <i32*> [#uses=1]
  %144 = load i32* %143, align 4                  ; <i32> [#uses=1]
  %145 = add i32 %144, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %146 = inttoptr i32 %145 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %147 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %146, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %148 = load i32* %147, align 4                  ; <i32> [#uses=2]
  %149 = icmp eq i32 %148, 0                      ; <i1> [#uses=1]
  br i1 %149, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %127, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %150 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %146, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %151 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %150, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %152 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %151, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %152, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %148 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %147
  %153 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %146, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %154 = load i32* %153, align 4                  ; <i32> [#uses=1]
  %155 = and i32 %storemerge.i.i.i.i.i, %154      ; <i32> [#uses=1]
  %156 = icmp eq i32 %155, 0                      ; <i1> [#uses=1]
  br i1 %156, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc11 unwind label %lpad44

.noexc11:                                         ; preds = %bb4.i.i.i.i.i.i
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr26 = load i8* %127, align 8                 ; <i8> [#uses=1]
  %toBool.i.i7 = icmp eq i8 %.pr26, 0             ; <i1> [#uses=1]
  br i1 %toBool.i.i7, label %_ZNSo3putEc.exit.i, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %157 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %158 = getelementptr inbounds i32 (...)** %157, i32 -3 ; <i32 (...)**> [#uses=1]
  %159 = bitcast i32 (...)** %158 to i32*         ; <i32*> [#uses=1]
  %160 = load i32* %159, align 4                  ; <i32> [#uses=1]
  %161 = add i32 %160, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %162 = inttoptr i32 %161 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %163 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %162, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %164 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %163, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %165 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %164, i32 0, i32 5 ; <i8**> [#uses=3]
  %166 = load i8** %165, align 4                  ; <i8*> [#uses=2]
  %167 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %164, i32 0, i32 6 ; <i8**> [#uses=1]
  %168 = load i8** %167, align 4                  ; <i8*> [#uses=1]
  %169 = icmp ult i8* %166, %168                  ; <i1> [#uses=1]
  br i1 %169, label %bb.i2.i.i, label %bb1.i.i.i

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %126, i8* %166, align 1
  %170 = load i8** %165, align 4                  ; <i8*> [#uses=1]
  %171 = getelementptr inbounds i8* %170, i32 1   ; <i8*> [#uses=1]
  store i8* %171, i8** %165, align 4
  %172 = zext i8 %126 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i:                                        ; preds = %invcont1.i.i
  %173 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %164, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %174 = load i32 (...)*** %173, align 4          ; <i32 (...)**> [#uses=1]
  %175 = getelementptr inbounds i32 (...)** %174, i32 13 ; <i32 (...)**> [#uses=1]
  %176 = load i32 (...)** %175, align 4           ; <i32 (...)*> [#uses=1]
  %177 = zext i8 %126 to i32                      ; <i32> [#uses=1]
  %178 = bitcast i32 (...)* %176 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %179 = invoke i32 %178(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %164, i32 %177)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i, %bb.i2.i.i
  %180 = phi i32 [ %172, %bb.i2.i.i ], [ %179, %bb1.i.i.i ] ; <i32> [#uses=1]
  %181 = icmp eq i32 %180, -1                     ; <i1> [#uses=1]
  br i1 %181, label %bb14.i.i, label %_ZNSo3putEc.exit.i

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit.i unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %182 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %183 = getelementptr inbounds i32 (...)** %182, i32 -3 ; <i32 (...)**> [#uses=1]
  %184 = bitcast i32 (...)** %183 to i32*         ; <i32*> [#uses=1]
  %185 = load i32* %184, align 4                  ; <i32> [#uses=1]
  %186 = add i32 %185, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %187 = inttoptr i32 %186 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %188 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %187, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %189 = load i32* %188, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %189, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %188
  %190 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %187, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %191 = load i32* %190, align 4                  ; <i32> [#uses=1]
  %192 = and i32 %storemerge.i.i.i, %191          ; <i32> [#uses=1]
  %193 = icmp eq i32 %192, 0                      ; <i1> [#uses=1]
  br i1 %193, label %_ZNSo3putEc.exit.i, label %bb4.i.i.i.i

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
  %194 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %195 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %196 = getelementptr inbounds i32 (...)** %195, i32 -3 ; <i32 (...)**> [#uses=1]
  %197 = bitcast i32 (...)** %196 to i32*         ; <i32*> [#uses=1]
  %198 = load i32* %197, align 4                  ; <i32> [#uses=1]
  %199 = add i32 %198, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %200 = inttoptr i32 %199 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %201 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %200, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %202 = load i32* %201, align 4                  ; <i32> [#uses=1]
  %203 = or i32 %202, 1                           ; <i32> [#uses=1]
  store i32 %203, i32* %201, align 4
  %204 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %200, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %205 = load i32* %204, align 4                  ; <i32> [#uses=1]
  %206 = and i32 %205, 1                          ; <i32> [#uses=1]
  %207 = icmp eq i32 %206, 0                      ; <i1> [#uses=1]
  br i1 %207, label %bb11.i.i, label %bb.i.i.i8

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
  %208 = icmp eq i8* %10, null                    ; <i1> [#uses=1]
  br i1 %208, label %bb32, label %bb.i.i.i7

bb.i.i.i7:                                        ; preds = %bb25
  tail call void @_ZdlPv(i8* %10) nounwind
  br label %bb32

bb32:                                             ; preds = %bb.i.i.i7, %bb25
  %209 = icmp eq i8* %8, null                     ; <i1> [#uses=1]
  br i1 %209, label %_ZNSt6vectorIiSaIiEED1Ev.exit6, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb32
  tail call void @_ZdlPv(i8* %8) nounwind
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
  %210 = icmp eq i8* %10, null                    ; <i1> [#uses=1]
  br i1 %210, label %ppad56, label %bb.i.i.i1

bb.i.i.i1:                                        ; preds = %lpad44
  tail call void @_ZdlPv(i8* %10) nounwind
  br label %ppad56

ppad56:                                           ; preds = %bb.i.i.i1, %lpad44, %lpad40
  %eh_exception.1 = phi i8* [ %eh_ptr41, %lpad40 ], [ %eh_ptr45, %bb.i.i.i1 ], [ %eh_ptr45, %lpad44 ] ; <i8*> [#uses=2]
  %211 = icmp eq i8* %8, null                     ; <i1> [#uses=1]
  br i1 %211, label %Unwind, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %ppad56
  tail call void @_ZdlPv(i8* %8) nounwind
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
