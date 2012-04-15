; ModuleID = 'lists.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_List_base<unsigned int,std::allocator<unsigned int> >" = type { %"struct.std::_List_base<unsigned int,std::allocator<unsigned int> >::_List_impl" }
%"struct.std::_List_base<unsigned int,std::allocator<unsigned int> >::_List_impl" = type { %"struct.std::_List_node_base" }
%"struct.std::_List_node_base" = type { %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"* }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::list<unsigned int,std::allocator<unsigned int> >" = type { %"struct.std::_List_base<unsigned int,std::allocator<unsigned int> >" }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }

@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I__Z10test_listsv }] ; <[1 x %0]*> [#uses=0]

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

define internal void @_GLOBAL__I__Z10test_listsv() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<std::_List_node<unsigned int> >"*)

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

declare void @_ZdlPv(i8*) nounwind

declare void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"*)

declare i8* @_Znwj(i32)

declare void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

declare void @_ZNSt15_List_node_base7reverseEv(%"struct.std::_List_node_base"*)

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %li3.i = alloca %"struct.std::list<unsigned int,std::allocator<unsigned int> >", align 8 ; <%"struct.std::list<unsigned int,std::allocator<unsigned int> >"*> [#uses=3]
  %li2.i = alloca %"struct.std::list<unsigned int,std::allocator<unsigned int> >", align 8 ; <%"struct.std::list<unsigned int,std::allocator<unsigned int> >"*> [#uses=3]
  %li1.i = alloca %"struct.std::list<unsigned int,std::allocator<unsigned int> >", align 8 ; <%"struct.std::list<unsigned int,std::allocator<unsigned int> >"*> [#uses=3]
  %1 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb6.preheader

bb:                                               ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = tail call i32 @atoi(i8* %3) nounwind readonly ; <i32> [#uses=3]
  %5 = icmp sgt i32 %4, 0                         ; <i1> [#uses=1]
  br i1 %5, label %bb7.preheader, label %bb6.preheader

bb7.preheader:                                    ; preds = %bb
  %6 = icmp eq i32 %4, 0                          ; <i1> [#uses=1]
  br i1 %6, label %bb8, label %bb6.preheader

bb6.preheader:                                    ; preds = %bb7.preheader, %bb, %entry
  %ITER.0.ph.reg2mem.0.ph = phi i32 [ %4, %bb7.preheader ], [ 3000, %entry ], [ 1, %bb ] ; <i32> [#uses=1]
  %7 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li1.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=7]
  %8 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li1.i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %9 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li1.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=17]
  %10 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li2.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=8]
  %11 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li2.i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %12 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li2.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=13]
  %13 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li3.i, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=5]
  %14 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li3.i, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=4]
  %15 = getelementptr inbounds %"struct.std::list<unsigned int,std::allocator<unsigned int> >"* %li3.i, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=11]
  br label %bb6

bb6:                                              ; preds = %_Z10test_listsv.exit, %bb6.preheader
  %indvar = phi i32 [ %indvar.next, %_Z10test_listsv.exit ], [ 0, %bb6.preheader ] ; <i32> [#uses=1]
  store %"struct.std::_List_node_base"* %9, %"struct.std::_List_node_base"** %7, align 8
  store %"struct.std::_List_node_base"* %9, %"struct.std::_List_node_base"** %8, align 4
  br label %bb.i.i.i

bb.i.i.i:                                         ; preds = %.noexc1.i.i, %bb6
  %indvar.i.i.i = phi i32 [ 0, %bb6 ], [ %16, %.noexc1.i.i ] ; <i32> [#uses=2]
  %16 = add i32 %indvar.i.i.i, 1                  ; <i32> [#uses=1]
  %17 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i.i unwind label %lpad.i.i ; <i8*> [#uses=2]

.noexc.i.i:                                       ; preds = %bb.i.i.i
  %18 = getelementptr inbounds i8* %17, i32 8     ; <i8*> [#uses=2]
  %19 = icmp eq i8* %18, null                     ; <i1> [#uses=1]
  br i1 %19, label %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i, label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %.noexc.i.i
  %20 = bitcast i8* %18 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %20
  br label %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i

_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i:      ; preds = %bb.i.i.i.i.i.i.i, %.noexc.i.i
  %21 = bitcast i8* %17 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %21, %"struct.std::_List_node_base"* %9)
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i
  %exitcond.i.i.i = icmp eq i32 %indvar.i.i.i, 9999 ; <i1> [#uses=1]
  br i1 %exitcond.i.i.i, label %invcont3.i, label %bb.i.i.i

invcont1.i.i:                                     ; preds = %bb.i.i.i42.i, %lpad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc43.i unwind label %lpad.i

.noexc43.i:                                       ; preds = %invcont1.i.i
  unreachable

lpad.i.i:                                         ; preds = %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i, %bb.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select5.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %22 = load %"struct.std::_List_node_base"** %7, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %23 = icmp eq %"struct.std::_List_node_base"* %9, %22 ; <i1> [#uses=1]
  br i1 %23, label %invcont1.i.i, label %bb.i.i.i42.i

bb.i.i.i42.i:                                     ; preds = %bb.i.i.i42.i, %lpad.i.i
  %__cur.0.in1.i.i.i41.i = phi %"struct.std::_List_node_base"* [ %25, %bb.i.i.i42.i ], [ %22, %lpad.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %24 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i41.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %25 = load %"struct.std::_List_node_base"** %24, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %26 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i41.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %26) nounwind
  %27 = icmp eq %"struct.std::_List_node_base"* %9, %25 ; <i1> [#uses=1]
  br i1 %27, label %invcont1.i.i, label %bb.i.i.i42.i

invcont3.i:                                       ; preds = %.noexc1.i.i
  %28 = load %"struct.std::_List_node_base"** %7, align 8 ; <%"struct.std::_List_node_base"*> [#uses=3]
  %29 = icmp eq %"struct.std::_List_node_base"* %28, %9 ; <i1> [#uses=1]
  br i1 %29, label %invcont6.i, label %bb.i40.i

bb.i40.i:                                         ; preds = %bb.i40.i, %invcont3.i
  %indvar.i.i = phi i32 [ %__value_addr.02.i.i, %bb.i40.i ], [ 0, %invcont3.i ] ; <i32> [#uses=1]
  %__first_addr.0.01.i.i = phi %"struct.std::_List_node_base"* [ %31, %bb.i40.i ], [ %28, %invcont3.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %__value_addr.02.i.i = add i32 %indvar.i.i, 1   ; <i32> [#uses=2]
  %30 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %31 = load %"struct.std::_List_node_base"** %30, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %32 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i, i32 1, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %__value_addr.0.c.i.i = inttoptr i32 %__value_addr.02.i.i to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  store %"struct.std::_List_node_base"* %__value_addr.0.c.i.i, %"struct.std::_List_node_base"** %32
  %33 = icmp eq %"struct.std::_List_node_base"* %31, %9 ; <i1> [#uses=1]
  br i1 %33, label %invcont6.loopexit.i, label %bb.i40.i

invcont6.loopexit.i:                              ; preds = %bb.i40.i
  %.pre.i = load %"struct.std::_List_node_base"** %7, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %invcont6.i

invcont6.i:                                       ; preds = %invcont6.loopexit.i, %invcont3.i
  %34 = phi %"struct.std::_List_node_base"* [ %.pre.i, %invcont6.loopexit.i ], [ %28, %invcont3.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  store %"struct.std::_List_node_base"* %12, %"struct.std::_List_node_base"** %10, align 8
  store %"struct.std::_List_node_base"* %12, %"struct.std::_List_node_base"** %11, align 4
  %35 = icmp eq %"struct.std::_List_node_base"* %34, %9 ; <i1> [#uses=1]
  br i1 %35, label %invcont8.i.thread, label %bb.i.i.i37.i

invcont8.i.thread:                                ; preds = %invcont6.i
  store %"struct.std::_List_node_base"* %15, %"struct.std::_List_node_base"** %13, align 8
  store %"struct.std::_List_node_base"* %15, %"struct.std::_List_node_base"** %14, align 4
  br label %bb14.preheader.i

bb.i.i.i37.i:                                     ; preds = %.noexc2.i.i.i, %invcont6.i
  %__first_addr.0.01.i.i.i36.i = phi %"struct.std::_List_node_base"* [ %45, %.noexc2.i.i.i ], [ %34, %invcont6.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %36 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i.i.i unwind label %lpad15.i.i.i ; <i8*> [#uses=2]

.noexc.i.i.i:                                     ; preds = %bb.i.i.i37.i
  %37 = getelementptr inbounds i8* %36, i32 8     ; <i8*> [#uses=2]
  %38 = icmp eq i8* %37, null                     ; <i1> [#uses=1]
  br i1 %38, label %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i.i, label %bb.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %.noexc.i.i.i
  %39 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i36.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %40 = bitcast %"struct.std::_List_node_base"* %39 to i32* ; <i32*> [#uses=1]
  %41 = bitcast i8* %37 to i32*                   ; <i32*> [#uses=1]
  %42 = load i32* %40, align 4                    ; <i32> [#uses=1]
  store i32 %42, i32* %41
  br label %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i.i

_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i.i:    ; preds = %bb.i.i.i.i.i.i.i.i, %.noexc.i.i.i
  %43 = bitcast i8* %36 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %43, %"struct.std::_List_node_base"* %12)
          to label %.noexc2.i.i.i unwind label %lpad15.i.i.i

.noexc2.i.i.i:                                    ; preds = %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i.i
  %44 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i36.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %45 = load %"struct.std::_List_node_base"** %44, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %46 = icmp eq %"struct.std::_List_node_base"* %45, %9 ; <i1> [#uses=1]
  br i1 %46, label %invcont8.i, label %bb.i.i.i37.i

lpad15.i.i.i:                                     ; preds = %_ZNSt4listIjSaIjEE9push_backERKj.exit.i.i.i.i, %bb.i.i.i37.i
  %eh_ptr16.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select18.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr16.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %47 = load %"struct.std::_List_node_base"** %10, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %48 = icmp eq %"struct.std::_List_node_base"* %12, %47 ; <i1> [#uses=1]
  br i1 %48, label %Unwind.i.i.i, label %bb.i.i.i.i38.i

bb.i.i.i.i38.i:                                   ; preds = %bb.i.i.i.i38.i, %lpad15.i.i.i
  %__cur.0.in1.i.i.i.i.i = phi %"struct.std::_List_node_base"* [ %50, %bb.i.i.i.i38.i ], [ %47, %lpad15.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %49 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %50 = load %"struct.std::_List_node_base"** %49, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %51 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %51) nounwind
  %52 = icmp eq %"struct.std::_List_node_base"* %12, %50 ; <i1> [#uses=1]
  br i1 %52, label %Unwind.i.i.i, label %bb.i.i.i.i38.i

Unwind.i.i.i:                                     ; preds = %bb.i.i.i.i38.i, %lpad15.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr16.i.i.i)
          to label %.noexc39.i unwind label %lpad58.i

.noexc39.i:                                       ; preds = %Unwind.i.i.i
  unreachable

invcont8.i:                                       ; preds = %.noexc2.i.i.i
  %.pre58.i = load %"struct.std::_List_node_base"** %10, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  store %"struct.std::_List_node_base"* %15, %"struct.std::_List_node_base"** %13, align 8
  store %"struct.std::_List_node_base"* %15, %"struct.std::_List_node_base"** %14, align 4
  %53 = icmp eq %"struct.std::_List_node_base"* %.pre58.i, %12 ; <i1> [#uses=1]
  br i1 %53, label %bb14.preheader.i, label %bb.i.i.i33.i

bb.i.i.i33.i:                                     ; preds = %bb.i.i.i33.i, %invcont8.i
  %__n.02.i.i.i30.i = phi i32 [ %54, %bb.i.i.i33.i ], [ 0, %invcont8.i ] ; <i32> [#uses=2]
  %__first_addr.0.01.i.i.i31.i = phi %"struct.std::_List_node_base"* [ %56, %bb.i.i.i33.i ], [ %.pre58.i, %invcont8.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %54 = add i32 %__n.02.i.i.i30.i, 1              ; <i32> [#uses=1]
  %55 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i31.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %56 = load %"struct.std::_List_node_base"** %55, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %57 = icmp eq %"struct.std::_List_node_base"* %56, %12 ; <i1> [#uses=1]
  br i1 %57, label %bb14.preheader.i, label %bb.i.i.i33.i

bb14.preheader.i:                                 ; preds = %bb.i.i.i33.i, %invcont8.i, %invcont8.i.thread
  %N.0.ph.i = phi i32 [ -1, %invcont8.i ], [ -1, %invcont8.i.thread ], [ %__n.02.i.i.i30.i, %bb.i.i.i33.i ] ; <i32> [#uses=1]
  br label %bb14.i

invcont11.i:                                      ; preds = %bb14.i
  %58 = load %"struct.std::_List_node_base"** %10, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %59 = getelementptr inbounds %"struct.std::_List_node_base"* %58, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %60 = bitcast %"struct.std::_List_node_base"* %59 to i32* ; <i32*> [#uses=1]
  %61 = invoke i8* @_Znwj(i32 12)
          to label %.noexc27.i unwind label %lpad66.i ; <i8*> [#uses=2]

.noexc27.i:                                       ; preds = %invcont11.i
  %62 = getelementptr inbounds i8* %61, i32 8     ; <i8*> [#uses=2]
  %63 = icmp eq i8* %62, null                     ; <i1> [#uses=1]
  br i1 %63, label %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i26.i, label %bb.i.i.i.i25.i

bb.i.i.i.i25.i:                                   ; preds = %.noexc27.i
  %64 = bitcast i8* %62 to i32*                   ; <i32*> [#uses=1]
  %65 = load i32* %60, align 4                    ; <i32> [#uses=1]
  store i32 %65, i32* %64
  br label %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i26.i

_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i26.i: ; preds = %bb.i.i.i.i25.i, %.noexc27.i
  %66 = bitcast i8* %61 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %66, %"struct.std::_List_node_base"* %15)
          to label %invcont12.i unwind label %lpad66.i

invcont12.i:                                      ; preds = %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i26.i
  %67 = load %"struct.std::_List_node_base"** %10, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  invoke void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"* %67)
          to label %_ZNSt4listIjSaIjEE9pop_frontEv.exit.i unwind label %lpad66.i

_ZNSt4listIjSaIjEE9pop_frontEv.exit.i:            ; preds = %invcont12.i
  %68 = bitcast %"struct.std::_List_node_base"* %67 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %68) nounwind
  %indvar.next53.i = add i32 %indvar52.i, 1       ; <i32> [#uses=1]
  br label %bb14.i

bb14.i:                                           ; preds = %_ZNSt4listIjSaIjEE9pop_frontEv.exit.i, %bb14.preheader.i
  %indvar52.i = phi i32 [ 0, %bb14.preheader.i ], [ %indvar.next53.i, %_ZNSt4listIjSaIjEE9pop_frontEv.exit.i ] ; <i32> [#uses=2]
  %tmp56.i = sub i32 %N.0.ph.i, %indvar52.i       ; <i32> [#uses=1]
  %69 = icmp eq i32 %tmp56.i, -1                  ; <i1> [#uses=1]
  br i1 %69, label %bb15.i, label %invcont11.i

bb15.i:                                           ; preds = %bb14.i
  %70 = load %"struct.std::_List_node_base"** %13, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %71 = icmp eq %"struct.std::_List_node_base"* %70, %15 ; <i1> [#uses=1]
  br i1 %71, label %bb21.preheader.i, label %bb.i.i.i21.i

bb.i.i.i21.i:                                     ; preds = %bb.i.i.i21.i, %bb15.i
  %__n.02.i.i.i18.i = phi i32 [ %72, %bb.i.i.i21.i ], [ 0, %bb15.i ] ; <i32> [#uses=2]
  %__first_addr.0.01.i.i.i19.i = phi %"struct.std::_List_node_base"* [ %74, %bb.i.i.i21.i ], [ %70, %bb15.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %72 = add i32 %__n.02.i.i.i18.i, 1              ; <i32> [#uses=1]
  %73 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i19.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %74 = load %"struct.std::_List_node_base"** %73, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %75 = icmp eq %"struct.std::_List_node_base"* %74, %15 ; <i1> [#uses=1]
  br i1 %75, label %bb21.preheader.i, label %bb.i.i.i21.i

bb21.preheader.i:                                 ; preds = %bb.i.i.i21.i, %bb15.i
  %N.1.ph.i = phi i32 [ -1, %bb15.i ], [ %__n.02.i.i.i18.i, %bb.i.i.i21.i ] ; <i32> [#uses=1]
  br label %bb21.i

invcont18.i:                                      ; preds = %bb21.i
  %76 = load %"struct.std::_List_node_base"** %14, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %77 = getelementptr inbounds %"struct.std::_List_node_base"* %76, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %78 = bitcast %"struct.std::_List_node_base"* %77 to i32* ; <i32*> [#uses=1]
  %79 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i unwind label %lpad66.i ; <i8*> [#uses=2]

.noexc.i:                                         ; preds = %invcont18.i
  %80 = getelementptr inbounds i8* %79, i32 8     ; <i8*> [#uses=2]
  %81 = icmp eq i8* %80, null                     ; <i1> [#uses=1]
  br i1 %81, label %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %.noexc.i
  %82 = bitcast i8* %80 to i32*                   ; <i32*> [#uses=1]
  %83 = load i32* %78, align 4                    ; <i32> [#uses=1]
  store i32 %83, i32* %82
  br label %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i.i

_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i.i: ; preds = %bb.i.i.i.i.i, %.noexc.i
  %84 = bitcast i8* %79 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %84, %"struct.std::_List_node_base"* %12)
          to label %invcont19.i unwind label %lpad66.i

invcont19.i:                                      ; preds = %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i.i
  %85 = load %"struct.std::_List_node_base"** %14, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  invoke void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"* %85)
          to label %_ZNSt4listIjSaIjEE8pop_backEv.exit.i unwind label %lpad66.i

_ZNSt4listIjSaIjEE8pop_backEv.exit.i:             ; preds = %invcont19.i
  %86 = bitcast %"struct.std::_List_node_base"* %85 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %86) nounwind
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb21.i

bb21.i:                                           ; preds = %_ZNSt4listIjSaIjEE8pop_backEv.exit.i, %bb21.preheader.i
  %indvar.i = phi i32 [ 0, %bb21.preheader.i ], [ %indvar.next.i, %_ZNSt4listIjSaIjEE8pop_backEv.exit.i ] ; <i32> [#uses=2]
  %tmp51.i = sub i32 %N.1.ph.i, %indvar.i         ; <i32> [#uses=1]
  %87 = icmp eq i32 %tmp51.i, -1                  ; <i1> [#uses=1]
  br i1 %87, label %bb23.i, label %invcont18.i

bb23.i:                                           ; preds = %bb21.i
  invoke void @_ZNSt15_List_node_base7reverseEv(%"struct.std::_List_node_base"* %9)
          to label %invcont25.i unwind label %lpad66.i

invcont25.i:                                      ; preds = %bb23.i
  %88 = load %"struct.std::_List_node_base"** %7, align 8 ; <%"struct.std::_List_node_base"*> [#uses=4]
  %89 = getelementptr inbounds %"struct.std::_List_node_base"* %88, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %90 = bitcast %"struct.std::_List_node_base"* %89 to i32* ; <i32*> [#uses=1]
  %91 = load i32* %90, align 4                    ; <i32> [#uses=1]
  %92 = icmp eq i32 %91, 10000                    ; <i1> [#uses=1]
  br i1 %92, label %bb1.i.i, label %bb35.i

bb.i.i:                                           ; preds = %bb10.i.i
  %93 = getelementptr inbounds %"struct.std::_List_node_base"* %__i1.0.0.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %94 = getelementptr inbounds %"struct.std::_List_node_base"* %__i2.0.0.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %__i1.0.0.i.pre.i = load %"struct.std::_List_node_base"** %93 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i.i, %invcont25.i
  %__i1.0.0.i.i = phi %"struct.std::_List_node_base"* [ %__i1.0.0.i.pre.i, %bb.i.i ], [ %88, %invcont25.i ] ; <%"struct.std::_List_node_base"*> [#uses=3]
  %__i2.0.0.in.i.i = phi %"struct.std::_List_node_base"** [ %94, %bb.i.i ], [ %10, %invcont25.i ] ; <%"struct.std::_List_node_base"**> [#uses=1]
  %__i2.0.0.i.i = load %"struct.std::_List_node_base"** %__i2.0.0.in.i.i ; <%"struct.std::_List_node_base"*> [#uses=3]
  %95 = icmp eq %"struct.std::_List_node_base"* %__i1.0.0.i.i, %9 ; <i1> [#uses=2]
  %96 = icmp eq %"struct.std::_List_node_base"* %__i2.0.0.i.i, %12 ; <i1> [#uses=2]
  %or.cond.i.i = or i1 %96, %95                   ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb15.critedge.i.i, label %bb10.i.i

bb10.i.i:                                         ; preds = %bb1.i.i
  %97 = getelementptr inbounds %"struct.std::_List_node_base"* %__i1.0.0.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %98 = bitcast %"struct.std::_List_node_base"* %97 to i32* ; <i32*> [#uses=1]
  %99 = load i32* %98, align 4                    ; <i32> [#uses=1]
  %100 = getelementptr inbounds %"struct.std::_List_node_base"* %__i2.0.0.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %101 = bitcast %"struct.std::_List_node_base"* %100 to i32* ; <i32*> [#uses=1]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = icmp eq i32 %99, %102                    ; <i1> [#uses=1]
  br i1 %103, label %bb.i.i, label %bb15.critedge.i.i

bb15.critedge.i.i:                                ; preds = %bb10.i.i, %bb1.i.i
  %brmerge.demorgan.i = and i1 %96, %95           ; <i1> [#uses=1]
  %brmerge.demorgan.not.i = xor i1 %brmerge.demorgan.i, true ; <i1> [#uses=1]
  %104 = icmp eq %"struct.std::_List_node_base"* %88, %9 ; <i1> [#uses=1]
  %or.cond.i = or i1 %104, %brmerge.demorgan.not.i ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb35.i, label %bb.i.i.i16.i

bb.i.i.i16.i:                                     ; preds = %bb.i.i.i16.i, %bb15.critedge.i.i
  %__n.02.i.i.i.i = phi i32 [ %tmp.i.i.i.i, %bb.i.i.i16.i ], [ 0, %bb15.critedge.i.i ] ; <i32> [#uses=1]
  %__first_addr.0.01.i.i.i.i = phi %"struct.std::_List_node_base"* [ %106, %bb.i.i.i16.i ], [ %88, %bb15.critedge.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %tmp.i.i.i.i = add i32 %__n.02.i.i.i.i, 1       ; <i32> [#uses=2]
  %105 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %106 = load %"struct.std::_List_node_base"** %105, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %107 = icmp eq %"struct.std::_List_node_base"* %106, %9 ; <i1> [#uses=1]
  br i1 %107, label %bb35.i, label %bb.i.i.i16.i

bb35.i:                                           ; preds = %bb.i.i.i16.i, %bb15.critedge.i.i, %invcont25.i
  %iftmp.91.0.i = phi i32 [ 0, %invcont25.i ], [ 0, %bb15.critedge.i.i ], [ %tmp.i.i.i.i, %bb.i.i.i16.i ] ; <i32> [#uses=1]
  %108 = load %"struct.std::_List_node_base"** %13, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %109 = icmp eq %"struct.std::_List_node_base"* %15, %108 ; <i1> [#uses=1]
  br i1 %109, label %bb47.i, label %bb.i.i.i14.i

bb.i.i.i14.i:                                     ; preds = %bb.i.i.i14.i, %bb35.i
  %__cur.0.in1.i.i.i13.i = phi %"struct.std::_List_node_base"* [ %111, %bb.i.i.i14.i ], [ %108, %bb35.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %110 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i13.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %111 = load %"struct.std::_List_node_base"** %110, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %112 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i13.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %112) nounwind
  %113 = icmp eq %"struct.std::_List_node_base"* %15, %111 ; <i1> [#uses=1]
  br i1 %113, label %bb47.i, label %bb.i.i.i14.i

bb47.i:                                           ; preds = %bb.i.i.i14.i, %bb35.i
  %114 = load %"struct.std::_List_node_base"** %10, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %115 = icmp eq %"struct.std::_List_node_base"* %12, %114 ; <i1> [#uses=1]
  br i1 %115, label %bb54.i, label %bb.i.i.i11.i

bb.i.i.i11.i:                                     ; preds = %bb.i.i.i11.i, %bb47.i
  %__cur.0.in1.i.i.i10.i = phi %"struct.std::_List_node_base"* [ %117, %bb.i.i.i11.i ], [ %114, %bb47.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %116 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i10.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %117 = load %"struct.std::_List_node_base"** %116, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %118 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i10.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %118) nounwind
  %119 = icmp eq %"struct.std::_List_node_base"* %12, %117 ; <i1> [#uses=1]
  br i1 %119, label %bb54.i, label %bb.i.i.i11.i

bb54.i:                                           ; preds = %bb.i.i.i11.i, %bb47.i
  %120 = load %"struct.std::_List_node_base"** %7, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %121 = icmp eq %"struct.std::_List_node_base"* %9, %120 ; <i1> [#uses=1]
  br i1 %121, label %_Z10test_listsv.exit, label %bb.i.i.i8.i

bb.i.i.i8.i:                                      ; preds = %bb.i.i.i8.i, %bb54.i
  %__cur.0.in1.i.i.i7.i = phi %"struct.std::_List_node_base"* [ %123, %bb.i.i.i8.i ], [ %120, %bb54.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %122 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i7.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %123 = load %"struct.std::_List_node_base"** %122, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %124 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i7.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %124) nounwind
  %125 = icmp eq %"struct.std::_List_node_base"* %9, %123 ; <i1> [#uses=1]
  br i1 %125, label %_Z10test_listsv.exit, label %bb.i.i.i8.i

lpad.i:                                           ; preds = %invcont1.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select57.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %Unwind.i

lpad58.i:                                         ; preds = %Unwind.i.i.i
  %eh_ptr59.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select61.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr59.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad82.i

lpad66.i:                                         ; preds = %bb23.i, %invcont19.i, %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i.i, %invcont18.i, %invcont12.i, %_ZNSt4listIjSaIjEE9_M_insertESt14_List_iteratorIjERKj.exit.i26.i, %invcont11.i
  %eh_ptr67.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=3]
  %eh_select69.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr67.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %126 = load %"struct.std::_List_node_base"** %13, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %127 = icmp eq %"struct.std::_List_node_base"* %15, %126 ; <i1> [#uses=1]
  br i1 %127, label %ppad83.i, label %bb.i.i.i5.i

bb.i.i.i5.i:                                      ; preds = %bb.i.i.i5.i, %lpad66.i
  %__cur.0.in1.i.i.i4.i = phi %"struct.std::_List_node_base"* [ %129, %bb.i.i.i5.i ], [ %126, %lpad66.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %128 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %129 = load %"struct.std::_List_node_base"** %128, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %130 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %130) nounwind
  %131 = icmp eq %"struct.std::_List_node_base"* %15, %129 ; <i1> [#uses=1]
  br i1 %131, label %ppad83.i, label %bb.i.i.i5.i

ppad82.i:                                         ; preds = %bb.i.i.i.i, %ppad83.i, %lpad58.i
  %eh_exception.2.i = phi i8* [ %eh_ptr59.i, %lpad58.i ], [ %eh_ptr67.i, %ppad83.i ], [ %eh_ptr67.i, %bb.i.i.i.i ] ; <i8*> [#uses=2]
  %132 = load %"struct.std::_List_node_base"** %7, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %133 = icmp eq %"struct.std::_List_node_base"* %9, %132 ; <i1> [#uses=1]
  br i1 %133, label %Unwind.i, label %bb.i.i.i2.i

bb.i.i.i2.i:                                      ; preds = %bb.i.i.i2.i, %ppad82.i
  %__cur.0.in1.i.i.i1.i = phi %"struct.std::_List_node_base"* [ %135, %bb.i.i.i2.i ], [ %132, %ppad82.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %134 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %135 = load %"struct.std::_List_node_base"** %134, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %136 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %136) nounwind
  %137 = icmp eq %"struct.std::_List_node_base"* %9, %135 ; <i1> [#uses=1]
  br i1 %137, label %Unwind.i, label %bb.i.i.i2.i

ppad83.i:                                         ; preds = %bb.i.i.i5.i, %lpad66.i
  %138 = load %"struct.std::_List_node_base"** %10, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %139 = icmp eq %"struct.std::_List_node_base"* %12, %138 ; <i1> [#uses=1]
  br i1 %139, label %ppad82.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %ppad83.i
  %__cur.0.in1.i.i.i.i = phi %"struct.std::_List_node_base"* [ %141, %bb.i.i.i.i ], [ %138, %ppad83.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %140 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %141 = load %"struct.std::_List_node_base"** %140, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %142 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %142) nounwind
  %143 = icmp eq %"struct.std::_List_node_base"* %12, %141 ; <i1> [#uses=1]
  br i1 %143, label %ppad82.i, label %bb.i.i.i.i

Unwind.i:                                         ; preds = %bb.i.i.i2.i, %ppad82.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_exception.2.i, %ppad82.i ], [ %eh_exception.2.i, %bb.i.i.i2.i ] ; <i8*> [#uses=1]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

_Z10test_listsv.exit:                             ; preds = %bb.i.i.i8.i, %bb54.i
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %ITER.0.ph.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond, label %bb8, label %bb6

bb8:                                              ; preds = %_Z10test_listsv.exit, %bb7.preheader
  %result.0.lcssa = phi i32 [ 0, %bb7.preheader ], [ %iftmp.91.0.i, %_Z10test_listsv.exit ] ; <i32> [#uses=1]
  %144 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %144, align 8
  %145 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %145, align 4
  %146 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %147 = getelementptr inbounds i32 (...)** %146, i32 -3 ; <i32 (...)**> [#uses=1]
  %148 = bitcast i32 (...)** %147 to i32*         ; <i32*> [#uses=1]
  %149 = load i32* %148, align 4                  ; <i32> [#uses=1]
  %150 = add i32 %149, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %151 = inttoptr i32 %150 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %152 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %151, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %153 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %152, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %154 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %153, null ; <i1> [#uses=1]
  br i1 %154, label %bb9.i.i.i, label %bb.i.i.i8

bb.i.i.i8:                                        ; preds = %bb8
  %155 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %151, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %156 = load i32* %155, align 4                  ; <i32> [#uses=1]
  %157 = icmp eq i32 %156, 0                      ; <i1> [#uses=1]
  br i1 %157, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i8
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %153)
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i, %bb.i.i.i8, %bb8
  %158 = phi i32 (...)** [ %.pre.i.i.i, %bb8.i.i.i ], [ %146, %bb8 ], [ %146, %bb.i.i.i8 ] ; <i32 (...)**> [#uses=1]
  %159 = getelementptr inbounds i32 (...)** %158, i32 -3 ; <i32 (...)**> [#uses=1]
  %160 = bitcast i32 (...)** %159 to i32*         ; <i32*> [#uses=1]
  %161 = load i32* %160, align 4                  ; <i32> [#uses=1]
  %162 = add i32 %161, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %163 = inttoptr i32 %162 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %164 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %163, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %165 = load i32* %164, align 4                  ; <i32> [#uses=2]
  %166 = icmp eq i32 %165, 0                      ; <i1> [#uses=1]
  br i1 %166, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %144, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %167 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %163, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %168 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %167, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %169 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %168, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %169, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %165 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %164
  %170 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %163, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %171 = load i32* %170, align 4                  ; <i32> [#uses=1]
  %172 = and i32 %storemerge.i.i.i.i, %171        ; <i32> [#uses=1]
  %173 = icmp eq i32 %172, 0                      ; <i1> [#uses=1]
  br i1 %173, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %144, align 8                   ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %_ZNSo9_M_insertImEERSoT_.exit, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %174 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %175 = getelementptr inbounds i32 (...)** %174, i32 -3 ; <i32 (...)**> [#uses=1]
  %176 = bitcast i32 (...)** %175 to i32*         ; <i32*> [#uses=1]
  %177 = load i32* %176, align 4                  ; <i32> [#uses=1]
  %178 = add i32 %177, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %179 = inttoptr i32 %178 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %180 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %181 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %180, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %182 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %181, null ; <i1> [#uses=1]
  br i1 %182, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %183 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 3 ; <i8*> [#uses=2]
  %184 = load i8* %183, align 1                   ; <i8> [#uses=1]
  %toBool.i.i9 = icmp eq i8 %184, 0               ; <i1> [#uses=1]
  br i1 %toBool.i.i9, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %185 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %186 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %185, i8* %186, align 4
  store i8 1, i8* %183, align 1
  %.pre.i10 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %187 = phi i32 (...)** [ %.pre.i10, %.noexc5.i ], [ %174, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %188 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 2 ; <i8*> [#uses=1]
  %189 = load i8* %188, align 4                   ; <i8> [#uses=1]
  %190 = getelementptr inbounds i32 (...)** %187, i32 -3 ; <i32 (...)**> [#uses=1]
  %191 = bitcast i32 (...)** %190 to i32*         ; <i32*> [#uses=1]
  %192 = load i32* %191, align 4                  ; <i32> [#uses=1]
  %193 = add i32 %192, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %194 = inttoptr i32 %193 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %195 = inttoptr i32 %193 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %196 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %195, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %197 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %196, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %197 to i32 ; <i32> [#uses=1]
  %198 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %197, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %199 = zext i32 %tmp.i to i64                   ; <i64> [#uses=1]
  %200 = zext i1 %198 to i64                      ; <i64> [#uses=1]
  %201 = shl i64 %200, 32                         ; <i64> [#uses=1]
  %202 = or i64 %201, %199                        ; <i64> [#uses=1]
  store i64 %202, i64* %tmp9.i, align 8
  %203 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %181, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %204 = load i32 (...)*** %203, align 4          ; <i32 (...)**> [#uses=1]
  %205 = getelementptr inbounds i32 (...)** %204, i32 4 ; <i32 (...)**> [#uses=1]
  %206 = load i32 (...)** %205, align 4           ; <i32 (...)*> [#uses=1]
  %207 = bitcast i32 (...)* %206 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %207(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %181, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %194, i8 signext %189, i32 %result.0.lcssa)
          to label %invcont3.i11 unwind label %lpad26.i

invcont3.i11:                                     ; preds = %invcont2.i
  %208 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %209 = load i8* %208, align 4                   ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %209, 0                 ; <i1> [#uses=1]
  br i1 %toBool4.i, label %_ZNSo9_M_insertImEERSoT_.exit, label %bb15.i13

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo9_M_insertImEERSoT_.exit unwind label %lpad30.i

bb15.i13:                                         ; preds = %invcont3.i11
  %210 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %211 = getelementptr inbounds i32 (...)** %210, i32 -3 ; <i32 (...)**> [#uses=1]
  %212 = bitcast i32 (...)** %211 to i32*         ; <i32*> [#uses=1]
  %213 = load i32* %212, align 4                  ; <i32> [#uses=1]
  %214 = add i32 %213, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %215 = inttoptr i32 %214 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %216 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %215, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %217 = load i32* %216, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %217, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %216
  %218 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %215, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %219 = load i32* %218, align 4                  ; <i32> [#uses=1]
  %220 = and i32 %storemerge.i.i, %219            ; <i32> [#uses=1]
  %221 = icmp eq i32 %220, 0                      ; <i1> [#uses=1]
  br i1 %221, label %_ZNSo9_M_insertImEERSoT_.exit, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb15.i13
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i15

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

invcont21.i:                                      ; preds = %ppad.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i18)
  unreachable

lpad.i15:                                         ; preds = %bb4.i.i.i
  %eh_ptr.i14 = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i14, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %222 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %223 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %224 = getelementptr inbounds i32 (...)** %223, i32 -3 ; <i32 (...)**> [#uses=1]
  %225 = bitcast i32 (...)** %224 to i32*         ; <i32*> [#uses=1]
  %226 = load i32* %225, align 4                  ; <i32> [#uses=1]
  %227 = add i32 %226, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %228 = inttoptr i32 %227 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %229 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %228, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %230 = load i32* %229, align 4                  ; <i32> [#uses=1]
  %231 = or i32 %230, 1                           ; <i32> [#uses=1]
  store i32 %231, i32* %229, align 4
  %232 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %228, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %233 = load i32* %232, align 4                  ; <i32> [#uses=1]
  %234 = and i32 %233, 1                          ; <i32> [#uses=1]
  %235 = icmp eq i32 %234, 0                      ; <i1> [#uses=1]
  br i1 %235, label %bb12.i, label %bb.i.i16

bb.i.i16:                                         ; preds = %lpad26.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i17 unwind label %lpad34.i

.noexc.i17:                                       ; preds = %bb.i.i16
  unreachable

lpad30.i:                                         ; preds = %bb12.i
  %eh_ptr31.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select33.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad34.i:                                         ; preds = %bb.i.i16
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

ppad.i:                                           ; preds = %lpad34.i, %lpad30.i, %lpad.i15
  %eh_exception.0.i18 = phi i8* [ %eh_ptr.i14, %lpad.i15 ], [ %eh_ptr31.i, %lpad30.i ], [ %eh_ptr35.i, %lpad34.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont21.i unwind label %lpad42.i

_ZNSo9_M_insertImEERSoT_.exit:                    ; preds = %bb15.i13, %bb12.i, %invcont3.i11, %invcont.i
  call fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
  %236 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %237 = getelementptr inbounds i32 (...)** %236, i32 -3 ; <i32 (...)**> [#uses=1]
  %238 = bitcast i32 (...)** %237 to i32*         ; <i32*> [#uses=1]
  %239 = load i32* %238, align 4                  ; <i32> [#uses=1]
  %240 = add i32 %239, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %241 = inttoptr i32 %240 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx19 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %241, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx19.val = load %"struct.std::ctype<char>"** %.idx19 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %242 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx19.val, i8 signext 10) ; <i8> [#uses=3]
  %243 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %243, align 8
  %244 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %244, align 4
  %245 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %246 = getelementptr inbounds i32 (...)** %245, i32 -3 ; <i32 (...)**> [#uses=1]
  %247 = bitcast i32 (...)** %246 to i32*         ; <i32*> [#uses=1]
  %248 = load i32* %247, align 4                  ; <i32> [#uses=1]
  %249 = add i32 %248, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %250 = inttoptr i32 %249 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %251 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %250, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %252 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %251, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %253 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %252, null ; <i1> [#uses=1]
  br i1 %253, label %bb9.i.i.i.i, label %bb.i.i.i.i1

bb.i.i.i.i1:                                      ; preds = %_ZNSo9_M_insertImEERSoT_.exit
  %254 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %250, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %255 = load i32* %254, align 4                  ; <i32> [#uses=1]
  %256 = icmp eq i32 %255, 0                      ; <i1> [#uses=1]
  br i1 %256, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i1
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %252)
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %bb8.i.i.i.i, %bb.i.i.i.i1, %_ZNSo9_M_insertImEERSoT_.exit
  %257 = phi i32 (...)** [ %.pre.i.i.i.i, %bb8.i.i.i.i ], [ %245, %_ZNSo9_M_insertImEERSoT_.exit ], [ %245, %bb.i.i.i.i1 ] ; <i32 (...)**> [#uses=1]
  %258 = getelementptr inbounds i32 (...)** %257, i32 -3 ; <i32 (...)**> [#uses=1]
  %259 = bitcast i32 (...)** %258 to i32*         ; <i32*> [#uses=1]
  %260 = load i32* %259, align 4                  ; <i32> [#uses=1]
  %261 = add i32 %260, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %262 = inttoptr i32 %261 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %263 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %262, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %264 = load i32* %263, align 4                  ; <i32> [#uses=2]
  %265 = icmp eq i32 %264, 0                      ; <i1> [#uses=1]
  br i1 %265, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %243, align 8
  br label %invcont1.i.i2

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %266 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %262, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %267 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %266, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %268 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %267, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %268, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %264 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %263
  %269 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %262, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %270 = load i32* %269, align 4                  ; <i32> [#uses=1]
  %271 = and i32 %storemerge.i.i.i.i.i, %270      ; <i32> [#uses=1]
  %272 = icmp eq i32 %271, 0                      ; <i1> [#uses=1]
  br i1 %272, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr45 = load i8* %243, align 8                 ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %.pr45, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit, label %invcont1.i.i2

invcont1.i.i2:                                    ; preds = %invcont.i.i, %invcont.i.i.thread
  %273 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %274 = getelementptr inbounds i32 (...)** %273, i32 -3 ; <i32 (...)**> [#uses=1]
  %275 = bitcast i32 (...)** %274 to i32*         ; <i32*> [#uses=1]
  %276 = load i32* %275, align 4                  ; <i32> [#uses=1]
  %277 = add i32 %276, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %278 = inttoptr i32 %277 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %279 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %278, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %280 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %279, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %281 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %280, i32 0, i32 5 ; <i8**> [#uses=3]
  %282 = load i8** %281, align 4                  ; <i8*> [#uses=2]
  %283 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %280, i32 0, i32 6 ; <i8**> [#uses=1]
  %284 = load i8** %283, align 4                  ; <i8*> [#uses=1]
  %285 = icmp ult i8* %282, %284                  ; <i1> [#uses=1]
  br i1 %285, label %bb.i2.i.i, label %bb1.i.i.i

bb.i2.i.i:                                        ; preds = %invcont1.i.i2
  store i8 %242, i8* %282, align 1
  %286 = load i8** %281, align 4                  ; <i8*> [#uses=1]
  %287 = getelementptr inbounds i8* %286, i32 1   ; <i8*> [#uses=1]
  store i8* %287, i8** %281, align 4
  %288 = zext i8 %242 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i:                                        ; preds = %invcont1.i.i2
  %289 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %280, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %290 = load i32 (...)*** %289, align 4          ; <i32 (...)**> [#uses=1]
  %291 = getelementptr inbounds i32 (...)** %290, i32 13 ; <i32 (...)**> [#uses=1]
  %292 = load i32 (...)** %291, align 4           ; <i32 (...)*> [#uses=1]
  %293 = zext i8 %242 to i32                      ; <i32> [#uses=1]
  %294 = bitcast i32 (...)* %292 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %295 = invoke i32 %294(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %280, i32 %293)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i, %bb.i2.i.i
  %296 = phi i32 [ %288, %bb.i2.i.i ], [ %295, %bb1.i.i.i ] ; <i32> [#uses=1]
  %297 = icmp eq i32 %296, -1                     ; <i1> [#uses=1]
  br i1 %297, label %bb14.i.i, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %298 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %299 = getelementptr inbounds i32 (...)** %298, i32 -3 ; <i32 (...)**> [#uses=1]
  %300 = bitcast i32 (...)** %299 to i32*         ; <i32*> [#uses=1]
  %301 = load i32* %300, align 4                  ; <i32> [#uses=1]
  %302 = add i32 %301, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %303 = inttoptr i32 %302 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %304 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %303, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %305 = load i32* %304, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %305, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %304
  %306 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %303, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %307 = load i32* %306, align 4                  ; <i32> [#uses=1]
  %308 = and i32 %storemerge.i.i.i, %307          ; <i32> [#uses=1]
  %309 = icmp eq i32 %308, 0                      ; <i1> [#uses=1]
  br i1 %309, label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i3 unwind label %lpad.i.i5

.noexc1.i.i3:                                     ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
  unreachable

lpad.i.i5:                                        ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i4 = call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i4, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %310 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %311 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %312 = getelementptr inbounds i32 (...)** %311, i32 -3 ; <i32 (...)**> [#uses=1]
  %313 = bitcast i32 (...)** %312 to i32*         ; <i32*> [#uses=1]
  %314 = load i32* %313, align 4                  ; <i32> [#uses=1]
  %315 = add i32 %314, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %316 = inttoptr i32 %315 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %317 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %316, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %318 = load i32* %317, align 4                  ; <i32> [#uses=1]
  %319 = or i32 %318, 1                           ; <i32> [#uses=1]
  store i32 %319, i32* %317, align 4
  %320 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %316, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %321 = load i32* %320, align 4                  ; <i32> [#uses=1]
  %322 = and i32 %321, 1                          ; <i32> [#uses=1]
  %323 = icmp eq i32 %322, 0                      ; <i1> [#uses=1]
  br i1 %323, label %bb11.i.i, label %bb.i.i.i6

bb.i.i.i6:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i7 unwind label %lpad33.i.i

.noexc.i.i7:                                      ; preds = %bb.i.i.i6
  unreachable

lpad29.i.i:                                       ; preds = %bb11.i.i
  %eh_ptr30.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select32.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad33.i.i:                                       ; preds = %bb.i.i.i6
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

ppad.i.i:                                         ; preds = %lpad33.i.i, %lpad29.i.i, %lpad.i.i5
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i.i4, %lpad.i.i5 ], [ %eh_ptr30.i.i, %lpad29.i.i ], [ %eh_ptr34.i.i, %lpad33.i.i ] ; <i8*> [#uses=1]
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

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._10*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._10*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._10*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._10*)
