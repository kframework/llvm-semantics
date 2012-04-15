; ModuleID = 'sieve.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%"struct.__gnu_cxx::new_allocator<int>" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_List_base<int,std::allocator<int> >" = type { %"struct.std::_List_base<int,std::allocator<int> >::_List_impl" }
%"struct.std::_List_base<int,std::allocator<int> >::_List_impl" = type { %"struct.std::_List_node_base" }
%"struct.std::_List_node_base" = type { %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"* }
%"struct.std::_Vector_base<int,std::allocator<int> >" = type { %"struct.std::_Vector_base<int,std::allocator<int> >::_Vector_impl" }
%"struct.std::_Vector_base<int,std::allocator<int> >::_Vector_impl" = type { i32*, i32*, i32* }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::list<int,std::allocator<int> >" = type { %"struct.std::_List_base<int,std::allocator<int> >" }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }
%"struct.std::vector<int,std::allocator<int> >" = type { %"struct.std::_Vector_base<int,std::allocator<int> >" }

@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<int>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<int>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str1 = private constant [22 x i8] c"vector::_M_insert_aux\00", align 1 ; <[22 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=6]
@.str2 = private constant [8 x i8] c"Count: \00", align 1 ; <[8 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I__Z5sieveRSt4listIiSaIiEERSt6vectorIiS0_E }] ; <[1 x %0]*> [#uses=0]

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

define internal void @_GLOBAL__I__Z5sieveRSt4listIiSaIiEERSt6vectorIiS0_E() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<int>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<int>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<int>"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<int>"*)

declare void @__cxa_rethrow() noreturn

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare void @_ZdlPv(i8*) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

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

declare void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"*)

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__cerb.i27 = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %integers = alloca %"struct.std::list<int,std::allocator<int> >", align 8 ; <%"struct.std::list<int,std::allocator<int> >"*> [#uses=3]
  %1 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb5

bb:                                               ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = call i32 @atoi(i8* %3) nounwind readonly   ; <i32> [#uses=2]
  %phitmp = add i32 %4, -1                        ; <i32> [#uses=1]
  %5 = icmp sgt i32 %4, 0                         ; <i1> [#uses=1]
  %phitmp. = select i1 %5, i32 %phitmp, i32 0     ; <i32> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb, %entry
  %iftmp.103.0 = phi i32 [ 499, %entry ], [ %phitmp., %bb ] ; <i32> [#uses=1]
  %6 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %integers, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=5]
  %7 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %integers, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %8 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %integers, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=11]
  br label %bb18

bb6:                                              ; preds = %bb18
  store %"struct.std::_List_node_base"* %8, %"struct.std::_List_node_base"** %6, align 8
  store %"struct.std::_List_node_base"* %8, %"struct.std::_List_node_base"** %7, align 4
  br label %bb9

bb7:                                              ; preds = %bb9
  %9 = invoke i8* @_Znwj(i32 12)
          to label %.noexc unwind label %lpad31   ; <i8*> [#uses=2]

.noexc:                                           ; preds = %bb7
  %10 = getelementptr inbounds i8* %9, i32 8      ; <i8*> [#uses=2]
  %11 = icmp eq i8* %10, null                     ; <i1> [#uses=1]
  br i1 %11, label %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %.noexc
  %12 = bitcast i8* %10 to i32*                   ; <i32*> [#uses=1]
  store i32 %storemerge, i32* %12
  br label %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i

_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i: ; preds = %bb.i.i.i.i, %.noexc
  %13 = bitcast i8* %9 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %13, %"struct.std::_List_node_base"* %8)
          to label %invcont8 unwind label %lpad31

invcont8:                                         ; preds = %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb9

bb9:                                              ; preds = %invcont8, %bb6
  %indvar = phi i32 [ 0, %bb6 ], [ %indvar.next, %invcont8 ] ; <i32> [#uses=2]
  %storemerge = add i32 %indvar, 2                ; <i32> [#uses=2]
  %14 = icmp sgt i32 %storemerge, 8191            ; <i1> [#uses=1]
  br i1 %14, label %invcont11, label %bb7

invcont11:                                        ; preds = %bb9
  %15 = load %"struct.std::_List_node_base"** %6, align 8 ; <%"struct.std::_List_node_base"*> [#uses=3]
  %16 = icmp eq %"struct.std::_List_node_base"* %15, %8 ; <i1> [#uses=1]
  br i1 %16, label %bb16, label %bb.i

bb.i:                                             ; preds = %bb7.backedge.i, %invcont11
  %primes.0.0.2.2 = phi i32* [ %primes.0.0.2.1, %bb7.backedge.i ], [ %primes.0.0.2.4, %invcont11 ] ; <i32*> [#uses=2]
  %primes.0.0.1.2 = phi i32* [ %primes.0.0.1.1, %bb7.backedge.i ], [ %primes.0.0.0.4, %invcont11 ] ; <i32*> [#uses=5]
  %primes.0.0.0.2 = phi i32* [ %primes.0.0.0.1, %bb7.backedge.i ], [ %primes.0.0.0.4, %invcont11 ] ; <i32*> [#uses=9]
  %17 = phi %"struct.std::_List_node_base"* [ %53, %bb7.backedge.i ], [ %15, %invcont11 ] ; <%"struct.std::_List_node_base"*> [#uses=3]
  %18 = getelementptr inbounds %"struct.std::_List_node_base"* %17, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %19 = bitcast %"struct.std::_List_node_base"* %18 to i32* ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=3]
  invoke void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"* %17)
          to label %.noexc5 unwind label %lpad31

.noexc5:                                          ; preds = %bb.i
  %21 = bitcast %"struct.std::_List_node_base"* %17 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %21) nounwind
  %22 = load %"struct.std::_List_node_base"** %6, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %23 = icmp eq %"struct.std::_List_node_base"* %22, %8 ; <i1> [#uses=1]
  br i1 %23, label %bb6.i, label %bb1.i

bb1.i:                                            ; preds = %bb4.backedge.i, %.noexc5
  %i.0.02.i = phi %"struct.std::_List_node_base"* [ %30, %bb4.backedge.i ], [ %22, %.noexc5 ] ; <%"struct.std::_List_node_base"*> [#uses=4]
  %24 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.02.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %25 = bitcast %"struct.std::_List_node_base"* %24 to i32* ; <i32*> [#uses=1]
  %26 = load i32* %25, align 4                    ; <i32> [#uses=1]
  %27 = srem i32 %26, %20                         ; <i32> [#uses=1]
  %28 = icmp eq i32 %27, 0                        ; <i1> [#uses=1]
  %29 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.02.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %30 = load %"struct.std::_List_node_base"** %29, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  br i1 %28, label %bb3.i, label %bb4.backedge.i

bb3.i:                                            ; preds = %bb1.i
  invoke void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"* %i.0.02.i)
          to label %.noexc6 unwind label %lpad31

.noexc6:                                          ; preds = %bb3.i
  %31 = bitcast %"struct.std::_List_node_base"* %i.0.02.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %31) nounwind
  br label %bb4.backedge.i

bb4.backedge.i:                                   ; preds = %.noexc6, %bb1.i
  %32 = icmp eq %"struct.std::_List_node_base"* %30, %8 ; <i1> [#uses=1]
  br i1 %32, label %bb6.i, label %bb1.i

bb6.i:                                            ; preds = %bb4.backedge.i, %.noexc5
  %33 = icmp eq i32* %primes.0.0.1.2, %primes.0.0.2.2 ; <i1> [#uses=1]
  br i1 %33, label %bb1.i5.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb6.i
  %34 = icmp eq i32* %primes.0.0.1.2, null        ; <i1> [#uses=1]
  br i1 %34, label %_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i, label %bb.i.i.i3

bb.i.i.i3:                                        ; preds = %bb.i.i
  store i32 %20, i32* %primes.0.0.1.2
  br label %_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i

_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i: ; preds = %bb.i.i.i3, %bb.i.i
  %35 = getelementptr inbounds i32* %primes.0.0.1.2, i32 1 ; <i32*> [#uses=1]
  br label %bb7.backedge.i

bb1.i5.i:                                         ; preds = %bb6.i
  %36 = ptrtoint i32* %primes.0.0.1.2 to i32      ; <i32> [#uses=1]
  %37 = ptrtoint i32* %primes.0.0.0.2 to i32      ; <i32> [#uses=1]
  %38 = sub i32 %36, %37                          ; <i32> [#uses=3]
  %39 = ashr i32 %38, 2                           ; <i32> [#uses=4]
  switch i32 %39, label %bb4.i.i [
    i32 1073741823, label %bb2.i.i
    i32 0, label %bb6.i.i
  ]

bb2.i.i:                                          ; preds = %bb1.i5.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc7 unwind label %lpad31

.noexc7:                                          ; preds = %bb2.i.i
  unreachable

bb4.i.i:                                          ; preds = %bb1.i5.i
  %40 = ashr i32 %38, 1                           ; <i32> [#uses=1]
  %41 = and i32 %40, -2                           ; <i32> [#uses=1]
  br label %bb6.i.i

bb6.i.i:                                          ; preds = %bb4.i.i, %bb1.i5.i
  %iftmp.117.0.i.i = phi i32 [ %41, %bb4.i.i ], [ 1, %bb1.i5.i ] ; <i32> [#uses=3]
  %42 = icmp ult i32 %iftmp.117.0.i.i, %39        ; <i1> [#uses=1]
  br i1 %42, label %invcont.i.i, label %bb8.i.i

bb8.i.i:                                          ; preds = %bb6.i.i
  %43 = icmp ugt i32 %iftmp.117.0.i.i, 1073741823 ; <i1> [#uses=1]
  br i1 %43, label %bb.i.i.i.i4, label %invcont.i.i

bb.i.i.i.i4:                                      ; preds = %bb8.i.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc8 unwind label %lpad31

.noexc8:                                          ; preds = %bb.i.i.i.i4
  unreachable

invcont.i.i:                                      ; preds = %bb8.i.i, %bb6.i.i
  %__len.0.reg2mem.0.i.i = phi i32 [ 1073741823, %bb6.i.i ], [ %iftmp.117.0.i.i, %bb8.i.i ] ; <i32> [#uses=2]
  %44 = shl i32 %__len.0.reg2mem.0.i.i, 2         ; <i32> [#uses=1]
  %45 = invoke i8* @_Znwj(i32 %44)
          to label %.noexc9 unwind label %lpad31  ; <i8*> [#uses=2]

.noexc9:                                          ; preds = %invcont.i.i
  %46 = bitcast i8* %45 to i32*                   ; <i32*> [#uses=4]
  %47 = bitcast i32* %primes.0.0.0.2 to i8*       ; <i8*> [#uses=2]
  call void @llvm.memmove.i32(i8* %45, i8* %47, i32 %38, i32 4) nounwind
  %48 = getelementptr inbounds i32* %46, i32 %39  ; <i32*> [#uses=2]
  %49 = icmp eq i32* %48, null                    ; <i1> [#uses=1]
  br i1 %49, label %bb33.i.i, label %bb.i5.i.i

bb.i5.i.i:                                        ; preds = %.noexc9
  store i32 %20, i32* %48
  br label %bb33.i.i

bb33.i.i:                                         ; preds = %bb.i5.i.i, %.noexc9
  %.sum8.i.i = add i32 %39, 1                     ; <i32> [#uses=1]
  %50 = getelementptr inbounds i32* %46, i32 %.sum8.i.i ; <i32*> [#uses=1]
  %51 = icmp eq i32* %primes.0.0.0.2, null        ; <i1> [#uses=1]
  br i1 %51, label %_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i, label %bb.i1.i.i

bb.i1.i.i:                                        ; preds = %bb33.i.i
  call void @_ZdlPv(i8* %47) nounwind
  br label %_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i

_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i: ; preds = %bb.i1.i.i, %bb33.i.i
  %52 = getelementptr inbounds i32* %46, i32 %__len.0.reg2mem.0.i.i ; <i32*> [#uses=1]
  br label %bb7.backedge.i

bb7.backedge.i:                                   ; preds = %_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i, %_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i
  %primes.0.0.2.1 = phi i32* [ %52, %_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i ], [ %primes.0.0.2.2, %_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i ] ; <i32*> [#uses=2]
  %primes.0.0.1.1 = phi i32* [ %50, %_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i ], [ %35, %_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i ] ; <i32*> [#uses=2]
  %primes.0.0.0.1 = phi i32* [ %46, %_ZNSt6vectorIiSaIiEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPiS1_EERKi.exit.i ], [ %primes.0.0.0.2, %_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi.exit.i.i ] ; <i32*> [#uses=2]
  %53 = load %"struct.std::_List_node_base"** %6, align 8 ; <%"struct.std::_List_node_base"*> [#uses=3]
  %54 = icmp eq %"struct.std::_List_node_base"* %53, %8 ; <i1> [#uses=1]
  br i1 %54, label %bb16, label %bb.i

bb16:                                             ; preds = %bb7.backedge.i, %invcont11
  %55 = phi %"struct.std::_List_node_base"* [ %15, %invcont11 ], [ %53, %bb7.backedge.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %primes.0.0.2.3 = phi i32* [ %primes.0.0.2.4, %invcont11 ], [ %primes.0.0.2.1, %bb7.backedge.i ] ; <i32*> [#uses=1]
  %primes.0.0.1.3 = phi i32* [ %primes.0.0.0.4, %invcont11 ], [ %primes.0.0.1.1, %bb7.backedge.i ] ; <i32*> [#uses=1]
  %primes.0.0.0.3 = phi i32* [ %primes.0.0.0.4, %invcont11 ], [ %primes.0.0.0.1, %bb7.backedge.i ] ; <i32*> [#uses=1]
  %56 = icmp eq %"struct.std::_List_node_base"* %8, %55 ; <i1> [#uses=1]
  br i1 %56, label %bb18.backedge, label %bb.i.i.i6

bb18.backedge:                                    ; preds = %bb.i.i.i6, %bb16
  %indvar.next11 = add i32 %indvar10, 1           ; <i32> [#uses=1]
  br label %bb18

bb.i.i.i6:                                        ; preds = %bb.i.i.i6, %bb16
  %__cur.0.in1.i.i.i5 = phi %"struct.std::_List_node_base"* [ %58, %bb.i.i.i6 ], [ %55, %bb16 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %57 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i5, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %58 = load %"struct.std::_List_node_base"** %57, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %59 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i5 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %59) nounwind
  %60 = icmp eq %"struct.std::_List_node_base"* %8, %58 ; <i1> [#uses=1]
  br i1 %60, label %bb18.backedge, label %bb.i.i.i6

bb18:                                             ; preds = %bb18.backedge, %bb5
  %primes.0.0.2.4 = phi i32* [ null, %bb5 ], [ %primes.0.0.2.3, %bb18.backedge ] ; <i32*> [#uses=2]
  %primes.0.0.1.4 = phi i32* [ null, %bb5 ], [ %primes.0.0.1.3, %bb18.backedge ] ; <i32*> [#uses=1]
  %primes.0.0.0.4 = phi i32* [ null, %bb5 ], [ %primes.0.0.0.3, %bb18.backedge ] ; <i32*> [#uses=10]
  %indvar10 = phi i32 [ 0, %bb5 ], [ %indvar.next11, %bb18.backedge ] ; <i32> [#uses=2]
  %tmp13 = sub i32 %iftmp.103.0, %indvar10        ; <i32> [#uses=1]
  %61 = icmp eq i32 %tmp13, -1                    ; <i1> [#uses=1]
  br i1 %61, label %bb19, label %bb6

bb19:                                             ; preds = %bb18
  %62 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i27, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %62, align 8
  %63 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i27, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %63, align 4
  %64 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %65 = getelementptr inbounds i32 (...)** %64, i32 -3 ; <i32 (...)**> [#uses=1]
  %66 = bitcast i32 (...)** %65 to i32*           ; <i32*> [#uses=1]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=1]
  %68 = add i32 %67, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %69 = inttoptr i32 %68 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %70 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %69, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %71 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %70, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %72 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %71, null ; <i1> [#uses=1]
  br i1 %72, label %bb9.i.i.i31, label %bb.i.i.i28

bb.i.i.i28:                                       ; preds = %bb19
  %73 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %69, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %74 = load i32* %73, align 4                    ; <i32> [#uses=1]
  %75 = icmp eq i32 %74, 0                        ; <i1> [#uses=1]
  br i1 %75, label %bb8.i.i.i30, label %bb9.i.i.i31

bb8.i.i.i30:                                      ; preds = %bb.i.i.i28
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %71)
          to label %.noexc49 unwind label %lpad

.noexc49:                                         ; preds = %bb8.i.i.i30
  %.pre.i.i.i29 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i31

bb9.i.i.i31:                                      ; preds = %.noexc49, %bb.i.i.i28, %bb19
  %76 = phi i32 (...)** [ %.pre.i.i.i29, %.noexc49 ], [ %64, %bb19 ], [ %64, %bb.i.i.i28 ] ; <i32 (...)**> [#uses=1]
  %77 = getelementptr inbounds i32 (...)** %76, i32 -3 ; <i32 (...)**> [#uses=1]
  %78 = bitcast i32 (...)** %77 to i32*           ; <i32*> [#uses=1]
  %79 = load i32* %78, align 4                    ; <i32> [#uses=1]
  %80 = add i32 %79, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %81 = inttoptr i32 %80 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %82 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %81, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=2]
  %84 = icmp eq i32 %83, 0                        ; <i1> [#uses=1]
  br i1 %84, label %invcont.i38.thread, label %bb12.i.i.i35

invcont.i38.thread:                               ; preds = %bb9.i.i.i31
  store i8 1, i8* %62, align 8
  br label %bb.i39

bb12.i.i.i35:                                     ; preds = %bb9.i.i.i31
  %85 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %81, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %86 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %85, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %87 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %86, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i33 = select i1 %87, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i34 = or i32 %storemerge.i.v.i.i.i33, %83 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i34, i32* %82
  %88 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %81, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %89 = load i32* %88, align 4                    ; <i32> [#uses=1]
  %90 = and i32 %storemerge.i.i.i.i34, %89        ; <i32> [#uses=1]
  %91 = icmp eq i32 %90, 0                        ; <i1> [#uses=1]
  br i1 %91, label %invcont.i38, label %bb4.i.i.i.i.i36

bb4.i.i.i.i.i36:                                  ; preds = %bb12.i.i.i35
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc50 unwind label %lpad

.noexc50:                                         ; preds = %bb4.i.i.i.i.i36
  unreachable

invcont.i38:                                      ; preds = %bb12.i.i.i35
  %.pr = load i8* %62, align 8                    ; <i8> [#uses=1]
  %toBool.i37 = icmp eq i8 %.pr, 0                ; <i1> [#uses=1]
  br i1 %toBool.i37, label %bb41.i, label %bb.i39

bb.i39:                                           ; preds = %invcont.i38, %invcont.i38.thread
  %92 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %93 = getelementptr inbounds i32 (...)** %92, i32 -3 ; <i32 (...)**> [#uses=1]
  %94 = bitcast i32 (...)** %93 to i32*           ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4                    ; <i32> [#uses=1]
  %96 = add i32 %95, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %97 = inttoptr i32 %96 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %98 = getelementptr inbounds %"struct.std::ios_base"* %97, i32 0, i32 2 ; <i32*> [#uses=1]
  %99 = load i32* %98, align 4                    ; <i32> [#uses=3]
  %100 = icmp sgt i32 %99, 7                      ; <i1> [#uses=1]
  br i1 %100, label %bb1.i40, label %bb30.i

bb1.i40:                                          ; preds = %bb.i39
  %101 = getelementptr inbounds %"struct.std::ios_base"* %97, i32 0, i32 3 ; <i32*> [#uses=1]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = and i32 %102, 176                        ; <i32> [#uses=1]
  %104 = icmp eq i32 %103, 32                     ; <i1> [#uses=2]
  br i1 %104, label %invcont9.i, label %bb6.i41

bb6.i41:                                          ; preds = %bb1.i40
  %105 = add i32 %99, -7                          ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %105)
          to label %invcont9.i unwind label %lpad50.i

invcont9.i:                                       ; preds = %bb6.i41, %bb1.i40
  %106 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %107 = getelementptr inbounds i32 (...)** %106, i32 -3 ; <i32 (...)**> [#uses=1]
  %108 = bitcast i32 (...)** %107 to i32*         ; <i32*> [#uses=1]
  %109 = load i32* %108, align 4                  ; <i32> [#uses=1]
  %110 = add i32 %109, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %111 = inttoptr i32 %110 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %112 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %111, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %113 = load i32* %112, align 4                  ; <i32> [#uses=1]
  %114 = icmp eq i32 %113, 0                      ; <i1> [#uses=1]
  br i1 %114, label %bb11.i, label %bb13.i

bb11.i:                                           ; preds = %invcont9.i
  %115 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %111, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %116 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %115, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %117 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %116, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %118 = load i32 (...)*** %117, align 4          ; <i32 (...)**> [#uses=1]
  %119 = getelementptr inbounds i32 (...)** %118, i32 12 ; <i32 (...)**> [#uses=1]
  %120 = load i32 (...)** %119, align 4           ; <i32 (...)*> [#uses=1]
  %121 = bitcast i32 (...)* %120 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %122 = invoke i32 %121(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %116, i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 7)
          to label %.noexc8.i unwind label %lpad50.i ; <i32> [#uses=1]

.noexc8.i:                                        ; preds = %bb11.i
  %123 = icmp eq i32 %122, 7                      ; <i1> [#uses=1]
  br i1 %123, label %bb13.i, label %bb.i4.i42

bb.i4.i42:                                        ; preds = %.noexc8.i
  %124 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %125 = getelementptr inbounds i32 (...)** %124, i32 -3 ; <i32 (...)**> [#uses=1]
  %126 = bitcast i32 (...)** %125 to i32*         ; <i32*> [#uses=1]
  %127 = load i32* %126, align 4                  ; <i32> [#uses=1]
  %128 = add i32 %127, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %129 = inttoptr i32 %128 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %130 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %129, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %131 = load i32* %130, align 4                  ; <i32> [#uses=1]
  %132 = or i32 %131, 1                           ; <i32> [#uses=2]
  store i32 %132, i32* %130
  %133 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %129, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %134 = load i32* %133, align 4                  ; <i32> [#uses=1]
  %135 = and i32 %132, %134                       ; <i32> [#uses=1]
  %136 = icmp eq i32 %135, 0                      ; <i1> [#uses=1]
  br i1 %136, label %bb13.i, label %bb4.i.i.i5.i

bb4.i.i.i5.i:                                     ; preds = %bb.i4.i42
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc9.i unwind label %lpad50.i

.noexc9.i:                                        ; preds = %bb4.i.i.i5.i
  unreachable

bb13.i:                                           ; preds = %bb.i4.i42, %.noexc8.i, %invcont9.i
  br i1 %104, label %invcont19.i, label %bb32.i

invcont19.i:                                      ; preds = %bb13.i
  %137 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %138 = getelementptr inbounds i32 (...)** %137, i32 -3 ; <i32 (...)**> [#uses=1]
  %139 = bitcast i32 (...)** %138 to i32*         ; <i32*> [#uses=1]
  %140 = load i32* %139, align 4                  ; <i32> [#uses=1]
  %141 = add i32 %140, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %142 = inttoptr i32 %141 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %143 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %142, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %144 = load i32* %143, align 4                  ; <i32> [#uses=1]
  %145 = icmp eq i32 %144, 0                      ; <i1> [#uses=1]
  br i1 %145, label %bb28.i, label %bb32.i

bb28.i:                                           ; preds = %invcont19.i
  %146 = add i32 %99, -7                          ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %146)
          to label %bb32.i unwind label %lpad50.i

bb30.i:                                           ; preds = %bb.i39
  %147 = inttoptr i32 %96 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %148 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %147, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %149 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %148, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %150 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %149, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %151 = load i32 (...)*** %150, align 4          ; <i32 (...)**> [#uses=1]
  %152 = getelementptr inbounds i32 (...)** %151, i32 12 ; <i32 (...)**> [#uses=1]
  %153 = load i32 (...)** %152, align 4           ; <i32 (...)*> [#uses=1]
  %154 = bitcast i32 (...)* %153 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %155 = invoke i32 %154(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %149, i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 7)
          to label %.noexc2.i unwind label %lpad50.i ; <i32> [#uses=1]

.noexc2.i:                                        ; preds = %bb30.i
  %156 = icmp eq i32 %155, 7                      ; <i1> [#uses=1]
  br i1 %156, label %bb32.i, label %bb.i1.i43

bb.i1.i43:                                        ; preds = %.noexc2.i
  %157 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %158 = getelementptr inbounds i32 (...)** %157, i32 -3 ; <i32 (...)**> [#uses=1]
  %159 = bitcast i32 (...)** %158 to i32*         ; <i32*> [#uses=1]
  %160 = load i32* %159, align 4                  ; <i32> [#uses=1]
  %161 = add i32 %160, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %162 = inttoptr i32 %161 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %163 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %162, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %164 = load i32* %163, align 4                  ; <i32> [#uses=1]
  %165 = or i32 %164, 1                           ; <i32> [#uses=2]
  store i32 %165, i32* %163
  %166 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %162, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %167 = load i32* %166, align 4                  ; <i32> [#uses=1]
  %168 = and i32 %165, %167                       ; <i32> [#uses=1]
  %169 = icmp eq i32 %168, 0                      ; <i1> [#uses=1]
  br i1 %169, label %bb32.i, label %bb4.i.i.i.i44

bb4.i.i.i.i44:                                    ; preds = %bb.i1.i43
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc3.i unwind label %lpad50.i

.noexc3.i:                                        ; preds = %bb4.i.i.i.i44
  unreachable

bb32.i:                                           ; preds = %bb.i1.i43, %.noexc2.i, %bb28.i, %invcont19.i, %bb13.i
  %170 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %171 = getelementptr inbounds i32 (...)** %170, i32 -3 ; <i32 (...)**> [#uses=1]
  %172 = bitcast i32 (...)** %171 to i32*         ; <i32*> [#uses=1]
  %173 = load i32* %172, align 4                  ; <i32> [#uses=1]
  %174 = add i32 %173, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %175 = inttoptr i32 %174 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %176 = getelementptr inbounds %"struct.std::ios_base"* %175, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %176, align 4
  br label %bb41.i

bb39.i:                                           ; preds = %lpad50.i
  invoke void @__cxa_end_catch()
          to label %bb41.i unwind label %lpad54.i

bb41.i:                                           ; preds = %bb39.i, %bb32.i, %invcont.i38
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i27)
          to label %invcont20 unwind label %lpad

invcont45.i:                                      ; preds = %ppad.i48
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i47)
          to label %.noexc52 unwind label %lpad

.noexc52:                                         ; preds = %invcont45.i
  unreachable

lpad50.i:                                         ; preds = %bb4.i.i.i.i44, %bb30.i, %bb28.i, %bb4.i.i.i5.i, %bb11.i, %bb6.i41
  %eh_ptr51.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select53.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr51.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %177 = call i8* @__cxa_begin_catch(i8* %eh_ptr51.i) nounwind ; <i8*> [#uses=0]
  %178 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %179 = getelementptr inbounds i32 (...)** %178, i32 -3 ; <i32 (...)**> [#uses=1]
  %180 = bitcast i32 (...)** %179 to i32*         ; <i32*> [#uses=1]
  %181 = load i32* %180, align 4                  ; <i32> [#uses=1]
  %182 = add i32 %181, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %183 = inttoptr i32 %182 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %184 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %183, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %185 = load i32* %184, align 4                  ; <i32> [#uses=1]
  %186 = or i32 %185, 1                           ; <i32> [#uses=1]
  store i32 %186, i32* %184, align 4
  %187 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %183, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %188 = load i32* %187, align 4                  ; <i32> [#uses=1]
  %189 = and i32 %188, 1                          ; <i32> [#uses=1]
  %190 = icmp eq i32 %189, 0                      ; <i1> [#uses=1]
  br i1 %190, label %bb39.i, label %bb.i.i45

bb.i.i45:                                         ; preds = %lpad50.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i46 unwind label %lpad58.i

.noexc.i46:                                       ; preds = %bb.i.i45
  unreachable

lpad54.i:                                         ; preds = %bb39.i
  %eh_ptr55.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select57.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr55.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i48

lpad58.i:                                         ; preds = %bb.i.i45
  %eh_ptr59.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select61.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr59.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad.i48 unwind label %lpad62.i

lpad62.i:                                         ; preds = %lpad58.i
  %eh_ptr63.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select65.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr63.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad66.i:                                         ; preds = %ppad.i48
  %eh_ptr67.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select69.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr67.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i48:                                         ; preds = %lpad58.i, %lpad54.i
  %eh_exception.0.i47 = phi i8* [ %eh_ptr55.i, %lpad54.i ], [ %eh_ptr59.i, %lpad58.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i27)
          to label %invcont45.i unwind label %lpad66.i

invcont20:                                        ; preds = %bb41.i
  %191 = ptrtoint i32* %primes.0.0.1.4 to i32     ; <i32> [#uses=1]
  %192 = ptrtoint i32* %primes.0.0.0.4 to i32     ; <i32> [#uses=1]
  %193 = sub i32 %191, %192                       ; <i32> [#uses=1]
  %194 = ashr i32 %193, 2                         ; <i32> [#uses=1]
  %195 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %195, align 8
  %196 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %196, align 4
  %197 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %198 = getelementptr inbounds i32 (...)** %197, i32 -3 ; <i32 (...)**> [#uses=1]
  %199 = bitcast i32 (...)** %198 to i32*         ; <i32*> [#uses=1]
  %200 = load i32* %199, align 4                  ; <i32> [#uses=1]
  %201 = add i32 %200, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %202 = inttoptr i32 %201 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %203 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %202, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %204 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %203, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %205 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %204, null ; <i1> [#uses=1]
  br i1 %205, label %bb9.i.i.i, label %bb.i.i.i19

bb.i.i.i19:                                       ; preds = %invcont20
  %206 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %202, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %207 = load i32* %206, align 4                  ; <i32> [#uses=1]
  %208 = icmp eq i32 %207, 0                      ; <i1> [#uses=1]
  br i1 %208, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i19
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %204)
          to label %.noexc23 unwind label %lpad

.noexc23:                                         ; preds = %bb8.i.i.i
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %.noexc23, %bb.i.i.i19, %invcont20
  %209 = phi i32 (...)** [ %.pre.i.i.i, %.noexc23 ], [ %197, %invcont20 ], [ %197, %bb.i.i.i19 ] ; <i32 (...)**> [#uses=1]
  %210 = getelementptr inbounds i32 (...)** %209, i32 -3 ; <i32 (...)**> [#uses=1]
  %211 = bitcast i32 (...)** %210 to i32*         ; <i32*> [#uses=1]
  %212 = load i32* %211, align 4                  ; <i32> [#uses=1]
  %213 = add i32 %212, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %214 = inttoptr i32 %213 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %215 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %214, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %216 = load i32* %215, align 4                  ; <i32> [#uses=2]
  %217 = icmp eq i32 %216, 0                      ; <i1> [#uses=1]
  br i1 %217, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %195, align 8
  br label %bb.i20

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %218 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %214, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %219 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %218, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %220 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %219, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %220, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %216 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %215
  %221 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %214, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %222 = load i32* %221, align 4                  ; <i32> [#uses=1]
  %223 = and i32 %storemerge.i.i.i.i, %222        ; <i32> [#uses=1]
  %224 = icmp eq i32 %223, 0                      ; <i1> [#uses=1]
  br i1 %224, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc24 unwind label %lpad

.noexc24:                                         ; preds = %bb4.i.i.i.i.i
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr55 = load i8* %195, align 8                 ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr55, 0                ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb17.i, label %bb.i20

bb.i20:                                           ; preds = %invcont.i, %invcont.i.thread
  %225 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %226 = getelementptr inbounds i32 (...)** %225, i32 -3 ; <i32 (...)**> [#uses=1]
  %227 = bitcast i32 (...)** %226 to i32*         ; <i32*> [#uses=1]
  %228 = load i32* %227, align 4                  ; <i32> [#uses=1]
  %229 = add i32 %228, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %230 = inttoptr i32 %229 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %231 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %230, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %232 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %231, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %233 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %232, null ; <i1> [#uses=1]
  br i1 %233, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i20
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i20
  %234 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %230, i32 0, i32 3 ; <i8*> [#uses=2]
  %235 = load i8* %234, align 1                   ; <i8> [#uses=1]
  %toBool.i.i21 = icmp eq i8 %235, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i21, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %230, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %236 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %237 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %230, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %236, i8* %237, align 4
  store i8 1, i8* %234, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %238 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %225, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %239 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %230, i32 0, i32 2 ; <i8*> [#uses=1]
  %240 = load i8* %239, align 4                   ; <i8> [#uses=1]
  %241 = getelementptr inbounds i32 (...)** %238, i32 -3 ; <i32 (...)**> [#uses=1]
  %242 = bitcast i32 (...)** %241 to i32*         ; <i32*> [#uses=1]
  %243 = load i32* %242, align 4                  ; <i32> [#uses=1]
  %244 = add i32 %243, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %245 = inttoptr i32 %244 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %246 = inttoptr i32 %244 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %247 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %246, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %248 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %247, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %248 to i32 ; <i32> [#uses=1]
  %249 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %248, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %250 = zext i32 %tmp.i to i64                   ; <i64> [#uses=1]
  %251 = zext i1 %249 to i64                      ; <i64> [#uses=1]
  %252 = shl i64 %251, 32                         ; <i64> [#uses=1]
  %253 = or i64 %252, %250                        ; <i64> [#uses=1]
  store i64 %253, i64* %tmp9.i, align 8
  %254 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %232, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %255 = load i32 (...)*** %254, align 4          ; <i32 (...)**> [#uses=1]
  %256 = getelementptr inbounds i32 (...)** %255, i32 4 ; <i32 (...)**> [#uses=1]
  %257 = load i32 (...)** %256, align 4           ; <i32 (...)*> [#uses=1]
  %258 = bitcast i32 (...)* %257 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %258(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %232, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %245, i8 signext %240, i32 %194)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %259 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %260 = load i8* %259, align 4                   ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %260, 0                 ; <i1> [#uses=1]
  br i1 %toBool4.i, label %bb17.i, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %bb17.i unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %261 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %262 = getelementptr inbounds i32 (...)** %261, i32 -3 ; <i32 (...)**> [#uses=1]
  %263 = bitcast i32 (...)** %262 to i32*         ; <i32*> [#uses=1]
  %264 = load i32* %263, align 4                  ; <i32> [#uses=1]
  %265 = add i32 %264, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %266 = inttoptr i32 %265 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %267 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %266, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %268 = load i32* %267, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %268, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %267
  %269 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %266, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %270 = load i32* %269, align 4                  ; <i32> [#uses=1]
  %271 = and i32 %storemerge.i.i, %270            ; <i32> [#uses=1]
  %272 = icmp eq i32 %271, 0                      ; <i1> [#uses=1]
  br i1 %272, label %bb17.i, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb15.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

bb17.i:                                           ; preds = %bb15.i, %bb12.i, %invcont3.i, %invcont.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont21 unwind label %lpad

invcont21.i:                                      ; preds = %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
          to label %.noexc26 unwind label %lpad

.noexc26:                                         ; preds = %invcont21.i
  unreachable

lpad.i:                                           ; preds = %bb4.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %273 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %274 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %275 = getelementptr inbounds i32 (...)** %274, i32 -3 ; <i32 (...)**> [#uses=1]
  %276 = bitcast i32 (...)** %275 to i32*         ; <i32*> [#uses=1]
  %277 = load i32* %276, align 4                  ; <i32> [#uses=1]
  %278 = add i32 %277, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %279 = inttoptr i32 %278 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %280 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %279, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %281 = load i32* %280, align 4                  ; <i32> [#uses=1]
  %282 = or i32 %281, 1                           ; <i32> [#uses=1]
  store i32 %282, i32* %280, align 4
  %283 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %279, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %284 = load i32* %283, align 4                  ; <i32> [#uses=1]
  %285 = and i32 %284, 1                          ; <i32> [#uses=1]
  %286 = icmp eq i32 %285, 0                      ; <i1> [#uses=1]
  br i1 %286, label %bb12.i, label %bb.i.i22

bb.i.i22:                                         ; preds = %lpad26.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i unwind label %lpad34.i

.noexc.i:                                         ; preds = %bb.i.i22
  unreachable

lpad30.i:                                         ; preds = %bb12.i
  %eh_ptr31.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select33.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad34.i:                                         ; preds = %bb.i.i22
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

invcont21:                                        ; preds = %bb17.i
  %287 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %288 = getelementptr inbounds i32 (...)** %287, i32 -3 ; <i32 (...)**> [#uses=1]
  %289 = bitcast i32 (...)** %288 to i32*         ; <i32*> [#uses=1]
  %290 = load i32* %289, align 4                  ; <i32> [#uses=1]
  %291 = add i32 %290, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %292 = inttoptr i32 %291 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx53 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %292, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx53.val = load %"struct.std::ctype<char>"** %.idx53 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %293 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx53.val, i8 signext 10)
          to label %.noexc13 unwind label %lpad   ; <i8> [#uses=3]

.noexc13:                                         ; preds = %invcont21
  %294 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %294, align 8
  %295 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %295, align 4
  %296 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %297 = getelementptr inbounds i32 (...)** %296, i32 -3 ; <i32 (...)**> [#uses=1]
  %298 = bitcast i32 (...)** %297 to i32*         ; <i32*> [#uses=1]
  %299 = load i32* %298, align 4                  ; <i32> [#uses=1]
  %300 = add i32 %299, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %301 = inttoptr i32 %300 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %302 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %301, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %303 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %302, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %304 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %303, null ; <i1> [#uses=1]
  br i1 %304, label %bb9.i.i.i.i, label %bb.i.i.i.i10

bb.i.i.i.i10:                                     ; preds = %.noexc13
  %305 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %301, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %306 = load i32* %305, align 4                  ; <i32> [#uses=1]
  %307 = icmp eq i32 %306, 0                      ; <i1> [#uses=1]
  br i1 %307, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i10
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %303)
          to label %.noexc14 unwind label %lpad

.noexc14:                                         ; preds = %bb8.i.i.i.i
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %.noexc14, %bb.i.i.i.i10, %.noexc13
  %308 = phi i32 (...)** [ %.pre.i.i.i.i, %.noexc14 ], [ %296, %.noexc13 ], [ %296, %bb.i.i.i.i10 ] ; <i32 (...)**> [#uses=1]
  %309 = getelementptr inbounds i32 (...)** %308, i32 -3 ; <i32 (...)**> [#uses=1]
  %310 = bitcast i32 (...)** %309 to i32*         ; <i32*> [#uses=1]
  %311 = load i32* %310, align 4                  ; <i32> [#uses=1]
  %312 = add i32 %311, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %313 = inttoptr i32 %312 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %314 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %313, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %315 = load i32* %314, align 4                  ; <i32> [#uses=2]
  %316 = icmp eq i32 %315, 0                      ; <i1> [#uses=1]
  br i1 %316, label %invcont.i.i11.thread, label %bb12.i.i.i.i

invcont.i.i11.thread:                             ; preds = %bb9.i.i.i.i
  store i8 1, i8* %294, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %317 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %313, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %318 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %317, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %319 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %318, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %319, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %315 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %314
  %320 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %313, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %321 = load i32* %320, align 4                  ; <i32> [#uses=1]
  %322 = and i32 %storemerge.i.i.i.i.i, %321      ; <i32> [#uses=1]
  %323 = icmp eq i32 %322, 0                      ; <i1> [#uses=1]
  br i1 %323, label %invcont.i.i11, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc15 unwind label %lpad

.noexc15:                                         ; preds = %bb4.i.i.i.i.i.i
  unreachable

invcont.i.i11:                                    ; preds = %bb12.i.i.i.i
  %.pr57 = load i8* %294, align 8                 ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %.pr57, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %_ZNSo3putEc.exit.i, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i11, %invcont.i.i11.thread
  %324 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %325 = getelementptr inbounds i32 (...)** %324, i32 -3 ; <i32 (...)**> [#uses=1]
  %326 = bitcast i32 (...)** %325 to i32*         ; <i32*> [#uses=1]
  %327 = load i32* %326, align 4                  ; <i32> [#uses=1]
  %328 = add i32 %327, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %329 = inttoptr i32 %328 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %330 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %329, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %331 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %330, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %332 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %331, i32 0, i32 5 ; <i8**> [#uses=3]
  %333 = load i8** %332, align 4                  ; <i8*> [#uses=2]
  %334 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %331, i32 0, i32 6 ; <i8**> [#uses=1]
  %335 = load i8** %334, align 4                  ; <i8*> [#uses=1]
  %336 = icmp ult i8* %333, %335                  ; <i1> [#uses=1]
  br i1 %336, label %bb.i2.i.i, label %bb1.i.i.i

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %293, i8* %333, align 1
  %337 = load i8** %332, align 4                  ; <i8*> [#uses=1]
  %338 = getelementptr inbounds i8* %337, i32 1   ; <i8*> [#uses=1]
  store i8* %338, i8** %332, align 4
  %339 = zext i8 %293 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i:                                        ; preds = %invcont1.i.i
  %340 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %331, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %341 = load i32 (...)*** %340, align 4          ; <i32 (...)**> [#uses=1]
  %342 = getelementptr inbounds i32 (...)** %341, i32 13 ; <i32 (...)**> [#uses=1]
  %343 = load i32 (...)** %342, align 4           ; <i32 (...)*> [#uses=1]
  %344 = zext i8 %293 to i32                      ; <i32> [#uses=1]
  %345 = bitcast i32 (...)* %343 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %346 = invoke i32 %345(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %331, i32 %344)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i, %bb.i2.i.i
  %347 = phi i32 [ %339, %bb.i2.i.i ], [ %346, %bb1.i.i.i ] ; <i32> [#uses=1]
  %348 = icmp eq i32 %347, -1                     ; <i1> [#uses=1]
  br i1 %348, label %bb14.i.i, label %_ZNSo3putEc.exit.i

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit.i unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %349 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %350 = getelementptr inbounds i32 (...)** %349, i32 -3 ; <i32 (...)**> [#uses=1]
  %351 = bitcast i32 (...)** %350 to i32*         ; <i32*> [#uses=1]
  %352 = load i32* %351, align 4                  ; <i32> [#uses=1]
  %353 = add i32 %352, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %354 = inttoptr i32 %353 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %355 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %354, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %356 = load i32* %355, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %356, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %355
  %357 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %354, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %358 = load i32* %357, align 4                  ; <i32> [#uses=1]
  %359 = and i32 %storemerge.i.i.i, %358          ; <i32> [#uses=1]
  %360 = icmp eq i32 %359, 0                      ; <i1> [#uses=1]
  br i1 %360, label %_ZNSo3putEc.exit.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc16 unwind label %lpad

.noexc16:                                         ; preds = %invcont20.i.i
  unreachable

lpad.i.i:                                         ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %361 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %362 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %363 = getelementptr inbounds i32 (...)** %362, i32 -3 ; <i32 (...)**> [#uses=1]
  %364 = bitcast i32 (...)** %363 to i32*         ; <i32*> [#uses=1]
  %365 = load i32* %364, align 4                  ; <i32> [#uses=1]
  %366 = add i32 %365, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %367 = inttoptr i32 %366 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %368 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %367, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %369 = load i32* %368, align 4                  ; <i32> [#uses=1]
  %370 = or i32 %369, 1                           ; <i32> [#uses=1]
  store i32 %370, i32* %368, align 4
  %371 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %367, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %372 = load i32* %371, align 4                  ; <i32> [#uses=1]
  %373 = and i32 %372, 1                          ; <i32> [#uses=1]
  %374 = icmp eq i32 %373, 0                      ; <i1> [#uses=1]
  br i1 %374, label %bb11.i.i, label %bb.i.i.i12

bb.i.i.i12:                                       ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i unwind label %lpad33.i.i

.noexc.i.i:                                       ; preds = %bb.i.i.i12
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i12
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

_ZNSo3putEc.exit.i:                               ; preds = %bb14.i.i, %bb11.i.i, %invcont2.i.i, %invcont.i.i11
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
          to label %.noexc17 unwind label %lpad

.noexc17:                                         ; preds = %_ZNSo3putEc.exit.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
          to label %invcont22 unwind label %lpad

invcont22:                                        ; preds = %.noexc17
  %375 = icmp eq i32* %primes.0.0.0.4, null       ; <i1> [#uses=1]
  br i1 %375, label %_ZNSt6vectorIiSaIiEED1Ev.exit4, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %invcont22
  %376 = bitcast i32* %primes.0.0.0.4 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %376) nounwind
  ret i32 0

_ZNSt6vectorIiSaIiEED1Ev.exit4:                   ; preds = %invcont22
  ret i32 0

invcont26:                                        ; preds = %bb.i.i.i, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

lpad:                                             ; preds = %.noexc17, %_ZNSo3putEc.exit.i, %invcont20.i.i, %bb4.i.i.i.i.i.i, %bb8.i.i.i.i, %invcont21, %invcont21.i, %bb17.i, %bb4.i.i.i.i.i, %bb8.i.i.i, %invcont45.i, %bb41.i, %bb4.i.i.i.i.i36, %bb8.i.i.i30
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select30 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad31:                                           ; preds = %invcont.i.i, %bb.i.i.i.i4, %bb2.i.i, %bb3.i, %bb.i, %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i, %bb7
  %primes.0.0.0.5 = phi i32* [ %primes.0.0.0.2, %bb.i.i.i.i4 ], [ %primes.0.0.0.2, %bb2.i.i ], [ %primes.0.0.0.4, %bb7 ], [ %primes.0.0.0.4, %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i ], [ %primes.0.0.0.2, %bb3.i ], [ %primes.0.0.0.2, %bb.i ], [ %primes.0.0.0.2, %invcont.i.i ] ; <i32*> [#uses=2]
  %eh_ptr32 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select34 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr32, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %377 = load %"struct.std::_List_node_base"** %6, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %378 = icmp eq %"struct.std::_List_node_base"* %8, %377 ; <i1> [#uses=1]
  br i1 %378, label %ppad, label %bb.i.i.i1

bb.i.i.i1:                                        ; preds = %bb.i.i.i1, %lpad31
  %__cur.0.in1.i.i.i = phi %"struct.std::_List_node_base"* [ %380, %bb.i.i.i1 ], [ %377, %lpad31 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %379 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %380 = load %"struct.std::_List_node_base"** %379, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %381 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %381) nounwind
  %382 = icmp eq %"struct.std::_List_node_base"* %8, %380 ; <i1> [#uses=1]
  br i1 %382, label %ppad, label %bb.i.i.i1

ppad:                                             ; preds = %bb.i.i.i1, %lpad31, %lpad
  %primes.0.0.0.6 = phi i32* [ %primes.0.0.0.4, %lpad ], [ %primes.0.0.0.5, %lpad31 ], [ %primes.0.0.0.5, %bb.i.i.i1 ] ; <i32*> [#uses=2]
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr32, %lpad31 ], [ %eh_ptr32, %bb.i.i.i1 ] ; <i8*> [#uses=1]
  %383 = icmp eq i32* %primes.0.0.0.6, null       ; <i1> [#uses=1]
  br i1 %383, label %invcont26, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %ppad
  %384 = bitcast i32* %primes.0.0.0.6 to i8*      ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %384) nounwind
  br label %invcont26
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
