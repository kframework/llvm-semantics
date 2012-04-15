; ModuleID = 'bigfib.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%struct.BigInt = type { %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >" }
%struct.Fibonacci = type { %"struct.std::vector<BigInt,std::allocator<BigInt> >" }
%"struct.__gnu_cxx::new_allocator<BigInt>" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Vector_base<BigInt,std::allocator<BigInt> >" = type { %"struct.std::_Vector_base<BigInt,std::allocator<BigInt> >::_Vector_impl" }
%"struct.std::_Vector_base<BigInt,std::allocator<BigInt> >::_Vector_impl" = type { %struct.BigInt*, %struct.BigInt*, %struct.BigInt* }
%"struct.std::_Vector_base<long unsigned int,std::allocator<long unsigned int> >" = type { %"struct.std::_Vector_base<long unsigned int,std::allocator<long unsigned int> >::_Vector_impl" }
%"struct.std::_Vector_base<long unsigned int,std::allocator<long unsigned int> >::_Vector_impl" = type { i32*, i32*, i32* }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >.base" = type { i32 (...)** }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >" = type { %"struct.std::basic_ostream<char,std::char_traits<char> >.base", %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >", %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Alloc_hider" = type { i8* }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep_base" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep_base" = type { i32, i32, i32 }
%"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >", i32, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >" }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }
%"struct.std::vector<BigInt,std::allocator<BigInt> >" = type { %"struct.std::_Vector_base<BigInt,std::allocator<BigInt> >" }
%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >" = type { %"struct.std::_Vector_base<long unsigned int,std::allocator<long unsigned int> >" }

@_ZN6BigInt6head_sE = internal global i32 0       ; <i32*> [#uses=5]
@_ZNSs4_Rep20_S_empty_rep_storageE = external global [4 x i32] ; <[4 x i32]*> [#uses=2]
@_ZNSs4_Rep11_S_terminalE = external constant i8  ; <i8*> [#uses=5]
@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<BigInt>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<BigInt>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [24 x i8] c"basic_string::_S_create\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str2 = private constant [42 x i8] c"basic_string::_S_construct NULL not valid\00", align 1 ; <[42 x i8]*> [#uses=1]
@.str3 = private constant [16 x i8] c"vector::reserve\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str4 = private constant [22 x i8] c"vector::_M_insert_aux\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str5 = private constant [23 x i8] c"vector::_M_fill_insert\00", align 1 ; <[23 x i8]*> [#uses=1]
@.str6 = private constant [4 x i8] c"all\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str7 = private constant [3 x i8] c"th\00", align 2 ; <[3 x i8]*> [#uses=3]
@.str8 = private constant [5 x i8] c"some\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str9 = private constant [5 x i8] c"rand\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str10 = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZTVSt9basic_iosIcSt11char_traitsIcEE = external constant [4 x i32 (...)*] ; <[4 x i32 (...)*]*> [#uses=1]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external constant [16 x i32 (...)*] ; <[16 x i32 (...)*]*> [#uses=1]
@_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE = external constant [16 x i32 (...)*] ; <[16 x i32 (...)*]*> [#uses=1]
@_ZNSt5ctypeIcE2idE = external global %struct..0._10 ; <%struct..0._10*> [#uses=1]
@_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE = external global %struct..0._10 ; <%struct..0._10*> [#uses=2]
@_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE = external global %struct..0._10 ; <%struct..0._10*> [#uses=2]
@_ZNSt8ios_base7goodbitE = external constant i32  ; <i32*> [#uses=1]
@_ZNSt8ios_base6badbitE = external constant i32   ; <i32*> [#uses=1]
@_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE = external constant [4 x i8*] ; <[4 x i8*]*> [#uses=2]
@_ZTVSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE = external constant [10 x i32 (...)*] ; <[10 x i32 (...)*]*> [#uses=2]
@.str20 = private constant [6 x i8] c"Fib [\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str21 = private constant [5 x i8] c"] = \00", align 1 ; <[5 x i8]*> [#uses=1]
@.str22 = private constant [2 x i8] c"\0A\00", align 1 ; <[2 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=3]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I__ZN9Fibonacci10get_numberEj }] ; <[1 x %0]*> [#uses=0]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=1]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._10*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._10*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._10*)* @pthread_mutexattr_init ; <i32 (%struct..0._10*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._10*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._10*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._10*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._10*)*> [#uses=0]

define internal fastcc void @_ZN9Fibonacci10get_numberEj(%struct.BigInt* noalias nocapture sret %agg.result, %struct.Fibonacci* %this, i32 %n_i) {
entry:
  %__x_addr.i11.i = alloca i32, align 4           ; <i32*> [#uses=2]
  %__x_addr.i6.i = alloca i32, align 4            ; <i32*> [#uses=2]
  %__x_addr.i.i = alloca i32, align 4             ; <i32*> [#uses=2]
  %unit_i_addr.i56 = alloca i32, align 4          ; <i32*> [#uses=2]
  %unit_i_addr.i41 = alloca i32, align 4          ; <i32*> [#uses=2]
  %unit_i_addr.i = alloca i32, align 4            ; <i32*> [#uses=2]
  %0 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=5]
  %1 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=5]
  %2 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=6]
  %3 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=6]
  %4 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=6]
  %5 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=6]
  %6 = add i32 %n_i, 1                            ; <i32> [#uses=4]
  %7 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0 ; <%"struct.std::vector<BigInt,std::allocator<BigInt> >"*> [#uses=4]
  %8 = icmp ugt i32 %6, 357913941                 ; <i1> [#uses=1]
  br i1 %8, label %bb.i1, label %bb1.i2

bb.i1:                                            ; preds = %entry
  call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0)) noreturn
  unreachable

bb1.i2:                                           ; preds = %entry
  %9 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 2 ; <%struct.BigInt**> [#uses=6]
  %10 = load %struct.BigInt** %9, align 4         ; <%struct.BigInt*> [#uses=1]
  %11 = ptrtoint %struct.BigInt* %10 to i32       ; <i32> [#uses=1]
  %12 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=6]
  %13 = load %struct.BigInt** %12, align 4        ; <%struct.BigInt*> [#uses=3]
  %14 = ptrtoint %struct.BigInt* %13 to i32       ; <i32> [#uses=2]
  %15 = sub i32 %11, %14                          ; <i32> [#uses=1]
  %16 = sdiv exact i32 %15, 12                    ; <i32> [#uses=1]
  %17 = icmp ult i32 %16, %6                      ; <i1> [#uses=1]
  br i1 %17, label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit.i.i, label %_ZNSt6vectorI6BigIntSaIS0_EE7reserveEj.exit

_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit.i.i: ; preds = %bb1.i2
  %18 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=3]
  %19 = load %struct.BigInt** %18, align 4        ; <%struct.BigInt*> [#uses=2]
  %20 = ptrtoint %struct.BigInt* %19 to i32       ; <i32> [#uses=1]
  %21 = sub i32 %20, %14                          ; <i32> [#uses=1]
  %22 = sdiv exact i32 %21, 12                    ; <i32> [#uses=1]
  %23 = mul i32 %6, 12                            ; <i32> [#uses=1]
  %24 = call i8* @_Znwj(i32 %23)                  ; <i8*> [#uses=3]
  %25 = bitcast i8* %24 to %struct.BigInt*        ; <%struct.BigInt*> [#uses=5]
  %26 = invoke fastcc %struct.BigInt* @_ZSt24__uninitialized_copy_auxIP6BigIntS1_ET0_T_S3_S2_St12__false_type(%struct.BigInt* %13, %struct.BigInt* %19, %struct.BigInt* %25)
          to label %_ZNSt6vectorI6BigIntSaIS0_EE20_M_allocate_and_copyIPS0_EES4_jT_S5_.exit.i unwind label %lpad.i.i ; <%struct.BigInt*> [#uses=0]

invcont4.i.i:                                     ; preds = %bb.i.i.i, %lpad.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %invcont5.i.i unwind label %lpad14.i.i

invcont5.i.i:                                     ; preds = %invcont4.i.i
  unreachable

invcont9.i.i:                                     ; preds = %lpad14.i.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr15.i.i)
  unreachable

lpad.i.i:                                         ; preds = %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select13.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %27 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i.i) nounwind ; <i8*> [#uses=0]
  %28 = icmp eq i8* %24, null                     ; <i1> [#uses=1]
  br i1 %28, label %invcont4.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %lpad.i.i
  call void @_ZdlPv(i8* %24) nounwind
  br label %invcont4.i.i

lpad14.i.i:                                       ; preds = %invcont4.i.i
  %eh_ptr15.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select17.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont9.i.i unwind label %lpad18.i.i

lpad18.i.i:                                       ; preds = %lpad14.i.i
  %eh_ptr19.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select21.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_ZNSt6vectorI6BigIntSaIS0_EE20_M_allocate_and_copyIPS0_EES4_jT_S5_.exit.i: ; preds = %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit.i.i
  %29 = load %struct.BigInt** %18, align 4        ; <%struct.BigInt*> [#uses=2]
  %30 = load %struct.BigInt** %12, align 4        ; <%struct.BigInt*> [#uses=4]
  %31 = icmp eq %struct.BigInt* %30, %29          ; <i1> [#uses=1]
  br i1 %31, label %bb5.i, label %bb.i.i.i.i4

bb.i.i.i.i4:                                      ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i, %_ZNSt6vectorI6BigIntSaIS0_EE20_M_allocate_and_copyIPS0_EES4_jT_S5_.exit.i
  %indvar.i.i.i.i = phi i32 [ %tmp.i, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i ], [ 0, %_ZNSt6vectorI6BigIntSaIS0_EE20_M_allocate_and_copyIPS0_EES4_jT_S5_.exit.i ] ; <i32> [#uses=2]
  %tmp.i = add i32 %indvar.i.i.i.i, 1             ; <i32> [#uses=2]
  %scevgep.i.i.i.i = getelementptr %struct.BigInt* %30, i32 %tmp.i ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i = getelementptr inbounds %struct.BigInt* %30, i32 %indvar.i.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %32 = load i32** %scevgep23.i.i.i.i, align 4    ; <i32*> [#uses=2]
  %33 = icmp eq i32* %32, null                    ; <i1> [#uses=1]
  br i1 %33, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i, label %bb.i.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i.i:                             ; preds = %bb.i.i.i.i4
  %34 = bitcast i32* %32 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %34) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i:          ; preds = %bb.i.i.i.i.i.i.i.i.i, %bb.i.i.i.i4
  %35 = icmp eq %struct.BigInt* %scevgep.i.i.i.i, %29 ; <i1> [#uses=1]
  br i1 %35, label %bb5.loopexit.i, label %bb.i.i.i.i4

bb5.loopexit.i:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i
  %.pre.i = load %struct.BigInt** %12, align 4    ; <%struct.BigInt*> [#uses=1]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.loopexit.i, %_ZNSt6vectorI6BigIntSaIS0_EE20_M_allocate_and_copyIPS0_EES4_jT_S5_.exit.i
  %36 = phi %struct.BigInt* [ %.pre.i, %bb5.loopexit.i ], [ %30, %_ZNSt6vectorI6BigIntSaIS0_EE20_M_allocate_and_copyIPS0_EES4_jT_S5_.exit.i ] ; <%struct.BigInt*> [#uses=2]
  %37 = icmp eq %struct.BigInt* %36, null         ; <i1> [#uses=1]
  br i1 %37, label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb5.i
  %38 = bitcast %struct.BigInt* %36 to i8*        ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %38) nounwind
  br label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit.i

_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit.i: ; preds = %bb.i.i, %bb5.i
  store %struct.BigInt* %25, %struct.BigInt** %12, align 4
  %39 = getelementptr inbounds %struct.BigInt* %25, i32 %22 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %39, %struct.BigInt** %18, align 4
  %40 = getelementptr inbounds %struct.BigInt* %25, i32 %6 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %40, %struct.BigInt** %9, align 4
  br label %_ZNSt6vectorI6BigIntSaIS0_EE7reserveEj.exit

_ZNSt6vectorI6BigIntSaIS0_EE7reserveEj.exit:      ; preds = %_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit.i, %bb1.i2
  %41 = phi %struct.BigInt* [ %25, %_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit.i ], [ %13, %bb1.i2 ] ; <%struct.BigInt*> [#uses=1]
  %42 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=14]
  %43 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=1]
  %44 = ptrtoint %struct.BigInt* %43 to i32       ; <i32> [#uses=1]
  %45 = ptrtoint %struct.BigInt* %41 to i32       ; <i32> [#uses=1]
  %46 = sub i32 %44, %45                          ; <i32> [#uses=1]
  %47 = sdiv exact i32 %46, 12                    ; <i32> [#uses=3]
  %48 = getelementptr inbounds %struct.BigInt* %2, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=7]
  %49 = getelementptr inbounds %struct.BigInt* %0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  %50 = getelementptr inbounds %struct.BigInt* %1, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=5]
  %51 = getelementptr inbounds %struct.BigInt* %5, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  %52 = getelementptr inbounds %struct.BigInt* %5, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=1]
  %53 = getelementptr inbounds %struct.BigInt* %5, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=1]
  %54 = getelementptr inbounds %struct.BigInt* %5, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  %55 = getelementptr inbounds %struct.BigInt* %4, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  %56 = getelementptr inbounds %struct.BigInt* %4, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=1]
  %57 = getelementptr inbounds %struct.BigInt* %4, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=1]
  %58 = getelementptr inbounds %struct.BigInt* %4, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  %59 = getelementptr inbounds %struct.BigInt* %3, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  %60 = getelementptr inbounds %struct.BigInt* %3, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=1]
  %61 = getelementptr inbounds %struct.BigInt* %3, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=1]
  %62 = getelementptr inbounds %struct.BigInt* %3, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  %tmp = add i32 %47, -2                          ; <i32> [#uses=1]
  %tmp72 = add i32 %47, -1                        ; <i32> [#uses=1]
  %63 = getelementptr inbounds %struct.BigInt* %2, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=7]
  %64 = getelementptr inbounds %struct.BigInt* %2, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  %65 = getelementptr inbounds %struct.BigInt* %0, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=3]
  %66 = getelementptr inbounds %struct.BigInt* %1, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=3]
  %67 = getelementptr inbounds %struct.BigInt* %2, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=2]
  %68 = getelementptr inbounds %struct.BigInt* %1, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  %69 = getelementptr inbounds %struct.BigInt* %0, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  br label %bb73

bb:                                               ; preds = %bb73
  switch i32 %i.0, label %bb48 [
    i32 0, label %bb24
    i32 1, label %bb31
  ]

bb24:                                             ; preds = %bb
  store i32 0, i32* %unit_i_addr.i
  store i32* null, i32** %51, align 8
  store i32* null, i32** %52, align 4
  store i32* null, i32** %53, align 8
  invoke fastcc void @_ZNSt6vectorImSaImEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPmS1_EERKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %54, i32* null, i32* %unit_i_addr.i)
          to label %_ZN6BigIntC1Em.exit unwind label %lpad.i

invcont1.i:                                       ; preds = %bb.i.i.i.i, %lpad.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
  unreachable

lpad.i:                                           ; preds = %bb24
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select5.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %70 = load i32** %51, align 8                   ; <i32*> [#uses=2]
  %71 = icmp eq i32* %70, null                    ; <i1> [#uses=1]
  br i1 %71, label %invcont1.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %lpad.i
  %72 = bitcast i32* %70 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %72) nounwind
  br label %invcont1.i

_ZN6BigIntC1Em.exit:                              ; preds = %bb24
  %73 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=3]
  %74 = load %struct.BigInt** %9, align 4         ; <%struct.BigInt*> [#uses=1]
  %75 = icmp eq %struct.BigInt* %73, %74          ; <i1> [#uses=1]
  br i1 %75, label %bb1.i, label %bb.i

bb.i:                                             ; preds = %_ZN6BigIntC1Em.exit
  invoke fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %73, %struct.BigInt* %5)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %bb.i
  %76 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=1]
  %77 = getelementptr inbounds %struct.BigInt* %76, i32 1 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %77, %struct.BigInt** %42, align 4
  br label %bb30

bb1.i:                                            ; preds = %_ZN6BigIntC1Em.exit
  invoke fastcc void @_ZNSt6vectorI6BigIntSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"struct.std::vector<BigInt,std::allocator<BigInt> >"* %7, %struct.BigInt* %73, %struct.BigInt* %5)
          to label %bb30 unwind label %lpad

bb30:                                             ; preds = %bb1.i, %.noexc
  %78 = load i32** %51, align 8                   ; <i32*> [#uses=2]
  %79 = icmp eq i32* %78, null                    ; <i1> [#uses=1]
  br i1 %79, label %bb72, label %bb.i.i.i.i63

bb.i.i.i.i63:                                     ; preds = %bb30
  %80 = bitcast i32* %78 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %80) nounwind
  br label %bb72

bb31:                                             ; preds = %bb
  %81 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=1]
  %82 = load %struct.BigInt** %12, align 4        ; <%struct.BigInt*> [#uses=1]
  %83 = icmp eq %struct.BigInt* %82, %81          ; <i1> [#uses=1]
  br i1 %83, label %bb32, label %bb40

bb32:                                             ; preds = %bb31
  store i32 0, i32* %unit_i_addr.i56
  store i32* null, i32** %55, align 8
  store i32* null, i32** %56, align 4
  store i32* null, i32** %57, align 8
  invoke fastcc void @_ZNSt6vectorImSaImEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPmS1_EERKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %58, i32* null, i32* %unit_i_addr.i56)
          to label %_ZN6BigIntC1Em.exit62 unwind label %lpad.i60

invcont1.i57:                                     ; preds = %bb.i.i.i.i61, %lpad.i60
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i58)
  unreachable

lpad.i60:                                         ; preds = %bb32
  %eh_ptr.i58 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select5.i59 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i58, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %84 = load i32** %55, align 8                   ; <i32*> [#uses=2]
  %85 = icmp eq i32* %84, null                    ; <i1> [#uses=1]
  br i1 %85, label %invcont1.i57, label %bb.i.i.i.i61

bb.i.i.i.i61:                                     ; preds = %lpad.i60
  %86 = bitcast i32* %84 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %86) nounwind
  br label %invcont1.i57

_ZN6BigIntC1Em.exit62:                            ; preds = %bb32
  %87 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=3]
  %88 = load %struct.BigInt** %9, align 4         ; <%struct.BigInt*> [#uses=1]
  %89 = icmp eq %struct.BigInt* %87, %88          ; <i1> [#uses=1]
  br i1 %89, label %bb1.i52, label %bb.i51

bb.i51:                                           ; preds = %_ZN6BigIntC1Em.exit62
  invoke fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %87, %struct.BigInt* %4)
          to label %.noexc53 unwind label %lpad81

.noexc53:                                         ; preds = %bb.i51
  %90 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=1]
  %91 = getelementptr inbounds %struct.BigInt* %90, i32 1 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %91, %struct.BigInt** %42, align 4
  br label %bb39

bb1.i52:                                          ; preds = %_ZN6BigIntC1Em.exit62
  invoke fastcc void @_ZNSt6vectorI6BigIntSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"struct.std::vector<BigInt,std::allocator<BigInt> >"* %7, %struct.BigInt* %87, %struct.BigInt* %4)
          to label %bb39 unwind label %lpad81

bb39:                                             ; preds = %bb1.i52, %.noexc53
  %92 = load i32** %55, align 8                   ; <i32*> [#uses=2]
  %93 = icmp eq i32* %92, null                    ; <i1> [#uses=1]
  br i1 %93, label %bb40, label %bb.i.i.i.i48

bb.i.i.i.i48:                                     ; preds = %bb39
  %94 = bitcast i32* %92 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %94) nounwind
  br label %bb40

bb40:                                             ; preds = %bb.i.i.i.i48, %bb39, %bb31
  store i32 1, i32* %unit_i_addr.i41
  store i32* null, i32** %59, align 8
  store i32* null, i32** %60, align 4
  store i32* null, i32** %61, align 8
  invoke fastcc void @_ZNSt6vectorImSaImEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPmS1_EERKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %62, i32* null, i32* %unit_i_addr.i41)
          to label %_ZN6BigIntC1Em.exit47 unwind label %lpad.i45

invcont1.i42:                                     ; preds = %bb.i.i.i.i46, %lpad.i45
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i43)
  unreachable

lpad.i45:                                         ; preds = %bb40
  %eh_ptr.i43 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select5.i44 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i43, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %95 = load i32** %59, align 8                   ; <i32*> [#uses=2]
  %96 = icmp eq i32* %95, null                    ; <i1> [#uses=1]
  br i1 %96, label %invcont1.i42, label %bb.i.i.i.i46

bb.i.i.i.i46:                                     ; preds = %lpad.i45
  %97 = bitcast i32* %95 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %97) nounwind
  br label %invcont1.i42

_ZN6BigIntC1Em.exit47:                            ; preds = %bb40
  %98 = load %struct.BigInt** %42, align 4        ; <%struct.BigInt*> [#uses=3]
  %99 = load %struct.BigInt** %9, align 4         ; <%struct.BigInt*> [#uses=1]
  %100 = icmp eq %struct.BigInt* %98, %99         ; <i1> [#uses=1]
  br i1 %100, label %bb1.i37, label %bb.i36

bb.i36:                                           ; preds = %_ZN6BigIntC1Em.exit47
  invoke fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %98, %struct.BigInt* %3)
          to label %.noexc38 unwind label %lpad89

.noexc38:                                         ; preds = %bb.i36
  %101 = load %struct.BigInt** %42, align 4       ; <%struct.BigInt*> [#uses=1]
  %102 = getelementptr inbounds %struct.BigInt* %101, i32 1 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %102, %struct.BigInt** %42, align 4
  br label %bb47

bb1.i37:                                          ; preds = %_ZN6BigIntC1Em.exit47
  invoke fastcc void @_ZNSt6vectorI6BigIntSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"struct.std::vector<BigInt,std::allocator<BigInt> >"* %7, %struct.BigInt* %98, %struct.BigInt* %3)
          to label %bb47 unwind label %lpad89

bb47:                                             ; preds = %bb1.i37, %.noexc38
  %103 = load i32** %59, align 8                  ; <i32*> [#uses=2]
  %104 = icmp eq i32* %103, null                  ; <i1> [#uses=1]
  br i1 %104, label %bb72, label %bb.i.i.i.i33

bb.i.i.i.i33:                                     ; preds = %bb47
  %105 = bitcast i32* %103 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %105) nounwind
  br label %bb72

bb48:                                             ; preds = %bb
  call fastcc void @_ZN9Fibonacci10get_numberEj(%struct.BigInt* noalias sret %1, %struct.Fibonacci* %this, i32 %tmp73)
  invoke fastcc void @_ZN9Fibonacci10get_numberEj(%struct.BigInt* noalias sret %0, %struct.Fibonacci* %this, i32 %tmp71)
          to label %invcont49 unwind label %lpad97

invcont49:                                        ; preds = %bb48
  store i32* null, i32** %48, align 8
  store i32* null, i32** %63, align 4
  store i32* null, i32** %64, align 8
  %106 = load i32** %65, align 4                  ; <i32*> [#uses=2]
  %107 = ptrtoint i32* %106 to i32                ; <i32> [#uses=1]
  %108 = load i32** %49, align 8                  ; <i32*> [#uses=2]
  %109 = ptrtoint i32* %108 to i32                ; <i32> [#uses=1]
  %110 = sub i32 %107, %109                       ; <i32> [#uses=1]
  %111 = ashr i32 %110, 2                         ; <i32> [#uses=3]
  %112 = load i32** %66, align 4                  ; <i32*> [#uses=1]
  %113 = ptrtoint i32* %112 to i32                ; <i32> [#uses=1]
  %114 = load i32** %50, align 8                  ; <i32*> [#uses=1]
  %115 = ptrtoint i32* %114 to i32                ; <i32> [#uses=1]
  %116 = sub i32 %113, %115                       ; <i32> [#uses=1]
  %117 = ashr i32 %116, 2                         ; <i32> [#uses=1]
  %118 = icmp ugt i32 %111, %117                  ; <i1> [#uses=1]
  %big1_i.pn17.i = select i1 %118, %struct.BigInt* %0, %struct.BigInt* %1 ; <%struct.BigInt*> [#uses=2]
  %.pn.in.in.i = getelementptr inbounds %struct.BigInt* %big1_i.pn17.i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=1]
  %.pn16.in.in.i = getelementptr inbounds %struct.BigInt* %big1_i.pn17.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %.pn.in.i = load i32** %.pn.in.in.i             ; <i32*> [#uses=1]
  %.pn16.in.i = load i32** %.pn16.in.in.i, align 8 ; <i32*> [#uses=1]
  %.pn.i = ptrtoint i32* %.pn.in.i to i32         ; <i32> [#uses=1]
  %.pn16.i = ptrtoint i32* %.pn16.in.i to i32     ; <i32> [#uses=1]
  %iftmp.98.0.in.i = sub i32 %.pn.i, %.pn16.i     ; <i32> [#uses=1]
  %iftmp.98.0.i = ashr i32 %iftmp.98.0.in.i, 2    ; <i32> [#uses=9]
  store i32 0, i32* %__x_addr.i11.i
  %119 = icmp ugt i32 %111, %iftmp.98.0.i         ; <i1> [#uses=1]
  br i1 %119, label %bb.i12.i, label %bb1.i13.i

bb.i12.i:                                         ; preds = %invcont49
  %120 = getelementptr inbounds i32* %108, i32 %iftmp.98.0.i ; <i32*> [#uses=1]
  store i32* %120, i32** %65, align 4
  br label %invcont.i

bb1.i13.i:                                        ; preds = %invcont49
  %121 = sub i32 %iftmp.98.0.i, %111              ; <i32> [#uses=1]
  invoke fastcc void @_ZNSt6vectorImSaImEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPmS1_EEjRKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %69, i32* %106, i32 %121, i32* %__x_addr.i11.i)
          to label %invcont.i unwind label %ppad.i.loopexit

invcont.i:                                        ; preds = %bb1.i13.i, %bb.i12.i
  store i32 0, i32* %__x_addr.i6.i
  %122 = load i32** %66, align 4                  ; <i32*> [#uses=2]
  %123 = ptrtoint i32* %122 to i32                ; <i32> [#uses=1]
  %124 = load i32** %50, align 8                  ; <i32*> [#uses=2]
  %125 = ptrtoint i32* %124 to i32                ; <i32> [#uses=1]
  %126 = sub i32 %123, %125                       ; <i32> [#uses=1]
  %127 = ashr i32 %126, 2                         ; <i32> [#uses=2]
  %128 = icmp ugt i32 %127, %iftmp.98.0.i         ; <i1> [#uses=1]
  br i1 %128, label %bb.i7.i, label %bb1.i8.i

bb.i7.i:                                          ; preds = %invcont.i
  %129 = getelementptr inbounds i32* %124, i32 %iftmp.98.0.i ; <i32*> [#uses=1]
  store i32* %129, i32** %66, align 4
  br label %invcont3.i

bb1.i8.i:                                         ; preds = %invcont.i
  %130 = sub i32 %iftmp.98.0.i, %127              ; <i32> [#uses=1]
  invoke fastcc void @_ZNSt6vectorImSaImEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPmS1_EEjRKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %68, i32* %122, i32 %130, i32* %__x_addr.i6.i)
          to label %invcont3.i unwind label %ppad.i.loopexit

invcont3.i:                                       ; preds = %bb1.i8.i, %bb.i7.i
  store i32 0, i32* %__x_addr.i.i
  %131 = load i32** %63, align 4                  ; <i32*> [#uses=2]
  %132 = ptrtoint i32* %131 to i32                ; <i32> [#uses=1]
  %133 = load i32** %48, align 8                  ; <i32*> [#uses=2]
  %134 = ptrtoint i32* %133 to i32                ; <i32> [#uses=1]
  %135 = sub i32 %132, %134                       ; <i32> [#uses=1]
  %136 = ashr i32 %135, 2                         ; <i32> [#uses=2]
  %137 = icmp ugt i32 %136, %iftmp.98.0.i         ; <i1> [#uses=1]
  br i1 %137, label %bb.i3.i, label %bb1.i4.i

bb.i3.i:                                          ; preds = %invcont3.i
  %138 = getelementptr inbounds i32* %133, i32 %iftmp.98.0.i ; <i32*> [#uses=1]
  store i32* %138, i32** %63, align 4
  br label %invcont4.i

bb1.i4.i:                                         ; preds = %invcont3.i
  %139 = sub i32 %iftmp.98.0.i, %136              ; <i32> [#uses=1]
  invoke fastcc void @_ZNSt6vectorImSaImEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPmS1_EEjRKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %67, i32* %131, i32 %139, i32* %__x_addr.i.i)
          to label %invcont4.i unwind label %ppad.i.loopexit

invcont4.i:                                       ; preds = %bb1.i4.i, %bb.i3.i
  store i32 0, i32* @_ZN6BigInt6head_sE, align 4
  %140 = load i32** %63, align 4                  ; <i32*> [#uses=1]
  %141 = ptrtoint i32* %140 to i32                ; <i32> [#uses=1]
  %142 = load i32** %48, align 8                  ; <i32*> [#uses=3]
  %143 = ptrtoint i32* %142 to i32                ; <i32> [#uses=1]
  %144 = sub i32 %141, %143                       ; <i32> [#uses=3]
  %145 = ashr i32 %144, 2                         ; <i32> [#uses=1]
  %146 = icmp ugt i32 %145, 1073741823            ; <i1> [#uses=1]
  br i1 %146, label %bb.i.i.i.i.i.i.i, label %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %invcont4.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i.i unwind label %lpad.i.i.i.i.i

.noexc.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i.i.i.i
  unreachable

_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i: ; preds = %invcont4.i
  %147 = and i32 %144, -4                         ; <i32> [#uses=1]
  %148 = invoke i8* @_Znwj(i32 %147)
          to label %invcont9.i unwind label %lpad.i.i.i.i.i ; <i8*> [#uses=3]

lpad.i.i.i.i.i:                                   ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i
  %eh_ptr.i.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i.i)
          to label %.noexc2.i unwind label %ppad.i

.noexc2.i:                                        ; preds = %lpad.i.i.i.i.i
  unreachable

invcont9.i:                                       ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i
  %149 = bitcast i32* %142 to i8*                 ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %148, i8* %149, i32 %144, i32 4) nounwind
  %150 = load i32** %48, align 8                  ; <i32*> [#uses=1]
  %151 = load i32** %50, align 8                  ; <i32*> [#uses=1]
  %152 = load i32** %65, align 4                  ; <i32*> [#uses=2]
  %153 = load i32** %49, align 8                  ; <i32*> [#uses=3]
  %154 = icmp eq i32* %153, %152                  ; <i1> [#uses=1]
  br i1 %154, label %bb20.i, label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i1.i, %invcont9.i
  %indvar.i.i = phi i32 [ %tmp.i5, %bb.i1.i ], [ 0, %invcont9.i ] ; <i32> [#uses=4]
  %tmp.i5 = add i32 %indvar.i.i, 1                ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr i32* %153, i32 %tmp.i5 ; <i32*> [#uses=1]
  %__first2_addr.0.01.i.i = getelementptr i32* %151, i32 %indvar.i.i ; <i32*> [#uses=1]
  %__result_addr.0.02.i.i = getelementptr i32* %150, i32 %indvar.i.i ; <i32*> [#uses=1]
  %__first1_addr.0.03.i.i = getelementptr i32* %153, i32 %indvar.i.i ; <i32*> [#uses=1]
  %155 = load i32* %__first2_addr.0.01.i.i, align 4 ; <i32> [#uses=1]
  %156 = load i32* %__first1_addr.0.03.i.i, align 4 ; <i32> [#uses=1]
  %157 = load i32* @_ZN6BigInt6head_sE, align 4   ; <i32> [#uses=1]
  %158 = add i32 %156, %155                       ; <i32> [#uses=1]
  %159 = add i32 %158, %157                       ; <i32> [#uses=2]
  %160 = udiv i32 %159, 1000000000                ; <i32> [#uses=1]
  store i32 %160, i32* @_ZN6BigInt6head_sE, align 4
  %161 = urem i32 %159, 1000000000                ; <i32> [#uses=1]
  store i32 %161, i32* %__result_addr.0.02.i.i, align 4
  %162 = icmp eq i32* %scevgep.i.i, %152          ; <i1> [#uses=1]
  br i1 %162, label %bb20.i, label %bb.i1.i

bb20.i:                                           ; preds = %bb.i1.i, %invcont9.i
  %163 = icmp eq i8* %148, null                   ; <i1> [#uses=1]
  br i1 %163, label %invcont21.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb20.i
  call void @_ZdlPv(i8* %148) nounwind
  br label %invcont21.i

invcont21.i:                                      ; preds = %bb.i.i.i.i.i, %bb20.i
  %164 = load i32* @_ZN6BigInt6head_sE, align 4   ; <i32> [#uses=2]
  %165 = icmp eq i32 %164, 0                      ; <i1> [#uses=1]
  br i1 %165, label %invcont50, label %bb22.i

bb22.i:                                           ; preds = %invcont21.i
  %166 = load i32** %63, align 4                  ; <i32*> [#uses=5]
  %167 = load i32** %64, align 8                  ; <i32*> [#uses=1]
  %168 = icmp eq i32* %166, %167                  ; <i1> [#uses=1]
  br i1 %168, label %bb1.i.i, label %bb.i.i6

bb.i.i6:                                          ; preds = %bb22.i
  %169 = icmp eq i32* %166, null                  ; <i1> [#uses=1]
  br i1 %169, label %_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit.i.i, label %bb.i.i.i7

bb.i.i.i7:                                        ; preds = %bb.i.i6
  store i32 %164, i32* %166
  %.pre.i.i = load i32** %63, align 4             ; <i32*> [#uses=1]
  br label %_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit.i.i

_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit.i.i: ; preds = %bb.i.i.i7, %bb.i.i6
  %170 = phi i32* [ %.pre.i.i, %bb.i.i.i7 ], [ %166, %bb.i.i6 ] ; <i32*> [#uses=1]
  %171 = getelementptr inbounds i32* %170, i32 1  ; <i32*> [#uses=1]
  store i32* %171, i32** %63, align 4
  br label %invcont50

bb1.i.i:                                          ; preds = %bb22.i
  invoke fastcc void @_ZNSt6vectorImSaImEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPmS1_EERKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %67, i32* %166, i32* @_ZN6BigInt6head_sE)
          to label %invcont50 unwind label %ppad.i.loopexit

invcont27.i:                                      ; preds = %bb.i.i.i.i10, %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i9)
          to label %.noexc11 unwind label %lpad101

.noexc11:                                         ; preds = %invcont27.i
  unreachable

ppad.i.loopexit:                                  ; preds = %bb1.i.i, %bb1.i4.i, %bb1.i8.i, %bb1.i13.i
  %.pre = load i32** %48, align 8                 ; <i32*> [#uses=1]
  br label %ppad.i

ppad.i:                                           ; preds = %ppad.i.loopexit, %lpad.i.i.i.i.i
  %172 = phi i32* [ %.pre, %ppad.i.loopexit ], [ %142, %lpad.i.i.i.i.i ] ; <i32*> [#uses=2]
  %eh_ptr.i9 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=2]
  %eh_select31.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i9, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %173 = icmp eq i32* %172, null                  ; <i1> [#uses=1]
  br i1 %173, label %invcont27.i, label %bb.i.i.i.i10

bb.i.i.i.i10:                                     ; preds = %ppad.i
  %174 = bitcast i32* %172 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %174) nounwind
  br label %invcont27.i

invcont50:                                        ; preds = %bb1.i.i, %_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit.i.i, %invcont21.i
  %175 = load %struct.BigInt** %42, align 4       ; <%struct.BigInt*> [#uses=3]
  %176 = load %struct.BigInt** %9, align 4        ; <%struct.BigInt*> [#uses=1]
  %177 = icmp eq %struct.BigInt* %175, %176       ; <i1> [#uses=1]
  br i1 %177, label %bb1.i22, label %bb.i21

bb.i21:                                           ; preds = %invcont50
  invoke fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %175, %struct.BigInt* %2)
          to label %.noexc23 unwind label %lpad105

.noexc23:                                         ; preds = %bb.i21
  %178 = load %struct.BigInt** %42, align 4       ; <%struct.BigInt*> [#uses=1]
  %179 = getelementptr inbounds %struct.BigInt* %178, i32 1 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %179, %struct.BigInt** %42, align 4
  br label %bb57

bb1.i22:                                          ; preds = %invcont50
  invoke fastcc void @_ZNSt6vectorI6BigIntSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"struct.std::vector<BigInt,std::allocator<BigInt> >"* %7, %struct.BigInt* %175, %struct.BigInt* %2)
          to label %bb57 unwind label %lpad105

bb57:                                             ; preds = %bb1.i22, %.noexc23
  %180 = load i32** %48, align 8                  ; <i32*> [#uses=2]
  %181 = icmp eq i32* %180, null                  ; <i1> [#uses=1]
  br i1 %181, label %bb64, label %bb.i.i.i.i18

bb.i.i.i.i18:                                     ; preds = %bb57
  %182 = bitcast i32* %180 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %182) nounwind
  br label %bb64

bb64:                                             ; preds = %bb.i.i.i.i18, %bb57
  %183 = load i32** %49, align 8                  ; <i32*> [#uses=2]
  %184 = icmp eq i32* %183, null                  ; <i1> [#uses=1]
  br i1 %184, label %bb71, label %bb.i.i.i.i15

bb.i.i.i.i15:                                     ; preds = %bb64
  %185 = bitcast i32* %183 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %185) nounwind
  br label %bb71

bb71:                                             ; preds = %bb.i.i.i.i15, %bb64
  %186 = load i32** %50, align 8                  ; <i32*> [#uses=2]
  %187 = icmp eq i32* %186, null                  ; <i1> [#uses=1]
  br i1 %187, label %bb72, label %bb.i.i.i.i12

bb.i.i.i.i12:                                     ; preds = %bb71
  %188 = bitcast i32* %186 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %188) nounwind
  br label %bb72

bb72:                                             ; preds = %bb.i.i.i.i12, %bb71, %bb.i.i.i.i33, %bb47, %bb.i.i.i.i63, %bb30
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb73

bb73:                                             ; preds = %bb72, %_ZNSt6vectorI6BigIntSaIS0_EE7reserveEj.exit
  %indvar = phi i32 [ 0, %_ZNSt6vectorI6BigIntSaIS0_EE7reserveEj.exit ], [ %indvar.next, %bb72 ] ; <i32> [#uses=4]
  %tmp71 = add i32 %indvar, %tmp                  ; <i32> [#uses=1]
  %tmp73 = add i32 %indvar, %tmp72                ; <i32> [#uses=1]
  %i.0 = add i32 %indvar, %47                     ; <i32> [#uses=2]
  %189 = icmp ugt i32 %i.0, %n_i                  ; <i1> [#uses=1]
  br i1 %189, label %bb74, label %bb

bb74:                                             ; preds = %bb73
  %190 = load %struct.BigInt** %12, align 4       ; <%struct.BigInt*> [#uses=2]
  %191 = getelementptr inbounds %struct.BigInt* %190, i32 %n_i, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=2]
  %192 = load i32** %191, align 4                 ; <i32*> [#uses=1]
  %193 = ptrtoint i32* %192 to i32                ; <i32> [#uses=1]
  %194 = getelementptr inbounds %struct.BigInt* %190, i32 %n_i, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  %195 = load i32** %194, align 4                 ; <i32*> [#uses=1]
  %196 = ptrtoint i32* %195 to i32                ; <i32> [#uses=1]
  %197 = sub i32 %193, %196                       ; <i32> [#uses=2]
  %198 = ashr i32 %197, 2                         ; <i32> [#uses=2]
  %199 = getelementptr inbounds %struct.BigInt* %agg.result, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  store i32* null, i32** %199, align 4
  %200 = getelementptr inbounds %struct.BigInt* %agg.result, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=3]
  store i32* null, i32** %200, align 4
  %201 = getelementptr inbounds %struct.BigInt* %agg.result, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  store i32* null, i32** %201, align 4
  %202 = icmp ugt i32 %198, 1073741823            ; <i1> [#uses=1]
  br i1 %202, label %bb.i.i.i.i.i.i, label %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb74
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i unwind label %lpad.i.i.i.i

.noexc.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i.i
  unreachable

_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i: ; preds = %bb74
  %203 = and i32 %197, -4                         ; <i32> [#uses=1]
  %204 = invoke i8* @_Znwj(i32 %203)
          to label %_ZN6BigIntC1ERKS_.exit unwind label %lpad.i.i.i.i ; <i8*> [#uses=2]

lpad.i.i.i.i:                                     ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i, %bb.i.i.i.i.i.i
  %eh_ptr.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i)
  unreachable

_ZN6BigIntC1ERKS_.exit:                           ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i
  %205 = bitcast i8* %204 to i32*                 ; <i32*> [#uses=4]
  store i32* %205, i32** %199, align 4
  store i32* %205, i32** %200, align 4
  %206 = getelementptr inbounds i32* %205, i32 %198 ; <i32*> [#uses=1]
  store i32* %206, i32** %201, align 4
  %207 = load i32** %191, align 4                 ; <i32*> [#uses=1]
  %208 = load i32** %194, align 4                 ; <i32*> [#uses=2]
  %209 = ptrtoint i32* %207 to i32                ; <i32> [#uses=1]
  %210 = ptrtoint i32* %208 to i32                ; <i32> [#uses=1]
  %211 = sub i32 %209, %210                       ; <i32> [#uses=2]
  %212 = bitcast i32* %208 to i8*                 ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %204, i8* %212, i32 %211, i32 4) nounwind
  %213 = ashr i32 %211, 2                         ; <i32> [#uses=1]
  %214 = getelementptr inbounds i32* %205, i32 %213 ; <i32*> [#uses=1]
  store i32* %214, i32** %200, align 4
  ret void

lpad:                                             ; preds = %bb1.i, %bb.i
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=3]
  %eh_select76 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %215 = load i32** %51, align 8                  ; <i32*> [#uses=2]
  %216 = icmp eq i32* %215, null                  ; <i1> [#uses=1]
  br i1 %216, label %Unwind, label %bb.i.i.i.i9

bb.i.i.i.i9:                                      ; preds = %lpad
  %217 = bitcast i32* %215 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %217) nounwind
  br label %Unwind

lpad81:                                           ; preds = %bb1.i52, %bb.i51
  %eh_ptr82 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select84 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr82, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %218 = load i32** %55, align 8                  ; <i32*> [#uses=2]
  %219 = icmp eq i32* %218, null                  ; <i1> [#uses=1]
  br i1 %219, label %Unwind, label %bb.i.i.i.i6

bb.i.i.i.i6:                                      ; preds = %lpad81
  %220 = bitcast i32* %218 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %220) nounwind
  br label %Unwind

lpad89:                                           ; preds = %bb1.i37, %bb.i36
  %eh_ptr90 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select92 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr90, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %221 = load i32** %59, align 8                  ; <i32*> [#uses=2]
  %222 = icmp eq i32* %221, null                  ; <i1> [#uses=1]
  br i1 %222, label %Unwind, label %bb.i.i.i.i3

bb.i.i.i.i3:                                      ; preds = %lpad89
  %223 = bitcast i32* %221 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %223) nounwind
  br label %Unwind

lpad97:                                           ; preds = %bb48
  %eh_ptr98 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select100 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr98, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad126

lpad101:                                          ; preds = %invcont27.i
  %eh_ptr102 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=2]
  %eh_select104 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr102, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad127

lpad105:                                          ; preds = %bb1.i22, %bb.i21
  %eh_ptr106 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=3]
  %eh_select108 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr106, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %224 = load i32** %48, align 8                  ; <i32*> [#uses=2]
  %225 = icmp eq i32* %224, null                  ; <i1> [#uses=1]
  br i1 %225, label %ppad127, label %bb.i.i.i.i2

bb.i.i.i.i2:                                      ; preds = %lpad105
  %226 = bitcast i32* %224 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %226) nounwind
  br label %ppad127

ppad126:                                          ; preds = %bb.i.i.i.i30, %ppad127, %lpad97
  %eh_exception.2 = phi i8* [ %eh_ptr98, %lpad97 ], [ %eh_exception.1, %bb.i.i.i.i30 ], [ %eh_exception.1, %ppad127 ] ; <i8*> [#uses=2]
  %227 = load i32** %50, align 8                  ; <i32*> [#uses=2]
  %228 = icmp eq i32* %227, null                  ; <i1> [#uses=1]
  br i1 %228, label %Unwind, label %bb.i.i.i.i27

bb.i.i.i.i27:                                     ; preds = %ppad126
  %229 = bitcast i32* %227 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %229) nounwind
  br label %Unwind

ppad127:                                          ; preds = %bb.i.i.i.i2, %lpad105, %lpad101
  %eh_exception.1 = phi i8* [ %eh_ptr102, %lpad101 ], [ %eh_ptr106, %bb.i.i.i.i2 ], [ %eh_ptr106, %lpad105 ] ; <i8*> [#uses=2]
  %230 = load i32** %49, align 8                  ; <i32*> [#uses=2]
  %231 = icmp eq i32* %230, null                  ; <i1> [#uses=1]
  br i1 %231, label %ppad126, label %bb.i.i.i.i30

bb.i.i.i.i30:                                     ; preds = %ppad127
  %232 = bitcast i32* %230 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %232) nounwind
  br label %ppad126

Unwind:                                           ; preds = %bb.i.i.i.i27, %ppad126, %bb.i.i.i.i3, %lpad89, %bb.i.i.i.i6, %lpad81, %bb.i.i.i.i9, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %bb.i.i.i.i9 ], [ %eh_ptr82, %bb.i.i.i.i6 ], [ %eh_ptr90, %bb.i.i.i.i3 ], [ %eh_exception.2, %bb.i.i.i.i27 ], [ %eh_ptr, %lpad ], [ %eh_ptr82, %lpad81 ], [ %eh_ptr90, %lpad89 ], [ %eh_exception.2, %ppad126 ] ; <i8*> [#uses=1]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable
}

define internal void @_GLOBAL__I__ZN9Fibonacci10get_numberEj() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<BigInt>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<BigInt>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<BigInt>"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<BigInt>"*)

declare i32 @strlen(i8* nocapture) nounwind readonly

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare void @llvm.memory.barrier(i1, i1, i1, i1, i1) nounwind

declare i32 @llvm.atomic.load.add.i32.p0i32(i32* nocapture, i32) nounwind

declare void @_ZdlPv(i8*) nounwind

declare void @_ZSt9terminatev() noreturn nounwind

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define internal fastcc i8* @_ZNSs4_Rep8_M_cloneERKSaIcEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* nocapture %this) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %this, i32 0, i32 0, i32 0 ; <i32*> [#uses=3]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=5]
  %2 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %this, i32 0, i32 0, i32 1 ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=3]
  %4 = icmp ult i32 %1, 1073741821                ; <i1> [#uses=1]
  br i1 %4, label %bb1.i, label %bb.i

bb.i:                                             ; preds = %entry
  tail call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

bb1.i:                                            ; preds = %entry
  %5 = icmp ugt i32 %1, %3                        ; <i1> [#uses=1]
  br i1 %5, label %bb2.i, label %bb4.i

bb2.i:                                            ; preds = %bb1.i
  %6 = shl i32 %3, 1                              ; <i32> [#uses=2]
  %7 = icmp ugt i32 %6, %1                        ; <i1> [#uses=1]
  %.__capacity.i = select i1 %7, i32 %6, i32 %1   ; <i32> [#uses=1]
  br label %bb4.i

bb4.i:                                            ; preds = %bb2.i, %bb1.i
  %__capacity_addr.0.i = phi i32 [ %.__capacity.i, %bb2.i ], [ %1, %bb1.i ] ; <i32> [#uses=5]
  %8 = add i32 %__capacity_addr.0.i, 29           ; <i32> [#uses=2]
  %9 = icmp ugt i32 %8, 4096                      ; <i1> [#uses=1]
  %10 = icmp ugt i32 %__capacity_addr.0.i, %3     ; <i1> [#uses=1]
  %11 = and i1 %9, %10                            ; <i1> [#uses=1]
  br i1 %11, label %bb7.i, label %bb10.i

bb7.i:                                            ; preds = %bb4.i
  %12 = and i32 %8, 4095                          ; <i32> [#uses=1]
  %13 = sub i32 4096, %12                         ; <i32> [#uses=1]
  %14 = add i32 %13, %__capacity_addr.0.i         ; <i32> [#uses=2]
  %15 = icmp ugt i32 %14, 1073741820              ; <i1> [#uses=1]
  %__capacity_addr.2.i = select i1 %15, i32 1073741820, i32 %14 ; <i32> [#uses=2]
  br label %bb10.i

bb10.i:                                           ; preds = %bb7.i, %bb4.i
  %__size.0.in.i = phi i32 [ %__capacity_addr.2.i, %bb7.i ], [ %__capacity_addr.0.i, %bb4.i ] ; <i32> [#uses=1]
  %__capacity_addr.1.i = phi i32 [ %__capacity_addr.2.i, %bb7.i ], [ %__capacity_addr.0.i, %bb4.i ] ; <i32> [#uses=1]
  %__size.0.i = add i32 %__size.0.in.i, 13        ; <i32> [#uses=1]
  %16 = invoke i8* @_Znwj(i32 %__size.0.i)
          to label %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit unwind label %lpad.i ; <i8*> [#uses=6]

lpad.i:                                           ; preds = %bb10.i
  %eh_ptr.i = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select14.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
  unreachable

_ZNSs4_Rep9_S_createEjjRKSaIcE.exit:              ; preds = %bb10.i
  %17 = getelementptr inbounds i8* %16, i32 4     ; <i8*> [#uses=1]
  %18 = bitcast i8* %17 to i32*                   ; <i32*> [#uses=1]
  store i32 %__capacity_addr.1.i, i32* %18, align 4
  %19 = getelementptr inbounds i8* %16, i32 8     ; <i8*> [#uses=1]
  %20 = bitcast i8* %19 to i32*                   ; <i32*> [#uses=2]
  store i32 0, i32* %20, align 4
  %21 = load i32* %0, align 4                     ; <i32> [#uses=3]
  %22 = icmp eq i32 %21, 0                        ; <i1> [#uses=1]
  br i1 %22, label %bb1, label %bb

bb:                                               ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit
  %23 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %this, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*> [#uses=1]
  %24 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %23 to i8* ; <i8*> [#uses=2]
  %25 = getelementptr inbounds i8* %16, i32 12    ; <i8*> [#uses=2]
  %26 = icmp eq i32 %21, 1                        ; <i1> [#uses=1]
  br i1 %26, label %bb.i1, label %bb1.i2

bb.i1:                                            ; preds = %bb
  %27 = load i8* %24, align 1                     ; <i8> [#uses=1]
  store i8 %27, i8* %25
  br label %bb1

bb1.i2:                                           ; preds = %bb
  tail call void @llvm.memcpy.i32(i8* %25, i8* %24, i32 %21, i32 1) nounwind
  br label %bb1

bb1:                                              ; preds = %bb1.i2, %bb.i1, %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit
  %28 = load i32* %0, align 4                     ; <i32> [#uses=2]
  store i32 0, i32* %20, align 4
  %29 = bitcast i8* %16 to i32*                   ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4
  %.sum = add i32 %28, 12                         ; <i32> [#uses=1]
  %30 = getelementptr inbounds i8* %16, i32 %.sum ; <i8*> [#uses=1]
  %31 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %31, i8* %30, align 1
  %32 = getelementptr inbounds i8* %16, i32 12    ; <i8*> [#uses=1]
  ret i8* %32
}

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define internal fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %__p, %struct.BigInt* nocapture %__val) {
entry:
  %0 = icmp eq %struct.BigInt* %__p, null         ; <i1> [#uses=1]
  br i1 %0, label %bb3, label %bb

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds %struct.BigInt* %__val, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=2]
  %2 = load i32** %1, align 4                     ; <i32*> [#uses=1]
  %3 = ptrtoint i32* %2 to i32                    ; <i32> [#uses=1]
  %4 = getelementptr inbounds %struct.BigInt* %__val, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  %5 = load i32** %4, align 4                     ; <i32*> [#uses=1]
  %6 = ptrtoint i32* %5 to i32                    ; <i32> [#uses=1]
  %7 = sub i32 %3, %6                             ; <i32> [#uses=2]
  %8 = ashr i32 %7, 2                             ; <i32> [#uses=2]
  %9 = getelementptr inbounds %struct.BigInt* %__p, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  store i32* null, i32** %9, align 4
  %10 = getelementptr inbounds %struct.BigInt* %__p, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=3]
  store i32* null, i32** %10, align 4
  %11 = getelementptr inbounds %struct.BigInt* %__p, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  store i32* null, i32** %11, align 4
  %12 = icmp ugt i32 %8, 1073741823               ; <i1> [#uses=1]
  br i1 %12, label %bb.i.i.i.i.i.i, label %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i unwind label %lpad.i.i.i.i

.noexc.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i.i
  unreachable

_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i: ; preds = %bb
  %13 = and i32 %7, -4                            ; <i32> [#uses=1]
  %14 = invoke i8* @_Znwj(i32 %13)
          to label %bb2 unwind label %lpad.i.i.i.i ; <i8*> [#uses=2]

lpad.i.i.i.i:                                     ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i, %bb.i.i.i.i.i.i
  %eh_ptr.i.i.i.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %lpad.i.i.i.i
  unreachable

bb2:                                              ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i
  %15 = bitcast i8* %14 to i32*                   ; <i32*> [#uses=4]
  store i32* %15, i32** %9, align 4
  store i32* %15, i32** %10, align 4
  %16 = getelementptr inbounds i32* %15, i32 %8   ; <i32*> [#uses=1]
  store i32* %16, i32** %11, align 4
  %17 = load i32** %1, align 4                    ; <i32*> [#uses=1]
  %18 = load i32** %4, align 4                    ; <i32*> [#uses=2]
  %19 = ptrtoint i32* %17 to i32                  ; <i32> [#uses=1]
  %20 = ptrtoint i32* %18 to i32                  ; <i32> [#uses=1]
  %21 = sub i32 %19, %20                          ; <i32> [#uses=2]
  %22 = bitcast i32* %18 to i8*                   ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %14, i8* %22, i32 %21, i32 4) nounwind
  %23 = ashr i32 %21, 2                           ; <i32> [#uses=1]
  %24 = getelementptr inbounds i32* %15, i32 %23  ; <i32*> [#uses=1]
  store i32* %24, i32** %10, align 4
  ret void

bb3:                                              ; preds = %entry
  ret void

lpad:                                             ; preds = %lpad.i.i.i.i
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select6 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable
}

declare i32 @memcmp(i8* nocapture, i8* nocapture, i32) nounwind readonly

declare void @__cxa_rethrow() noreturn

declare void @_ZSt19__throw_logic_errorPKc(i8*) noreturn

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

define internal fastcc i8* @_ZNSs12_S_constructIPcEES0_T_S1_RKSaIcESt20forward_iterator_tag(i8* %__beg, i8* %__end) {
entry:
  %0 = icmp eq i8* %__beg, %__end                 ; <i1> [#uses=1]
  br i1 %0, label %bb11, label %bb12

bb11:                                             ; preds = %entry
  ret i8* bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*)

bb12:                                             ; preds = %entry
  %toBool13 = icmp eq i8* %__beg, null            ; <i1> [#uses=1]
  br i1 %toBool13, label %bb22, label %bb23

bb22:                                             ; preds = %bb12
  tail call void @_ZSt19__throw_logic_errorPKc(i8* getelementptr inbounds ([42 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

bb23:                                             ; preds = %bb12
  %1 = ptrtoint i8* %__end to i32                 ; <i32> [#uses=1]
  %2 = ptrtoint i8* %__beg to i32                 ; <i32> [#uses=1]
  %3 = sub i32 %1, %2                             ; <i32> [#uses=9]
  %4 = icmp ugt i32 %3, 1073741820                ; <i1> [#uses=1]
  br i1 %4, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %bb23
  tail call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

bb1.i:                                            ; preds = %bb23
  %5 = add i32 %3, 29                             ; <i32> [#uses=2]
  %6 = icmp ugt i32 %5, 4096                      ; <i1> [#uses=1]
  %7 = icmp ne i8* %__end, %__beg                 ; <i1> [#uses=1]
  %8 = and i1 %6, %7                              ; <i1> [#uses=1]
  br i1 %8, label %bb7.i, label %bb10.i

bb7.i:                                            ; preds = %bb1.i
  %9 = and i32 %5, 4095                           ; <i32> [#uses=1]
  %10 = sub i32 4096, %9                          ; <i32> [#uses=1]
  %11 = add i32 %10, %3                           ; <i32> [#uses=2]
  %12 = icmp ugt i32 %11, 1073741820              ; <i1> [#uses=1]
  %__capacity_addr.2.i = select i1 %12, i32 1073741820, i32 %11 ; <i32> [#uses=2]
  br label %bb10.i

bb10.i:                                           ; preds = %bb7.i, %bb1.i
  %__size.0.in.i = phi i32 [ %__capacity_addr.2.i, %bb7.i ], [ %3, %bb1.i ] ; <i32> [#uses=1]
  %__capacity_addr.1.i = phi i32 [ %__capacity_addr.2.i, %bb7.i ], [ %3, %bb1.i ] ; <i32> [#uses=1]
  %__size.0.i = add i32 %__size.0.in.i, 13        ; <i32> [#uses=1]
  %13 = invoke i8* @_Znwj(i32 %__size.0.i)
          to label %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit unwind label %lpad.i ; <i8*> [#uses=5]

lpad.i:                                           ; preds = %bb10.i
  %eh_ptr.i = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select14.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
  unreachable

_ZNSs4_Rep9_S_createEjjRKSaIcE.exit:              ; preds = %bb10.i
  %14 = getelementptr inbounds i8* %13, i32 4     ; <i8*> [#uses=1]
  %15 = bitcast i8* %14 to i32*                   ; <i32*> [#uses=1]
  store i32 %__capacity_addr.1.i, i32* %15, align 4
  %16 = getelementptr inbounds i8* %13, i32 8     ; <i8*> [#uses=1]
  %17 = bitcast i8* %16 to i32*                   ; <i32*> [#uses=2]
  store i32 0, i32* %17, align 4
  %18 = getelementptr inbounds i8* %13, i32 12    ; <i8*> [#uses=3]
  %19 = icmp eq i32 %3, 1                         ; <i1> [#uses=1]
  br i1 %19, label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit
  %20 = load i8* %__beg, align 1                  ; <i8> [#uses=1]
  store i8 %20, i8* %18
  br label %bb30

bb1.i.i:                                          ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit
  tail call void @llvm.memcpy.i32(i8* %18, i8* %__beg, i32 %3, i32 1) nounwind
  br label %bb30

bb30:                                             ; preds = %bb1.i.i, %bb.i.i
  store i32 0, i32* %17, align 4
  %21 = bitcast i8* %13 to i32*                   ; <i32*> [#uses=1]
  store i32 %3, i32* %21, align 4
  %.sum = add i32 %3, 12                          ; <i32> [#uses=1]
  %22 = getelementptr inbounds i8* %13, i32 %.sum ; <i8*> [#uses=1]
  %23 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %23, i8* %22, align 1
  ret i8* %18
}

define internal fastcc %struct.BigInt* @_ZSt24__uninitialized_copy_auxIP6BigIntS1_ET0_T_S3_S2_St12__false_type(%struct.BigInt* %__first, %struct.BigInt* %__last, %struct.BigInt* %__result) {
entry:
  br label %bb1

bb:                                               ; preds = %bb1
  %0 = icmp eq %struct.BigInt* %__cur.0, null     ; <i1> [#uses=1]
  br i1 %0, label %invcont, label %bb.i

bb.i:                                             ; preds = %bb
  %1 = getelementptr inbounds %struct.BigInt* %__first, i32 %indvar, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=2]
  %2 = load i32** %1, align 4                     ; <i32*> [#uses=1]
  %3 = ptrtoint i32* %2 to i32                    ; <i32> [#uses=1]
  %4 = getelementptr inbounds %struct.BigInt* %__first, i32 %indvar, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  %5 = load i32** %4, align 4                     ; <i32*> [#uses=1]
  %6 = ptrtoint i32* %5 to i32                    ; <i32> [#uses=1]
  %7 = sub i32 %3, %6                             ; <i32> [#uses=2]
  %8 = ashr i32 %7, 2                             ; <i32> [#uses=2]
  %9 = getelementptr inbounds %struct.BigInt* %__result, i32 %indvar, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  store i32* null, i32** %9, align 4
  %10 = getelementptr inbounds %struct.BigInt* %__result, i32 %indvar, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=3]
  store i32* null, i32** %10, align 4
  %11 = getelementptr inbounds %struct.BigInt* %__result, i32 %indvar, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  store i32* null, i32** %11, align 4
  %12 = icmp ugt i32 %8, 1073741823               ; <i1> [#uses=1]
  br i1 %12, label %bb.i.i.i.i.i.i.i1, label %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i

bb.i.i.i.i.i.i.i1:                                ; preds = %bb.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i.i unwind label %lpad.i.i.i.i.i

.noexc.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i.i.i.i1
  unreachable

_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i: ; preds = %bb.i
  %13 = and i32 %7, -4                            ; <i32> [#uses=1]
  %14 = invoke i8* @_Znwj(i32 %13)
          to label %bb2.i unwind label %lpad.i.i.i.i.i ; <i8*> [#uses=2]

lpad.i.i.i.i.i:                                   ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i1
  %eh_ptr.i.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i.i)
          to label %.noexc.i unwind label %lpad.i

.noexc.i:                                         ; preds = %lpad.i.i.i.i.i
  unreachable

bb2.i:                                            ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i.i
  %15 = bitcast i8* %14 to i32*                   ; <i32*> [#uses=4]
  store i32* %15, i32** %9, align 4
  store i32* %15, i32** %10, align 4
  %16 = getelementptr inbounds i32* %15, i32 %8   ; <i32*> [#uses=1]
  store i32* %16, i32** %11, align 4
  %17 = load i32** %1, align 4                    ; <i32*> [#uses=1]
  %18 = load i32** %4, align 4                    ; <i32*> [#uses=2]
  %19 = ptrtoint i32* %17 to i32                  ; <i32> [#uses=1]
  %20 = ptrtoint i32* %18 to i32                  ; <i32> [#uses=1]
  %21 = sub i32 %19, %20                          ; <i32> [#uses=2]
  %22 = bitcast i32* %18 to i8*                   ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %14, i8* %22, i32 %21, i32 4) nounwind
  %23 = ashr i32 %21, 2                           ; <i32> [#uses=1]
  %24 = getelementptr inbounds i32* %15, i32 %23  ; <i32*> [#uses=1]
  store i32* %24, i32** %10, align 4
  br label %invcont

lpad.i:                                           ; preds = %lpad.i.i.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select6.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %lpad.i
  unreachable

invcont:                                          ; preds = %bb2.i, %bb
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %invcont, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %invcont ] ; <i32> [#uses=9]
  %__cur.0 = getelementptr %struct.BigInt* %__result, i32 %indvar ; <%struct.BigInt*> [#uses=3]
  %__first_addr.0 = getelementptr %struct.BigInt* %__first, i32 %indvar ; <%struct.BigInt*> [#uses=1]
  %25 = icmp eq %struct.BigInt* %__first_addr.0, %__last ; <i1> [#uses=1]
  br i1 %25, label %bb2, label %bb

bb2:                                              ; preds = %bb1
  ret %struct.BigInt* %__cur.0

invcont4:                                         ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i, %lpad
  invoke void @__cxa_rethrow() noreturn
          to label %invcont5 unwind label %lpad13

invcont5:                                         ; preds = %invcont4
  unreachable

invcont8:                                         ; preds = %lpad13
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr14)
  unreachable

lpad:                                             ; preds = %lpad.i
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select12 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %26 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %27 = icmp eq %struct.BigInt* %__cur.0, %__result ; <i1> [#uses=1]
  br i1 %27, label %invcont4, label %bb.i.i

bb.i.i:                                           ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i, %lpad
  %indvar.i.i = phi i32 [ %tmp, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i ], [ 0, %lpad ] ; <i32> [#uses=2]
  %tmp = add i32 %indvar.i.i, 1                   ; <i32> [#uses=2]
  %scevgep23.i.i = getelementptr inbounds %struct.BigInt* %__result, i32 %indvar.i.i, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %28 = load i32** %scevgep23.i.i, align 4        ; <i32*> [#uses=2]
  %29 = icmp eq i32* %28, null                    ; <i1> [#uses=1]
  br i1 %29, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i, label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %bb.i.i
  %30 = bitcast i32* %28 to i8*                   ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %30) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i:              ; preds = %bb.i.i.i.i.i.i.i, %bb.i.i
  %31 = icmp eq i32 %tmp, %indvar                 ; <i1> [#uses=1]
  br i1 %31, label %invcont4, label %bb.i.i

lpad13:                                           ; preds = %invcont4
  %eh_ptr14 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select16 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr14, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont8 unwind label %lpad17

lpad17:                                           ; preds = %lpad13
  %eh_ptr18 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=1]
  %eh_select20 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr18, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable
}

define internal fastcc void @_ZNSt6vectorImSaImEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPmS1_EERKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* nocapture %this, i32* %__position.0, i32* nocapture %__x) {
entry:
  %0 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=5]
  %1 = load i32** %0, align 4                     ; <i32*> [#uses=6]
  %2 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  %3 = load i32** %2, align 4                     ; <i32*> [#uses=1]
  %4 = icmp eq i32* %1, %3                        ; <i1> [#uses=1]
  br i1 %4, label %bb1, label %bb

bb:                                               ; preds = %entry
  %5 = icmp eq i32* %1, null                      ; <i1> [#uses=1]
  br i1 %5, label %_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit, label %bb.i

bb.i:                                             ; preds = %bb
  %6 = getelementptr inbounds i32* %1, i32 -1     ; <i32*> [#uses=1]
  %7 = load i32* %6, align 4                      ; <i32> [#uses=1]
  store i32 %7, i32* %1
  %.pre = load i32** %0, align 4                  ; <i32*> [#uses=1]
  br label %_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit

_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm.exit: ; preds = %bb.i, %bb
  %8 = phi i32* [ %.pre, %bb.i ], [ %1, %bb ]     ; <i32*> [#uses=3]
  %9 = getelementptr inbounds i32* %8, i32 1      ; <i32*> [#uses=1]
  store i32* %9, i32** %0, align 4
  %10 = load i32* %__x, align 4                   ; <i32> [#uses=1]
  %11 = getelementptr inbounds i32* %8, i32 -1    ; <i32*> [#uses=1]
  %12 = ptrtoint i32* %11 to i32                  ; <i32> [#uses=1]
  %13 = ptrtoint i32* %__position.0 to i32        ; <i32> [#uses=1]
  %14 = sub i32 %12, %13                          ; <i32> [#uses=2]
  %15 = ashr i32 %14, 2                           ; <i32> [#uses=1]
  %16 = and i32 %14, -4                           ; <i32> [#uses=1]
  %17 = sub i32 0, %15                            ; <i32> [#uses=1]
  %18 = getelementptr inbounds i32* %8, i32 %17   ; <i32*> [#uses=1]
  %19 = bitcast i32* %18 to i8*                   ; <i8*> [#uses=1]
  %20 = bitcast i32* %__position.0 to i8*         ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %19, i8* %20, i32 %16, i32 4) nounwind
  store i32 %10, i32* %__position.0, align 4
  ret void

bb1:                                              ; preds = %entry
  %21 = ptrtoint i32* %1 to i32                   ; <i32> [#uses=1]
  %22 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  %23 = load i32** %22, align 4                   ; <i32*> [#uses=1]
  %24 = ptrtoint i32* %23 to i32                  ; <i32> [#uses=1]
  %25 = sub i32 %21, %24                          ; <i32> [#uses=2]
  %26 = ashr i32 %25, 2                           ; <i32> [#uses=2]
  switch i32 %26, label %bb4 [
    i32 1073741823, label %bb2
    i32 0, label %bb6
  ]

bb2:                                              ; preds = %bb1
  tail call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0)) noreturn
  unreachable

bb4:                                              ; preds = %bb1
  %27 = ashr i32 %25, 1                           ; <i32> [#uses=1]
  %28 = and i32 %27, -2                           ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb4, %bb1
  %iftmp.160.0 = phi i32 [ %28, %bb4 ], [ 1, %bb1 ] ; <i32> [#uses=3]
  %29 = icmp ult i32 %iftmp.160.0, %26            ; <i1> [#uses=1]
  br i1 %29, label %invcont, label %bb8

bb8:                                              ; preds = %bb6
  %30 = icmp ugt i32 %iftmp.160.0, 1073741823     ; <i1> [#uses=1]
  br i1 %30, label %bb.i.i, label %invcont

bb.i.i:                                           ; preds = %bb8
  tail call void @_ZSt17__throw_bad_allocv() noreturn
  unreachable

invcont:                                          ; preds = %bb8, %bb6
  %__len.0.reg2mem.0 = phi i32 [ 1073741823, %bb6 ], [ %iftmp.160.0, %bb8 ] ; <i32> [#uses=2]
  %31 = shl i32 %__len.0.reg2mem.0, 2             ; <i32> [#uses=1]
  %32 = tail call i8* @_Znwj(i32 %31)             ; <i8*> [#uses=2]
  %33 = bitcast i8* %32 to i32*                   ; <i32*> [#uses=5]
  %34 = load i32** %22, align 4                   ; <i32*> [#uses=2]
  %35 = ptrtoint i32* %__position.0 to i32        ; <i32> [#uses=2]
  %36 = ptrtoint i32* %34 to i32                  ; <i32> [#uses=1]
  %37 = sub i32 %35, %36                          ; <i32> [#uses=2]
  %38 = bitcast i32* %34 to i8*                   ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %32, i8* %38, i32 %37, i32 4) nounwind
  %39 = ashr i32 %37, 2                           ; <i32> [#uses=2]
  %40 = getelementptr inbounds i32* %33, i32 %39  ; <i32*> [#uses=2]
  %41 = icmp eq i32* %40, null                    ; <i1> [#uses=1]
  br i1 %41, label %bb33, label %bb.i5

bb.i5:                                            ; preds = %invcont
  %42 = load i32* %__x, align 4                   ; <i32> [#uses=1]
  store i32 %42, i32* %40
  br label %bb33

bb33:                                             ; preds = %bb.i5, %invcont
  %.sum = add i32 %39, 1                          ; <i32> [#uses=2]
  %43 = getelementptr inbounds i32* %33, i32 %.sum ; <i32*> [#uses=1]
  %44 = load i32** %0, align 4                    ; <i32*> [#uses=1]
  %45 = ptrtoint i32* %44 to i32                  ; <i32> [#uses=1]
  %46 = sub i32 %45, %35                          ; <i32> [#uses=2]
  %47 = bitcast i32* %43 to i8*                   ; <i8*> [#uses=1]
  %48 = bitcast i32* %__position.0 to i8*         ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %47, i8* %48, i32 %46, i32 4) nounwind
  %49 = ashr i32 %46, 2                           ; <i32> [#uses=1]
  %.sum8 = add i32 %49, %.sum                     ; <i32> [#uses=1]
  %50 = getelementptr inbounds i32* %33, i32 %.sum8 ; <i32*> [#uses=1]
  %51 = load i32** %22, align 4                   ; <i32*> [#uses=2]
  %52 = icmp eq i32* %51, null                    ; <i1> [#uses=1]
  br i1 %52, label %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit, label %bb.i1

bb.i1:                                            ; preds = %bb33
  %53 = bitcast i32* %51 to i8*                   ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %53) nounwind
  br label %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit

_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit: ; preds = %bb.i1, %bb33
  store i32* %33, i32** %22, align 4
  store i32* %50, i32** %0, align 4
  %54 = getelementptr inbounds i32* %33, i32 %__len.0.reg2mem.0 ; <i32*> [#uses=1]
  store i32* %54, i32** %2, align 4
  ret void
}

define internal fastcc void @_ZNSt6vectorImSaImEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPmS1_EEjRKm(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* nocapture %this, i32* %__position.0, i32 %__n, i32* nocapture %__x) {
entry:
  %0 = icmp eq i32 %__n, 0                        ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  %2 = load i32** %1, align 4                     ; <i32*> [#uses=1]
  %3 = ptrtoint i32* %2 to i32                    ; <i32> [#uses=1]
  %4 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=9]
  %5 = load i32** %4, align 4                     ; <i32*> [#uses=8]
  %6 = ptrtoint i32* %5 to i32                    ; <i32> [#uses=4]
  %7 = sub i32 %3, %6                             ; <i32> [#uses=1]
  %8 = ashr i32 %7, 2                             ; <i32> [#uses=1]
  %9 = icmp ult i32 %8, %__n                      ; <i1> [#uses=1]
  br i1 %9, label %bb16, label %bb1

bb1:                                              ; preds = %bb
  %10 = load i32* %__x, align 4                   ; <i32> [#uses=3]
  %11 = ptrtoint i32* %__position.0 to i32        ; <i32> [#uses=2]
  %12 = sub i32 %6, %11                           ; <i32> [#uses=2]
  %13 = ashr i32 %12, 2                           ; <i32> [#uses=5]
  %14 = icmp ugt i32 %13, %__n                    ; <i1> [#uses=1]
  br i1 %14, label %bb4, label %bb5

bb4:                                              ; preds = %bb1
  %15 = sub i32 0, %__n                           ; <i32> [#uses=1]
  %16 = getelementptr inbounds i32* %5, i32 %15   ; <i32*> [#uses=2]
  %17 = ptrtoint i32* %16 to i32                  ; <i32> [#uses=2]
  %18 = sub i32 %6, %17                           ; <i32> [#uses=1]
  %19 = bitcast i32* %5 to i8*                    ; <i8*> [#uses=1]
  %20 = bitcast i32* %16 to i8*                   ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %19, i8* %20, i32 %18, i32 4) nounwind
  %21 = load i32** %4, align 4                    ; <i32*> [#uses=1]
  %22 = getelementptr inbounds i32* %21, i32 %__n ; <i32*> [#uses=1]
  store i32* %22, i32** %4, align 4
  %23 = sub i32 %17, %11                          ; <i32> [#uses=2]
  %24 = ashr i32 %23, 2                           ; <i32> [#uses=1]
  %25 = and i32 %23, -4                           ; <i32> [#uses=1]
  %26 = sub i32 0, %24                            ; <i32> [#uses=1]
  %27 = getelementptr inbounds i32* %5, i32 %26   ; <i32*> [#uses=1]
  %28 = bitcast i32* %27 to i8*                   ; <i8*> [#uses=1]
  %29 = bitcast i32* %__position.0 to i8*         ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %28, i8* %29, i32 %25, i32 4) nounwind
  br label %bb.i.i15

bb.i.i15:                                         ; preds = %bb.i.i15, %bb4
  %indvar.i.i11 = phi i32 [ 0, %bb4 ], [ %tmp.i12, %bb.i.i15 ] ; <i32> [#uses=2]
  %__first_addr.01.i.i14 = getelementptr i32* %__position.0, i32 %indvar.i.i11 ; <i32*> [#uses=1]
  %tmp.i12 = add i32 %indvar.i.i11, 1             ; <i32> [#uses=2]
  store i32 %10, i32* %__first_addr.01.i.i14, align 4
  %exitcond24 = icmp eq i32 %tmp.i12, %__n        ; <i1> [#uses=1]
  br i1 %exitcond24, label %_ZSt4fillIPmmEvT_S1_RKT0_.exit16, label %bb.i.i15

_ZSt4fillIPmmEvT_S1_RKT0_.exit16:                 ; preds = %bb.i.i15
  ret void

bb5:                                              ; preds = %bb1
  %30 = icmp eq i32 %13, %__n                     ; <i1> [#uses=1]
  br i1 %30, label %bb15, label %bb.i.i.i.i.i9.preheader

bb.i.i.i.i.i9.preheader:                          ; preds = %bb5
  %tmp22 = sub i32 %__n, %13                      ; <i32> [#uses=1]
  br label %bb.i.i.i.i.i9

bb.i.i.i.i.i9:                                    ; preds = %bb.i.i.i.i.i9, %bb.i.i.i.i.i9.preheader
  %indvar.i.i.i.i.i5 = phi i32 [ 0, %bb.i.i.i.i.i9.preheader ], [ %indvar.next.i.i.i.i.i7, %bb.i.i.i.i.i9 ] ; <i32> [#uses=2]
  %__first_addr.02.i.i.i.i.i6 = getelementptr i32* %5, i32 %indvar.i.i.i.i.i5 ; <i32*> [#uses=1]
  store i32 %10, i32* %__first_addr.02.i.i.i.i.i6, align 4
  %indvar.next.i.i.i.i.i7 = add i32 %indvar.i.i.i.i.i5, 1 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i.i.i.i.i7, %tmp22 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb15.loopexit, label %bb.i.i.i.i.i9

bb15.loopexit:                                    ; preds = %bb.i.i.i.i.i9
  %.pre = load i32** %4, align 4                  ; <i32*> [#uses=1]
  br label %bb15

bb15:                                             ; preds = %bb15.loopexit, %bb5
  %31 = phi i32* [ %.pre, %bb15.loopexit ], [ %5, %bb5 ] ; <i32*> [#uses=1]
  %32 = sub i32 %__n, %13                         ; <i32> [#uses=1]
  %33 = getelementptr inbounds i32* %31, i32 %32  ; <i32*> [#uses=2]
  store i32* %33, i32** %4, align 4
  %34 = bitcast i32* %33 to i8*                   ; <i8*> [#uses=1]
  %35 = bitcast i32* %__position.0 to i8*         ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %34, i8* %35, i32 %12, i32 4) nounwind
  %36 = load i32** %4, align 4                    ; <i32*> [#uses=1]
  %37 = getelementptr inbounds i32* %36, i32 %13  ; <i32*> [#uses=1]
  store i32* %37, i32** %4, align 4
  %38 = icmp eq i32* %5, %__position.0            ; <i1> [#uses=1]
  br i1 %38, label %_ZSt4fillIPmmEvT_S1_RKT0_.exit, label %bb.i.i4

bb.i.i4:                                          ; preds = %bb.i.i4, %bb15
  %indvar.i.i = phi i32 [ %tmp23, %bb.i.i4 ], [ 0, %bb15 ] ; <i32> [#uses=2]
  %tmp23 = add i32 %indvar.i.i, 1                 ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr i32* %__position.0, i32 %tmp23 ; <i32*> [#uses=1]
  %__first_addr.01.i.i = getelementptr i32* %__position.0, i32 %indvar.i.i ; <i32*> [#uses=1]
  store i32 %10, i32* %__first_addr.01.i.i, align 4
  %39 = icmp eq i32* %scevgep.i.i, %5             ; <i1> [#uses=1]
  br i1 %39, label %_ZSt4fillIPmmEvT_S1_RKT0_.exit, label %bb.i.i4

_ZSt4fillIPmmEvT_S1_RKT0_.exit:                   ; preds = %bb.i.i4, %bb15
  ret void

bb16:                                             ; preds = %bb
  %40 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  %41 = load i32** %40, align 4                   ; <i32*> [#uses=1]
  %42 = ptrtoint i32* %41 to i32                  ; <i32> [#uses=1]
  %43 = sub i32 %6, %42                           ; <i32> [#uses=1]
  %44 = ashr i32 %43, 2                           ; <i32> [#uses=5]
  %45 = sub i32 1073741823, %44                   ; <i32> [#uses=1]
  %46 = icmp ult i32 %45, %__n                    ; <i1> [#uses=1]
  br i1 %46, label %bb17, label %bb18

bb17:                                             ; preds = %bb16
  tail call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0)) noreturn
  unreachable

bb18:                                             ; preds = %bb16
  %47 = icmp ult i32 %44, %__n                    ; <i1> [#uses=1]
  %48 = select i1 %47, i32 %__n, i32 %44          ; <i32> [#uses=1]
  %49 = add i32 %48, %44                          ; <i32> [#uses=3]
  %50 = icmp ult i32 %49, %44                     ; <i1> [#uses=1]
  br i1 %50, label %invcont21, label %bb20

bb20:                                             ; preds = %bb18
  %51 = icmp ugt i32 %49, 1073741823              ; <i1> [#uses=1]
  br i1 %51, label %bb.i.i, label %invcont21

bb.i.i:                                           ; preds = %bb20
  tail call void @_ZSt17__throw_bad_allocv() noreturn
  unreachable

invcont21:                                        ; preds = %bb20, %bb18
  %__len.0.reg2mem.0 = phi i32 [ 1073741823, %bb18 ], [ %49, %bb20 ] ; <i32> [#uses=2]
  %52 = shl i32 %__len.0.reg2mem.0, 2             ; <i32> [#uses=1]
  %53 = tail call i8* @_Znwj(i32 %52)             ; <i8*> [#uses=3]
  %54 = bitcast i8* %53 to i32*                   ; <i32*> [#uses=4]
  %55 = load i32** %40, align 4                   ; <i32*> [#uses=2]
  %56 = ptrtoint i32* %__position.0 to i32        ; <i32> [#uses=2]
  %57 = ptrtoint i32* %55 to i32                  ; <i32> [#uses=1]
  %58 = sub i32 %56, %57                          ; <i32> [#uses=2]
  %59 = bitcast i32* %55 to i8*                   ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %53, i8* %59, i32 %58, i32 4) nounwind
  %60 = ashr i32 %58, 2                           ; <i32> [#uses=2]
  %61 = load i32* %__x, align 4                   ; <i32> [#uses=1]
  br label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %invcont21
  %indvar.i.i.i.i.i = phi i32 [ 0, %invcont21 ], [ %indvar.next.i.i.i.i.i, %bb.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp2630 = add i32 %indvar.i.i.i.i.i, %60       ; <i32> [#uses=1]
  %tmp28 = shl i32 %tmp2630, 2                    ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %53, i32 %tmp28    ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i = bitcast i8* %scevgep to i32* ; <i32*> [#uses=1]
  store i32 %61, i32* %__first_addr.02.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i = add i32 %indvar.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond25 = icmp eq i32 %indvar.next.i.i.i.i.i, %__n ; <i1> [#uses=1]
  br i1 %exitcond25, label %bb52, label %bb.i.i.i.i.i

bb52:                                             ; preds = %bb.i.i.i.i.i
  %.sum = add i32 %60, %__n                       ; <i32> [#uses=2]
  %62 = getelementptr inbounds i32* %54, i32 %.sum ; <i32*> [#uses=1]
  %63 = load i32** %4, align 4                    ; <i32*> [#uses=1]
  %64 = ptrtoint i32* %63 to i32                  ; <i32> [#uses=1]
  %65 = sub i32 %64, %56                          ; <i32> [#uses=2]
  %66 = bitcast i32* %62 to i8*                   ; <i8*> [#uses=1]
  %67 = bitcast i32* %__position.0 to i8*         ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %66, i8* %67, i32 %65, i32 4) nounwind
  %68 = ashr i32 %65, 2                           ; <i32> [#uses=1]
  %.sum17 = add i32 %68, %.sum                    ; <i32> [#uses=1]
  %69 = getelementptr inbounds i32* %54, i32 %.sum17 ; <i32*> [#uses=1]
  %70 = load i32** %40, align 4                   ; <i32*> [#uses=2]
  %71 = icmp eq i32* %70, null                    ; <i1> [#uses=1]
  br i1 %71, label %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit, label %bb.i

bb.i:                                             ; preds = %bb52
  %72 = bitcast i32* %70 to i8*                   ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %72) nounwind
  br label %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit

_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit: ; preds = %bb.i, %bb52
  store i32* %54, i32** %40, align 4
  store i32* %69, i32** %4, align 4
  %73 = getelementptr inbounds i32* %54, i32 %__len.0.reg2mem.0 ; <i32*> [#uses=1]
  store i32* %73, i32** %1, align 4
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_ZNSt6vectorImSaImEEaSERKS1_(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %__x) {
entry:
  %0 = icmp eq %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %__x, %this ; <i1> [#uses=1]
  br i1 %0, label %bb36, label %bb

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %__x, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=2]
  %2 = load i32** %1, align 4                     ; <i32*> [#uses=1]
  %3 = ptrtoint i32* %2 to i32                    ; <i32> [#uses=1]
  %4 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %__x, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  %5 = load i32** %4, align 4                     ; <i32*> [#uses=5]
  %6 = ptrtoint i32* %5 to i32                    ; <i32> [#uses=2]
  %7 = sub i32 %3, %6                             ; <i32> [#uses=4]
  %8 = ashr i32 %7, 2                             ; <i32> [#uses=5]
  %9 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  %10 = load i32** %9, align 4                    ; <i32*> [#uses=1]
  %11 = ptrtoint i32* %10 to i32                  ; <i32> [#uses=1]
  %12 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=5]
  %13 = load i32** %12, align 4                   ; <i32*> [#uses=3]
  %14 = ptrtoint i32* %13 to i32                  ; <i32> [#uses=2]
  %15 = sub i32 %11, %14                          ; <i32> [#uses=1]
  %16 = ashr i32 %15, 2                           ; <i32> [#uses=1]
  %17 = icmp ult i32 %16, %8                      ; <i1> [#uses=1]
  br i1 %17, label %bb1, label %bb6

bb1:                                              ; preds = %bb
  %18 = icmp ugt i32 %8, 1073741823               ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i.i, label %bb5

bb.i.i.i:                                         ; preds = %bb1
  tail call void @_ZSt17__throw_bad_allocv() noreturn
  unreachable

bb5:                                              ; preds = %bb1
  %19 = and i32 %7, -4                            ; <i32> [#uses=1]
  %20 = tail call i8* @_Znwj(i32 %19)             ; <i8*> [#uses=2]
  %21 = bitcast i32* %5 to i8*                    ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %20, i8* %21, i32 %7, i32 4) nounwind
  %22 = bitcast i8* %20 to i32*                   ; <i32*> [#uses=2]
  %23 = load i32** %12, align 4                   ; <i32*> [#uses=2]
  %24 = icmp eq i32* %23, null                    ; <i1> [#uses=1]
  br i1 %24, label %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit, label %bb.i

bb.i:                                             ; preds = %bb5
  %25 = bitcast i32* %23 to i8*                   ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %25) nounwind
  br label %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit

_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit: ; preds = %bb.i, %bb5
  store i32* %22, i32** %12, align 4
  %26 = getelementptr inbounds i32* %22, i32 %8   ; <i32*> [#uses=1]
  store i32* %26, i32** %9, align 4
  br label %bb35

bb6:                                              ; preds = %bb
  %27 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=2]
  %28 = load i32** %27, align 4                   ; <i32*> [#uses=1]
  %29 = ptrtoint i32* %28 to i32                  ; <i32> [#uses=1]
  %30 = sub i32 %29, %14                          ; <i32> [#uses=1]
  %31 = ashr i32 %30, 2                           ; <i32> [#uses=2]
  %32 = icmp ult i32 %31, %8                      ; <i1> [#uses=1]
  br i1 %32, label %bb34, label %bb28

bb28:                                             ; preds = %bb6
  %33 = bitcast i32* %13 to i8*                   ; <i8*> [#uses=1]
  %34 = bitcast i32* %5 to i8*                    ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %33, i8* %34, i32 %7, i32 4) nounwind
  br label %bb35

bb34:                                             ; preds = %bb6
  %35 = getelementptr inbounds i32* %5, i32 %31   ; <i32*> [#uses=1]
  %36 = ptrtoint i32* %35 to i32                  ; <i32> [#uses=1]
  %37 = sub i32 %36, %6                           ; <i32> [#uses=1]
  %38 = bitcast i32* %13 to i8*                   ; <i8*> [#uses=1]
  %39 = bitcast i32* %5 to i8*                    ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %38, i8* %39, i32 %37, i32 4) nounwind
  %40 = load i32** %27, align 4                   ; <i32*> [#uses=2]
  %41 = load i32** %1, align 4                    ; <i32*> [#uses=1]
  %42 = load i32** %4, align 4                    ; <i32*> [#uses=1]
  %43 = ptrtoint i32* %40 to i32                  ; <i32> [#uses=1]
  %44 = load i32** %12, align 4                   ; <i32*> [#uses=1]
  %45 = ptrtoint i32* %44 to i32                  ; <i32> [#uses=1]
  %46 = sub i32 %43, %45                          ; <i32> [#uses=1]
  %47 = ashr i32 %46, 2                           ; <i32> [#uses=1]
  %48 = getelementptr inbounds i32* %42, i32 %47  ; <i32*> [#uses=2]
  %49 = ptrtoint i32* %41 to i32                  ; <i32> [#uses=1]
  %50 = ptrtoint i32* %48 to i32                  ; <i32> [#uses=1]
  %51 = sub i32 %49, %50                          ; <i32> [#uses=1]
  %52 = bitcast i32* %40 to i8*                   ; <i8*> [#uses=1]
  %53 = bitcast i32* %48 to i8*                   ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %52, i8* %53, i32 %51, i32 4) nounwind
  br label %bb35

bb35:                                             ; preds = %bb34, %bb28, %_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmj.exit
  %54 = load i32** %12, align 4                   ; <i32*> [#uses=1]
  %55 = getelementptr inbounds i32* %54, i32 %8   ; <i32*> [#uses=1]
  %56 = getelementptr inbounds %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %this, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=1]
  store i32* %55, i32** %56, align 4
  ret void

bb36:                                             ; preds = %entry
  ret void
}

define internal fastcc void @_ZNSt6vectorI6BigIntSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"struct.std::vector<BigInt,std::allocator<BigInt> >"* nocapture %this, %struct.BigInt* %__position.0, %struct.BigInt* nocapture %__x) {
entry:
  %__x_copy = alloca %struct.BigInt, align 8      ; <%struct.BigInt*> [#uses=4]
  %0 = getelementptr inbounds %"struct.std::vector<BigInt,std::allocator<BigInt> >"* %this, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=7]
  %1 = load %struct.BigInt** %0, align 4          ; <%struct.BigInt*> [#uses=4]
  %2 = getelementptr inbounds %"struct.std::vector<BigInt,std::allocator<BigInt> >"* %this, i32 0, i32 0, i32 0, i32 2 ; <%struct.BigInt**> [#uses=2]
  %3 = load %struct.BigInt** %2, align 4          ; <%struct.BigInt*> [#uses=1]
  %4 = icmp eq %struct.BigInt* %1, %3             ; <i1> [#uses=1]
  br i1 %4, label %bb6, label %bb

bb:                                               ; preds = %entry
  %5 = getelementptr inbounds %struct.BigInt* %1, i32 -1 ; <%struct.BigInt*> [#uses=1]
  call fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %1, %struct.BigInt* %5)
  %6 = load %struct.BigInt** %0, align 4          ; <%struct.BigInt*> [#uses=1]
  %7 = getelementptr inbounds %struct.BigInt* %6, i32 1 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %7, %struct.BigInt** %0, align 4
  %8 = getelementptr inbounds %struct.BigInt* %__x, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=2]
  %9 = load i32** %8, align 4                     ; <i32*> [#uses=1]
  %10 = ptrtoint i32* %9 to i32                   ; <i32> [#uses=1]
  %11 = getelementptr inbounds %struct.BigInt* %__x, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  %12 = load i32** %11, align 4                   ; <i32*> [#uses=1]
  %13 = ptrtoint i32* %12 to i32                  ; <i32> [#uses=1]
  %14 = sub i32 %10, %13                          ; <i32> [#uses=2]
  %15 = ashr i32 %14, 2                           ; <i32> [#uses=2]
  %16 = getelementptr inbounds %struct.BigInt* %__x_copy, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=4]
  store i32* null, i32** %16, align 8
  %17 = getelementptr inbounds %struct.BigInt* %__x_copy, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=3]
  store i32* null, i32** %17, align 4
  %18 = getelementptr inbounds %struct.BigInt* %__x_copy, i32 0, i32 0, i32 0, i32 0, i32 2 ; <i32**> [#uses=2]
  store i32* null, i32** %18, align 8
  %19 = icmp ugt i32 %15, 1073741823              ; <i1> [#uses=1]
  br i1 %19, label %bb.i.i.i.i.i.i, label %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i unwind label %lpad.i.i.i.i

.noexc.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i.i
  unreachable

_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i: ; preds = %bb
  %20 = and i32 %14, -4                           ; <i32> [#uses=1]
  %21 = invoke i8* @_Znwj(i32 %20)
          to label %_ZN6BigIntC1ERKS_.exit unwind label %lpad.i.i.i.i ; <i8*> [#uses=2]

lpad.i.i.i.i:                                     ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i, %bb.i.i.i.i.i.i
  %eh_ptr.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select2.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i)
  unreachable

_ZN6BigIntC1ERKS_.exit:                           ; preds = %_ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv.exit.i.i.i.i.i
  %22 = bitcast i8* %21 to i32*                   ; <i32*> [#uses=4]
  store i32* %22, i32** %16, align 8
  store i32* %22, i32** %17, align 4
  %23 = getelementptr inbounds i32* %22, i32 %15  ; <i32*> [#uses=1]
  store i32* %23, i32** %18, align 8
  %24 = load i32** %8, align 4                    ; <i32*> [#uses=1]
  %25 = load i32** %11, align 4                   ; <i32*> [#uses=2]
  %26 = ptrtoint i32* %24 to i32                  ; <i32> [#uses=1]
  %27 = ptrtoint i32* %25 to i32                  ; <i32> [#uses=1]
  %28 = sub i32 %26, %27                          ; <i32> [#uses=2]
  %29 = bitcast i32* %25 to i8*                   ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %21, i8* %29, i32 %28, i32 4) nounwind
  %30 = ashr i32 %28, 2                           ; <i32> [#uses=1]
  %31 = getelementptr inbounds i32* %22, i32 %30  ; <i32*> [#uses=1]
  store i32* %31, i32** %17, align 4
  %32 = load %struct.BigInt** %0, align 4         ; <%struct.BigInt*> [#uses=3]
  %33 = getelementptr inbounds %struct.BigInt* %32, i32 -2 ; <%struct.BigInt*> [#uses=1]
  %34 = ptrtoint %struct.BigInt* %33 to i32       ; <i32> [#uses=1]
  %35 = ptrtoint %struct.BigInt* %__position.0 to i32 ; <i32> [#uses=1]
  %36 = sub i32 %34, %35                          ; <i32> [#uses=2]
  %37 = sdiv exact i32 %36, 12                    ; <i32> [#uses=2]
  %38 = icmp slt i32 %36, 12                      ; <i1> [#uses=1]
  br i1 %38, label %invcont, label %bb.nph.i.i.i.i

bb.nph.i.i.i.i:                                   ; preds = %_ZN6BigIntC1ERKS_.exit
  %tmp.i.i.i.i = sub i32 0, %37                   ; <i32> [#uses=2]
  %tmp5.i.i.i.i = icmp sgt i32 %tmp.i.i.i.i, -1   ; <i1> [#uses=1]
  %smax.i = select i1 %tmp5.i.i.i.i, i32 %tmp.i.i.i.i, i32 -1 ; <i32> [#uses=1]
  %tmp1.i = add i32 %37, 1                        ; <i32> [#uses=1]
  %tmp2.i = add i32 %tmp1.i, %smax.i              ; <i32> [#uses=1]
  br label %bb.i.i.i.i16

bb.i.i.i.i16:                                     ; preds = %.noexc, %bb.nph.i.i.i.i
  %indvar.i.i.i.i = phi i32 [ 0, %bb.nph.i.i.i.i ], [ %indvar.next.i.i.i.i, %.noexc ] ; <i32> [#uses=3]
  %tmp21 = sub i32 -2, %indvar.i.i.i.i            ; <i32> [#uses=1]
  %scevgep1415.i.i.i.i = getelementptr inbounds %struct.BigInt* %32, i32 %tmp21, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  %tmp23 = sub i32 -3, %indvar.i.i.i.i            ; <i32> [#uses=1]
  %scevgep1213.i.i.i.i = getelementptr inbounds %struct.BigInt* %32, i32 %tmp23, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  invoke fastcc void @_ZNSt6vectorImSaImEEaSERKS1_(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %scevgep1415.i.i.i.i, %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %scevgep1213.i.i.i.i)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %bb.i.i.i.i16
  %indvar.next.i.i.i.i = add i32 %indvar.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i.i.i, %tmp2.i ; <i1> [#uses=1]
  br i1 %exitcond.i, label %invcont, label %bb.i.i.i.i16

invcont:                                          ; preds = %.noexc, %_ZN6BigIntC1ERKS_.exit
  %39 = getelementptr inbounds %struct.BigInt* %__x_copy, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  %40 = getelementptr inbounds %struct.BigInt* %__position.0, i32 0, i32 0 ; <%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"*> [#uses=1]
  invoke fastcc void @_ZNSt6vectorImSaImEEaSERKS1_(%"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %40, %"struct.std::vector<long unsigned int,std::allocator<long unsigned int> >"* %39)
          to label %bb5 unwind label %lpad

bb5:                                              ; preds = %invcont
  %41 = load i32** %16, align 8                   ; <i32*> [#uses=2]
  %42 = icmp eq i32* %41, null                    ; <i1> [#uses=1]
  br i1 %42, label %_ZN6BigIntD1Ev.exit15, label %bb.i.i.i.i13

bb.i.i.i.i13:                                     ; preds = %bb5
  %43 = bitcast i32* %41 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %43) nounwind
  ret void

_ZN6BigIntD1Ev.exit15:                            ; preds = %bb5
  ret void

bb6:                                              ; preds = %entry
  %44 = ptrtoint %struct.BigInt* %1 to i32        ; <i32> [#uses=1]
  %45 = getelementptr inbounds %"struct.std::vector<BigInt,std::allocator<BigInt> >"* %this, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=5]
  %46 = load %struct.BigInt** %45, align 4        ; <%struct.BigInt*> [#uses=1]
  %47 = ptrtoint %struct.BigInt* %46 to i32       ; <i32> [#uses=1]
  %48 = sub i32 %44, %47                          ; <i32> [#uses=1]
  %49 = sdiv exact i32 %48, 12                    ; <i32> [#uses=3]
  switch i32 %49, label %bb9 [
    i32 357913941, label %bb7
    i32 0, label %bb11
  ]

bb7:                                              ; preds = %bb6
  call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0)) noreturn
  unreachable

bb9:                                              ; preds = %bb6
  %50 = shl i32 %49, 1                            ; <i32> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %bb9, %bb6
  %iftmp.177.0 = phi i32 [ %50, %bb9 ], [ 1, %bb6 ] ; <i32> [#uses=3]
  %51 = icmp ult i32 %iftmp.177.0, %49            ; <i1> [#uses=1]
  br i1 %51, label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit, label %bb13

bb13:                                             ; preds = %bb11
  %52 = icmp ugt i32 %iftmp.177.0, 357913941      ; <i1> [#uses=1]
  br i1 %52, label %bb.i.i, label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit

bb.i.i:                                           ; preds = %bb13
  call void @_ZSt17__throw_bad_allocv() noreturn
  unreachable

_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit: ; preds = %bb13, %bb11
  %__len.0.reg2mem.0 = phi i32 [ 357913941, %bb11 ], [ %iftmp.177.0, %bb13 ] ; <i32> [#uses=2]
  %53 = mul i32 %__len.0.reg2mem.0, 12            ; <i32> [#uses=1]
  %54 = call i8* @_Znwj(i32 %53)                  ; <i8*> [#uses=5]
  %55 = bitcast i8* %54 to %struct.BigInt*        ; <%struct.BigInt*> [#uses=5]
  %56 = load %struct.BigInt** %45, align 4        ; <%struct.BigInt*> [#uses=1]
  %57 = invoke fastcc %struct.BigInt* @_ZSt24__uninitialized_copy_auxIP6BigIntS1_ET0_T_S3_S2_St12__false_type(%struct.BigInt* %56, %struct.BigInt* %__position.0, %struct.BigInt* %55)
          to label %invcont14 unwind label %lpad54 ; <%struct.BigInt*> [#uses=3]

invcont14:                                        ; preds = %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit
  invoke fastcc void @_ZN9__gnu_cxx13new_allocatorI6BigIntE9constructEPS1_RKS1_(%struct.BigInt* %57, %struct.BigInt* %__x)
          to label %bb19 unwind label %lpad50

bb19:                                             ; preds = %invcont14
  %58 = getelementptr inbounds %struct.BigInt* %57, i32 1 ; <%struct.BigInt*> [#uses=2]
  %59 = load %struct.BigInt** %0, align 4         ; <%struct.BigInt*> [#uses=1]
  %60 = invoke fastcc %struct.BigInt* @_ZSt24__uninitialized_copy_auxIP6BigIntS1_ET0_T_S3_S2_St12__false_type(%struct.BigInt* %__position.0, %struct.BigInt* %59, %struct.BigInt* %58)
          to label %invcont20 unwind label %lpad58 ; <%struct.BigInt*> [#uses=1]

invcont20:                                        ; preds = %bb19
  %61 = load %struct.BigInt** %0, align 4         ; <%struct.BigInt*> [#uses=2]
  %62 = load %struct.BigInt** %45, align 4        ; <%struct.BigInt*> [#uses=4]
  %63 = icmp eq %struct.BigInt* %62, %61          ; <i1> [#uses=1]
  br i1 %63, label %bb42, label %bb.i.i.i8

bb.i.i.i8:                                        ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i10, %invcont20
  %indvar.i.i.i4 = phi i32 [ %tmp32, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i10 ], [ 0, %invcont20 ] ; <i32> [#uses=2]
  %tmp32 = add i32 %indvar.i.i.i4, 1              ; <i32> [#uses=2]
  %scevgep.i.i.i6 = getelementptr %struct.BigInt* %62, i32 %tmp32 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i7 = getelementptr inbounds %struct.BigInt* %62, i32 %indvar.i.i.i4, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %64 = load i32** %scevgep23.i.i.i7, align 4     ; <i32*> [#uses=2]
  %65 = icmp eq i32* %64, null                    ; <i1> [#uses=1]
  br i1 %65, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i10, label %bb.i.i.i.i.i.i.i.i9

bb.i.i.i.i.i.i.i.i9:                              ; preds = %bb.i.i.i8
  %66 = bitcast i32* %64 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %66) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i10

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i10:          ; preds = %bb.i.i.i.i.i.i.i.i9, %bb.i.i.i8
  %67 = icmp eq %struct.BigInt* %scevgep.i.i.i6, %61 ; <i1> [#uses=1]
  br i1 %67, label %bb42.loopexit, label %bb.i.i.i8

bb31:                                             ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i, %ppad81
  %68 = icmp eq i8* %54, null                     ; <i1> [#uses=1]
  br i1 %68, label %invcont32, label %bb.i1

bb.i1:                                            ; preds = %bb31
  call void @_ZdlPv(i8* %54) nounwind
  br label %invcont32

invcont32:                                        ; preds = %bb.i1, %bb31
  invoke void @__cxa_rethrow() noreturn
          to label %invcont33 unwind label %ppad82

invcont33:                                        ; preds = %invcont32
  unreachable

bb42.loopexit:                                    ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i10
  %.pre = load %struct.BigInt** %45, align 4      ; <%struct.BigInt*> [#uses=1]
  br label %bb42

bb42:                                             ; preds = %bb42.loopexit, %invcont20
  %69 = phi %struct.BigInt* [ %.pre, %bb42.loopexit ], [ %62, %invcont20 ] ; <%struct.BigInt*> [#uses=2]
  %70 = icmp eq %struct.BigInt* %69, null         ; <i1> [#uses=1]
  br i1 %70, label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit, label %bb.i

bb.i:                                             ; preds = %bb42
  %71 = bitcast %struct.BigInt* %69 to i8*        ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %71) nounwind
  br label %_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit

_ZNSt12_Vector_baseI6BigIntSaIS0_EE13_M_deallocateEPS0_j.exit: ; preds = %bb.i, %bb42
  store %struct.BigInt* %55, %struct.BigInt** %45, align 4
  store %struct.BigInt* %60, %struct.BigInt** %0, align 4
  %72 = getelementptr inbounds %struct.BigInt* %55, i32 %__len.0.reg2mem.0 ; <%struct.BigInt*> [#uses=1]
  store %struct.BigInt* %72, %struct.BigInt** %2, align 4
  ret void

lpad:                                             ; preds = %invcont, %bb.i.i.i.i16
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=3]
  %eh_select45 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %73 = load i32** %16, align 8                   ; <i32*> [#uses=2]
  %74 = icmp eq i32* %73, null                    ; <i1> [#uses=1]
  br i1 %74, label %Unwind, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %lpad
  %75 = bitcast i32* %73 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %75) nounwind
  br label %Unwind

lpad50:                                           ; preds = %invcont14
  %eh_ptr51 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select53 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr51, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad81

lpad54:                                           ; preds = %_ZNSt12_Vector_baseI6BigIntSaIS0_EE11_M_allocateEj.exit
  %eh_ptr55 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select57 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr55, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad81

lpad58:                                           ; preds = %bb19
  %eh_ptr59 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select61 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr59, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad81

lpad70:                                           ; preds = %ppad82
  %eh_ptr71 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select73 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr71, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad81:                                           ; preds = %lpad58, %lpad54, %lpad50
  %__new_finish.0 = phi %struct.BigInt* [ %58, %lpad58 ], [ %57, %lpad50 ], [ %55, %lpad54 ] ; <%struct.BigInt*> [#uses=2]
  %eh_exception.1 = phi i8* [ %eh_ptr59, %lpad58 ], [ %eh_ptr51, %lpad50 ], [ %eh_ptr55, %lpad54 ] ; <i8*> [#uses=1]
  %76 = call i8* @__cxa_begin_catch(i8* %eh_exception.1) nounwind ; <i8*> [#uses=0]
  %77 = icmp eq %struct.BigInt* %55, %__new_finish.0 ; <i1> [#uses=1]
  br i1 %77, label %bb31, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i, %ppad81
  %indvar.i.i.i = phi i32 [ %tmp.i, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i ], [ 0, %ppad81 ] ; <i32> [#uses=2]
  %tmp26 = mul i32 %indvar.i.i.i, 12              ; <i32> [#uses=2]
  %tmp27 = add i32 %tmp26, 12                     ; <i32> [#uses=1]
  %scevgep28 = getelementptr i8* %54, i32 %tmp27  ; <i8*> [#uses=1]
  %scevgep.i.i.i = bitcast i8* %scevgep28 to %struct.BigInt* ; <%struct.BigInt*> [#uses=1]
  %scevgep30 = getelementptr i8* %54, i32 %tmp26  ; <i8*> [#uses=1]
  %scevgep23.i.i.i = bitcast i8* %scevgep30 to i32** ; <i32**> [#uses=1]
  %tmp.i = add i32 %indvar.i.i.i, 1               ; <i32> [#uses=1]
  %78 = load i32** %scevgep23.i.i.i, align 4      ; <i32*> [#uses=2]
  %79 = icmp eq i32* %78, null                    ; <i1> [#uses=1]
  br i1 %79, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i, label %bb.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %bb.i.i.i
  %80 = bitcast i32* %78 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %80) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i:            ; preds = %bb.i.i.i.i.i.i.i.i, %bb.i.i.i
  %81 = icmp eq %struct.BigInt* %scevgep.i.i.i, %__new_finish.0 ; <i1> [#uses=1]
  br i1 %81, label %bb31, label %bb.i.i.i

ppad82:                                           ; preds = %invcont32
  %eh_ptr63 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select65 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr63, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %Unwind unwind label %lpad70

Unwind:                                           ; preds = %ppad82, %bb.i.i.i.i, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %bb.i.i.i.i ], [ %eh_ptr, %lpad ], [ %eh_ptr63, %ppad82 ] ; <i8*> [#uses=1]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable
}

define internal fastcc void @_ZN9FibonacciC1Ej(%struct.Fibonacci* %this, i32 %n_i) {
entry:
  %0 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=2]
  %1 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=3]
  store %struct.BigInt* null, %struct.BigInt** %1, align 4
  %2 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=2]
  store %struct.BigInt* null, %struct.BigInt** %2, align 4
  %3 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 2 ; <%struct.BigInt**> [#uses=1]
  store %struct.BigInt* null, %struct.BigInt** %3, align 4
  invoke fastcc void @_ZN9Fibonacci10get_numberEj(%struct.BigInt* noalias sret %0, %struct.Fibonacci* %this, i32 %n_i)
          to label %invcont unwind label %lpad

invcont:                                          ; preds = %entry
  %4 = getelementptr inbounds %struct.BigInt* %0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %5 = load i32** %4, align 8                     ; <i32*> [#uses=2]
  %6 = icmp eq i32* %5, null                      ; <i1> [#uses=1]
  br i1 %6, label %return, label %bb.i.i.i.i1

bb.i.i.i.i1:                                      ; preds = %invcont
  %7 = bitcast i32* %5 to i8*                     ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %7) nounwind
  ret void

invcont2:                                         ; preds = %bb.i.i1.i, %bb1.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable

return:                                           ; preds = %invcont
  ret void

lpad:                                             ; preds = %entry
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select6 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %8 = load %struct.BigInt** %2, align 4          ; <%struct.BigInt*> [#uses=2]
  %9 = load %struct.BigInt** %1, align 4          ; <%struct.BigInt*> [#uses=4]
  %10 = icmp eq %struct.BigInt* %9, %8            ; <i1> [#uses=1]
  br i1 %10, label %bb1.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i, %lpad
  %indvar.i.i.i.i = phi i32 [ %tmp, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i ], [ 0, %lpad ] ; <i32> [#uses=2]
  %tmp = add i32 %indvar.i.i.i.i, 1               ; <i32> [#uses=2]
  %scevgep.i.i.i.i = getelementptr %struct.BigInt* %9, i32 %tmp ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i = getelementptr inbounds %struct.BigInt* %9, i32 %indvar.i.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %11 = load i32** %scevgep23.i.i.i.i, align 4    ; <i32*> [#uses=2]
  %12 = icmp eq i32* %11, null                    ; <i1> [#uses=1]
  br i1 %12, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i, label %bb.i.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i.i:                             ; preds = %bb.i.i.i.i
  %13 = bitcast i32* %11 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %13) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i:          ; preds = %bb.i.i.i.i.i.i.i.i.i, %bb.i.i.i.i
  %14 = icmp eq %struct.BigInt* %scevgep.i.i.i.i, %8 ; <i1> [#uses=1]
  br i1 %14, label %bb1.loopexit.i, label %bb.i.i.i.i

bb1.loopexit.i:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i
  %.pre.i = load %struct.BigInt** %1, align 4     ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.loopexit.i, %lpad
  %15 = phi %struct.BigInt* [ %.pre.i, %bb1.loopexit.i ], [ %9, %lpad ] ; <%struct.BigInt*> [#uses=2]
  %16 = icmp eq %struct.BigInt* %15, null         ; <i1> [#uses=1]
  br i1 %16, label %invcont2, label %bb.i.i1.i

bb.i.i1.i:                                        ; preds = %bb1.i
  %17 = bitcast %struct.BigInt* %15 to i8*        ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %17) nounwind
  br label %invcont2
}

declare void @__cxa_call_unexpected(i8*) noreturn

define internal fastcc void @_ZNSs6assignERKSs(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* nocapture %this, i8* %__str.0.0.0.val) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  %1 = load i8** %0, align 4                      ; <i8*> [#uses=1]
  %2 = icmp eq i8* %1, %__str.0.0.0.val           ; <i1> [#uses=1]
  br i1 %2, label %bb13, label %invcont1

invcont1:                                         ; preds = %entry
  %3 = getelementptr inbounds i8* %__str.0.0.0.val, i32 -12 ; <i8*> [#uses=2]
  %4 = getelementptr inbounds i8* %__str.0.0.0.val, i32 -4 ; <i8*> [#uses=1]
  %5 = bitcast i8* %4 to i32*                     ; <i32*> [#uses=3]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=2]
  %toBool.i = icmp slt i32 %6, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb12.i, label %bb11.i

bb11.i:                                           ; preds = %invcont1
  %7 = icmp eq i8* %3, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %7, label %bb5, label %bb.i.i1

bb.i.i1:                                          ; preds = %bb11.i
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i1
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %8 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %5, i32 1) nounwind ; <i32> [#uses=0]
  br label %bb5

bb1.i.i.i:                                        ; preds = %bb.i.i1
  %9 = add nsw i32 %6, 1                          ; <i32> [#uses=1]
  store i32 %9, i32* %5, align 4
  br label %bb5

bb12.i:                                           ; preds = %invcont1
  %10 = bitcast i8* %3 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*> [#uses=1]
  %11 = invoke fastcc i8* @_ZNSs4_Rep8_M_cloneERKSaIcEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %10)
          to label %bb5 unwind label %ppad        ; <i8*> [#uses=1]

bb5:                                              ; preds = %bb12.i, %bb1.i.i.i, %bb.i.i.i, %bb11.i
  %12 = phi i8* [ %__str.0.0.0.val, %bb1.i.i.i ], [ %__str.0.0.0.val, %bb.i.i.i ], [ %__str.0.0.0.val, %bb11.i ], [ %11, %bb12.i ] ; <i8*> [#uses=1]
  %13 = load i8** %0, align 4                     ; <i8*> [#uses=2]
  %14 = getelementptr inbounds i8* %13, i32 -12   ; <i8*> [#uses=2]
  %15 = icmp eq i8* %14, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %15, label %bb12, label %bb.i

bb.i:                                             ; preds = %bb5
  %16 = getelementptr inbounds i8* %13, i32 -4    ; <i8*> [#uses=1]
  %17 = bitcast i8* %16 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %bb.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %18 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %17, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i

bb1.i.i:                                          ; preds = %bb.i
  %19 = load i32* %17, align 4                    ; <i32> [#uses=2]
  %20 = add nsw i32 %19, -1                       ; <i32> [#uses=1]
  store i32 %20, i32* %17, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i: ; preds = %bb1.i.i, %bb.i.i
  %21 = phi i32 [ %19, %bb1.i.i ], [ %18, %bb.i.i ] ; <i32> [#uses=1]
  %22 = icmp slt i32 %21, 1                       ; <i1> [#uses=1]
  br i1 %22, label %bb2.i, label %bb12

bb2.i:                                            ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i
  call void @_ZdlPv(i8* %14) nounwind
  br label %bb12

bb12:                                             ; preds = %bb2.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i, %bb5
  store i8* %12, i8** %0, align 4
  ret void

bb13:                                             ; preds = %entry
  ret void

ppad:                                             ; preds = %bb12.i
  %eh_ptr18 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select20 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr18, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr18)
  unreachable
}

define internal fastcc void @_ZNKSt15basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* noalias nocapture sret %agg.result, %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* nocapture %this) {
invcont:
  %0 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %agg.result, i32 0, i32 0, i32 0 ; <i8**> [#uses=2]
  store i8* bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), i8** %0, align 4
  %1 = getelementptr inbounds %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 5 ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=3]
  %3 = icmp eq i8* %2, null                       ; <i1> [#uses=1]
  br i1 %3, label %bb54, label %invcont20

invcont20:                                        ; preds = %invcont
  %4 = getelementptr inbounds %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 3 ; <i8**> [#uses=1]
  %5 = load i8** %4, align 4                      ; <i8*> [#uses=2]
  %6 = icmp ugt i8* %2, %5                        ; <i1> [#uses=1]
  %7 = getelementptr inbounds %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 4 ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=2]
  br i1 %6, label %invcont24, label %invcont40

invcont24:                                        ; preds = %invcont20
  %9 = invoke fastcc i8* @_ZNSs12_S_constructIPcEES0_T_S1_RKSaIcESt20forward_iterator_tag(i8* %8, i8* %2)
          to label %invcont25 unwind label %lpad64 ; <i8*> [#uses=5]

invcont25:                                        ; preds = %invcont24
  invoke fastcc void @_ZNSs6assignERKSs(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %agg.result, i8* %9)
          to label %bb32 unwind label %lpad68

bb32:                                             ; preds = %invcont25
  %10 = getelementptr inbounds i8* %9, i32 -12    ; <i8*> [#uses=2]
  %11 = icmp eq i8* %10, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %11, label %bb37, label %bb.i.i23

bb.i.i23:                                         ; preds = %bb32
  %12 = getelementptr inbounds i8* %9, i32 -4     ; <i8*> [#uses=1]
  %13 = bitcast i8* %12 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i24, label %bb1.i.i.i25

bb.i.i.i24:                                       ; preds = %bb.i.i23
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %14 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %13, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i26

bb1.i.i.i25:                                      ; preds = %bb.i.i23
  %15 = load i32* %13, align 4                    ; <i32> [#uses=2]
  %16 = add nsw i32 %15, -1                       ; <i32> [#uses=1]
  store i32 %16, i32* %13, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i26

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i26: ; preds = %bb1.i.i.i25, %bb.i.i.i24
  %17 = phi i32 [ %15, %bb1.i.i.i25 ], [ %14, %bb.i.i.i24 ] ; <i32> [#uses=1]
  %18 = icmp slt i32 %17, 1                       ; <i1> [#uses=1]
  br i1 %18, label %bb2.i.i27, label %bb37

bb2.i.i27:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i26
  call void @_ZdlPv(i8* %10) nounwind
  ret void

bb37:                                             ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i26, %bb32
  ret void

invcont40:                                        ; preds = %invcont20
  %19 = invoke fastcc i8* @_ZNSs12_S_constructIPcEES0_T_S1_RKSaIcESt20forward_iterator_tag(i8* %8, i8* %5)
          to label %invcont41 unwind label %lpad76 ; <i8*> [#uses=5]

invcont41:                                        ; preds = %invcont40
  invoke fastcc void @_ZNSs6assignERKSs(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %agg.result, i8* %19)
          to label %bb48 unwind label %lpad80

bb48:                                             ; preds = %invcont41
  %20 = getelementptr inbounds i8* %19, i32 -12   ; <i8*> [#uses=2]
  %21 = icmp eq i8* %20, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %21, label %bb53, label %bb.i.i15

bb.i.i15:                                         ; preds = %bb48
  %22 = getelementptr inbounds i8* %19, i32 -4    ; <i8*> [#uses=1]
  %23 = bitcast i8* %22 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i16, label %bb1.i.i.i17

bb.i.i.i16:                                       ; preds = %bb.i.i15
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %24 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %23, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i18

bb1.i.i.i17:                                      ; preds = %bb.i.i15
  %25 = load i32* %23, align 4                    ; <i32> [#uses=2]
  %26 = add nsw i32 %25, -1                       ; <i32> [#uses=1]
  store i32 %26, i32* %23, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i18

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i18: ; preds = %bb1.i.i.i17, %bb.i.i.i16
  %27 = phi i32 [ %25, %bb1.i.i.i17 ], [ %24, %bb.i.i.i16 ] ; <i32> [#uses=1]
  %28 = icmp slt i32 %27, 1                       ; <i1> [#uses=1]
  br i1 %28, label %bb2.i.i19, label %bb53

bb2.i.i19:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i18
  call void @_ZdlPv(i8* %20) nounwind
  ret void

bb53:                                             ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i18, %bb48
  ret void

bb54:                                             ; preds = %invcont
  %.idx2 = getelementptr %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 2, i32 0, i32 0 ; <i8**> [#uses=1]
  %.idx2.val = load i8** %.idx2                   ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSs6assignERKSs(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %agg.result, i8* %.idx2.val)
          to label %return unwind label %lpad

invcont59:                                        ; preds = %bb2.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.1)
  unreachable

return:                                           ; preds = %bb54
  ret void

lpad:                                             ; preds = %bb54
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select63 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad64:                                           ; preds = %invcont24
  %eh_ptr65 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select67 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr65, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad68:                                           ; preds = %invcont25
  %eh_ptr69 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=4]
  %eh_select71 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr69, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %29 = getelementptr inbounds i8* %9, i32 -12    ; <i8*> [#uses=2]
  %30 = icmp eq i8* %29, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %30, label %ppad, label %bb.i.i8

bb.i.i8:                                          ; preds = %lpad68
  %31 = getelementptr inbounds i8* %9, i32 -4     ; <i8*> [#uses=1]
  %32 = bitcast i8* %31 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i9, label %bb1.i.i.i10

bb.i.i.i9:                                        ; preds = %bb.i.i8
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %33 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %32, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i11

bb1.i.i.i10:                                      ; preds = %bb.i.i8
  %34 = load i32* %32, align 4                    ; <i32> [#uses=2]
  %35 = add nsw i32 %34, -1                       ; <i32> [#uses=1]
  store i32 %35, i32* %32, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i11

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i11: ; preds = %bb1.i.i.i10, %bb.i.i.i9
  %36 = phi i32 [ %34, %bb1.i.i.i10 ], [ %33, %bb.i.i.i9 ] ; <i32> [#uses=1]
  %37 = icmp slt i32 %36, 1                       ; <i1> [#uses=1]
  br i1 %37, label %bb2.i.i12, label %ppad

bb2.i.i12:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i11
  call void @_ZdlPv(i8* %29) nounwind
  br label %ppad

lpad76:                                           ; preds = %invcont40
  %eh_ptr77 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select79 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr77, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad80:                                           ; preds = %invcont41
  %eh_ptr81 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=4]
  %eh_select83 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr81, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %38 = getelementptr inbounds i8* %19, i32 -12   ; <i8*> [#uses=2]
  %39 = icmp eq i8* %38, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %39, label %ppad, label %bb.i.i1

bb.i.i1:                                          ; preds = %lpad80
  %40 = getelementptr inbounds i8* %19, i32 -4    ; <i8*> [#uses=1]
  %41 = bitcast i8* %40 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2, label %bb1.i.i.i3

bb.i.i.i2:                                        ; preds = %bb.i.i1
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %42 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %41, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4

bb1.i.i.i3:                                       ; preds = %bb.i.i1
  %43 = load i32* %41, align 4                    ; <i32> [#uses=2]
  %44 = add nsw i32 %43, -1                       ; <i32> [#uses=1]
  store i32 %44, i32* %41, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4: ; preds = %bb1.i.i.i3, %bb.i.i.i2
  %45 = phi i32 [ %43, %bb1.i.i.i3 ], [ %42, %bb.i.i.i2 ] ; <i32> [#uses=1]
  %46 = icmp slt i32 %45, 1                       ; <i1> [#uses=1]
  br i1 %46, label %bb2.i.i5, label %ppad

bb2.i.i5:                                         ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4
  call void @_ZdlPv(i8* %38) nounwind
  br label %ppad

ppad:                                             ; preds = %bb2.i.i5, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4, %lpad80, %lpad76, %bb2.i.i12, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i11, %lpad68, %lpad64, %lpad
  %eh_exception.1 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr65, %lpad64 ], [ %eh_ptr69, %bb2.i.i12 ], [ %eh_ptr77, %lpad76 ], [ %eh_ptr81, %bb2.i.i5 ], [ %eh_ptr69, %lpad68 ], [ %eh_ptr69, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i11 ], [ %eh_ptr81, %lpad80 ], [ %eh_ptr81, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4 ] ; <i8*> [#uses=1]
  %47 = load i8** %0, align 4                     ; <i8*> [#uses=2]
  %48 = getelementptr inbounds i8* %47, i32 -12   ; <i8*> [#uses=2]
  %49 = icmp eq i8* %48, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %49, label %invcont59, label %bb.i.i

bb.i.i:                                           ; preds = %ppad
  %50 = getelementptr inbounds i8* %47, i32 -4    ; <i8*> [#uses=1]
  %51 = bitcast i8* %50 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %52 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %51, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i
  %53 = load i32* %51, align 4                    ; <i32> [#uses=2]
  %54 = add nsw i32 %53, -1                       ; <i32> [#uses=1]
  store i32 %54, i32* %51, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i: ; preds = %bb1.i.i.i, %bb.i.i.i
  %55 = phi i32 [ %53, %bb1.i.i.i ], [ %52, %bb.i.i.i ] ; <i32> [#uses=1]
  %56 = icmp slt i32 %55, 1                       ; <i1> [#uses=1]
  br i1 %56, label %bb2.i.i, label %invcont59

bb2.i.i:                                          ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i
  call void @_ZdlPv(i8* %48) nounwind
  br label %invcont59
}

declare void @_ZSt16__throw_bad_castv() noreturn

define internal fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %this.0.5.val) {
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
  %4 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 7, i32 32 ; <i8*> [#uses=1]
  %5 = load i8* %4, align 1                       ; <i8> [#uses=1]
  ret i8 %5

bb.i.i:                                           ; preds = %bb.i.i, %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %__i.01.i.i = phi i32 [ %6, %bb.i.i ], [ 0, %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit ] ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr [256 x i8]* %__tmp.i.i, i32 0, i32 %__i.01.i.i ; <i8*> [#uses=1]
  %tmp.i.i = trunc i32 %__i.01.i.i to i8          ; <i8> [#uses=1]
  store i8 %tmp.i.i, i8* %scevgep.i.i, align 1
  %6 = add i32 %__i.01.i.i, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %6, 256                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2.i.i, label %bb.i.i

bb2.i.i:                                          ; preds = %bb.i.i
  %7 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=2]
  %8 = load i32 (...)*** %7, align 4              ; <i32 (...)**> [#uses=1]
  %9 = getelementptr inbounds i32 (...)** %8, i32 7 ; <i32 (...)**> [#uses=1]
  %10 = load i32 (...)** %9, align 4              ; <i32 (...)*> [#uses=1]
  %11 = getelementptr inbounds %"struct.std::ctype<char>"* %this.0.5.val, i32 0, i32 7, i32 0 ; <i8*> [#uses=2]
  %12 = bitcast i32 (...)* %10 to i8* (%"struct.std::ctype<char>"*, i8*, i8*, i8*)* ; <i8* (%"struct.std::ctype<char>"*, i8*, i8*, i8*)*> [#uses=1]
  %13 = getelementptr inbounds [256 x i8]* %__tmp.i.i, i32 0, i32 0 ; <i8*> [#uses=2]
  %14 = getelementptr inbounds [256 x i8]* %__tmp.i.i, i32 0, i32 256 ; <i8*> [#uses=1]
  %15 = call i8* %12(%"struct.std::ctype<char>"* %this.0.5.val, i8* %13, i8* %14, i8* %11) ; <i8*> [#uses=0]
  store i8 1, i8* %1, align 4
  %16 = call i32 @memcmp(i8* %13, i8* %11, i32 256) nounwind readonly ; <i32> [#uses=1]
  %17 = icmp eq i32 %16, 0                        ; <i1> [#uses=1]
  br i1 %17, label %_ZNKSt5ctypeIcE13_M_widen_initEv.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb2.i.i
  store i8 2, i8* %1, align 4
  br label %_ZNKSt5ctypeIcE13_M_widen_initEv.exit.i

_ZNKSt5ctypeIcE13_M_widen_initEv.exit.i:          ; preds = %bb3.i.i, %bb2.i.i
  %18 = load i32 (...)*** %7, align 4             ; <i32 (...)**> [#uses=1]
  %19 = getelementptr inbounds i32 (...)** %18, i32 6 ; <i32 (...)**> [#uses=1]
  %20 = load i32 (...)** %19, align 4             ; <i32 (...)*> [#uses=1]
  %21 = bitcast i32 (...)* %20 to i8 (%"struct.std::ctype<char>"*, i8)* ; <i8 (%"struct.std::ctype<char>"*, i8)*> [#uses=1]
  %22 = call signext i8 %21(%"struct.std::ctype<char>"* %this.0.5.val, i8 signext 32) ; <i8> [#uses=1]
  ret i8 %22
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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
  %10 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val) ; <i8> [#uses=1]
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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

define internal fastcc void @_ZNSo9_M_insertImEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %this, i32 %__v) {
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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
  %44 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val)
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
  %64 = getelementptr inbounds i32 (...)** %63, i32 4 ; <i32 (...)**> [#uses=1]
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0)) noreturn
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

define internal fastcc void @_ZlsRSoRK6BigInt(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %os, %struct.BigInt* nocapture %ins_i) {
entry:
  %0 = getelementptr inbounds %struct.BigInt* %ins_i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <i32**> [#uses=1]
  %1 = load i32** %0, align 4                     ; <i32*> [#uses=1]
  %2 = ptrtoint i32* %1 to i32                    ; <i32> [#uses=1]
  %3 = getelementptr inbounds %struct.BigInt* %ins_i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=2]
  %4 = load i32** %3, align 4                     ; <i32*> [#uses=3]
  %5 = ptrtoint i32* %4 to i32                    ; <i32> [#uses=1]
  %6 = sub i32 %2, %5                             ; <i32> [#uses=1]
  %7 = ashr i32 %6, 2                             ; <i32> [#uses=2]
  %8 = icmp eq i32 %7, 1                          ; <i1> [#uses=1]
  br i1 %8, label %bb2, label %bb.nph

bb.nph:                                           ; preds = %entry
  %9 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %os, i32 0, i32 0 ; <i32 (...)***> [#uses=2]
  %10 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %os to i32 ; <i32> [#uses=2]
  %tmp = add i32 %7, -1                           ; <i32> [#uses=2]
  br label %bb

bb:                                               ; preds = %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit ] ; <i32> [#uses=2]
  %11 = phi i32* [ %4, %bb.nph ], [ %31, %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit ] ; <i32*> [#uses=1]
  %tmp11 = sub i32 %tmp, %indvar                  ; <i32> [#uses=1]
  %scevgep = getelementptr i32* %11, i32 %tmp11   ; <i32*> [#uses=1]
  %12 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  tail call fastcc void @_ZNSo9_M_insertImEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %os, i32 %12)
  %13 = load i32 (...)*** %9, align 4             ; <i32 (...)**> [#uses=1]
  %14 = getelementptr inbounds i32 (...)** %13, i32 -3 ; <i32 (...)**> [#uses=1]
  %15 = bitcast i32 (...)** %14 to i32*           ; <i32*> [#uses=1]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = add i32 %16, %10                          ; <i32> [#uses=1]
  %18 = inttoptr i32 %17 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %19 = getelementptr inbounds %"struct.std::ios_base"* %18, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 9, i32* %19, align 4
  %20 = load i32 (...)*** %9, align 4             ; <i32 (...)**> [#uses=1]
  %21 = getelementptr inbounds i32 (...)** %20, i32 -3 ; <i32 (...)**> [#uses=1]
  %22 = bitcast i32 (...)** %21 to i32*           ; <i32*> [#uses=1]
  %23 = load i32* %22, align 4                    ; <i32> [#uses=1]
  %24 = add i32 %23, %10                          ; <i32> [#uses=1]
  %25 = inttoptr i32 %24 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=4]
  %26 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %25, i32 0, i32 3 ; <i8*> [#uses=2]
  %27 = load i8* %26, align 1                     ; <i8> [#uses=1]
  %toBool.i.i.i = icmp eq i8 %27, 0               ; <i1> [#uses=1]
  br i1 %toBool.i.i.i, label %bb.i.i.i, label %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit

bb.i.i.i:                                         ; preds = %bb
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %25, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %28 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val) ; <i8> [#uses=1]
  %29 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %25, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %28, i8* %29, align 4
  store i8 1, i8* %26, align 1
  br label %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit

_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit: ; preds = %bb.i.i.i, %bb
  %30 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %25, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 48, i8* %30, align 4
  %31 = load i32** %3, align 4                    ; <i32*> [#uses=2]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %tmp      ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit, %entry
  %.lcssa = phi i32* [ %4, %entry ], [ %31, %_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E.exit ] ; <i32*> [#uses=1]
  %32 = load i32* %.lcssa, align 4                ; <i32> [#uses=1]
  tail call fastcc void @_ZNSo9_M_insertImEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %os, i32 %32)
  ret void
}

declare void @_ZNSt8ios_baseC2Ev(%"struct.std::ios_base"*)

declare void @_ZNSt6localeC1Ev(%"struct.std::locale"*) nounwind

declare void @_ZNSt6localeD1Ev(%"struct.std::locale"*) nounwind

declare i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._10*)

declare %"struct.std::ctype<char>"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"struct.std::locale"*)

declare void @_ZNSt8ios_base7_M_initEv(%"struct.std::ios_base"*)

declare void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"*)

define internal fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this) {
invcont1:
  %0 = ptrtoint %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this to i32 ; <i32> [#uses=3]
  %1 = add i32 %0, 44                             ; <i32> [#uses=1]
  %2 = inttoptr i32 %1 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=13]
  %3 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0 ; <%"struct.std::ios_base"*> [#uses=3]
  tail call void @_ZNSt8ios_baseC2Ev(%"struct.std::ios_base"* %3)
  %4 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  %5 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=2]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* null, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %5, align 4
  %6 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 2 ; <i8*> [#uses=2]
  store i8 0, i8* %6, align 4
  %7 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 3 ; <i8*> [#uses=2]
  store i8 0, i8* %7, align 1
  %8 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=2]
  store %"struct.std::basic_streambuf<char,std::char_traits<char> >"* null, %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %8, align 4
  %9 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=2]
  store %"struct.std::ctype<char>"* null, %"struct.std::ctype<char>"** %9, align 4
  %10 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=2]
  store %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* null, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %10, align 4
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 7 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=2]
  store %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* null, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %11, align 4
  %12 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %13 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  %.c2 = bitcast i8* %12 to i32 (...)**           ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c2, i32 (...)*** %13
  %14 = getelementptr inbounds i8* %12, i32 -12   ; <i8*> [#uses=1]
  %15 = bitcast i8* %14 to i32*                   ; <i32*> [#uses=1]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = add i32 %16, %0                           ; <i32> [#uses=1]
  %18 = inttoptr i32 %17 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %19 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %20 = bitcast i8* %19 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %18, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %20, i32 (...)*** %21, align 4
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 3), i32 (...)*** %13
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 8), i32 (...)*** %4, align 4
  %22 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=4]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %22, align 4
  %23 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 1 ; <i8**> [#uses=1]
  store i8* null, i8** %23, align 4
  %24 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 2 ; <i8**> [#uses=1]
  store i8* null, i8** %24, align 4
  %25 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 3 ; <i8**> [#uses=1]
  store i8* null, i8** %25, align 4
  %26 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 4 ; <i8**> [#uses=1]
  store i8* null, i8** %26, align 4
  %27 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 5 ; <i8**> [#uses=1]
  store i8* null, i8** %27, align 4
  %28 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 6 ; <i8**> [#uses=1]
  store i8* null, i8** %28, align 4
  %29 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 7 ; <%"struct.std::locale"*> [#uses=2]
  tail call void @_ZNSt6localeC1Ev(%"struct.std::locale"* %29) nounwind
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE, i32 0, i32 2), i32 (...)*** %22, align 4
  %30 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 1 ; <i32*> [#uses=1]
  store i32 16, i32* %30, align 4
  %31 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 2, i32 0, i32 0 ; <i8**> [#uses=2]
  store i8* bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), i8** %31, align 4
  %32 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  invoke void @_ZNSt8ios_base7_M_initEv(%"struct.std::ios_base"* %3)
          to label %.noexc unwind label %lpad22

.noexc:                                           ; preds = %invcont1
  %33 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 11 ; <%"struct.std::locale"*> [#uses=1]
  %34 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._10* @_ZNSt5ctypeIcE2idE)
          to label %invcont.i.i unwind label %lpad.i.i ; <i32> [#uses=2]

invcont.i.i:                                      ; preds = %.noexc
  %35 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 11, i32 0 ; <%"struct.std::locale::_Impl"**> [#uses=5]
  %36 = load %"struct.std::locale::_Impl"** %35, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %37 = getelementptr inbounds %"struct.std::locale::_Impl"* %36, i32 0, i32 2 ; <i32*> [#uses=1]
  %38 = load i32* %37, align 4                    ; <i32> [#uses=1]
  %39 = icmp ugt i32 %38, %34                     ; <i1> [#uses=1]
  br i1 %39, label %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i, label %bb2.i

lpad.i.i:                                         ; preds = %.noexc
  %eh_ptr.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i:   ; preds = %invcont.i.i
  %40 = getelementptr inbounds %"struct.std::locale::_Impl"* %36, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %41 = load %"struct.std::locale::facet"*** %40, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %42 = getelementptr inbounds %"struct.std::locale::facet"** %41, i32 %34 ; <%"struct.std::locale::facet"**> [#uses=1]
  %43 = load %"struct.std::locale::facet"** %42, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp23.i = icmp eq %"struct.std::locale::facet"* %43, null ; <i1> [#uses=1]
  br i1 %phitmp23.i, label %bb2.i, label %bb.i

bb.i:                                             ; preds = %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i
  %44 = invoke %"struct.std::ctype<char>"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"struct.std::locale"* %33)
          to label %bb2.i unwind label %lpad22    ; <%"struct.std::ctype<char>"*> [#uses=1]

bb2.i:                                            ; preds = %bb.i, %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i, %invcont.i.i
  %storemerge = phi %"struct.std::ctype<char>"* [ %44, %bb.i ], [ null, %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i ], [ null, %invcont.i.i ] ; <%"struct.std::ctype<char>"*> [#uses=1]
  store %"struct.std::ctype<char>"* %storemerge, %"struct.std::ctype<char>"** %9
  %45 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._10* @_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %invcont.i14.i unwind label %lpad.i21.i ; <i32> [#uses=2]

invcont.i14.i:                                    ; preds = %bb2.i
  %46 = load %"struct.std::locale::_Impl"** %35, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %47 = getelementptr inbounds %"struct.std::locale::_Impl"* %46, i32 0, i32 2 ; <i32*> [#uses=1]
  %48 = load i32* %47, align 4                    ; <i32> [#uses=1]
  %49 = icmp ugt i32 %48, %45                     ; <i1> [#uses=1]
  br i1 %49, label %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i, label %bb6.i

lpad.i21.i:                                       ; preds = %bb2.i
  %eh_ptr.i19.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i20.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i19.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i19.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i: ; preds = %invcont.i14.i
  %50 = getelementptr inbounds %"struct.std::locale::_Impl"* %46, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %51 = load %"struct.std::locale::facet"*** %50, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %52 = getelementptr inbounds %"struct.std::locale::facet"** %51, i32 %45 ; <%"struct.std::locale::facet"**> [#uses=1]
  %53 = load %"struct.std::locale::facet"** %52, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp22.i = icmp eq %"struct.std::locale::facet"* %53, null ; <i1> [#uses=1]
  br i1 %phitmp22.i, label %bb6.i, label %bb4.i

bb4.i:                                            ; preds = %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i
  %54 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._10* @_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %.noexc2 unwind label %lpad22  ; <i32> [#uses=2]

.noexc2:                                          ; preds = %bb4.i
  %55 = load %"struct.std::locale::_Impl"** %35, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %56 = getelementptr inbounds %"struct.std::locale::_Impl"* %55, i32 0, i32 2 ; <i32*> [#uses=1]
  %57 = load i32* %56, align 4                    ; <i32> [#uses=1]
  %58 = icmp ugt i32 %57, %54                     ; <i1> [#uses=1]
  br i1 %58, label %bb.i11.i, label %bb1.i12.i

bb.i11.i:                                         ; preds = %.noexc2
  %59 = getelementptr inbounds %"struct.std::locale::_Impl"* %55, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %60 = load %"struct.std::locale::facet"*** %59, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %61 = getelementptr inbounds %"struct.std::locale::facet"** %60, i32 %54 ; <%"struct.std::locale::facet"**> [#uses=1]
  %62 = load %"struct.std::locale::facet"** %61, align 4 ; <%"struct.std::locale::facet"*> [#uses=2]
  %63 = icmp eq %"struct.std::locale::facet"* %62, null ; <i1> [#uses=1]
  br i1 %63, label %bb1.i12.i, label %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i

bb1.i12.i:                                        ; preds = %bb.i11.i, %.noexc2
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc3 unwind label %lpad22

.noexc3:                                          ; preds = %bb1.i12.i
  unreachable

_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i: ; preds = %bb.i11.i
  %64 = bitcast %"struct.std::locale::facet"* %62 to %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i, %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i, %invcont.i14.i
  %storemerge6 = phi %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* [ %64, %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i ], [ null, %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i ], [ null, %invcont.i14.i ] ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=1]
  store %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %storemerge6, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %10
  %65 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._10* @_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %invcont.i3.i unwind label %lpad.i10.i ; <i32> [#uses=2]

invcont.i3.i:                                     ; preds = %bb6.i
  %66 = load %"struct.std::locale::_Impl"** %35, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %67 = getelementptr inbounds %"struct.std::locale::_Impl"* %66, i32 0, i32 2 ; <i32*> [#uses=1]
  %68 = load i32* %67, align 4                    ; <i32> [#uses=1]
  %69 = icmp ugt i32 %68, %65                     ; <i1> [#uses=1]
  br i1 %69, label %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i, label %return

lpad.i10.i:                                       ; preds = %bb6.i
  %eh_ptr.i8.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i9.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i8.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i8.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i: ; preds = %invcont.i3.i
  %70 = getelementptr inbounds %"struct.std::locale::_Impl"* %66, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %71 = load %"struct.std::locale::facet"*** %70, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %72 = getelementptr inbounds %"struct.std::locale::facet"** %71, i32 %65 ; <%"struct.std::locale::facet"**> [#uses=1]
  %73 = load %"struct.std::locale::facet"** %72, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp.i = icmp eq %"struct.std::locale::facet"* %73, null ; <i1> [#uses=1]
  br i1 %phitmp.i, label %return, label %bb8.i

bb8.i:                                            ; preds = %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i
  %74 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._10* @_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %.noexc4 unwind label %lpad22  ; <i32> [#uses=2]

.noexc4:                                          ; preds = %bb8.i
  %75 = load %"struct.std::locale::_Impl"** %35, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %76 = getelementptr inbounds %"struct.std::locale::_Impl"* %75, i32 0, i32 2 ; <i32*> [#uses=1]
  %77 = load i32* %76, align 4                    ; <i32> [#uses=1]
  %78 = icmp ugt i32 %77, %74                     ; <i1> [#uses=1]
  br i1 %78, label %bb.i1.i, label %bb1.i.i

bb.i1.i:                                          ; preds = %.noexc4
  %79 = getelementptr inbounds %"struct.std::locale::_Impl"* %75, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %80 = load %"struct.std::locale::facet"*** %79, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %81 = getelementptr inbounds %"struct.std::locale::facet"** %80, i32 %74 ; <%"struct.std::locale::facet"**> [#uses=1]
  %82 = load %"struct.std::locale::facet"** %81, align 4 ; <%"struct.std::locale::facet"*> [#uses=2]
  %83 = icmp eq %"struct.std::locale::facet"* %82, null ; <i1> [#uses=1]
  br i1 %83, label %bb1.i.i, label %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i

bb1.i.i:                                          ; preds = %bb.i1.i, %.noexc4
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc5 unwind label %lpad22

.noexc5:                                          ; preds = %bb1.i.i
  unreachable

_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i: ; preds = %bb.i1.i
  %84 = bitcast %"struct.std::locale::facet"* %82 to %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=1]
  br label %return

invcont13:                                        ; preds = %ppad
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr23)
  unreachable

return:                                           ; preds = %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i, %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i, %invcont.i3.i
  %storemerge7 = phi %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* [ %84, %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i ], [ null, %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i ], [ null, %invcont.i3.i ] ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=1]
  store %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %storemerge7, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %11
  store i8 0, i8* %6, align 4
  store i8 0, i8* %7, align 1
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* null, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %5, align 4
  %85 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %85, align 4
  store %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %32, %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %8, align 4
  %86 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %32, null ; <i1> [#uses=1]
  %_ZNSt8ios_base6badbitE.val.i = load i32* @_ZNSt8ios_base6badbitE ; <i32> [#uses=1]
  %_ZNSt8ios_base7goodbitE.val.i = load i32* @_ZNSt8ios_base7goodbitE ; <i32> [#uses=1]
  %iftmp.189.0.i = select i1 %86, i32 %_ZNSt8ios_base6badbitE.val.i, i32 %_ZNSt8ios_base7goodbitE.val.i ; <i32> [#uses=1]
  %87 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 %iftmp.189.0.i, i32* %87, align 4
  ret void

lpad22:                                           ; preds = %bb1.i.i, %bb8.i, %bb1.i12.i, %bb4.i, %bb.i, %invcont1
  %eh_ptr23 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select25 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr23, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE, i32 0, i32 2), i32 (...)*** %22, align 4
  %88 = load i8** %31, align 4                    ; <i8*> [#uses=2]
  %89 = getelementptr inbounds i8* %88, i32 -12   ; <i8*> [#uses=2]
  %90 = icmp eq i8* %89, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %90, label %ppad, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %lpad22
  %91 = getelementptr inbounds i8* %88, i32 -4    ; <i8*> [#uses=1]
  %92 = bitcast i8* %91 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i, label %bb1.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i
  tail call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %93 = tail call i32 @llvm.atomic.load.add.i32.p0i32(i32* %92, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i
  %94 = load i32* %92, align 4                    ; <i32> [#uses=2]
  %95 = add nsw i32 %94, -1                       ; <i32> [#uses=1]
  store i32 %95, i32* %92, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i: ; preds = %bb1.i.i.i.i, %bb.i.i.i.i
  %96 = phi i32 [ %94, %bb1.i.i.i.i ], [ %93, %bb.i.i.i.i ] ; <i32> [#uses=1]
  %97 = icmp slt i32 %96, 1                       ; <i1> [#uses=1]
  br i1 %97, label %bb2.i.i.i, label %ppad

bb2.i.i.i:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i
  tail call void @_ZdlPv(i8* %89) nounwind
  br label %ppad

lpad34:                                           ; preds = %ppad
  %eh_ptr35 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=1]
  %eh_select37 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr35, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad:                                             ; preds = %bb2.i.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i, %lpad22
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %22, align 4
  tail call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %29) nounwind
  %98 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %.c = bitcast i8* %98 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c, i32 (...)*** %13
  %99 = getelementptr inbounds i8* %98, i32 -12   ; <i8*> [#uses=1]
  %100 = bitcast i8* %99 to i32*                  ; <i32*> [#uses=1]
  %101 = load i32* %100, align 4                  ; <i32> [#uses=1]
  %102 = add i32 %101, %0                         ; <i32> [#uses=1]
  %103 = inttoptr i32 %102 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %104 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %105 = bitcast i8* %104 to i32 (...)**          ; <i32 (...)**> [#uses=1]
  %106 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %103, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %105, i32 (...)*** %106, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  invoke void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %3)
          to label %invcont13 unwind label %lpad34
}

define internal fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=2]
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 3), i32 (...)*** %0
  %1 = ptrtoint %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this to i32 ; <i32> [#uses=2]
  %2 = add i32 %1, 44                             ; <i32> [#uses=1]
  %3 = inttoptr i32 %2 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %3, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=2]
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 8), i32 (...)*** %4, align 4
  %5 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=2]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE, i32 0, i32 2), i32 (...)*** %5, align 4
  %6 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 2, i32 0, i32 0 ; <i8**> [#uses=1]
  %7 = load i8** %6, align 4                      ; <i8*> [#uses=2]
  %8 = getelementptr inbounds i8* %7, i32 -12     ; <i8*> [#uses=2]
  %9 = icmp eq i8* %8, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %9, label %bb17, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %entry
  %10 = getelementptr inbounds i8* %7, i32 -4     ; <i8*> [#uses=1]
  %11 = bitcast i8* %10 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i, label %bb1.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i
  tail call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %12 = tail call i32 @llvm.atomic.load.add.i32.p0i32(i32* %11, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i
  %13 = load i32* %11, align 4                    ; <i32> [#uses=2]
  %14 = add nsw i32 %13, -1                       ; <i32> [#uses=1]
  store i32 %14, i32* %11, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i: ; preds = %bb1.i.i.i.i, %bb.i.i.i.i
  %15 = phi i32 [ %13, %bb1.i.i.i.i ], [ %12, %bb.i.i.i.i ] ; <i32> [#uses=1]
  %16 = icmp slt i32 %15, 1                       ; <i1> [#uses=1]
  br i1 %16, label %bb2.i.i.i, label %bb17

bb2.i.i.i:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i
  tail call void @_ZdlPv(i8* %8) nounwind
  br label %bb17

bb17:                                             ; preds = %bb2.i.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i, %entry
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %5, align 4
  %17 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 1, i32 0, i32 7 ; <%"struct.std::locale"*> [#uses=1]
  tail call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %17) nounwind
  %18 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %.c = bitcast i8* %18 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  store i32 (...)** %.c, i32 (...)*** %0
  %19 = getelementptr inbounds i8* %18, i32 -12   ; <i8*> [#uses=1]
  %20 = bitcast i8* %19 to i32*                   ; <i32*> [#uses=1]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=1]
  %22 = add i32 %21, %1                           ; <i32> [#uses=1]
  %23 = inttoptr i32 %22 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %24 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %25 = bitcast i8* %24 to i32 (...)**            ; <i32 (...)**> [#uses=1]
  %26 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %23, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %25, i32 (...)*** %26, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  %27 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %3, i32 0, i32 0 ; <%"struct.std::ios_base"*> [#uses=1]
  tail call void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %27)
  ret void
}

define internal fastcc void @_ZN9Fibonacci11show_numberEm(%struct.Fibonacci* %this, i32 %n_i) {
entry:
  %oss = alloca %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=5]
  %0 = alloca %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %1 = alloca %struct.BigInt, align 8             ; <%struct.BigInt*> [#uses=2]
  call fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss)
  %2 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %3 = load %struct.BigInt** %2, align 4          ; <%struct.BigInt*> [#uses=1]
  %4 = ptrtoint %struct.BigInt* %3 to i32         ; <i32> [#uses=1]
  %5 = getelementptr inbounds %struct.Fibonacci* %this, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %6 = load %struct.BigInt** %5, align 4          ; <%struct.BigInt*> [#uses=1]
  %7 = ptrtoint %struct.BigInt* %6 to i32         ; <i32> [#uses=1]
  %8 = sub i32 %4, %7                             ; <i32> [#uses=1]
  %9 = sdiv exact i32 %8, 12                      ; <i32> [#uses=1]
  %10 = icmp ugt i32 %9, %n_i                     ; <i1> [#uses=1]
  br i1 %10, label %bb2, label %bb

bb:                                               ; preds = %entry
  invoke fastcc void @_ZN9Fibonacci10get_numberEj(%struct.BigInt* noalias sret %1, %struct.Fibonacci* %this, i32 %n_i)
          to label %invcont unwind label %lpad

invcont:                                          ; preds = %bb
  %11 = getelementptr inbounds %struct.BigInt* %1, i32 0, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %12 = load i32** %11, align 8                   ; <i32*> [#uses=2]
  %13 = icmp eq i32* %12, null                    ; <i1> [#uses=1]
  br i1 %13, label %bb2, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %invcont
  %14 = bitcast i32* %12 to i8*                   ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %14) nounwind
  br label %bb2

bb2:                                              ; preds = %bb.i.i.i.i, %invcont, %entry
  %15 = load %struct.BigInt** %5, align 4         ; <%struct.BigInt*> [#uses=1]
  %16 = getelementptr inbounds %struct.BigInt* %15, i32 %n_i ; <%struct.BigInt*> [#uses=1]
  %17 = bitcast %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss to %"struct.std::basic_ostream<char,std::char_traits<char> >"* ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %17, i8* getelementptr inbounds ([6 x i8]* @.str20, i32 0, i32 0), i32 5)
          to label %invcont3 unwind label %lpad

invcont3:                                         ; preds = %bb2
  invoke fastcc void @_ZNSo9_M_insertImEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %17, i32 %n_i)
          to label %invcont4 unwind label %lpad

invcont4:                                         ; preds = %invcont3
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %17, i8* getelementptr inbounds ([5 x i8]* @.str21, i32 0, i32 0), i32 4)
          to label %invcont5 unwind label %lpad

invcont5:                                         ; preds = %invcont4
  invoke fastcc void @_ZlsRSoRK6BigInt(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %17, %struct.BigInt* %16)
          to label %invcont6 unwind label %lpad

invcont6:                                         ; preds = %invcont5
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %17, i8* getelementptr inbounds ([2 x i8]* @.str22, i32 0, i32 0), i32 1)
          to label %invcont7 unwind label %lpad

invcont7:                                         ; preds = %invcont6
  %18 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss, i32 0, i32 1 ; <%"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  invoke fastcc void @_ZNKSt15basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* noalias sret %0, %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %18)
          to label %invcont8 unwind label %lpad

invcont8:                                         ; preds = %invcont7
  %19 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %0, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  %20 = load i8** %19, align 8                    ; <i8*> [#uses=2]
  %21 = getelementptr inbounds i8* %20, i32 -12   ; <i8*> [#uses=1]
  %22 = bitcast i8* %21 to i32*                   ; <i32*> [#uses=1]
  %23 = load i32* %22, align 4                    ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* %20, i32 %23)
          to label %bb13 unwind label %lpad23

bb13:                                             ; preds = %invcont8
  %24 = load i8** %19, align 8                    ; <i8*> [#uses=2]
  %25 = getelementptr inbounds i8* %24, i32 -12   ; <i8*> [#uses=2]
  %26 = icmp eq i8* %25, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %26, label %bb20, label %bb.i.i1

bb.i.i1:                                          ; preds = %bb13
  %27 = getelementptr inbounds i8* %24, i32 -4    ; <i8*> [#uses=1]
  %28 = bitcast i8* %27 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2, label %bb1.i.i.i3

bb.i.i.i2:                                        ; preds = %bb.i.i1
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %29 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %28, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4

bb1.i.i.i3:                                       ; preds = %bb.i.i1
  %30 = load i32* %28, align 4                    ; <i32> [#uses=2]
  %31 = add nsw i32 %30, -1                       ; <i32> [#uses=1]
  store i32 %31, i32* %28, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4: ; preds = %bb1.i.i.i3, %bb.i.i.i2
  %32 = phi i32 [ %30, %bb1.i.i.i3 ], [ %29, %bb.i.i.i2 ] ; <i32> [#uses=1]
  %33 = icmp slt i32 %32, 1                       ; <i1> [#uses=1]
  br i1 %33, label %bb2.i.i5, label %bb20

bb2.i.i5:                                         ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4
  call void @_ZdlPv(i8* %25) nounwind
  br label %bb20

invcont18:                                        ; preds = %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

bb20:                                             ; preds = %bb2.i.i5, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4, %bb13
  call fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss)
  ret void

lpad:                                             ; preds = %invcont7, %invcont6, %invcont5, %invcont4, %invcont3, %bb2, %bb
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select22 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad23:                                           ; preds = %invcont8
  %eh_ptr24 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=4]
  %eh_select26 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %34 = load i8** %19, align 8                    ; <i8*> [#uses=2]
  %35 = getelementptr inbounds i8* %34, i32 -12   ; <i8*> [#uses=2]
  %36 = icmp eq i8* %35, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %36, label %ppad, label %bb.i.i

bb.i.i:                                           ; preds = %lpad23
  %37 = getelementptr inbounds i8* %34, i32 -4    ; <i8*> [#uses=1]
  %38 = bitcast i8* %37 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %39 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %38, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i
  %40 = load i32* %38, align 4                    ; <i32> [#uses=2]
  %41 = add nsw i32 %40, -1                       ; <i32> [#uses=1]
  store i32 %41, i32* %38, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i: ; preds = %bb1.i.i.i, %bb.i.i.i
  %42 = phi i32 [ %40, %bb1.i.i.i ], [ %39, %bb.i.i.i ] ; <i32> [#uses=1]
  %43 = icmp slt i32 %42, 1                       ; <i1> [#uses=1]
  br i1 %43, label %bb2.i.i, label %ppad

bb2.i.i:                                          ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i
  call void @_ZdlPv(i8* %35) nounwind
  br label %ppad

lpad31:                                           ; preds = %ppad
  %eh_ptr32 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select34 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr32, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad:                                             ; preds = %bb2.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i, %lpad23, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr24, %bb2.i.i ], [ %eh_ptr24, %lpad23 ], [ %eh_ptr24, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss)
          to label %invcont18 unwind label %lpad31
}

define i32 @main(i32 %argc, i8** nocapture %argv) {
invcont:
  %oss.i46 = alloca %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=5]
  %0 = alloca %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %oss.i = alloca %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=5]
  %1 = alloca %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %fib = alloca %struct.Fibonacci, align 8        ; <%struct.Fibonacci*> [#uses=6]
  %fib2 = alloca %struct.Fibonacci, align 8       ; <%struct.Fibonacci*> [#uses=6]
  %fib3 = alloca %struct.Fibonacci, align 8       ; <%struct.Fibonacci*> [#uses=5]
  %fib4 = alloca %struct.Fibonacci, align 8       ; <%struct.Fibonacci*> [#uses=5]
  %2 = icmp sgt i32 %argc, 2                      ; <i1> [#uses=1]
  br i1 %2, label %bb11.i, label %_Z5checkiPPc.exit

bb11.i:                                           ; preds = %invcont
  %3 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %4 = load i8** %3, align 4                      ; <i8*> [#uses=9]
  %5 = icmp eq i8* %4, null                       ; <i1> [#uses=2]
  br i1 %5, label %bb1.i.i2, label %bb.i.i1

bb.i.i1:                                          ; preds = %bb11.i
  %6 = call i32 @strlen(i8* %4) nounwind readonly ; <i32> [#uses=1]
  %7 = getelementptr inbounds i8* %4, i32 %6      ; <i8*> [#uses=1]
  br label %bb2.i.i3

bb1.i.i2:                                         ; preds = %bb11.i
  %8 = getelementptr inbounds i8* %4, i32 -1      ; <i8*> [#uses=1]
  br label %bb2.i.i3

bb2.i.i3:                                         ; preds = %bb1.i.i2, %bb.i.i1
  %iftmp.151.0.i.i = phi i8* [ %7, %bb.i.i1 ], [ %8, %bb1.i.i2 ] ; <i8*> [#uses=3]
  %9 = icmp eq i8* %4, %iftmp.151.0.i.i           ; <i1> [#uses=1]
  br i1 %9, label %_ZNSs12_S_constructIPKcEEPcT_S3_RKSaIcESt20forward_iterator_tag.exit.i, label %bb12.i.i

bb12.i.i:                                         ; preds = %bb2.i.i3
  br i1 %5, label %bb22.i.i, label %bb23.i.i

bb22.i.i:                                         ; preds = %bb12.i.i
  invoke void @_ZSt19__throw_logic_errorPKc(i8* getelementptr inbounds ([42 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc5.i unwind label %lpad.i

.noexc5.i:                                        ; preds = %bb22.i.i
  unreachable

bb23.i.i:                                         ; preds = %bb12.i.i
  %10 = ptrtoint i8* %iftmp.151.0.i.i to i32      ; <i32> [#uses=1]
  %11 = ptrtoint i8* %4 to i32                    ; <i32> [#uses=1]
  %12 = sub i32 %10, %11                          ; <i32> [#uses=9]
  %13 = icmp ugt i32 %12, 1073741820              ; <i1> [#uses=1]
  br i1 %13, label %bb.i.i2.i, label %bb1.i.i.i4

bb.i.i2.i:                                        ; preds = %bb23.i.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc6.i unwind label %lpad.i

.noexc6.i:                                        ; preds = %bb.i.i2.i
  unreachable

bb1.i.i.i4:                                       ; preds = %bb23.i.i
  %14 = add i32 %12, 29                           ; <i32> [#uses=2]
  %15 = icmp ugt i32 %14, 4096                    ; <i1> [#uses=1]
  %16 = icmp ne i8* %iftmp.151.0.i.i, %4          ; <i1> [#uses=1]
  %17 = and i1 %15, %16                           ; <i1> [#uses=1]
  br i1 %17, label %bb7.i.i.i, label %bb10.i.i.i

bb7.i.i.i:                                        ; preds = %bb1.i.i.i4
  %18 = and i32 %14, 4095                         ; <i32> [#uses=1]
  %19 = sub i32 4096, %18                         ; <i32> [#uses=1]
  %20 = add i32 %19, %12                          ; <i32> [#uses=2]
  %21 = icmp ugt i32 %20, 1073741820              ; <i1> [#uses=1]
  %__capacity_addr.2.i.i.i = select i1 %21, i32 1073741820, i32 %20 ; <i32> [#uses=2]
  br label %bb10.i.i.i

bb10.i.i.i:                                       ; preds = %bb7.i.i.i, %bb1.i.i.i4
  %__size.0.in.i.i.i = phi i32 [ %__capacity_addr.2.i.i.i, %bb7.i.i.i ], [ %12, %bb1.i.i.i4 ] ; <i32> [#uses=1]
  %__capacity_addr.1.i.i.i = phi i32 [ %__capacity_addr.2.i.i.i, %bb7.i.i.i ], [ %12, %bb1.i.i.i4 ] ; <i32> [#uses=1]
  %__size.0.i.i.i = add i32 %__size.0.in.i.i.i, 13 ; <i32> [#uses=1]
  %22 = invoke i8* @_Znwj(i32 %__size.0.i.i.i)
          to label %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i.i unwind label %lpad.i.i.i ; <i8*> [#uses=5]

lpad.i.i.i:                                       ; preds = %bb10.i.i.i
  %eh_ptr.i.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select14.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc7.i unwind label %lpad.i

.noexc7.i:                                        ; preds = %lpad.i.i.i
  unreachable

_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i.i:          ; preds = %bb10.i.i.i
  %23 = getelementptr inbounds i8* %22, i32 4     ; <i8*> [#uses=1]
  %24 = bitcast i8* %23 to i32*                   ; <i32*> [#uses=1]
  store i32 %__capacity_addr.1.i.i.i, i32* %24, align 4
  %25 = getelementptr inbounds i8* %22, i32 8     ; <i8*> [#uses=1]
  %26 = bitcast i8* %25 to i32*                   ; <i32*> [#uses=2]
  store i32 0, i32* %26, align 4
  %27 = getelementptr inbounds i8* %22, i32 12    ; <i8*> [#uses=3]
  %28 = icmp eq i32 %12, 1                        ; <i1> [#uses=1]
  br i1 %28, label %bb.i.i.i3.i, label %bb1.i.i.i4.i

bb.i.i.i3.i:                                      ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i.i
  %29 = load i8* %4, align 1                      ; <i8> [#uses=1]
  store i8 %29, i8* %27
  br label %bb30.i.i

bb1.i.i.i4.i:                                     ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i.i
  call void @llvm.memcpy.i32(i8* %27, i8* %4, i32 %12, i32 1) nounwind
  br label %bb30.i.i

bb30.i.i:                                         ; preds = %bb1.i.i.i4.i, %bb.i.i.i3.i
  store i32 0, i32* %26, align 4
  %30 = bitcast i8* %22 to i32*                   ; <i32*> [#uses=1]
  store i32 %12, i32* %30, align 4
  %.sum.i.i = add i32 %12, 12                     ; <i32> [#uses=1]
  %31 = getelementptr inbounds i8* %22, i32 %.sum.i.i ; <i8*> [#uses=1]
  %32 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %32, i8* %31, align 1
  br label %_ZNSs12_S_constructIPKcEEPcT_S3_RKSaIcESt20forward_iterator_tag.exit.i

_ZNSs12_S_constructIPKcEEPcT_S3_RKSaIcESt20forward_iterator_tag.exit.i: ; preds = %bb30.i.i, %bb2.i.i3
  %33 = phi i8* [ %27, %bb30.i.i ], [ bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), %bb2.i.i3 ] ; <i8*> [#uses=10]
  %34 = getelementptr inbounds i8* %33, i32 -12   ; <i8*> [#uses=7]
  %35 = bitcast i8* %34 to i32*                   ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=9]
  %37 = icmp ugt i32 %36, 3                       ; <i1> [#uses=1]
  %38 = select i1 %37, i32 3, i32 %36             ; <i32> [#uses=1]
  %39 = call i32 @memcmp(i8* %33, i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %38) nounwind readonly ; <i32> [#uses=2]
  %40 = icmp eq i32 %39, 0                        ; <i1> [#uses=1]
  %41 = add i32 %36, -3                           ; <i32> [#uses=1]
  %42 = select i1 %40, i32 %41, i32 %39           ; <i32> [#uses=1]
  %43 = icmp eq i32 %42, 0                        ; <i1> [#uses=1]
  br i1 %43, label %bb30.i, label %invcont18.i

invcont18.i:                                      ; preds = %_ZNSs12_S_constructIPKcEEPcT_S3_RKSaIcESt20forward_iterator_tag.exit.i
  %44 = icmp ugt i32 %36, 2                       ; <i1> [#uses=1]
  %45 = select i1 %44, i32 2, i32 %36             ; <i32> [#uses=1]
  %46 = call i32 @memcmp(i8* %33, i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i32 %45) nounwind readonly ; <i32> [#uses=2]
  %47 = icmp eq i32 %46, 0                        ; <i1> [#uses=1]
  %48 = add i32 %36, -2                           ; <i32> [#uses=1]
  %49 = select i1 %47, i32 %48, i32 %46           ; <i32> [#uses=1]
  %50 = icmp eq i32 %49, 0                        ; <i1> [#uses=1]
  br i1 %50, label %bb30.i, label %invcont21.i

invcont21.i:                                      ; preds = %invcont18.i
  %51 = icmp ugt i32 %36, 4                       ; <i1> [#uses=1]
  %52 = select i1 %51, i32 4, i32 %36             ; <i32> [#uses=2]
  %53 = call i32 @memcmp(i8* %33, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0), i32 %52) nounwind readonly ; <i32> [#uses=2]
  %54 = icmp eq i32 %53, 0                        ; <i1> [#uses=1]
  %55 = add i32 %36, -4                           ; <i32> [#uses=2]
  %56 = select i1 %54, i32 %55, i32 %53           ; <i32> [#uses=1]
  %57 = icmp eq i32 %56, 0                        ; <i1> [#uses=1]
  br i1 %57, label %bb30.i, label %invcont24.i

invcont24.i:                                      ; preds = %invcont21.i
  %58 = call i32 @memcmp(i8* %33, i8* getelementptr inbounds ([5 x i8]* @.str9, i32 0, i32 0), i32 %52) nounwind readonly ; <i32> [#uses=2]
  %59 = icmp eq i32 %58, 0                        ; <i1> [#uses=1]
  %60 = select i1 %59, i32 %55, i32 %58           ; <i32> [#uses=1]
  %61 = icmp eq i32 %60, 0                        ; <i1> [#uses=1]
  br i1 %61, label %bb30.i, label %bb40.i

bb30.i:                                           ; preds = %invcont24.i, %invcont21.i, %invcont18.i, %_ZNSs12_S_constructIPKcEEPcT_S3_RKSaIcESt20forward_iterator_tag.exit.i
  %62 = getelementptr inbounds i8* %33, i32 -4    ; <i8*> [#uses=1]
  %63 = bitcast i8* %62 to i32*                   ; <i32*> [#uses=6]
  %64 = load i32* %63, align 4                    ; <i32> [#uses=2]
  %toBool.i.i.i.i = icmp slt i32 %64, 0           ; <i1> [#uses=1]
  br i1 %toBool.i.i.i.i, label %bb12.i.i.i.i, label %bb11.i.i.i.i

bb11.i.i.i.i:                                     ; preds = %bb30.i
  %65 = icmp eq i8* %34, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %65, label %bb40.i, label %bb.i.i.i.i.i6

bb.i.i.i.i.i6:                                    ; preds = %bb11.i.i.i.i
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i, label %bb1.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb.i.i.i.i.i6
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %66 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %63, i32 1) nounwind ; <i32> [#uses=0]
  br label %bb40.i

bb1.i.i.i.i.i.i:                                  ; preds = %bb.i.i.i.i.i6
  %67 = add nsw i32 %64, 1                        ; <i32> [#uses=1]
  store i32 %67, i32* %63, align 4
  br label %bb40.i

bb12.i.i.i.i:                                     ; preds = %bb30.i
  %68 = bitcast i8* %34 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*> [#uses=1]
  %69 = invoke fastcc i8* @_ZNSs4_Rep8_M_cloneERKSaIcEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %68)
          to label %bb40.i unwind label %ppad.i.i.i ; <i8*> [#uses=1]

ppad.i.i.i:                                       ; preds = %bb12.i.i.i.i
  %eh_ptr19.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select21.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr19.i.i.i)
          to label %.noexc.i unwind label %lpad45.i

.noexc.i:                                         ; preds = %ppad.i.i.i
  unreachable

bb40.i:                                           ; preds = %bb12.i.i.i.i, %bb1.i.i.i.i.i.i, %bb.i.i.i.i.i.i, %bb11.i.i.i.i, %invcont24.i
  %option.0.0.1 = phi i8* [ bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), %invcont24.i ], [ %33, %bb1.i.i.i.i.i.i ], [ %33, %bb.i.i.i.i.i.i ], [ %33, %bb11.i.i.i.i ], [ %69, %bb12.i.i.i.i ] ; <i8*> [#uses=3]
  %70 = icmp eq i8* %34, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %70, label %_Z5checkiPPc.exit, label %bb.i.i1.i

bb.i.i1.i:                                        ; preds = %bb40.i
  %71 = getelementptr inbounds i8* %33, i32 -4    ; <i8*> [#uses=1]
  %72 = bitcast i8* %71 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2.i, label %bb1.i.i.i3.i

bb.i.i.i2.i:                                      ; preds = %bb.i.i1.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %73 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %72, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i

bb1.i.i.i3.i:                                     ; preds = %bb.i.i1.i
  %74 = load i32* %72, align 4                    ; <i32> [#uses=2]
  %75 = add nsw i32 %74, -1                       ; <i32> [#uses=1]
  store i32 %75, i32* %72, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i: ; preds = %bb1.i.i.i3.i, %bb.i.i.i2.i
  %76 = phi i32 [ %74, %bb1.i.i.i3.i ], [ %73, %bb.i.i.i2.i ] ; <i32> [#uses=1]
  %77 = icmp slt i32 %76, 1                       ; <i1> [#uses=1]
  br i1 %77, label %bb2.i.i5.i, label %_Z5checkiPPc.exit

bb2.i.i5.i:                                       ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i
  call void @_ZdlPv(i8* %34) nounwind
  br label %_Z5checkiPPc.exit

lpad.i:                                           ; preds = %lpad.i.i.i, %bb.i.i2.i, %bb22.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select44.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %Unwind.i

lpad45.i:                                         ; preds = %ppad.i.i.i
  %eh_ptr46.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=4]
  %eh_select48.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr46.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %78 = icmp eq i8* %34, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %78, label %Unwind.i, label %bb.i.i.i7

bb.i.i.i7:                                        ; preds = %lpad45.i
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i, label %bb1.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i7
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %79 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %63, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i7
  %80 = load i32* %63, align 4                    ; <i32> [#uses=2]
  %81 = add nsw i32 %80, -1                       ; <i32> [#uses=1]
  store i32 %81, i32* %63, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i: ; preds = %bb1.i.i.i.i, %bb.i.i.i.i
  %82 = phi i32 [ %80, %bb1.i.i.i.i ], [ %79, %bb.i.i.i.i ] ; <i32> [#uses=1]
  %83 = icmp slt i32 %82, 1                       ; <i1> [#uses=1]
  br i1 %83, label %bb2.i.i.i, label %Unwind.i

bb2.i.i.i:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i
  call void @_ZdlPv(i8* %34) nounwind
  br label %Unwind.i

Unwind.i:                                         ; preds = %bb2.i.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i, %lpad45.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr46.i, %bb2.i.i.i ], [ %eh_ptr46.i, %lpad45.i ], [ %eh_ptr46.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i ] ; <i8*> [#uses=1]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

_Z5checkiPPc.exit:                                ; preds = %bb2.i.i5.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i, %bb40.i, %invcont
  %option.0.0.0 = phi i8* [ %option.0.0.1, %bb2.i.i5.i ], [ bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), %invcont ], [ %option.0.0.1, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i ], [ %option.0.0.1, %bb40.i ] ; <i8*> [#uses=16]
  %84 = getelementptr inbounds i8* %option.0.0.0, i32 -12 ; <i8*> [#uses=3]
  %85 = bitcast i8* %84 to i32*                   ; <i32*> [#uses=2]
  %86 = load i32* %85, align 4                    ; <i32> [#uses=2]
  %87 = icmp eq i32 %86, 0                        ; <i1> [#uses=1]
  br i1 %87, label %bb, label %bb6

bb:                                               ; preds = %_Z5checkiPPc.exit
  %88 = icmp ugt i8* %option.0.0.0, getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %88, label %bb6.i, label %_ZNKSs11_M_disjunctEPKc.exit.i

_ZNKSs11_M_disjunctEPKc.exit.i:                   ; preds = %bb
  %89 = getelementptr inbounds i8* %option.0.0.0, i32 %86 ; <i8*> [#uses=1]
  %phitmp.i = icmp ult i8* %89, getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %phitmp.i, label %bb6.i, label %bb.i8

bb.i8:                                            ; preds = %_ZNKSs11_M_disjunctEPKc.exit.i
  %90 = getelementptr inbounds i8* %option.0.0.0, i32 -4 ; <i8*> [#uses=1]
  %91 = bitcast i8* %90 to i32*                   ; <i32*> [#uses=2]
  %92 = load i32* %91, align 4                    ; <i32> [#uses=1]
  %93 = icmp sgt i32 %92, 0                       ; <i1> [#uses=1]
  br i1 %93, label %bb6.i, label %bb3.i

bb3.i:                                            ; preds = %bb.i8
  %94 = ptrtoint i8* %option.0.0.0 to i32         ; <i32> [#uses=1]
  %95 = sub i32 ptrtoint ([3 x i8]* @.str7 to i32), %94 ; <i32> [#uses=1]
  %96 = icmp ult i32 %95, 2                       ; <i1> [#uses=1]
  br i1 %96, label %bb9.i, label %bb8.i

bb6.i:                                            ; preds = %bb.i8, %_ZNKSs11_M_disjunctEPKc.exit.i, %bb
  %97 = getelementptr inbounds i8* %option.0.0.0, i32 -8 ; <i8*> [#uses=1]
  %98 = bitcast i8* %97 to i32*                   ; <i32*> [#uses=1]
  %99 = load i32* %98, align 4                    ; <i32> [#uses=4]
  %100 = icmp ult i32 %99, 2                      ; <i1> [#uses=1]
  br i1 %100, label %bb2.i12.i.i, label %bb.i.i9

bb.i.i9:                                          ; preds = %bb6.i
  %101 = getelementptr inbounds i8* %option.0.0.0, i32 -4 ; <i8*> [#uses=1]
  %102 = bitcast i8* %101 to i32*                 ; <i32*> [#uses=1]
  %103 = load i32* %102, align 4                  ; <i32> [#uses=1]
  %104 = icmp sgt i32 %103, 0                     ; <i1> [#uses=1]
  br i1 %104, label %bb1.i11.i.i, label %_ZNSs9_M_mutateEjjj.exit.i

bb1.i11.i.i:                                      ; preds = %bb.i.i9
  %105 = icmp ult i32 %99, 2                      ; <i1> [#uses=1]
  br i1 %105, label %bb2.i12.i.i, label %bb4.i.i.i

bb2.i12.i.i:                                      ; preds = %bb1.i11.i.i, %bb6.i
  %106 = shl i32 %99, 1                           ; <i32> [#uses=2]
  %107 = icmp ugt i32 %106, 2                     ; <i1> [#uses=1]
  %.__capacity.i.i.i = select i1 %107, i32 %106, i32 2 ; <i32> [#uses=1]
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb2.i12.i.i, %bb1.i11.i.i
  %__capacity_addr.0.i.i.i = phi i32 [ %.__capacity.i.i.i, %bb2.i12.i.i ], [ 2, %bb1.i11.i.i ] ; <i32> [#uses=5]
  %108 = add i32 %__capacity_addr.0.i.i.i, 29     ; <i32> [#uses=2]
  %109 = icmp ugt i32 %108, 4096                  ; <i1> [#uses=1]
  %110 = icmp ugt i32 %__capacity_addr.0.i.i.i, %99 ; <i1> [#uses=1]
  %111 = and i1 %109, %110                        ; <i1> [#uses=1]
  br i1 %111, label %bb7.i.i.i12, label %bb10.i.i.i16

bb7.i.i.i12:                                      ; preds = %bb4.i.i.i
  %112 = and i32 %108, 4095                       ; <i32> [#uses=1]
  %113 = sub i32 4096, %112                       ; <i32> [#uses=1]
  %114 = add i32 %113, %__capacity_addr.0.i.i.i   ; <i32> [#uses=2]
  %115 = icmp ugt i32 %114, 1073741820            ; <i1> [#uses=1]
  %__capacity_addr.2.i.i.i11 = select i1 %115, i32 1073741820, i32 %114 ; <i32> [#uses=2]
  br label %bb10.i.i.i16

bb10.i.i.i16:                                     ; preds = %bb7.i.i.i12, %bb4.i.i.i
  %__size.0.in.i.i.i13 = phi i32 [ %__capacity_addr.2.i.i.i11, %bb7.i.i.i12 ], [ %__capacity_addr.0.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=1]
  %__capacity_addr.1.i.i.i14 = phi i32 [ %__capacity_addr.2.i.i.i11, %bb7.i.i.i12 ], [ %__capacity_addr.0.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=1]
  %__size.0.i.i.i15 = add i32 %__size.0.in.i.i.i13, 13 ; <i32> [#uses=1]
  %116 = invoke i8* @_Znwj(i32 %__size.0.i.i.i15)
          to label %invcont15.i.i unwind label %lpad.i.i.i19 ; <i8*> [#uses=3]

lpad.i.i.i19:                                     ; preds = %bb10.i.i.i16
  %eh_ptr.i.i.i17 = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select14.i.i.i18 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i17, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i17)
          to label %.noexc13.i.i unwind label %lpad.i.i

.noexc13.i.i:                                     ; preds = %lpad.i.i.i19
  unreachable

invcont15.i.i:                                    ; preds = %bb10.i.i.i16
  %117 = getelementptr inbounds i8* %116, i32 4   ; <i8*> [#uses=1]
  %118 = bitcast i8* %117 to i32*                 ; <i32*> [#uses=1]
  store i32 %__capacity_addr.1.i.i.i14, i32* %118, align 4
  %119 = getelementptr inbounds i8* %116, i32 8   ; <i8*> [#uses=1]
  %120 = bitcast i8* %119 to i32*                 ; <i32*> [#uses=1]
  store i32 0, i32* %120, align 4
  %121 = icmp eq i8* %84, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %121, label %bb20.i.i, label %bb.i4.i.i

bb.i4.i.i:                                        ; preds = %invcont15.i.i
  %122 = getelementptr inbounds i8* %option.0.0.0, i32 -4 ; <i8*> [#uses=1]
  %123 = bitcast i8* %122 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i20, label %bb1.i.i.i.i21

bb.i.i.i.i20:                                     ; preds = %bb.i4.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %124 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %123, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i22

bb1.i.i.i.i21:                                    ; preds = %bb.i4.i.i
  %125 = load i32* %123, align 4                  ; <i32> [#uses=2]
  %126 = add nsw i32 %125, -1                     ; <i32> [#uses=1]
  store i32 %126, i32* %123, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i22

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i22: ; preds = %bb1.i.i.i.i21, %bb.i.i.i.i20
  %127 = phi i32 [ %125, %bb1.i.i.i.i21 ], [ %124, %bb.i.i.i.i20 ] ; <i32> [#uses=1]
  %128 = icmp slt i32 %127, 1                     ; <i1> [#uses=1]
  br i1 %128, label %bb2.i.i.i23, label %bb20.i.i

bb2.i.i.i23:                                      ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i22
  call void @_ZdlPv(i8* %84) nounwind
  br label %bb20.i.i

bb20.i.i:                                         ; preds = %bb2.i.i.i23, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i22, %invcont15.i.i
  %129 = getelementptr inbounds i8* %116, i32 12  ; <i8*> [#uses=1]
  br label %_ZNSs9_M_mutateEjjj.exit.i

lpad.i.i:                                         ; preds = %lpad.i.i.i19
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %lpad.i.i
  unreachable

_ZNSs9_M_mutateEjjj.exit.i:                       ; preds = %bb20.i.i, %bb.i.i9
  %option.0.0.2 = phi i8* [ %129, %bb20.i.i ], [ %option.0.0.0, %bb.i.i9 ] ; <i8*> [#uses=5]
  %130 = getelementptr inbounds i8* %option.0.0.2, i32 -12 ; <i8*> [#uses=1]
  %131 = getelementptr inbounds i8* %option.0.0.2, i32 -4 ; <i8*> [#uses=1]
  %132 = bitcast i8* %131 to i32*                 ; <i32*> [#uses=1]
  store i32 0, i32* %132, align 4
  %133 = bitcast i8* %130 to i32*                 ; <i32*> [#uses=1]
  store i32 2, i32* %133, align 4
  %134 = getelementptr inbounds i8* %option.0.0.2, i32 2 ; <i8*> [#uses=1]
  %135 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %135, i8* %134, align 1
  %136 = bitcast i8* %option.0.0.2 to i16*        ; <i16*> [#uses=1]
  %tmp.i = load i16* bitcast ([3 x i8]* @.str7 to i16*), align 2 ; <i16> [#uses=1]
  store i16 %tmp.i, i16* %136, align 1
  br label %invcont8

bb8.i:                                            ; preds = %bb3.i
  %137 = bitcast i8* %option.0.0.0 to i16*        ; <i16*> [#uses=1]
  %tmp2.i = load i16* bitcast ([3 x i8]* @.str7 to i16*), align 2 ; <i16> [#uses=1]
  store i16 %tmp2.i, i16* %137, align 1
  br label %bb11.i27

bb9.i:                                            ; preds = %bb3.i
  %138 = icmp eq i8* %option.0.0.0, getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %138, label %bb11.i27, label %bb10.i

bb10.i:                                           ; preds = %bb9.i
  %139 = bitcast i8* %option.0.0.0 to i16*        ; <i16*> [#uses=1]
  %tmp1.i = load i16* bitcast ([3 x i8]* @.str7 to i16*), align 2 ; <i16> [#uses=1]
  store i16 %tmp1.i, i16* %139, align 1
  br label %bb11.i27

bb11.i27:                                         ; preds = %bb10.i, %bb9.i, %bb8.i
  store i32 0, i32* %91, align 4
  store i32 2, i32* %85, align 4
  %140 = getelementptr inbounds i8* %option.0.0.0, i32 2 ; <i8*> [#uses=1]
  %141 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %141, i8* %140, align 1
  br label %invcont8

bb6:                                              ; preds = %_Z5checkiPPc.exit
  %142 = getelementptr inbounds i8** %argv, i32 2 ; <i8**> [#uses=1]
  %143 = load i8** %142, align 4                  ; <i8*> [#uses=1]
  %144 = call i32 @atoi(i8* %143) nounwind readonly ; <i32> [#uses=1]
  br label %invcont8

invcont8:                                         ; preds = %bb6, %bb11.i27, %_ZNSs9_M_mutateEjjj.exit.i
  %option.0.0.4 = phi i8* [ %option.0.0.0, %bb6 ], [ %option.0.0.2, %_ZNSs9_M_mutateEjjj.exit.i ], [ %option.0.0.0, %bb11.i27 ] ; <i8*> [#uses=18]
  %N.0 = phi i32 [ %144, %bb6 ], [ 50000, %_ZNSs9_M_mutateEjjj.exit.i ], [ 50000, %bb11.i27 ] ; <i32> [#uses=3]
  %145 = getelementptr inbounds i8* %option.0.0.4, i32 -12 ; <i8*> [#uses=3]
  %146 = bitcast i8* %145 to i32*                 ; <i32*> [#uses=4]
  %147 = load i32* %146, align 4                  ; <i32> [#uses=3]
  %148 = icmp ugt i32 %147, 3                     ; <i1> [#uses=1]
  %149 = select i1 %148, i32 3, i32 %147          ; <i32> [#uses=1]
  %150 = call i32 @memcmp(i8* %option.0.0.4, i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %149) nounwind readonly ; <i32> [#uses=2]
  %151 = icmp eq i32 %150, 0                      ; <i1> [#uses=1]
  %152 = add i32 %147, -3                         ; <i32> [#uses=1]
  %153 = select i1 %151, i32 %152, i32 %150       ; <i32> [#uses=1]
  %154 = icmp eq i32 %153, 0                      ; <i1> [#uses=1]
  br i1 %154, label %bb10, label %invcont19

bb10:                                             ; preds = %invcont8
  invoke fastcc void @_ZN9FibonacciC1Ej(%struct.Fibonacci* %fib4, i32 %N.0)
          to label %invcont11 unwind label %lpad

invcont11:                                        ; preds = %bb10
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i)
          to label %.noexc43 unwind label %lpad73

.noexc43:                                         ; preds = %invcont11
  %155 = getelementptr inbounds %struct.Fibonacci* %fib4, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=2]
  %156 = getelementptr inbounds %struct.Fibonacci* %fib4, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=3]
  %157 = bitcast %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i to %"struct.std::basic_ostream<char,std::char_traits<char> >"* ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
  br label %bb5.i

bb.i28:                                           ; preds = %bb5.i
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %157, i8* getelementptr inbounds ([6 x i8]* @.str20, i32 0, i32 0), i32 5)
          to label %invcont.i unwind label %lpad.i36

invcont.i:                                        ; preds = %bb.i28
  invoke fastcc void @_ZNSo9_M_insertImEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %157, i32 %159)
          to label %invcont1.i unwind label %lpad.i36

invcont1.i:                                       ; preds = %invcont.i
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %157, i8* getelementptr inbounds ([5 x i8]* @.str21, i32 0, i32 0), i32 4)
          to label %invcont2.i unwind label %lpad.i36

invcont2.i:                                       ; preds = %invcont1.i
  %scevgep.i = getelementptr %struct.BigInt* %162, i32 %159 ; <%struct.BigInt*> [#uses=1]
  invoke fastcc void @_ZlsRSoRK6BigInt(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %157, %struct.BigInt* %scevgep.i)
          to label %invcont3.i unwind label %lpad.i36

invcont3.i:                                       ; preds = %invcont2.i
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %157, i8* getelementptr inbounds ([2 x i8]* @.str22, i32 0, i32 0), i32 1)
          to label %invcont4.i unwind label %lpad.i36

invcont4.i:                                       ; preds = %invcont3.i
  %158 = add i32 %159, 1                          ; <i32> [#uses=1]
  br label %bb5.i

bb5.i:                                            ; preds = %invcont4.i, %.noexc43
  %159 = phi i32 [ 0, %.noexc43 ], [ %158, %invcont4.i ] ; <i32> [#uses=4]
  %160 = load %struct.BigInt** %155, align 4      ; <%struct.BigInt*> [#uses=1]
  %161 = ptrtoint %struct.BigInt* %160 to i32     ; <i32> [#uses=1]
  %162 = load %struct.BigInt** %156, align 8      ; <%struct.BigInt*> [#uses=2]
  %163 = ptrtoint %struct.BigInt* %162 to i32     ; <i32> [#uses=1]
  %164 = sub i32 %161, %163                       ; <i32> [#uses=1]
  %165 = sdiv exact i32 %164, 12                  ; <i32> [#uses=1]
  %166 = icmp ugt i32 %165, %159                  ; <i1> [#uses=1]
  br i1 %166, label %bb.i28, label %bb6.i29

bb6.i29:                                          ; preds = %bb5.i
  %167 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i, i32 0, i32 1 ; <%"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  invoke fastcc void @_ZNKSt15basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* noalias sret %1, %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %167)
          to label %invcont7.i unwind label %lpad.i36

invcont7.i:                                       ; preds = %bb6.i29
  %168 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %1, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  %169 = load i8** %168, align 8                  ; <i8*> [#uses=2]
  %170 = getelementptr inbounds i8* %169, i32 -12 ; <i8*> [#uses=1]
  %171 = bitcast i8* %170 to i32*                 ; <i32*> [#uses=1]
  %172 = load i32* %171, align 4                  ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* %169, i32 %172)
          to label %bb12.i unwind label %lpad22.i

bb12.i:                                           ; preds = %invcont7.i
  %173 = load i8** %168, align 8                  ; <i8*> [#uses=2]
  %174 = getelementptr inbounds i8* %173, i32 -12 ; <i8*> [#uses=2]
  %175 = icmp eq i8* %174, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %175, label %bb19.i, label %bb.i.i1.i30

bb.i.i1.i30:                                      ; preds = %bb12.i
  %176 = getelementptr inbounds i8* %173, i32 -4  ; <i8*> [#uses=1]
  %177 = bitcast i8* %176 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2.i31, label %bb1.i.i.i3.i32

bb.i.i.i2.i31:                                    ; preds = %bb.i.i1.i30
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %178 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %177, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i33

bb1.i.i.i3.i32:                                   ; preds = %bb.i.i1.i30
  %179 = load i32* %177, align 4                  ; <i32> [#uses=2]
  %180 = add nsw i32 %179, -1                     ; <i32> [#uses=1]
  store i32 %180, i32* %177, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i33

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i33: ; preds = %bb1.i.i.i3.i32, %bb.i.i.i2.i31
  %181 = phi i32 [ %179, %bb1.i.i.i3.i32 ], [ %178, %bb.i.i.i2.i31 ] ; <i32> [#uses=1]
  %182 = icmp slt i32 %181, 1                     ; <i1> [#uses=1]
  br i1 %182, label %bb2.i.i5.i34, label %bb19.i

bb2.i.i5.i34:                                     ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i33
  call void @_ZdlPv(i8* %174) nounwind
  br label %bb19.i

invcont17.i:                                      ; preds = %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i42)
          to label %.noexc44 unwind label %lpad73

.noexc44:                                         ; preds = %invcont17.i
  unreachable

bb19.i:                                           ; preds = %bb2.i.i5.i34, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i33, %bb12.i
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i)
          to label %bb16 unwind label %lpad73

lpad.i36:                                         ; preds = %bb6.i29, %invcont3.i, %invcont2.i, %invcont1.i, %invcont.i, %bb.i28
  %eh_ptr.i35 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select21.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i35, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad22.i:                                         ; preds = %invcont7.i
  %eh_ptr23.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=4]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr23.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %183 = load i8** %168, align 8                  ; <i8*> [#uses=2]
  %184 = getelementptr inbounds i8* %183, i32 -12 ; <i8*> [#uses=2]
  %185 = icmp eq i8* %184, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %185, label %ppad.i, label %bb.i.i.i37

bb.i.i.i37:                                       ; preds = %lpad22.i
  %186 = getelementptr inbounds i8* %183, i32 -4  ; <i8*> [#uses=1]
  %187 = bitcast i8* %186 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i38, label %bb1.i.i.i.i39

bb.i.i.i.i38:                                     ; preds = %bb.i.i.i37
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %188 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %187, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i40

bb1.i.i.i.i39:                                    ; preds = %bb.i.i.i37
  %189 = load i32* %187, align 4                  ; <i32> [#uses=2]
  %190 = add nsw i32 %189, -1                     ; <i32> [#uses=1]
  store i32 %190, i32* %187, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i40

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i40: ; preds = %bb1.i.i.i.i39, %bb.i.i.i.i38
  %191 = phi i32 [ %189, %bb1.i.i.i.i39 ], [ %188, %bb.i.i.i.i38 ] ; <i32> [#uses=1]
  %192 = icmp slt i32 %191, 1                     ; <i1> [#uses=1]
  br i1 %192, label %bb2.i.i.i41, label %ppad.i

bb2.i.i.i41:                                      ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i40
  call void @_ZdlPv(i8* %184) nounwind
  br label %ppad.i

lpad30.i:                                         ; preds = %ppad.i
  %eh_ptr31.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select33.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i:                                           ; preds = %bb2.i.i.i41, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i40, %lpad22.i, %lpad.i36
  %eh_exception.0.i42 = phi i8* [ %eh_ptr.i35, %lpad.i36 ], [ %eh_ptr23.i, %bb2.i.i.i41 ], [ %eh_ptr23.i, %lpad22.i ], [ %eh_ptr23.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i40 ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i)
          to label %invcont17.i unwind label %lpad30.i

bb16:                                             ; preds = %bb19.i
  %193 = load %struct.BigInt** %155, align 4      ; <%struct.BigInt*> [#uses=2]
  %194 = load %struct.BigInt** %156, align 8      ; <%struct.BigInt*> [#uses=4]
  %195 = icmp eq %struct.BigInt* %194, %193       ; <i1> [#uses=1]
  br i1 %195, label %bb1.i.i84, label %bb.i.i.i.i.i79

bb.i.i.i.i.i79:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i81, %bb16
  %indvar.i.i.i.i.i75 = phi i32 [ %tmp104, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i81 ], [ 0, %bb16 ] ; <i32> [#uses=2]
  %tmp104 = add i32 %indvar.i.i.i.i.i75, 1        ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i77 = getelementptr %struct.BigInt* %194, i32 %tmp104 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i78 = getelementptr inbounds %struct.BigInt* %194, i32 %indvar.i.i.i.i.i75, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %196 = load i32** %scevgep23.i.i.i.i.i78, align 4 ; <i32*> [#uses=2]
  %197 = icmp eq i32* %196, null                  ; <i1> [#uses=1]
  br i1 %197, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i81, label %bb.i.i.i.i.i.i.i.i.i.i80

bb.i.i.i.i.i.i.i.i.i.i80:                         ; preds = %bb.i.i.i.i.i79
  %198 = bitcast i32* %196 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %198) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i81

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i81:      ; preds = %bb.i.i.i.i.i.i.i.i.i.i80, %bb.i.i.i.i.i79
  %199 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i77, %193 ; <i1> [#uses=1]
  br i1 %199, label %bb1.loopexit.i.i83, label %bb.i.i.i.i.i79

bb1.loopexit.i.i83:                               ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i81
  %.pre.i.i82 = load %struct.BigInt** %156, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i84

bb1.i.i84:                                        ; preds = %bb1.loopexit.i.i83, %bb16
  %200 = phi %struct.BigInt* [ %.pre.i.i82, %bb1.loopexit.i.i83 ], [ %194, %bb16 ] ; <%struct.BigInt*> [#uses=2]
  %201 = icmp eq %struct.BigInt* %200, null       ; <i1> [#uses=1]
  br i1 %201, label %invcont19, label %bb.i.i1.i.i85

bb.i.i1.i.i85:                                    ; preds = %bb1.i.i84
  %202 = bitcast %struct.BigInt* %200 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %202) nounwind
  br label %invcont19

invcont19:                                        ; preds = %bb.i.i1.i.i85, %bb1.i.i84, %invcont8
  %203 = load i32* %146, align 4                  ; <i32> [#uses=3]
  %204 = icmp ugt i32 %203, 2                     ; <i1> [#uses=1]
  %205 = select i1 %204, i32 2, i32 %203          ; <i32> [#uses=1]
  %206 = call i32 @memcmp(i8* %option.0.0.4, i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i32 %205) nounwind readonly ; <i32> [#uses=2]
  %207 = icmp eq i32 %206, 0                      ; <i1> [#uses=1]
  %208 = add i32 %203, -2                         ; <i32> [#uses=1]
  %209 = select i1 %207, i32 %208, i32 %206       ; <i32> [#uses=1]
  %210 = icmp eq i32 %209, 0                      ; <i1> [#uses=1]
  br i1 %210, label %bb21, label %invcont32

bb21:                                             ; preds = %invcont19
  invoke fastcc void @_ZN9FibonacciC1Ej(%struct.Fibonacci* %fib3, i32 %N.0)
          to label %invcont22 unwind label %lpad

invcont22:                                        ; preds = %bb21
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i46)
          to label %.noexc67 unwind label %lpad81

.noexc67:                                         ; preds = %invcont22
  %211 = getelementptr inbounds %struct.Fibonacci* %fib3, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=2]
  %212 = load %struct.BigInt** %211, align 4      ; <%struct.BigInt*> [#uses=2]
  %213 = getelementptr inbounds %struct.BigInt* %212, i32 -1 ; <%struct.BigInt*> [#uses=1]
  %214 = getelementptr inbounds %struct.Fibonacci* %fib3, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=3]
  %215 = load %struct.BigInt** %214, align 8      ; <%struct.BigInt*> [#uses=1]
  %216 = bitcast %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i46 to %"struct.std::basic_ostream<char,std::char_traits<char> >"* ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %216, i8* getelementptr inbounds ([6 x i8]* @.str20, i32 0, i32 0), i32 5)
          to label %invcont1.i48 unwind label %lpad.i59

invcont1.i48:                                     ; preds = %.noexc67
  %217 = ptrtoint %struct.BigInt* %212 to i32     ; <i32> [#uses=1]
  %218 = ptrtoint %struct.BigInt* %215 to i32     ; <i32> [#uses=1]
  %219 = sub i32 %217, %218                       ; <i32> [#uses=1]
  %220 = sdiv exact i32 %219, 12                  ; <i32> [#uses=1]
  %221 = add i32 %220, -1                         ; <i32> [#uses=1]
  invoke fastcc void @_ZNSo9_M_insertImEERSoT_(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %216, i32 %221)
          to label %invcont2.i49 unwind label %lpad.i59

invcont2.i49:                                     ; preds = %invcont1.i48
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %216, i8* getelementptr inbounds ([5 x i8]* @.str21, i32 0, i32 0), i32 4)
          to label %invcont3.i50 unwind label %lpad.i59

invcont3.i50:                                     ; preds = %invcont2.i49
  invoke fastcc void @_ZlsRSoRK6BigInt(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %216, %struct.BigInt* %213)
          to label %invcont4.i51 unwind label %lpad.i59

invcont4.i51:                                     ; preds = %invcont3.i50
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %216, i8* getelementptr inbounds ([2 x i8]* @.str22, i32 0, i32 0), i32 1)
          to label %invcont5.i unwind label %lpad.i59

invcont5.i:                                       ; preds = %invcont4.i51
  %222 = getelementptr inbounds %"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i46, i32 0, i32 1 ; <%"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  invoke fastcc void @_ZNKSt15basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* noalias sret %0, %"struct.std::basic_stringbuf<char,std::char_traits<char>,std::allocator<char> >"* %222)
          to label %invcont6.i unwind label %lpad.i59

invcont6.i:                                       ; preds = %invcont5.i
  %223 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %0, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  %224 = load i8** %223, align 8                  ; <i8*> [#uses=2]
  %225 = getelementptr inbounds i8* %224, i32 -12 ; <i8*> [#uses=1]
  %226 = bitcast i8* %225 to i32*                 ; <i32*> [#uses=1]
  %227 = load i32* %226, align 4                  ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* %224, i32 %227)
          to label %bb10.i52 unwind label %lpad20.i

bb10.i52:                                         ; preds = %invcont6.i
  %228 = load i8** %223, align 8                  ; <i8*> [#uses=2]
  %229 = getelementptr inbounds i8* %228, i32 -12 ; <i8*> [#uses=2]
  %230 = icmp eq i8* %229, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %230, label %bb17.i, label %bb.i.i1.i53

bb.i.i1.i53:                                      ; preds = %bb10.i52
  %231 = getelementptr inbounds i8* %228, i32 -4  ; <i8*> [#uses=1]
  %232 = bitcast i8* %231 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2.i54, label %bb1.i.i.i3.i55

bb.i.i.i2.i54:                                    ; preds = %bb.i.i1.i53
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %233 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %232, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i56

bb1.i.i.i3.i55:                                   ; preds = %bb.i.i1.i53
  %234 = load i32* %232, align 4                  ; <i32> [#uses=2]
  %235 = add nsw i32 %234, -1                     ; <i32> [#uses=1]
  store i32 %235, i32* %232, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i56

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i56: ; preds = %bb1.i.i.i3.i55, %bb.i.i.i2.i54
  %236 = phi i32 [ %234, %bb1.i.i.i3.i55 ], [ %233, %bb.i.i.i2.i54 ] ; <i32> [#uses=1]
  %237 = icmp slt i32 %236, 1                     ; <i1> [#uses=1]
  br i1 %237, label %bb2.i.i5.i57, label %bb17.i

bb2.i.i5.i57:                                     ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i56
  call void @_ZdlPv(i8* %229) nounwind
  br label %bb17.i

invcont15.i:                                      ; preds = %ppad.i66
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i65)
          to label %.noexc68 unwind label %lpad81

.noexc68:                                         ; preds = %invcont15.i
  unreachable

bb17.i:                                           ; preds = %bb2.i.i5.i57, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i56, %bb10.i52
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i46)
          to label %bb29 unwind label %lpad81

lpad.i59:                                         ; preds = %invcont5.i, %invcont4.i51, %invcont3.i50, %invcont2.i49, %invcont1.i48, %.noexc67
  %eh_ptr.i58 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select19.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i58, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i66

lpad20.i:                                         ; preds = %invcont6.i
  %eh_ptr21.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=4]
  %eh_select23.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr21.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %238 = load i8** %223, align 8                  ; <i8*> [#uses=2]
  %239 = getelementptr inbounds i8* %238, i32 -12 ; <i8*> [#uses=2]
  %240 = icmp eq i8* %239, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %240, label %ppad.i66, label %bb.i.i.i60

bb.i.i.i60:                                       ; preds = %lpad20.i
  %241 = getelementptr inbounds i8* %238, i32 -4  ; <i8*> [#uses=1]
  %242 = bitcast i8* %241 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i61, label %bb1.i.i.i.i62

bb.i.i.i.i61:                                     ; preds = %bb.i.i.i60
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %243 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %242, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i63

bb1.i.i.i.i62:                                    ; preds = %bb.i.i.i60
  %244 = load i32* %242, align 4                  ; <i32> [#uses=2]
  %245 = add nsw i32 %244, -1                     ; <i32> [#uses=1]
  store i32 %245, i32* %242, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i63

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i63: ; preds = %bb1.i.i.i.i62, %bb.i.i.i.i61
  %246 = phi i32 [ %244, %bb1.i.i.i.i62 ], [ %243, %bb.i.i.i.i61 ] ; <i32> [#uses=1]
  %247 = icmp slt i32 %246, 1                     ; <i1> [#uses=1]
  br i1 %247, label %bb2.i.i.i64, label %ppad.i66

bb2.i.i.i64:                                      ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i63
  call void @_ZdlPv(i8* %239) nounwind
  br label %ppad.i66

lpad28.i:                                         ; preds = %ppad.i66
  %eh_ptr29.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select31.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr29.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i66:                                         ; preds = %bb2.i.i.i64, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i63, %lpad20.i, %lpad.i59
  %eh_exception.0.i65 = phi i8* [ %eh_ptr.i58, %lpad.i59 ], [ %eh_ptr21.i, %bb2.i.i.i64 ], [ %eh_ptr21.i, %lpad20.i ], [ %eh_ptr21.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i63 ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev(%"struct.std::basic_ostringstream<char,std::char_traits<char>,std::allocator<char> >"* %oss.i46)
          to label %invcont15.i unwind label %lpad28.i

bb29:                                             ; preds = %bb17.i
  %248 = load %struct.BigInt** %211, align 4      ; <%struct.BigInt*> [#uses=2]
  %249 = load %struct.BigInt** %214, align 8      ; <%struct.BigInt*> [#uses=4]
  %250 = icmp eq %struct.BigInt* %249, %248       ; <i1> [#uses=1]
  br i1 %250, label %bb1.i.i99, label %bb.i.i.i.i.i94

bb.i.i.i.i.i94:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i96, %bb29
  %indvar.i.i.i.i.i90 = phi i32 [ %tmp112, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i96 ], [ 0, %bb29 ] ; <i32> [#uses=2]
  %tmp112 = add i32 %indvar.i.i.i.i.i90, 1        ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i92 = getelementptr %struct.BigInt* %249, i32 %tmp112 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i93 = getelementptr inbounds %struct.BigInt* %249, i32 %indvar.i.i.i.i.i90, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %251 = load i32** %scevgep23.i.i.i.i.i93, align 4 ; <i32*> [#uses=2]
  %252 = icmp eq i32* %251, null                  ; <i1> [#uses=1]
  br i1 %252, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i96, label %bb.i.i.i.i.i.i.i.i.i.i95

bb.i.i.i.i.i.i.i.i.i.i95:                         ; preds = %bb.i.i.i.i.i94
  %253 = bitcast i32* %251 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %253) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i96

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i96:      ; preds = %bb.i.i.i.i.i.i.i.i.i.i95, %bb.i.i.i.i.i94
  %254 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i92, %248 ; <i1> [#uses=1]
  br i1 %254, label %bb1.loopexit.i.i98, label %bb.i.i.i.i.i94

bb1.loopexit.i.i98:                               ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i96
  %.pre.i.i97 = load %struct.BigInt** %214, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i99

bb1.i.i99:                                        ; preds = %bb1.loopexit.i.i98, %bb29
  %255 = phi %struct.BigInt* [ %.pre.i.i97, %bb1.loopexit.i.i98 ], [ %249, %bb29 ] ; <%struct.BigInt*> [#uses=2]
  %256 = icmp eq %struct.BigInt* %255, null       ; <i1> [#uses=1]
  br i1 %256, label %invcont32, label %bb.i.i1.i.i100

bb.i.i1.i.i100:                                   ; preds = %bb1.i.i99
  %257 = bitcast %struct.BigInt* %255 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %257) nounwind
  br label %invcont32

invcont32:                                        ; preds = %bb.i.i1.i.i100, %bb1.i.i99, %invcont19
  %258 = load i32* %146, align 4                  ; <i32> [#uses=3]
  %259 = icmp ugt i32 %258, 4                     ; <i1> [#uses=1]
  %260 = select i1 %259, i32 4, i32 %258          ; <i32> [#uses=1]
  %261 = call i32 @memcmp(i8* %option.0.0.4, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0), i32 %260) nounwind readonly ; <i32> [#uses=2]
  %262 = icmp eq i32 %261, 0                      ; <i1> [#uses=1]
  %263 = add i32 %258, -4                         ; <i32> [#uses=1]
  %264 = select i1 %262, i32 %263, i32 %261       ; <i32> [#uses=1]
  %265 = icmp eq i32 %264, 0                      ; <i1> [#uses=1]
  br i1 %265, label %bb34, label %invcont47

bb34:                                             ; preds = %invcont32
  invoke fastcc void @_ZN9FibonacciC1Ej(%struct.Fibonacci* %fib2, i32 0)
          to label %bb38 unwind label %lpad

bb36:                                             ; preds = %bb38
  %scevgep133 = getelementptr i8** %argv, i32 %i1.0 ; <i8**> [#uses=1]
  %266 = load i8** %scevgep133, align 4           ; <i8*> [#uses=1]
  %267 = call i32 @atoi(i8* %266) nounwind readonly ; <i32> [#uses=1]
  invoke fastcc void @_ZN9Fibonacci11show_numberEm(%struct.Fibonacci* %fib2, i32 %267)
          to label %invcont37 unwind label %lpad89

invcont37:                                        ; preds = %bb36
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb38

bb38:                                             ; preds = %invcont37, %bb34
  %indvar = phi i32 [ %indvar.next, %invcont37 ], [ 0, %bb34 ] ; <i32> [#uses=2]
  %i1.0 = add i32 %indvar, 2                      ; <i32> [#uses=2]
  %268 = icmp slt i32 %i1.0, %argc                ; <i1> [#uses=1]
  br i1 %268, label %bb36, label %bb44

bb44:                                             ; preds = %bb38
  %269 = getelementptr inbounds %struct.Fibonacci* %fib2, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %270 = load %struct.BigInt** %269, align 4      ; <%struct.BigInt*> [#uses=2]
  %271 = getelementptr inbounds %struct.Fibonacci* %fib2, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %272 = load %struct.BigInt** %271, align 8      ; <%struct.BigInt*> [#uses=4]
  %273 = icmp eq %struct.BigInt* %272, %270       ; <i1> [#uses=1]
  br i1 %273, label %bb1.i.i71, label %bb.i.i.i.i.i66

bb.i.i.i.i.i66:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i68, %bb44
  %indvar.i.i.i.i.i62 = phi i32 [ %tmp116, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i68 ], [ 0, %bb44 ] ; <i32> [#uses=2]
  %tmp116 = add i32 %indvar.i.i.i.i.i62, 1        ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i64 = getelementptr %struct.BigInt* %272, i32 %tmp116 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i65 = getelementptr inbounds %struct.BigInt* %272, i32 %indvar.i.i.i.i.i62, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %274 = load i32** %scevgep23.i.i.i.i.i65, align 4 ; <i32*> [#uses=2]
  %275 = icmp eq i32* %274, null                  ; <i1> [#uses=1]
  br i1 %275, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i68, label %bb.i.i.i.i.i.i.i.i.i.i67

bb.i.i.i.i.i.i.i.i.i.i67:                         ; preds = %bb.i.i.i.i.i66
  %276 = bitcast i32* %274 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %276) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i68

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i68:      ; preds = %bb.i.i.i.i.i.i.i.i.i.i67, %bb.i.i.i.i.i66
  %277 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i64, %270 ; <i1> [#uses=1]
  br i1 %277, label %bb1.loopexit.i.i70, label %bb.i.i.i.i.i66

bb1.loopexit.i.i70:                               ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i68
  %.pre.i.i69 = load %struct.BigInt** %271, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i71

bb1.i.i71:                                        ; preds = %bb1.loopexit.i.i70, %bb44
  %278 = phi %struct.BigInt* [ %.pre.i.i69, %bb1.loopexit.i.i70 ], [ %272, %bb44 ] ; <%struct.BigInt*> [#uses=2]
  %279 = icmp eq %struct.BigInt* %278, null       ; <i1> [#uses=1]
  br i1 %279, label %invcont47, label %bb.i.i1.i.i72

bb.i.i1.i.i72:                                    ; preds = %bb1.i.i71
  %280 = bitcast %struct.BigInt* %278 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %280) nounwind
  br label %invcont47

invcont47:                                        ; preds = %bb.i.i1.i.i72, %bb1.i.i71, %invcont32
  %281 = load i32* %146, align 4                  ; <i32> [#uses=3]
  %282 = icmp ugt i32 %281, 4                     ; <i1> [#uses=1]
  %283 = select i1 %282, i32 4, i32 %281          ; <i32> [#uses=1]
  %284 = call i32 @memcmp(i8* %option.0.0.4, i8* getelementptr inbounds ([5 x i8]* @.str9, i32 0, i32 0), i32 %283) nounwind readonly ; <i32> [#uses=2]
  %285 = icmp eq i32 %284, 0                      ; <i1> [#uses=1]
  %286 = add i32 %281, -4                         ; <i32> [#uses=1]
  %287 = select i1 %285, i32 %286, i32 %284       ; <i32> [#uses=1]
  %288 = icmp eq i32 %287, 0                      ; <i1> [#uses=1]
  br i1 %288, label %bb49, label %bb64

bb49:                                             ; preds = %invcont47
  %289 = icmp eq i32 %argc, 3                     ; <i1> [#uses=1]
  br i1 %289, label %bb52, label %bb50

bb50:                                             ; preds = %bb49
  %290 = getelementptr inbounds i8** %argv, i32 3 ; <i8**> [#uses=1]
  %291 = load i8** %290, align 4                  ; <i8*> [#uses=1]
  %292 = call i32 @atoi(i8* %291) nounwind readonly ; <i32> [#uses=1]
  br label %bb52

bb52:                                             ; preds = %bb50, %bb49
  %iftmp.112.0 = phi i32 [ %292, %bb50 ], [ 25000, %bb49 ] ; <i32> [#uses=1]
  invoke fastcc void @_ZN9FibonacciC1Ej(%struct.Fibonacci* %fib, i32 0)
          to label %bb56 unwind label %lpad

bb54:                                             ; preds = %bb56
  %293 = call i32 @rand() nounwind                ; <i32> [#uses=1]
  %294 = srem i32 %293, %iftmp.112.0              ; <i32> [#uses=1]
  invoke fastcc void @_ZN9Fibonacci11show_numberEm(%struct.Fibonacci* %fib, i32 %294)
          to label %invcont55 unwind label %lpad97

invcont55:                                        ; preds = %bb54
  %295 = add i32 %296, 1                          ; <i32> [#uses=1]
  br label %bb56

bb56:                                             ; preds = %invcont55, %bb52
  %296 = phi i32 [ %295, %invcont55 ], [ 0, %bb52 ] ; <i32> [#uses=2]
  %297 = icmp ult i32 %296, %N.0                  ; <i1> [#uses=1]
  br i1 %297, label %bb54, label %bb62

bb62:                                             ; preds = %bb56
  %298 = getelementptr inbounds %struct.Fibonacci* %fib, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %299 = load %struct.BigInt** %298, align 4      ; <%struct.BigInt*> [#uses=2]
  %300 = getelementptr inbounds %struct.Fibonacci* %fib, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %301 = load %struct.BigInt** %300, align 8      ; <%struct.BigInt*> [#uses=4]
  %302 = icmp eq %struct.BigInt* %301, %299       ; <i1> [#uses=1]
  br i1 %302, label %bb1.i.i56, label %bb.i.i.i.i.i51

bb.i.i.i.i.i51:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i53, %bb62
  %indvar.i.i.i.i.i47 = phi i32 [ %tmp120, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i53 ], [ 0, %bb62 ] ; <i32> [#uses=2]
  %tmp120 = add i32 %indvar.i.i.i.i.i47, 1        ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i49 = getelementptr %struct.BigInt* %301, i32 %tmp120 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i50 = getelementptr inbounds %struct.BigInt* %301, i32 %indvar.i.i.i.i.i47, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %303 = load i32** %scevgep23.i.i.i.i.i50, align 4 ; <i32*> [#uses=2]
  %304 = icmp eq i32* %303, null                  ; <i1> [#uses=1]
  br i1 %304, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i53, label %bb.i.i.i.i.i.i.i.i.i.i52

bb.i.i.i.i.i.i.i.i.i.i52:                         ; preds = %bb.i.i.i.i.i51
  %305 = bitcast i32* %303 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %305) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i53

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i53:      ; preds = %bb.i.i.i.i.i.i.i.i.i.i52, %bb.i.i.i.i.i51
  %306 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i49, %299 ; <i1> [#uses=1]
  br i1 %306, label %bb1.loopexit.i.i55, label %bb.i.i.i.i.i51

bb1.loopexit.i.i55:                               ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i53
  %.pre.i.i54 = load %struct.BigInt** %300, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i56

bb1.i.i56:                                        ; preds = %bb1.loopexit.i.i55, %bb62
  %307 = phi %struct.BigInt* [ %.pre.i.i54, %bb1.loopexit.i.i55 ], [ %301, %bb62 ] ; <%struct.BigInt*> [#uses=2]
  %308 = icmp eq %struct.BigInt* %307, null       ; <i1> [#uses=1]
  br i1 %308, label %bb64, label %bb.i.i1.i.i57

bb.i.i1.i.i57:                                    ; preds = %bb1.i.i56
  %309 = bitcast %struct.BigInt* %307 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %309) nounwind
  br label %bb64

bb64:                                             ; preds = %bb.i.i1.i.i57, %bb1.i.i56, %invcont47
  %310 = icmp eq i8* %145, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %310, label %_ZNSsD1Ev.exit46, label %bb.i.i40

bb.i.i40:                                         ; preds = %bb64
  %311 = getelementptr inbounds i8* %option.0.0.4, i32 -4 ; <i8*> [#uses=1]
  %312 = bitcast i8* %311 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i41, label %bb1.i.i.i42

bb.i.i.i41:                                       ; preds = %bb.i.i40
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %313 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %312, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i43

bb1.i.i.i42:                                      ; preds = %bb.i.i40
  %314 = load i32* %312, align 4                  ; <i32> [#uses=2]
  %315 = add nsw i32 %314, -1                     ; <i32> [#uses=1]
  store i32 %315, i32* %312, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i43

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i43: ; preds = %bb1.i.i.i42, %bb.i.i.i41
  %316 = phi i32 [ %314, %bb1.i.i.i42 ], [ %313, %bb.i.i.i41 ] ; <i32> [#uses=1]
  %317 = icmp slt i32 %316, 1                     ; <i1> [#uses=1]
  br i1 %317, label %bb2.i.i44, label %_ZNSsD1Ev.exit46

bb2.i.i44:                                        ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i43
  call void @_ZdlPv(i8* %145) nounwind
  ret i32 0

_ZNSsD1Ev.exit46:                                 ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i43, %bb64
  ret i32 0

invcont68:                                        ; preds = %bb2.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

lpad:                                             ; preds = %bb52, %bb34, %bb21, %bb10, %lpad.i.i
  %option.0.0.5 = phi i8* [ %option.0.0.0, %lpad.i.i ], [ %option.0.0.4, %bb52 ], [ %option.0.0.4, %bb34 ], [ %option.0.0.4, %bb21 ], [ %option.0.0.4, %bb10 ] ; <i8*> [#uses=1]
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select72 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad73:                                           ; preds = %bb19.i, %invcont17.i, %invcont11
  %eh_ptr74 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select76 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr74, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %318 = getelementptr inbounds %struct.Fibonacci* %fib4, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %319 = load %struct.BigInt** %318, align 4      ; <%struct.BigInt*> [#uses=2]
  %320 = getelementptr inbounds %struct.Fibonacci* %fib4, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %321 = load %struct.BigInt** %320, align 8      ; <%struct.BigInt*> [#uses=4]
  %322 = icmp eq %struct.BigInt* %321, %319       ; <i1> [#uses=1]
  br i1 %322, label %bb1.i.i36, label %bb.i.i.i.i.i31

bb.i.i.i.i.i31:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i33, %lpad73
  %indvar.i.i.i.i.i27 = phi i32 [ %tmp, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i33 ], [ 0, %lpad73 ] ; <i32> [#uses=2]
  %tmp = add i32 %indvar.i.i.i.i.i27, 1           ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i29 = getelementptr %struct.BigInt* %321, i32 %tmp ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i30 = getelementptr inbounds %struct.BigInt* %321, i32 %indvar.i.i.i.i.i27, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %323 = load i32** %scevgep23.i.i.i.i.i30, align 4 ; <i32*> [#uses=2]
  %324 = icmp eq i32* %323, null                  ; <i1> [#uses=1]
  br i1 %324, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i33, label %bb.i.i.i.i.i.i.i.i.i.i32

bb.i.i.i.i.i.i.i.i.i.i32:                         ; preds = %bb.i.i.i.i.i31
  %325 = bitcast i32* %323 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %325) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i33

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i33:      ; preds = %bb.i.i.i.i.i.i.i.i.i.i32, %bb.i.i.i.i.i31
  %326 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i29, %319 ; <i1> [#uses=1]
  br i1 %326, label %bb1.loopexit.i.i35, label %bb.i.i.i.i.i31

bb1.loopexit.i.i35:                               ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i33
  %.pre.i.i34 = load %struct.BigInt** %320, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i36

bb1.i.i36:                                        ; preds = %bb1.loopexit.i.i35, %lpad73
  %327 = phi %struct.BigInt* [ %.pre.i.i34, %bb1.loopexit.i.i35 ], [ %321, %lpad73 ] ; <%struct.BigInt*> [#uses=2]
  %328 = icmp eq %struct.BigInt* %327, null       ; <i1> [#uses=1]
  br i1 %328, label %ppad, label %bb.i.i1.i.i37

bb.i.i1.i.i37:                                    ; preds = %bb1.i.i36
  %329 = bitcast %struct.BigInt* %327 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %329) nounwind
  br label %ppad

lpad81:                                           ; preds = %bb17.i, %invcont15.i, %invcont22
  %eh_ptr82 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select84 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr82, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %330 = getelementptr inbounds %struct.Fibonacci* %fib3, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %331 = load %struct.BigInt** %330, align 4      ; <%struct.BigInt*> [#uses=2]
  %332 = getelementptr inbounds %struct.Fibonacci* %fib3, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %333 = load %struct.BigInt** %332, align 8      ; <%struct.BigInt*> [#uses=4]
  %334 = icmp eq %struct.BigInt* %333, %331       ; <i1> [#uses=1]
  br i1 %334, label %bb1.i.i23, label %bb.i.i.i.i.i18

bb.i.i.i.i.i18:                                   ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i20, %lpad81
  %indvar.i.i.i.i.i14 = phi i32 [ %tmp108, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i20 ], [ 0, %lpad81 ] ; <i32> [#uses=2]
  %tmp108 = add i32 %indvar.i.i.i.i.i14, 1        ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i16 = getelementptr %struct.BigInt* %333, i32 %tmp108 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i17 = getelementptr inbounds %struct.BigInt* %333, i32 %indvar.i.i.i.i.i14, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %335 = load i32** %scevgep23.i.i.i.i.i17, align 4 ; <i32*> [#uses=2]
  %336 = icmp eq i32* %335, null                  ; <i1> [#uses=1]
  br i1 %336, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i20, label %bb.i.i.i.i.i.i.i.i.i.i19

bb.i.i.i.i.i.i.i.i.i.i19:                         ; preds = %bb.i.i.i.i.i18
  %337 = bitcast i32* %335 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %337) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i20

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i20:      ; preds = %bb.i.i.i.i.i.i.i.i.i.i19, %bb.i.i.i.i.i18
  %338 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i16, %331 ; <i1> [#uses=1]
  br i1 %338, label %bb1.loopexit.i.i22, label %bb.i.i.i.i.i18

bb1.loopexit.i.i22:                               ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i20
  %.pre.i.i21 = load %struct.BigInt** %332, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i23

bb1.i.i23:                                        ; preds = %bb1.loopexit.i.i22, %lpad81
  %339 = phi %struct.BigInt* [ %.pre.i.i21, %bb1.loopexit.i.i22 ], [ %333, %lpad81 ] ; <%struct.BigInt*> [#uses=2]
  %340 = icmp eq %struct.BigInt* %339, null       ; <i1> [#uses=1]
  br i1 %340, label %ppad, label %bb.i.i1.i.i24

bb.i.i1.i.i24:                                    ; preds = %bb1.i.i23
  %341 = bitcast %struct.BigInt* %339 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %341) nounwind
  br label %ppad

lpad89:                                           ; preds = %bb36
  %eh_ptr90 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select92 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr90, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %342 = getelementptr inbounds %struct.Fibonacci* %fib2, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %343 = load %struct.BigInt** %342, align 4      ; <%struct.BigInt*> [#uses=2]
  %344 = getelementptr inbounds %struct.Fibonacci* %fib2, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %345 = load %struct.BigInt** %344, align 8      ; <%struct.BigInt*> [#uses=4]
  %346 = icmp eq %struct.BigInt* %345, %343       ; <i1> [#uses=1]
  br i1 %346, label %bb1.i.i10, label %bb.i.i.i.i.i5

bb.i.i.i.i.i5:                                    ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i7, %lpad89
  %indvar.i.i.i.i.i1 = phi i32 [ %tmp128, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i7 ], [ 0, %lpad89 ] ; <i32> [#uses=2]
  %tmp128 = add i32 %indvar.i.i.i.i.i1, 1         ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i3 = getelementptr %struct.BigInt* %345, i32 %tmp128 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i4 = getelementptr inbounds %struct.BigInt* %345, i32 %indvar.i.i.i.i.i1, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %347 = load i32** %scevgep23.i.i.i.i.i4, align 4 ; <i32*> [#uses=2]
  %348 = icmp eq i32* %347, null                  ; <i1> [#uses=1]
  br i1 %348, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i7, label %bb.i.i.i.i.i.i.i.i.i.i6

bb.i.i.i.i.i.i.i.i.i.i6:                          ; preds = %bb.i.i.i.i.i5
  %349 = bitcast i32* %347 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %349) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i7

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i7:       ; preds = %bb.i.i.i.i.i.i.i.i.i.i6, %bb.i.i.i.i.i5
  %350 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i3, %343 ; <i1> [#uses=1]
  br i1 %350, label %bb1.loopexit.i.i9, label %bb.i.i.i.i.i5

bb1.loopexit.i.i9:                                ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i7
  %.pre.i.i8 = load %struct.BigInt** %344, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i10

bb1.i.i10:                                        ; preds = %bb1.loopexit.i.i9, %lpad89
  %351 = phi %struct.BigInt* [ %.pre.i.i8, %bb1.loopexit.i.i9 ], [ %345, %lpad89 ] ; <%struct.BigInt*> [#uses=2]
  %352 = icmp eq %struct.BigInt* %351, null       ; <i1> [#uses=1]
  br i1 %352, label %ppad, label %bb.i.i1.i.i11

bb.i.i1.i.i11:                                    ; preds = %bb1.i.i10
  %353 = bitcast %struct.BigInt* %351 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %353) nounwind
  br label %ppad

lpad97:                                           ; preds = %bb54
  %eh_ptr98 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select100 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr98, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %354 = getelementptr inbounds %struct.Fibonacci* %fib, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%struct.BigInt**> [#uses=1]
  %355 = load %struct.BigInt** %354, align 4      ; <%struct.BigInt*> [#uses=2]
  %356 = getelementptr inbounds %struct.Fibonacci* %fib, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%struct.BigInt**> [#uses=2]
  %357 = load %struct.BigInt** %356, align 8      ; <%struct.BigInt*> [#uses=4]
  %358 = icmp eq %struct.BigInt* %357, %355       ; <i1> [#uses=1]
  br i1 %358, label %bb1.i.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i, %lpad97
  %indvar.i.i.i.i.i = phi i32 [ %tmp124, %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i ], [ 0, %lpad97 ] ; <i32> [#uses=2]
  %tmp124 = add i32 %indvar.i.i.i.i.i, 1          ; <i32> [#uses=2]
  %scevgep.i.i.i.i.i = getelementptr %struct.BigInt* %357, i32 %tmp124 ; <%struct.BigInt*> [#uses=1]
  %scevgep23.i.i.i.i.i = getelementptr inbounds %struct.BigInt* %357, i32 %indvar.i.i.i.i.i, i32 0, i32 0, i32 0, i32 0 ; <i32**> [#uses=1]
  %359 = load i32** %scevgep23.i.i.i.i.i, align 4 ; <i32*> [#uses=2]
  %360 = icmp eq i32* %359, null                  ; <i1> [#uses=1]
  br i1 %360, label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i, label %bb.i.i.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i.i.i:                           ; preds = %bb.i.i.i.i.i
  %361 = bitcast i32* %359 to i8*                 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %361) nounwind
  br label %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i

_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i:        ; preds = %bb.i.i.i.i.i.i.i.i.i.i, %bb.i.i.i.i.i
  %362 = icmp eq %struct.BigInt* %scevgep.i.i.i.i.i, %355 ; <i1> [#uses=1]
  br i1 %362, label %bb1.loopexit.i.i, label %bb.i.i.i.i.i

bb1.loopexit.i.i:                                 ; preds = %_ZSt8_DestroyI6BigIntEvPT_.exit.i.i.i.i.i
  %.pre.i.i = load %struct.BigInt** %356, align 8 ; <%struct.BigInt*> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb1.loopexit.i.i, %lpad97
  %363 = phi %struct.BigInt* [ %.pre.i.i, %bb1.loopexit.i.i ], [ %357, %lpad97 ] ; <%struct.BigInt*> [#uses=2]
  %364 = icmp eq %struct.BigInt* %363, null       ; <i1> [#uses=1]
  br i1 %364, label %ppad, label %bb.i.i1.i.i

bb.i.i1.i.i:                                      ; preds = %bb1.i.i
  %365 = bitcast %struct.BigInt* %363 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %365) nounwind
  br label %ppad

ppad:                                             ; preds = %bb.i.i1.i.i, %bb1.i.i, %bb.i.i1.i.i11, %bb1.i.i10, %bb.i.i1.i.i24, %bb1.i.i23, %bb.i.i1.i.i37, %bb1.i.i36, %lpad
  %option.0.0.6 = phi i8* [ %option.0.0.5, %lpad ], [ %option.0.0.4, %bb1.i.i36 ], [ %option.0.0.4, %bb.i.i1.i.i37 ], [ %option.0.0.4, %bb1.i.i10 ], [ %option.0.0.4, %bb.i.i1.i.i11 ], [ %option.0.0.4, %bb1.i.i ], [ %option.0.0.4, %bb.i.i1.i.i ], [ %option.0.0.4, %bb1.i.i23 ], [ %option.0.0.4, %bb.i.i1.i.i24 ] ; <i8*> [#uses=2]
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr74, %bb.i.i1.i.i37 ], [ %eh_ptr82, %bb.i.i1.i.i24 ], [ %eh_ptr90, %bb.i.i1.i.i11 ], [ %eh_ptr98, %bb.i.i1.i.i ], [ %eh_ptr74, %bb1.i.i36 ], [ %eh_ptr82, %bb1.i.i23 ], [ %eh_ptr90, %bb1.i.i10 ], [ %eh_ptr98, %bb1.i.i ] ; <i8*> [#uses=1]
  %366 = getelementptr inbounds i8* %option.0.0.6, i32 -12 ; <i8*> [#uses=2]
  %367 = icmp eq i8* %366, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %367, label %invcont68, label %bb.i.i

bb.i.i:                                           ; preds = %ppad
  %368 = getelementptr inbounds i8* %option.0.0.6, i32 -4 ; <i8*> [#uses=1]
  %369 = bitcast i8* %368 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %370 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %369, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i
  %371 = load i32* %369, align 4                  ; <i32> [#uses=2]
  %372 = add nsw i32 %371, -1                     ; <i32> [#uses=1]
  store i32 %372, i32* %369, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i: ; preds = %bb1.i.i.i, %bb.i.i.i
  %373 = phi i32 [ %371, %bb1.i.i.i ], [ %370, %bb.i.i.i ] ; <i32> [#uses=1]
  %374 = icmp slt i32 %373, 1                     ; <i1> [#uses=1]
  br i1 %374, label %bb2.i.i, label %invcont68

bb2.i.i:                                          ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i
  call void @_ZdlPv(i8* %366) nounwind
  br label %invcont68
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare i32 @rand() nounwind

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
