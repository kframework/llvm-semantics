; ModuleID = 'lists1.llvm.bc'
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
%"struct.std::_List_base<int,std::allocator<int> >" = type { %"struct.std::_List_base<int,std::allocator<int> >::_List_impl" }
%"struct.std::_List_base<int,std::allocator<int> >::_List_impl" = type { %"struct.std::_List_node_base" }
%"struct.std::_List_node_base" = type { %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"* }
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

@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<int>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<int>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str1 = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=7]
@.str2 = private constant [2 x i8] c" \00", align 1 ; <[2 x i8]*> [#uses=1]
@.str3 = private constant [6 x i8] c"false\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str4 = private constant [5 x i8] c"true\00", align 1 ; <[5 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I__Z12list_print_nSt4listIiSaIiEEi }] ; <[1 x %0]*> [#uses=0]

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

define internal void @_GLOBAL__I__Z12list_print_nSt4listIiSaIiEEi() {
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

declare void @_ZdlPv(i8*) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare i8* @_Znwj(i32)

declare void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

declare void @_ZSt9terminatev() noreturn nounwind

define internal fastcc void @_ZNSt4listIiSaIiEEC1ERKS1_(%"struct.std::list<int,std::allocator<int> >"* %this, %"struct.std::list<int,std::allocator<int> >"* %__x) {
entry:
  %0 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %this, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=2]
  %1 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %this, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %2 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %this, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=5]
  store %"struct.std::_List_node_base"* %2, %"struct.std::_List_node_base"** %0, align 4
  store %"struct.std::_List_node_base"* %2, %"struct.std::_List_node_base"** %1, align 4
  %3 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %__x, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %__x, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %5 = load %"struct.std::_List_node_base"** %4, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %6 = icmp eq %"struct.std::_List_node_base"* %5, %3 ; <i1> [#uses=1]
  br i1 %6, label %_ZNSt4listIiSaIiEEC2ERKS1_.exit, label %bb.i.i

bb.i.i:                                           ; preds = %.noexc2.i, %entry
  %__first_addr.0.01.i.i = phi %"struct.std::_List_node_base"* [ %16, %.noexc2.i ], [ %5, %entry ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %7 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i unwind label %lpad15.i ; <i8*> [#uses=2]

.noexc.i:                                         ; preds = %bb.i.i
  %8 = getelementptr inbounds i8* %7, i32 8       ; <i8*> [#uses=2]
  %9 = icmp eq i8* %8, null                       ; <i1> [#uses=1]
  br i1 %9, label %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %.noexc.i
  %10 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %11 = bitcast %"struct.std::_List_node_base"* %10 to i32* ; <i32*> [#uses=1]
  %12 = bitcast i8* %8 to i32*                    ; <i32*> [#uses=1]
  %13 = load i32* %11, align 4                    ; <i32> [#uses=1]
  store i32 %13, i32* %12
  br label %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i

_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i:        ; preds = %bb.i.i.i.i.i.i, %.noexc.i
  %14 = bitcast i8* %7 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %14, %"struct.std::_List_node_base"* %2)
          to label %.noexc2.i unwind label %lpad15.i

.noexc2.i:                                        ; preds = %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i
  %15 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %16 = load %"struct.std::_List_node_base"** %15, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %17 = icmp eq %"struct.std::_List_node_base"* %16, %3 ; <i1> [#uses=1]
  br i1 %17, label %_ZNSt4listIiSaIiEEC2ERKS1_.exit, label %bb.i.i

lpad15.i:                                         ; preds = %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i, %bb.i.i
  %eh_ptr16.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select18.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr16.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %18 = load %"struct.std::_List_node_base"** %0, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %19 = icmp eq %"struct.std::_List_node_base"* %2, %18 ; <i1> [#uses=1]
  br i1 %19, label %Unwind.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %lpad15.i
  %__cur.0.in1.i.i.i = phi %"struct.std::_List_node_base"* [ %21, %bb.i.i.i ], [ %18, %lpad15.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %20 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %21 = load %"struct.std::_List_node_base"** %20, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %22 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %22) nounwind
  %23 = icmp eq %"struct.std::_List_node_base"* %2, %21 ; <i1> [#uses=1]
  br i1 %23, label %Unwind.i, label %bb.i.i.i

Unwind.i:                                         ; preds = %bb.i.i.i, %lpad15.i
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr16.i)
  unreachable

_ZNSt4listIiSaIiEEC2ERKS1_.exit:                  ; preds = %.noexc2.i, %entry
  ret void
}

declare void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"*)

declare void @_ZNSt15_List_node_base7reverseEv(%"struct.std::_List_node_base"*)

declare void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
  unreachable

_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit: ; preds = %bb17
  ret void
}

declare zeroext i8 @_ZSt18uncaught_exceptionv() nounwind

define internal fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %__s, i32 %__n) {
entry:
  %__cerb = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %0, align 8
  %1 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %1, align 4
  %2 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %3 = getelementptr inbounds i32 (...)** %2, i32 -3 ; <i32 (...)**> [#uses=1]
  %4 = bitcast i32 (...)** %3 to i32*             ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4                      ; <i32> [#uses=1]
  %6 = add i32 %5, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %7 = inttoptr i32 %6 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %8 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %9 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %8, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %10 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %9, null ; <i1> [#uses=1]
  br i1 %10, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %7, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, 0                        ; <i1> [#uses=1]
  br i1 %13, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %9)
  %.pre.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i.i, %entry
  %14 = phi i32 (...)** [ %.pre.i.i, %bb8.i.i ], [ %2, %entry ], [ %2, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %15 = getelementptr inbounds i32 (...)** %14, i32 -3 ; <i32 (...)**> [#uses=1]
  %16 = bitcast i32 (...)** %15 to i32*           ; <i32*> [#uses=1]
  %17 = load i32* %16, align 4                    ; <i32> [#uses=1]
  %18 = add i32 %17, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %19 = inttoptr i32 %18 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %20 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %19, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=2]
  %22 = icmp eq i32 %21, 0                        ; <i1> [#uses=1]
  br i1 %22, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %0, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %23 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %19, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %24 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %23, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %25 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %24, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %25, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %21 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %20
  %26 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %19, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4                    ; <i32> [#uses=1]
  %28 = and i32 %storemerge.i.i.i, %27            ; <i32> [#uses=1]
  %29 = icmp eq i32 %28, 0                        ; <i1> [#uses=1]
  br i1 %29, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %0, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb41, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %30 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %31 = getelementptr inbounds i32 (...)** %30, i32 -3 ; <i32 (...)**> [#uses=1]
  %32 = bitcast i32 (...)** %31 to i32*           ; <i32*> [#uses=1]
  %33 = load i32* %32, align 4                    ; <i32> [#uses=1]
  %34 = add i32 %33, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %35 = inttoptr i32 %34 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %36 = getelementptr inbounds %"struct.std::ios_base"* %35, i32 0, i32 2 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4                    ; <i32> [#uses=3]
  %38 = icmp sgt i32 %37, %__n                    ; <i1> [#uses=1]
  br i1 %38, label %bb1, label %bb30

bb1:                                              ; preds = %bb
  %39 = getelementptr inbounds %"struct.std::ios_base"* %35, i32 0, i32 3 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = and i32 %40, 176                          ; <i32> [#uses=1]
  %42 = icmp eq i32 %41, 32                       ; <i1> [#uses=2]
  br i1 %42, label %invcont9, label %bb6

bb6:                                              ; preds = %bb1
  %43 = sub i32 %37, %__n                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %43)
          to label %invcont9 unwind label %lpad50

invcont9:                                         ; preds = %bb6, %bb1
  %44 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %45 = getelementptr inbounds i32 (...)** %44, i32 -3 ; <i32 (...)**> [#uses=1]
  %46 = bitcast i32 (...)** %45 to i32*           ; <i32*> [#uses=1]
  %47 = load i32* %46, align 4                    ; <i32> [#uses=1]
  %48 = add i32 %47, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %49 = inttoptr i32 %48 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %50 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %51 = load i32* %50, align 4                    ; <i32> [#uses=1]
  %52 = icmp eq i32 %51, 0                        ; <i1> [#uses=1]
  br i1 %52, label %bb11, label %bb13

bb11:                                             ; preds = %invcont9
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %49, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %54 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %53, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %55 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %56 = load i32 (...)*** %55, align 4            ; <i32 (...)**> [#uses=1]
  %57 = getelementptr inbounds i32 (...)** %56, i32 12 ; <i32 (...)**> [#uses=1]
  %58 = load i32 (...)** %57, align 4             ; <i32 (...)*> [#uses=1]
  %59 = bitcast i32 (...)* %58 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %60 = invoke i32 %59(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54, i8* %__s, i32 %__n)
          to label %.noexc8 unwind label %lpad50  ; <i32> [#uses=1]

.noexc8:                                          ; preds = %bb11
  %61 = icmp eq i32 %60, %__n                     ; <i1> [#uses=1]
  br i1 %61, label %bb13, label %bb.i4

bb.i4:                                            ; preds = %.noexc8
  %62 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %63 = getelementptr inbounds i32 (...)** %62, i32 -3 ; <i32 (...)**> [#uses=1]
  %64 = bitcast i32 (...)** %63 to i32*           ; <i32*> [#uses=1]
  %65 = load i32* %64, align 4                    ; <i32> [#uses=1]
  %66 = add i32 %65, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %67 = inttoptr i32 %66 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %68 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %69 = load i32* %68, align 4                    ; <i32> [#uses=1]
  %70 = or i32 %69, 1                             ; <i32> [#uses=2]
  store i32 %70, i32* %68
  %71 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %72 = load i32* %71, align 4                    ; <i32> [#uses=1]
  %73 = and i32 %70, %72                          ; <i32> [#uses=1]
  %74 = icmp eq i32 %73, 0                        ; <i1> [#uses=1]
  br i1 %74, label %bb13, label %bb4.i.i.i5

bb4.i.i.i5:                                       ; preds = %bb.i4
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc9 unwind label %lpad50

.noexc9:                                          ; preds = %bb4.i.i.i5
  unreachable

bb13:                                             ; preds = %bb.i4, %.noexc8, %invcont9
  br i1 %42, label %invcont19, label %bb32

invcont19:                                        ; preds = %bb13
  %75 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %76 = getelementptr inbounds i32 (...)** %75, i32 -3 ; <i32 (...)**> [#uses=1]
  %77 = bitcast i32 (...)** %76 to i32*           ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=1]
  %79 = add i32 %78, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %80 = inttoptr i32 %79 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %81 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %80, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %82 = load i32* %81, align 4                    ; <i32> [#uses=1]
  %83 = icmp eq i32 %82, 0                        ; <i1> [#uses=1]
  br i1 %83, label %bb28, label %bb32

bb28:                                             ; preds = %invcont19
  %84 = sub i32 %37, %__n                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(i32 %84)
          to label %bb32 unwind label %lpad50

bb30:                                             ; preds = %bb
  %85 = inttoptr i32 %34 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %87 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %86, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %88 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %87, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %89 = load i32 (...)*** %88, align 4            ; <i32 (...)**> [#uses=1]
  %90 = getelementptr inbounds i32 (...)** %89, i32 12 ; <i32 (...)**> [#uses=1]
  %91 = load i32 (...)** %90, align 4             ; <i32 (...)*> [#uses=1]
  %92 = bitcast i32 (...)* %91 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %93 = invoke i32 %92(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %87, i8* %__s, i32 %__n)
          to label %.noexc2 unwind label %lpad50  ; <i32> [#uses=1]

.noexc2:                                          ; preds = %bb30
  %94 = icmp eq i32 %93, %__n                     ; <i1> [#uses=1]
  br i1 %94, label %bb32, label %bb.i1

bb.i1:                                            ; preds = %.noexc2
  %95 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %96 = getelementptr inbounds i32 (...)** %95, i32 -3 ; <i32 (...)**> [#uses=1]
  %97 = bitcast i32 (...)** %96 to i32*           ; <i32*> [#uses=1]
  %98 = load i32* %97, align 4                    ; <i32> [#uses=1]
  %99 = add i32 %98, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %100 = inttoptr i32 %99 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %101 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %100, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %102 = load i32* %101, align 4                  ; <i32> [#uses=1]
  %103 = or i32 %102, 1                           ; <i32> [#uses=2]
  store i32 %103, i32* %101
  %104 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %100, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %105 = load i32* %104, align 4                  ; <i32> [#uses=1]
  %106 = and i32 %103, %105                       ; <i32> [#uses=1]
  %107 = icmp eq i32 %106, 0                      ; <i1> [#uses=1]
  br i1 %107, label %bb32, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i1
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc3 unwind label %lpad50

.noexc3:                                          ; preds = %bb4.i.i.i
  unreachable

bb32:                                             ; preds = %bb.i1, %.noexc2, %bb28, %invcont19, %bb13
  %108 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %109 = getelementptr inbounds i32 (...)** %108, i32 -3 ; <i32 (...)**> [#uses=1]
  %110 = bitcast i32 (...)** %109 to i32*         ; <i32*> [#uses=1]
  %111 = load i32* %110, align 4                  ; <i32> [#uses=1]
  %112 = add i32 %111, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %113 = inttoptr i32 %112 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %114 = getelementptr inbounds %"struct.std::ios_base"* %113, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %114, align 4
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
  %115 = call i8* @__cxa_begin_catch(i8* %eh_ptr51) nounwind ; <i8*> [#uses=0]
  %116 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %117 = getelementptr inbounds i32 (...)** %116, i32 -3 ; <i32 (...)**> [#uses=1]
  %118 = bitcast i32 (...)** %117 to i32*         ; <i32*> [#uses=1]
  %119 = load i32* %118, align 4                  ; <i32> [#uses=1]
  %120 = add i32 %119, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %121 = inttoptr i32 %120 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %122 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %121, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %123 = load i32* %122, align 4                  ; <i32> [#uses=1]
  %124 = or i32 %123, 1                           ; <i32> [#uses=1]
  store i32 %124, i32* %122, align 4
  %125 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %121, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %126 = load i32* %125, align 4                  ; <i32> [#uses=1]
  %127 = and i32 %126, 1                          ; <i32> [#uses=1]
  %128 = icmp eq i32 %127, 0                      ; <i1> [#uses=1]
  br i1 %128, label %bb39, label %bb.i

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

define internal fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %__v) {
entry:
  %__s = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %1 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %1, align 8
  %2 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %2, align 4
  %3 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %4 = getelementptr inbounds i32 (...)** %3, i32 -3 ; <i32 (...)**> [#uses=1]
  %5 = bitcast i32 (...)** %4 to i32*             ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = add i32 %6, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %8 = inttoptr i32 %7 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %9 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %8, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %10 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %9, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %11 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %10, null ; <i1> [#uses=1]
  br i1 %11, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %12 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %8, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %13 = load i32* %12, align 4                    ; <i32> [#uses=1]
  %14 = icmp eq i32 %13, 0                        ; <i1> [#uses=1]
  br i1 %14, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %10)
  %.pre.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i.i, %entry
  %15 = phi i32 (...)** [ %.pre.i.i, %bb8.i.i ], [ %3, %entry ], [ %3, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %16 = getelementptr inbounds i32 (...)** %15, i32 -3 ; <i32 (...)**> [#uses=1]
  %17 = bitcast i32 (...)** %16 to i32*           ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = add i32 %18, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %20 = inttoptr i32 %19 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %22 = load i32* %21, align 4                    ; <i32> [#uses=2]
  %23 = icmp eq i32 %22, 0                        ; <i1> [#uses=1]
  br i1 %23, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %1, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %24 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %25 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %24, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %26 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %26, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %22 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %21
  %27 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %20, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=1]
  %29 = and i32 %storemerge.i.i.i, %28            ; <i32> [#uses=1]
  %30 = icmp eq i32 %29, 0                        ; <i1> [#uses=1]
  br i1 %30, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %1, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb17, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %31 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %32 = getelementptr inbounds i32 (...)** %31, i32 -3 ; <i32 (...)**> [#uses=1]
  %33 = bitcast i32 (...)** %32 to i32*           ; <i32*> [#uses=1]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  %35 = add i32 %34, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %36 = inttoptr i32 %35 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %37 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %38 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %37, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %39 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, null ; <i1> [#uses=1]
  br i1 %39, label %bb.i6, label %invcont1

bb.i6:                                            ; preds = %bb
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7 unwind label %lpad26

.noexc7:                                          ; preds = %bb.i6
  unreachable

invcont1:                                         ; preds = %bb
  %40 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 3 ; <i8*> [#uses=2]
  %41 = load i8* %40, align 1                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %41, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb.i4, label %invcont2

bb.i4:                                            ; preds = %invcont1
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %42 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5 unwind label %lpad26  ; <i8> [#uses=1]

.noexc5:                                          ; preds = %bb.i4
  %43 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %42, i8* %43, align 4
  store i8 1, i8* %40, align 1
  %.pre = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2

invcont2:                                         ; preds = %.noexc5, %invcont1
  %44 = phi i32 (...)** [ %.pre, %.noexc5 ], [ %31, %invcont1 ] ; <i32 (...)**> [#uses=1]
  %45 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %36, i32 0, i32 2 ; <i8*> [#uses=1]
  %46 = load i8* %45, align 4                     ; <i8> [#uses=1]
  %47 = getelementptr inbounds i32 (...)** %44, i32 -3 ; <i32 (...)**> [#uses=1]
  %48 = bitcast i32 (...)** %47 to i32*           ; <i32*> [#uses=1]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=1]
  %50 = add i32 %49, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %51 = inttoptr i32 %50 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %52 = inttoptr i32 %50 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %54 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %53, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54 to i32 ; <i32> [#uses=1]
  %55 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %54, null ; <i1> [#uses=1]
  %tmp9 = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s to i64* ; <i64*> [#uses=1]
  %56 = zext i32 %tmp to i64                      ; <i64> [#uses=1]
  %57 = zext i1 %55 to i64                        ; <i64> [#uses=1]
  %58 = shl i64 %57, 32                           ; <i64> [#uses=1]
  %59 = or i64 %58, %56                           ; <i64> [#uses=1]
  store i64 %59, i64* %tmp9, align 8
  %60 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %61 = load i32 (...)*** %60, align 4            ; <i32 (...)**> [#uses=1]
  %62 = getelementptr inbounds i32 (...)** %61, i32 3 ; <i32 (...)**> [#uses=1]
  %63 = load i32 (...)** %62, align 4             ; <i32 (...)*> [#uses=1]
  %64 = bitcast i32 (...)* %63 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %64(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s, %"struct.std::ios_base"* %51, i8 signext %46, i32 %__v)
          to label %invcont3 unwind label %lpad26

invcont3:                                         ; preds = %invcont2
  %65 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %66 = load i8* %65, align 4                     ; <i8> [#uses=1]
  %toBool4 = icmp eq i8 %66, 0                    ; <i1> [#uses=1]
  br i1 %toBool4, label %bb17, label %bb15

bb12:                                             ; preds = %lpad26
  invoke void @__cxa_end_catch()
          to label %bb17 unwind label %lpad30

bb15:                                             ; preds = %invcont3
  %67 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %68 = getelementptr inbounds i32 (...)** %67, i32 -3 ; <i32 (...)**> [#uses=1]
  %69 = bitcast i32 (...)** %68 to i32*           ; <i32*> [#uses=1]
  %70 = load i32* %69, align 4                    ; <i32> [#uses=1]
  %71 = add i32 %70, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %72 = inttoptr i32 %71 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %73 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %72, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %74 = load i32* %73, align 4                    ; <i32> [#uses=1]
  %storemerge.i = or i32 %74, 1                   ; <i32> [#uses=2]
  store i32 %storemerge.i, i32* %73
  %75 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %72, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %76 = load i32* %75, align 4                    ; <i32> [#uses=1]
  %77 = and i32 %storemerge.i, %76                ; <i32> [#uses=1]
  %78 = icmp eq i32 %77, 0                        ; <i1> [#uses=1]
  br i1 %78, label %bb17, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb15
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
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
  %79 = call i8* @__cxa_begin_catch(i8* %eh_ptr27) nounwind ; <i8*> [#uses=0]
  %80 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %81 = getelementptr inbounds i32 (...)** %80, i32 -3 ; <i32 (...)**> [#uses=1]
  %82 = bitcast i32 (...)** %81 to i32*           ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=1]
  %84 = add i32 %83, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %85 = inttoptr i32 %84 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %86 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %88 = or i32 %87, 1                             ; <i32> [#uses=1]
  store i32 %88, i32* %86, align 4
  %89 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %85, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %90 = load i32* %89, align 4                    ; <i32> [#uses=1]
  %91 = and i32 %90, 1                            ; <i32> [#uses=1]
  %92 = icmp eq i32 %91, 0                        ; <i1> [#uses=1]
  br i1 %92, label %bb12, label %bb.i

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

define internal fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_() {
entry:
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %1 = getelementptr inbounds i32 (...)** %0, i32 -3 ; <i32 (...)**> [#uses=1]
  %2 = bitcast i32 (...)** %1 to i32*             ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=1]
  %4 = add i32 %3, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %5 = inttoptr i32 %4 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %5, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %6 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10) ; <i8> [#uses=3]
  %7 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %7, align 8
  %8 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %8, align 4
  %9 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %10 = getelementptr inbounds i32 (...)** %9, i32 -3 ; <i32 (...)**> [#uses=1]
  %11 = bitcast i32 (...)** %10 to i32*           ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %13 = add i32 %12, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %14 = inttoptr i32 %13 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %15 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %14, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %16 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %15, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %17 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %16, null ; <i1> [#uses=1]
  br i1 %17, label %bb9.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %entry
  %18 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %14, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  %20 = icmp eq i32 %19, 0                        ; <i1> [#uses=1]
  br i1 %20, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i
  call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %16)
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i, %bb.i.i.i, %entry
  %21 = phi i32 (...)** [ %.pre.i.i.i, %bb8.i.i.i ], [ %9, %entry ], [ %9, %bb.i.i.i ] ; <i32 (...)**> [#uses=1]
  %22 = getelementptr inbounds i32 (...)** %21, i32 -3 ; <i32 (...)**> [#uses=1]
  %23 = bitcast i32 (...)** %22 to i32*           ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=1]
  %25 = add i32 %24, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %26 = inttoptr i32 %25 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %27 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %26, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=2]
  %29 = icmp eq i32 %28, 0                        ; <i1> [#uses=1]
  br i1 %29, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %7, align 8
  br label %invcont1.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %30 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %26, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %31 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %30, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %32 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %31, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %32, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %28 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %27
  %33 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %26, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  %35 = and i32 %storemerge.i.i.i.i, %34          ; <i32> [#uses=1]
  %36 = icmp eq i32 %35, 0                        ; <i1> [#uses=1]
  br i1 %36, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %7, align 8                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %_ZNSo3putEc.exit, label %invcont1.i

invcont1.i:                                       ; preds = %invcont.i, %invcont.i.thread
  %37 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %38 = getelementptr inbounds i32 (...)** %37, i32 -3 ; <i32 (...)**> [#uses=1]
  %39 = bitcast i32 (...)** %38 to i32*           ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4                    ; <i32> [#uses=1]
  %41 = add i32 %40, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %42 = inttoptr i32 %41 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %43 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %42, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %44 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %43, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %45 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %44, i32 0, i32 5 ; <i8**> [#uses=3]
  %46 = load i8** %45, align 4                    ; <i8*> [#uses=2]
  %47 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %44, i32 0, i32 6 ; <i8**> [#uses=1]
  %48 = load i8** %47, align 4                    ; <i8*> [#uses=1]
  %49 = icmp ult i8* %46, %48                     ; <i1> [#uses=1]
  br i1 %49, label %bb.i2.i, label %bb1.i.i

bb.i2.i:                                          ; preds = %invcont1.i
  store i8 %6, i8* %46, align 1
  %50 = load i8** %45, align 4                    ; <i8*> [#uses=1]
  %51 = getelementptr inbounds i8* %50, i32 1     ; <i8*> [#uses=1]
  store i8* %51, i8** %45, align 4
  %52 = zext i8 %6 to i32                         ; <i32> [#uses=1]
  br label %invcont2.i

bb1.i.i:                                          ; preds = %invcont1.i
  %53 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %44, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %54 = load i32 (...)*** %53, align 4            ; <i32 (...)**> [#uses=1]
  %55 = getelementptr inbounds i32 (...)** %54, i32 13 ; <i32 (...)**> [#uses=1]
  %56 = load i32 (...)** %55, align 4             ; <i32 (...)*> [#uses=1]
  %57 = zext i8 %6 to i32                         ; <i32> [#uses=1]
  %58 = bitcast i32 (...)* %56 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %59 = invoke i32 %58(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %44, i32 %57)
          to label %invcont2.i unwind label %lpad25.i ; <i32> [#uses=1]

invcont2.i:                                       ; preds = %bb1.i.i, %bb.i2.i
  %60 = phi i32 [ %52, %bb.i2.i ], [ %59, %bb1.i.i ] ; <i32> [#uses=1]
  %61 = icmp eq i32 %60, -1                       ; <i1> [#uses=1]
  br i1 %61, label %bb14.i, label %_ZNSo3putEc.exit

bb11.i:                                           ; preds = %lpad25.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit unwind label %lpad29.i

bb14.i:                                           ; preds = %invcont2.i
  %62 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %63 = getelementptr inbounds i32 (...)** %62, i32 -3 ; <i32 (...)**> [#uses=1]
  %64 = bitcast i32 (...)** %63 to i32*           ; <i32*> [#uses=1]
  %65 = load i32* %64, align 4                    ; <i32> [#uses=1]
  %66 = add i32 %65, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %67 = inttoptr i32 %66 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %68 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %69 = load i32* %68, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %69, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %68
  %70 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  %72 = and i32 %storemerge.i.i, %71              ; <i32> [#uses=1]
  %73 = icmp eq i32 %72, 0                        ; <i1> [#uses=1]
  br i1 %73, label %_ZNSo3putEc.exit, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb14.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
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
  %74 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i) nounwind ; <i8*> [#uses=0]
  %75 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %76 = getelementptr inbounds i32 (...)** %75, i32 -3 ; <i32 (...)**> [#uses=1]
  %77 = bitcast i32 (...)** %76 to i32*           ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=1]
  %79 = add i32 %78, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %80 = inttoptr i32 %79 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %81 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %80, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %82 = load i32* %81, align 4                    ; <i32> [#uses=1]
  %83 = or i32 %82, 1                             ; <i32> [#uses=1]
  store i32 %83, i32* %81, align 4
  %84 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %80, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %85 = load i32* %84, align 4                    ; <i32> [#uses=1]
  %86 = and i32 %85, 1                            ; <i32> [#uses=1]
  %87 = icmp eq i32 %86, 0                        ; <i1> [#uses=1]
  br i1 %87, label %bb11.i, label %bb.i.i

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
  tail call fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
  ret void
}

declare i32 @strlen(i8* nocapture) nounwind readonly

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %A = alloca %"struct.std::list<int,std::allocator<int> >", align 8 ; <%"struct.std::list<int,std::allocator<int> >"*> [#uses=4]
  %B = alloca %"struct.std::list<int,std::allocator<int> >", align 8 ; <%"struct.std::list<int,std::allocator<int> >"*> [#uses=4]
  %1 = alloca %"struct.std::list<int,std::allocator<int> >", align 8 ; <%"struct.std::list<int,std::allocator<int> >"*> [#uses=3]
  %2 = alloca %"struct.std::list<int,std::allocator<int> >", align 8 ; <%"struct.std::list<int,std::allocator<int> >"*> [#uses=3]
  %3 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %3, label %bb, label %bb5

bb:                                               ; preds = %entry
  %4 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %5 = load i8** %4, align 4                      ; <i8*> [#uses=1]
  %6 = call i32 @atoi(i8* %5) nounwind readonly   ; <i32> [#uses=2]
  %7 = icmp sgt i32 %6, 0                         ; <i1> [#uses=1]
  br i1 %7, label %bb1, label %bb5

bb1:                                              ; preds = %bb
  br label %bb5

bb5:                                              ; preds = %bb1, %bb, %entry
  %iftmp.91.0 = phi i32 [ %6, %bb1 ], [ 1000000, %entry ], [ 1, %bb ] ; <i32> [#uses=4]
  %8 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %B, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=8]
  %9 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %B, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %10 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %B, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=12]
  store %"struct.std::_List_node_base"* %10, %"struct.std::_List_node_base"** %8, align 8
  store %"struct.std::_List_node_base"* %10, %"struct.std::_List_node_base"** %9, align 4
  %11 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %A, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=9]
  %12 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %A, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=2]
  %13 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %A, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=18]
  store %"struct.std::_List_node_base"* %13, %"struct.std::_List_node_base"** %11, align 8
  store %"struct.std::_List_node_base"* %13, %"struct.std::_List_node_base"** %12, align 4
  %14 = icmp eq i32 %iftmp.91.0, 0                ; <i1> [#uses=1]
  br i1 %14, label %bb17, label %bb.i.i80

bb.i.i80:                                         ; preds = %.noexc1.i, %bb5
  %indvar.i.i = phi i32 [ %indvar.next.i.i, %.noexc1.i ], [ 0, %bb5 ] ; <i32> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=2]
  %15 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i unwind label %lpad.i ; <i8*> [#uses=2]

.noexc.i:                                         ; preds = %bb.i.i80
  %16 = getelementptr inbounds i8* %15, i32 8     ; <i8*> [#uses=2]
  %17 = icmp eq i8* %16, null                     ; <i1> [#uses=1]
  br i1 %17, label %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %.noexc.i
  %18 = bitcast i8* %16 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %18
  br label %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i

_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i:        ; preds = %bb.i.i.i.i.i.i, %.noexc.i
  %19 = bitcast i8* %15 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %19, %"struct.std::_List_node_base"* %13)
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i
  %exitcond.i.i = icmp eq i32 %indvar.next.i.i, %iftmp.91.0 ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %invcont9, label %bb.i.i80

invcont1.i:                                       ; preds = %bb.i.i.i83, %lpad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
          to label %.noexc84 unwind label %lpad116

.noexc84:                                         ; preds = %invcont1.i
  unreachable

lpad.i:                                           ; preds = %_ZNSt4listIiSaIiEE9push_backERKi.exit.i.i, %bb.i.i80
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select5.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %20 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %21 = icmp eq %"struct.std::_List_node_base"* %13, %20 ; <i1> [#uses=1]
  br i1 %21, label %invcont1.i, label %bb.i.i.i83

bb.i.i.i83:                                       ; preds = %bb.i.i.i83, %lpad.i
  %__cur.0.in1.i.i.i82 = phi %"struct.std::_List_node_base"* [ %23, %bb.i.i.i83 ], [ %20, %lpad.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %22 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i82, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %23 = load %"struct.std::_List_node_base"** %22, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %24 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i82 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %24) nounwind
  %25 = icmp eq %"struct.std::_List_node_base"* %13, %23 ; <i1> [#uses=1]
  br i1 %25, label %invcont1.i, label %bb.i.i.i83

invcont9:                                         ; preds = %.noexc1.i
  %.pre = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %26 = icmp eq %"struct.std::_List_node_base"* %.pre, %13 ; <i1> [#uses=1]
  br i1 %26, label %bb17, label %bb.i78

bb.i78:                                           ; preds = %bb.i78, %invcont9
  %indvar.i = phi i32 [ %__value_addr.02.i, %bb.i78 ], [ 0, %invcont9 ] ; <i32> [#uses=1]
  %__first_addr.0.01.i = phi %"struct.std::_List_node_base"* [ %28, %bb.i78 ], [ %.pre, %invcont9 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %__value_addr.02.i = add i32 %indvar.i, 1       ; <i32> [#uses=2]
  %27 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %28 = load %"struct.std::_List_node_base"** %27, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %29 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i, i32 1, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %__value_addr.0.c.i = inttoptr i32 %__value_addr.02.i to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  store %"struct.std::_List_node_base"* %__value_addr.0.c.i, %"struct.std::_List_node_base"** %29
  %30 = icmp eq %"struct.std::_List_node_base"* %28, %13 ; <i1> [#uses=1]
  br i1 %30, label %bb17, label %bb.i78

invcont14:                                        ; preds = %bb17
  %31 = getelementptr inbounds %"struct.std::_List_node_base"* %42, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %32 = bitcast %"struct.std::_List_node_base"* %31 to i32* ; <i32*> [#uses=1]
  %33 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %34 = invoke i8* @_Znwj(i32 12)
          to label %.noexc76 unwind label %lpad120 ; <i8*> [#uses=2]

.noexc76:                                         ; preds = %invcont14
  %35 = getelementptr inbounds i8* %34, i32 8     ; <i8*> [#uses=2]
  %36 = icmp eq i8* %35, null                     ; <i1> [#uses=1]
  br i1 %36, label %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i75, label %bb.i.i.i.i74

bb.i.i.i.i74:                                     ; preds = %.noexc76
  %37 = bitcast i8* %35 to i32*                   ; <i32*> [#uses=1]
  %38 = load i32* %32, align 4                    ; <i32> [#uses=1]
  store i32 %38, i32* %37
  br label %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i75

_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i75: ; preds = %bb.i.i.i.i74, %.noexc76
  %39 = bitcast i8* %34 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %39, %"struct.std::_List_node_base"* %33)
          to label %invcont15 unwind label %lpad120

invcont15:                                        ; preds = %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i75
  %40 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  invoke void @_ZNSt15_List_node_base6unhookEv(%"struct.std::_List_node_base"* %40)
          to label %_ZNSt4listIiSaIiEE9pop_frontEv.exit unwind label %lpad120

_ZNSt4listIiSaIiEE9pop_frontEv.exit:              ; preds = %invcont15
  %41 = bitcast %"struct.std::_List_node_base"* %40 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %41) nounwind
  br label %bb17

bb17:                                             ; preds = %_ZNSt4listIiSaIiEE9pop_frontEv.exit, %bb.i78, %invcont9, %bb5
  %42 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %43 = icmp eq %"struct.std::_List_node_base"* %42, %13 ; <i1> [#uses=1]
  br i1 %43, label %bb20, label %invcont14

bb20:                                             ; preds = %bb17
  invoke fastcc void @_ZNSt4listIiSaIiEEC1ERKS1_(%"struct.std::list<int,std::allocator<int> >"* %2, %"struct.std::list<int,std::allocator<int> >"* %B)
          to label %invcont21 unwind label %lpad120

invcont21:                                        ; preds = %bb20
  %44 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %2, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=3]
  %i.0.03.i58 = load %"struct.std::_List_node_base"** %44, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %45 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %2, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=6]
  %46 = icmp eq %"struct.std::_List_node_base"* %i.0.03.i58, %45 ; <i1> [#uses=1]
  br i1 %46, label %bb12.i67, label %bb.i62

bb.i62:                                           ; preds = %bb2.i66, %invcont21
  %i.0.04.i60 = phi %"struct.std::_List_node_base"* [ %i.0.0.i64, %bb2.i66 ], [ %i.0.03.i58, %invcont21 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %47 = phi i32 [ %tmp.i61, %bb2.i66 ], [ 0, %invcont21 ] ; <i32> [#uses=2]
  %tmp.i61 = add i32 %47, 1                       ; <i32> [#uses=2]
  %48 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.04.i60, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %49 = bitcast %"struct.std::_List_node_base"* %48 to i32* ; <i32*> [#uses=1]
  %50 = load i32* %49, align 4                    ; <i32> [#uses=1]
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %50)
          to label %.noexc68 unwind label %lpad124

.noexc68:                                         ; preds = %bb.i62
  %51 = icmp slt i32 %47, 1                       ; <i1> [#uses=1]
  br i1 %51, label %bb1.i63, label %bb2.i66

bb1.i63:                                          ; preds = %.noexc68
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i32 1)
          to label %bb2.i66 unwind label %lpad124

bb2.i66:                                          ; preds = %bb1.i63, %.noexc68
  %52 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.04.i60, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %i.0.0.i64 = load %"struct.std::_List_node_base"** %52 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %53 = icmp ne %"struct.std::_List_node_base"* %i.0.0.i64, %45 ; <i1> [#uses=1]
  %54 = icmp slt i32 %tmp.i61, 2                  ; <i1> [#uses=1]
  %or.cond.i65 = and i1 %53, %54                  ; <i1> [#uses=1]
  br i1 %or.cond.i65, label %bb.i62, label %bb12.i67

bb12.i67:                                         ; preds = %bb2.i66, %invcont21
  invoke fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_()
          to label %bb28 unwind label %lpad124

bb28:                                             ; preds = %bb12.i67
  %55 = load %"struct.std::_List_node_base"** %44, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %56 = icmp eq %"struct.std::_List_node_base"* %45, %55 ; <i1> [#uses=1]
  br i1 %56, label %invcont29, label %bb.i.i.i56

bb.i.i.i56:                                       ; preds = %bb.i.i.i56, %bb28
  %__cur.0.in1.i.i.i55 = phi %"struct.std::_List_node_base"* [ %58, %bb.i.i.i56 ], [ %55, %bb28 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %57 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i55, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %58 = load %"struct.std::_List_node_base"** %57, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %59 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i55 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %59) nounwind
  %60 = icmp eq %"struct.std::_List_node_base"* %45, %58 ; <i1> [#uses=1]
  br i1 %60, label %invcont29, label %bb.i.i.i56

invcont29:                                        ; preds = %bb.i.i.i56, %bb28
  invoke void @_ZNSt15_List_node_base7reverseEv(%"struct.std::_List_node_base"* %10)
          to label %invcont33 unwind label %lpad120

invcont33:                                        ; preds = %invcont29
  %61 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb1.i.i51

bb.i.i49:                                         ; preds = %bb5.i.i52
  %62 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.0.i.i50, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %63 = load %"struct.std::_List_node_base"** %62, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb1.i.i51

bb1.i.i51:                                        ; preds = %bb.i.i49, %invcont33
  %__first_addr.0.0.i.i50 = phi %"struct.std::_List_node_base"* [ %61, %invcont33 ], [ %63, %bb.i.i49 ] ; <%"struct.std::_List_node_base"*> [#uses=3]
  %64 = icmp eq %"struct.std::_List_node_base"* %__first_addr.0.0.i.i50, %10 ; <i1> [#uses=2]
  br i1 %64, label %invcont38, label %bb5.i.i52

bb5.i.i52:                                        ; preds = %bb1.i.i51
  %65 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.0.i.i50, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %66 = bitcast %"struct.std::_List_node_base"* %65 to i32* ; <i32*> [#uses=1]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=1]
  %68 = icmp eq i32 %67, 0                        ; <i1> [#uses=1]
  br i1 %68, label %invcont38, label %bb.i.i49

invcont38:                                        ; preds = %bb5.i.i52, %bb1.i.i51
  %iftmp.96.0 = select i1 %64, i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i32 0, i32 0) ; <i8*> [#uses=3]
  %69 = icmp eq i8* %iftmp.96.0, null             ; <i1> [#uses=1]
  br i1 %69, label %bb.i41, label %bb1.i44

bb.i41:                                           ; preds = %invcont38
  %70 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %71 = getelementptr inbounds i32 (...)** %70, i32 -3 ; <i32 (...)**> [#uses=1]
  %72 = bitcast i32 (...)** %71 to i32*           ; <i32*> [#uses=1]
  %73 = load i32* %72, align 4                    ; <i32> [#uses=1]
  %74 = add i32 %73, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %75 = inttoptr i32 %74 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %76 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %75, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %77 = load i32* %76, align 4                    ; <i32> [#uses=1]
  %78 = or i32 %77, 1                             ; <i32> [#uses=2]
  store i32 %78, i32* %76
  %79 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %75, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %80 = load i32* %79, align 4                    ; <i32> [#uses=1]
  %81 = and i32 %78, %80                          ; <i32> [#uses=1]
  %82 = icmp eq i32 %81, 0                        ; <i1> [#uses=1]
  br i1 %82, label %invcont43, label %bb4.i.i.i42

bb4.i.i.i42:                                      ; preds = %bb.i41
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc45 unwind label %lpad120

.noexc45:                                         ; preds = %bb4.i.i.i42
  unreachable

bb1.i44:                                          ; preds = %invcont38
  %83 = call i32 @strlen(i8* %iftmp.96.0) nounwind readonly ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %iftmp.96.0, i32 %83)
          to label %invcont43 unwind label %lpad120

invcont43:                                        ; preds = %bb1.i44, %bb.i41
  invoke fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_()
          to label %invcont47 unwind label %lpad120

invcont47:                                        ; preds = %invcont43
  %84 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb1.i.i

bb.i.i:                                           ; preds = %bb5.i.i
  %85 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.0.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %86 = load %"struct.std::_List_node_base"** %85, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i.i, %invcont47
  %__first_addr.0.0.i.i = phi %"struct.std::_List_node_base"* [ %84, %invcont47 ], [ %86, %bb.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=3]
  %87 = icmp eq %"struct.std::_List_node_base"* %__first_addr.0.0.i.i, %10 ; <i1> [#uses=2]
  br i1 %87, label %invcont52, label %bb5.i.i

bb5.i.i:                                          ; preds = %bb1.i.i
  %88 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.0.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %89 = bitcast %"struct.std::_List_node_base"* %88 to i32* ; <i32*> [#uses=1]
  %90 = load i32* %89, align 4                    ; <i32> [#uses=1]
  %91 = icmp eq i32 %90, %iftmp.91.0              ; <i1> [#uses=1]
  br i1 %91, label %invcont52, label %bb.i.i

invcont52:                                        ; preds = %bb5.i.i, %bb1.i.i
  %iftmp.97.0 = select i1 %87, i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i32 0, i32 0) ; <i8*> [#uses=3]
  %92 = icmp eq i8* %iftmp.97.0, null             ; <i1> [#uses=1]
  br i1 %92, label %bb.i33, label %bb1.i34

bb.i33:                                           ; preds = %invcont52
  %93 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %94 = getelementptr inbounds i32 (...)** %93, i32 -3 ; <i32 (...)**> [#uses=1]
  %95 = bitcast i32 (...)** %94 to i32*           ; <i32*> [#uses=1]
  %96 = load i32* %95, align 4                    ; <i32> [#uses=1]
  %97 = add i32 %96, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %98 = inttoptr i32 %97 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %99 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %98, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = or i32 %100, 1                           ; <i32> [#uses=2]
  store i32 %101, i32* %99
  %102 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %98, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %103 = load i32* %102, align 4                  ; <i32> [#uses=1]
  %104 = and i32 %101, %103                       ; <i32> [#uses=1]
  %105 = icmp eq i32 %104, 0                      ; <i1> [#uses=1]
  br i1 %105, label %invcont57, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i33
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc35 unwind label %lpad120

.noexc35:                                         ; preds = %bb4.i.i.i
  unreachable

bb1.i34:                                          ; preds = %invcont52
  %106 = call i32 @strlen(i8* %iftmp.97.0) nounwind readonly ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %iftmp.97.0, i32 %106)
          to label %invcont57 unwind label %lpad120

invcont57:                                        ; preds = %bb1.i34, %bb.i33
  invoke fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_()
          to label %invcont59 unwind label %lpad120

invcont59:                                        ; preds = %invcont57
  %107 = sdiv i32 %iftmp.91.0, 2                  ; <i32> [#uses=1]
  %108 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %invcont66

bb60:                                             ; preds = %invcont66
  %109 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.0, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %110 = bitcast %"struct.std::_List_node_base"* %109 to i32* ; <i32*> [#uses=2]
  %111 = load i32* %110, align 4                  ; <i32> [#uses=1]
  %112 = icmp slt i32 %111, %107                  ; <i1> [#uses=1]
  br i1 %112, label %bb62, label %bb64

bb62:                                             ; preds = %bb60
  %113 = invoke i8* @_Znwj(i32 12)
          to label %.noexc29 unwind label %lpad120 ; <i8*> [#uses=2]

.noexc29:                                         ; preds = %bb62
  %114 = getelementptr inbounds i8* %113, i32 8   ; <i8*> [#uses=2]
  %115 = icmp eq i8* %114, null                   ; <i1> [#uses=1]
  br i1 %115, label %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %.noexc29
  %116 = bitcast i8* %114 to i32*                 ; <i32*> [#uses=1]
  %117 = load i32* %110, align 4                  ; <i32> [#uses=1]
  store i32 %117, i32* %116
  br label %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i

_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i: ; preds = %bb.i.i.i.i, %.noexc29
  %118 = bitcast i8* %113 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %118, %"struct.std::_List_node_base"* %13)
          to label %bb64 unwind label %lpad120

bb64:                                             ; preds = %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i, %bb60
  %119 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %120 = load %"struct.std::_List_node_base"** %119, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %invcont66

invcont66:                                        ; preds = %bb64, %invcont59
  %i.0.0 = phi %"struct.std::_List_node_base"* [ %108, %invcont59 ], [ %120, %bb64 ] ; <%"struct.std::_List_node_base"*> [#uses=3]
  %121 = icmp eq %"struct.std::_List_node_base"* %i.0.0, %10 ; <i1> [#uses=1]
  br i1 %121, label %bb68, label %bb60

bb68:                                             ; preds = %invcont66
  invoke fastcc void @_ZNSt4listIiSaIiEEC1ERKS1_(%"struct.std::list<int,std::allocator<int> >"* %1, %"struct.std::list<int,std::allocator<int> >"* %A)
          to label %invcont69 unwind label %lpad120

invcont69:                                        ; preds = %bb68
  %122 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %1, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=3]
  %i.0.03.i = load %"struct.std::_List_node_base"** %122, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %123 = getelementptr inbounds %"struct.std::list<int,std::allocator<int> >"* %1, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=6]
  %124 = icmp eq %"struct.std::_List_node_base"* %i.0.03.i, %123 ; <i1> [#uses=1]
  br i1 %124, label %bb12.i, label %bb.i24

bb.i24:                                           ; preds = %bb2.i, %invcont69
  %i.0.04.i = phi %"struct.std::_List_node_base"* [ %i.0.0.i, %bb2.i ], [ %i.0.03.i, %invcont69 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %125 = phi i32 [ %tmp.i, %bb2.i ], [ 0, %invcont69 ] ; <i32> [#uses=2]
  %tmp.i = add i32 %125, 1                        ; <i32> [#uses=2]
  %126 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.04.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %127 = bitcast %"struct.std::_List_node_base"* %126 to i32* ; <i32*> [#uses=1]
  %128 = load i32* %127, align 4                  ; <i32> [#uses=1]
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %128)
          to label %.noexc25 unwind label %lpad132

.noexc25:                                         ; preds = %bb.i24
  %129 = icmp slt i32 %125, 9                     ; <i1> [#uses=1]
  br i1 %129, label %bb1.i, label %bb2.i

bb1.i:                                            ; preds = %.noexc25
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i32 1)
          to label %bb2.i unwind label %lpad132

bb2.i:                                            ; preds = %bb1.i, %.noexc25
  %130 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.04.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %i.0.0.i = load %"struct.std::_List_node_base"** %130 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %131 = icmp ne %"struct.std::_List_node_base"* %i.0.0.i, %123 ; <i1> [#uses=1]
  %132 = icmp slt i32 %tmp.i, 10                  ; <i1> [#uses=1]
  %or.cond.i = and i1 %131, %132                  ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb.i24, label %bb12.i

bb12.i:                                           ; preds = %bb2.i, %invcont69
  invoke fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_()
          to label %bb76 unwind label %lpad132

bb76:                                             ; preds = %bb12.i
  %133 = load %"struct.std::_List_node_base"** %122, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %134 = icmp eq %"struct.std::_List_node_base"* %123, %133 ; <i1> [#uses=1]
  br i1 %134, label %invcont79, label %bb.i.i.i22

bb.i.i.i22:                                       ; preds = %bb.i.i.i22, %bb76
  %__cur.0.in1.i.i.i21 = phi %"struct.std::_List_node_base"* [ %136, %bb.i.i.i22 ], [ %133, %bb76 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %135 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i21, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %136 = load %"struct.std::_List_node_base"** %135, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %137 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i21 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %137) nounwind
  %138 = icmp eq %"struct.std::_List_node_base"* %123, %136 ; <i1> [#uses=1]
  br i1 %138, label %invcont79, label %bb.i.i.i22

invcont79:                                        ; preds = %bb.i.i.i22, %bb76
  %139 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %140 = icmp eq %"struct.std::_List_node_base"* %139, %13 ; <i1> [#uses=1]
  br i1 %140, label %bb87, label %bb80

bb80:                                             ; preds = %bb80, %invcont79
  %sum.1100 = phi i32 [ %sum.0, %bb80 ], [ 0, %invcont79 ] ; <i32> [#uses=1]
  %i.0.199 = phi %"struct.std::_List_node_base"* [ %147, %bb80 ], [ %139, %invcont79 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %141 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.199, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %142 = bitcast %"struct.std::_List_node_base"* %141 to i32* ; <i32*> [#uses=1]
  %143 = load i32* %142, align 4                  ; <i32> [#uses=2]
  %144 = icmp slt i32 %143, 1000                  ; <i1> [#uses=1]
  %145 = select i1 %144, i32 %143, i32 0          ; <i32> [#uses=1]
  %sum.0 = add i32 %sum.1100, %145                ; <i32> [#uses=2]
  %146 = getelementptr inbounds %"struct.std::_List_node_base"* %i.0.199, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %147 = load %"struct.std::_List_node_base"** %146, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %148 = icmp eq %"struct.std::_List_node_base"* %147, %13 ; <i1> [#uses=1]
  br i1 %148, label %bb87, label %bb80

bb87:                                             ; preds = %bb80, %invcont79
  %sum.1.lcssa = phi i32 [ 0, %invcont79 ], [ %sum.0, %bb80 ] ; <i32> [#uses=1]
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %sum.1.lcssa)
          to label %invcont88 unwind label %lpad120

invcont88:                                        ; preds = %bb87
  invoke fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_()
          to label %invcont90 unwind label %lpad120

invcont90:                                        ; preds = %invcont88
  %149 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %150 = icmp eq %"struct.std::_List_node_base"* %149, %10 ; <i1> [#uses=1]
  br i1 %150, label %invcont94, label %bb.i

bb.i:                                             ; preds = %invcont90
  invoke void @_ZNSt15_List_node_base8transferEPS_S0_(%"struct.std::_List_node_base"* %13, %"struct.std::_List_node_base"* %149, %"struct.std::_List_node_base"* %10)
          to label %invcont94 unwind label %lpad120

invcont94:                                        ; preds = %bb.i, %invcont90
  %151 = load %"struct.std::_List_node_base"** %12, align 4 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %152 = getelementptr inbounds %"struct.std::_List_node_base"* %151, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %153 = bitcast %"struct.std::_List_node_base"* %152 to i32* ; <i32*> [#uses=1]
  %154 = load i32* %153, align 4                  ; <i32> [#uses=1]
  %155 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %156 = icmp eq %"struct.std::_List_node_base"* %155, %13 ; <i1> [#uses=1]
  br i1 %156, label %invcont95, label %bb.i.i.i16

bb.i.i.i16:                                       ; preds = %bb.i.i.i16, %invcont94
  %__n.02.i.i.i = phi i32 [ %tmp.i.i.i, %bb.i.i.i16 ], [ 0, %invcont94 ] ; <i32> [#uses=1]
  %__first_addr.0.01.i.i.i = phi %"struct.std::_List_node_base"* [ %158, %bb.i.i.i16 ], [ %155, %invcont94 ] ; <%"struct.std::_List_node_base"*> [#uses=1]
  %tmp.i.i.i = add i32 %__n.02.i.i.i, 1           ; <i32> [#uses=2]
  %157 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %158 = load %"struct.std::_List_node_base"** %157, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %159 = icmp eq %"struct.std::_List_node_base"* %158, %13 ; <i1> [#uses=1]
  br i1 %159, label %invcont95, label %bb.i.i.i16

invcont95:                                        ; preds = %bb.i.i.i16, %invcont94
  %__n.0.lcssa.i.i.i = phi i32 [ 0, %invcont94 ], [ %tmp.i.i.i, %bb.i.i.i16 ] ; <i32> [#uses=1]
  %160 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %160, align 8
  %161 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %161, align 4
  %162 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %163 = getelementptr inbounds i32 (...)** %162, i32 -3 ; <i32 (...)**> [#uses=1]
  %164 = bitcast i32 (...)** %163 to i32*         ; <i32*> [#uses=1]
  %165 = load i32* %164, align 4                  ; <i32> [#uses=1]
  %166 = add i32 %165, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %167 = inttoptr i32 %166 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %168 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %167, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %169 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %168, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %170 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %169, null ; <i1> [#uses=1]
  br i1 %170, label %bb9.i.i.i, label %bb.i.i.i1

bb.i.i.i1:                                        ; preds = %invcont95
  %171 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %167, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %172 = load i32* %171, align 4                  ; <i32> [#uses=1]
  %173 = icmp eq i32 %172, 0                      ; <i1> [#uses=1]
  br i1 %173, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i1
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %169)
          to label %.noexc unwind label %lpad120

.noexc:                                           ; preds = %bb8.i.i.i
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %.noexc, %bb.i.i.i1, %invcont95
  %174 = phi i32 (...)** [ %.pre.i.i.i, %.noexc ], [ %162, %invcont95 ], [ %162, %bb.i.i.i1 ] ; <i32 (...)**> [#uses=1]
  %175 = getelementptr inbounds i32 (...)** %174, i32 -3 ; <i32 (...)**> [#uses=1]
  %176 = bitcast i32 (...)** %175 to i32*         ; <i32*> [#uses=1]
  %177 = load i32* %176, align 4                  ; <i32> [#uses=1]
  %178 = add i32 %177, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %179 = inttoptr i32 %178 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %180 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %181 = load i32* %180, align 4                  ; <i32> [#uses=2]
  %182 = icmp eq i32 %181, 0                      ; <i1> [#uses=1]
  br i1 %182, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %160, align 8
  br label %bb.i2

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %183 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %184 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %183, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %185 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %184, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %185, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %181 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %180
  %186 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %179, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %187 = load i32* %186, align 4                  ; <i32> [#uses=1]
  %188 = and i32 %storemerge.i.i.i.i, %187        ; <i32> [#uses=1]
  %189 = icmp eq i32 %188, 0                      ; <i1> [#uses=1]
  br i1 %189, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc12 unwind label %lpad120

.noexc12:                                         ; preds = %bb4.i.i.i.i.i
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %160, align 8                   ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb17.i, label %bb.i2

bb.i2:                                            ; preds = %invcont.i, %invcont.i.thread
  %190 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %191 = getelementptr inbounds i32 (...)** %190, i32 -3 ; <i32 (...)**> [#uses=1]
  %192 = bitcast i32 (...)** %191 to i32*         ; <i32*> [#uses=1]
  %193 = load i32* %192, align 4                  ; <i32> [#uses=1]
  %194 = add i32 %193, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %195 = inttoptr i32 %194 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %196 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %195, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %197 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %196, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %198 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %197, null ; <i1> [#uses=1]
  br i1 %198, label %bb.i6.i, label %invcont1.i3

bb.i6.i:                                          ; preds = %bb.i2
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i3:                                      ; preds = %bb.i2
  %199 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %195, i32 0, i32 3 ; <i8*> [#uses=2]
  %200 = load i8* %199, align 1                   ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %200, 0                ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i3
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %195, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %201 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %202 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %195, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %201, i8* %202, align 4
  store i8 1, i8* %199, align 1
  %.pre.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i3
  %203 = phi i32 (...)** [ %.pre.i, %.noexc5.i ], [ %190, %invcont1.i3 ] ; <i32 (...)**> [#uses=1]
  %204 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %195, i32 0, i32 2 ; <i8*> [#uses=1]
  %205 = load i8* %204, align 4                   ; <i8> [#uses=1]
  %206 = getelementptr inbounds i32 (...)** %203, i32 -3 ; <i32 (...)**> [#uses=1]
  %207 = bitcast i32 (...)** %206 to i32*         ; <i32*> [#uses=1]
  %208 = load i32* %207, align 4                  ; <i32> [#uses=1]
  %209 = add i32 %208, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %210 = inttoptr i32 %209 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %211 = inttoptr i32 %209 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %212 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %211, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %213 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %212, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i4 = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %213 to i32 ; <i32> [#uses=1]
  %214 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %213, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %215 = zext i32 %tmp.i4 to i64                  ; <i64> [#uses=1]
  %216 = zext i1 %214 to i64                      ; <i64> [#uses=1]
  %217 = shl i64 %216, 32                         ; <i64> [#uses=1]
  %218 = or i64 %217, %215                        ; <i64> [#uses=1]
  store i64 %218, i64* %tmp9.i, align 8
  %219 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %197, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %220 = load i32 (...)*** %219, align 4          ; <i32 (...)**> [#uses=1]
  %221 = getelementptr inbounds i32 (...)** %220, i32 4 ; <i32 (...)**> [#uses=1]
  %222 = load i32 (...)** %221, align 4           ; <i32 (...)*> [#uses=1]
  %223 = bitcast i32 (...)* %222 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %223(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %197, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %210, i8 signext %205, i32 %__n.0.lcssa.i.i.i)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %224 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %225 = load i8* %224, align 4                   ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %225, 0                 ; <i1> [#uses=1]
  br i1 %toBool4.i, label %bb17.i, label %bb15.i

bb12.i5:                                          ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %bb17.i unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %226 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %227 = getelementptr inbounds i32 (...)** %226, i32 -3 ; <i32 (...)**> [#uses=1]
  %228 = bitcast i32 (...)** %227 to i32*         ; <i32*> [#uses=1]
  %229 = load i32* %228, align 4                  ; <i32> [#uses=1]
  %230 = add i32 %229, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %231 = inttoptr i32 %230 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %232 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %231, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %233 = load i32* %232, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %233, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %232
  %234 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %231, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %235 = load i32* %234, align 4                  ; <i32> [#uses=1]
  %236 = and i32 %storemerge.i.i, %235            ; <i32> [#uses=1]
  %237 = icmp eq i32 %236, 0                      ; <i1> [#uses=1]
  br i1 %237, label %bb17.i, label %bb4.i.i.i6

bb4.i.i.i6:                                       ; preds = %bb15.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc1.i7 unwind label %lpad.i9

.noexc1.i7:                                       ; preds = %bb4.i.i.i6
  unreachable

bb17.i:                                           ; preds = %bb15.i, %bb12.i5, %invcont3.i, %invcont.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont96 unwind label %lpad120

invcont21.i:                                      ; preds = %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
          to label %.noexc14 unwind label %lpad120

.noexc14:                                         ; preds = %invcont21.i
  unreachable

lpad.i9:                                          ; preds = %bb4.i.i.i6
  %eh_ptr.i8 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i8, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %238 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %239 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %240 = getelementptr inbounds i32 (...)** %239, i32 -3 ; <i32 (...)**> [#uses=1]
  %241 = bitcast i32 (...)** %240 to i32*         ; <i32*> [#uses=1]
  %242 = load i32* %241, align 4                  ; <i32> [#uses=1]
  %243 = add i32 %242, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %244 = inttoptr i32 %243 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %245 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %244, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %246 = load i32* %245, align 4                  ; <i32> [#uses=1]
  %247 = or i32 %246, 1                           ; <i32> [#uses=1]
  store i32 %247, i32* %245, align 4
  %248 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %244, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %249 = load i32* %248, align 4                  ; <i32> [#uses=1]
  %250 = and i32 %249, 1                          ; <i32> [#uses=1]
  %251 = icmp eq i32 %250, 0                      ; <i1> [#uses=1]
  br i1 %251, label %bb12.i5, label %bb.i.i10

bb.i.i10:                                         ; preds = %lpad26.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i11 unwind label %lpad34.i

.noexc.i11:                                       ; preds = %bb.i.i10
  unreachable

lpad30.i:                                         ; preds = %bb12.i5
  %eh_ptr31.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select33.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr31.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad34.i:                                         ; preds = %bb.i.i10
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

ppad.i:                                           ; preds = %lpad34.i, %lpad30.i, %lpad.i9
  %eh_exception.0.i = phi i8* [ %eh_ptr.i8, %lpad.i9 ], [ %eh_ptr31.i, %lpad30.i ], [ %eh_ptr35.i, %lpad34.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont21.i unwind label %lpad42.i

invcont96:                                        ; preds = %bb17.i
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i32 1)
          to label %invcont97 unwind label %lpad120

invcont97:                                        ; preds = %invcont96
  invoke fastcc void @_ZNSo9_M_insertIlEERSoT_(i32 %154)
          to label %invcont98 unwind label %lpad120

invcont98:                                        ; preds = %invcont97
  invoke fastcc void @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_()
          to label %bb105 unwind label %lpad120

bb105:                                            ; preds = %invcont98
  %252 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %253 = icmp eq %"struct.std::_List_node_base"* %13, %252 ; <i1> [#uses=1]
  br i1 %253, label %bb112, label %bb.i.i.i14

bb.i.i.i14:                                       ; preds = %bb.i.i.i14, %bb105
  %__cur.0.in1.i.i.i13 = phi %"struct.std::_List_node_base"* [ %255, %bb.i.i.i14 ], [ %252, %bb105 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %254 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i13, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %255 = load %"struct.std::_List_node_base"** %254, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %256 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i13 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %256) nounwind
  %257 = icmp eq %"struct.std::_List_node_base"* %13, %255 ; <i1> [#uses=1]
  br i1 %257, label %bb112, label %bb.i.i.i14

invcont110:                                       ; preds = %bb.i.i.i2, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

bb112:                                            ; preds = %bb.i.i.i14, %bb105
  %258 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %259 = icmp eq %"struct.std::_List_node_base"* %10, %258 ; <i1> [#uses=1]
  br i1 %259, label %_ZNSt4listIiSaIiEED1Ev.exit12, label %bb.i.i.i11

bb.i.i.i11:                                       ; preds = %bb.i.i.i11, %bb112
  %__cur.0.in1.i.i.i10 = phi %"struct.std::_List_node_base"* [ %261, %bb.i.i.i11 ], [ %258, %bb112 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %260 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i10, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %261 = load %"struct.std::_List_node_base"** %260, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %262 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i10 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %262) nounwind
  %263 = icmp eq %"struct.std::_List_node_base"* %10, %261 ; <i1> [#uses=1]
  br i1 %263, label %_ZNSt4listIiSaIiEED1Ev.exit12, label %bb.i.i.i11

_ZNSt4listIiSaIiEED1Ev.exit12:                    ; preds = %bb.i.i.i11, %bb112
  ret i32 0

lpad116:                                          ; preds = %invcont1.i
  %eh_ptr117 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=2]
  %eh_select119 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr117, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad120:                                          ; preds = %invcont98, %invcont97, %invcont96, %invcont21.i, %bb17.i, %bb4.i.i.i.i.i, %bb8.i.i.i, %bb.i, %invcont88, %bb87, %bb68, %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i, %bb62, %invcont57, %bb1.i34, %bb4.i.i.i, %invcont43, %bb1.i44, %bb4.i.i.i42, %invcont29, %bb20, %invcont15, %_ZNSt4listIiSaIiEE9_M_insertESt14_List_iteratorIiERKi.exit.i75, %invcont14
  %eh_ptr121 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=2]
  %eh_select123 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr121, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad149

lpad124:                                          ; preds = %bb12.i67, %bb1.i63, %bb.i62
  %eh_ptr125 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=3]
  %eh_select127 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr125, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %264 = load %"struct.std::_List_node_base"** %44, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %265 = icmp eq %"struct.std::_List_node_base"* %45, %264 ; <i1> [#uses=1]
  br i1 %265, label %ppad149, label %bb.i.i.i8

bb.i.i.i8:                                        ; preds = %bb.i.i.i8, %lpad124
  %__cur.0.in1.i.i.i7 = phi %"struct.std::_List_node_base"* [ %267, %bb.i.i.i8 ], [ %264, %lpad124 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %266 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i7, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %267 = load %"struct.std::_List_node_base"** %266, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %268 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i7 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %268) nounwind
  %269 = icmp eq %"struct.std::_List_node_base"* %45, %267 ; <i1> [#uses=1]
  br i1 %269, label %ppad149, label %bb.i.i.i8

lpad132:                                          ; preds = %bb12.i, %bb1.i, %bb.i24
  %eh_ptr133 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=3]
  %eh_select135 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr133, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %270 = load %"struct.std::_List_node_base"** %122, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %271 = icmp eq %"struct.std::_List_node_base"* %123, %270 ; <i1> [#uses=1]
  br i1 %271, label %ppad149, label %bb.i.i.i5

bb.i.i.i5:                                        ; preds = %bb.i.i.i5, %lpad132
  %__cur.0.in1.i.i.i4 = phi %"struct.std::_List_node_base"* [ %273, %bb.i.i.i5 ], [ %270, %lpad132 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %272 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %273 = load %"struct.std::_List_node_base"** %272, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %274 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i4 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %274) nounwind
  %275 = icmp eq %"struct.std::_List_node_base"* %123, %273 ; <i1> [#uses=1]
  br i1 %275, label %ppad149, label %bb.i.i.i5

ppad:                                             ; preds = %bb.i.i.i, %ppad149, %lpad116
  %eh_exception.0 = phi i8* [ %eh_ptr117, %lpad116 ], [ %eh_exception.1, %ppad149 ], [ %eh_exception.1, %bb.i.i.i ] ; <i8*> [#uses=1]
  %276 = load %"struct.std::_List_node_base"** %8, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %277 = icmp eq %"struct.std::_List_node_base"* %10, %276 ; <i1> [#uses=1]
  br i1 %277, label %invcont110, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %bb.i.i.i2, %ppad
  %__cur.0.in1.i.i.i1 = phi %"struct.std::_List_node_base"* [ %279, %bb.i.i.i2 ], [ %276, %ppad ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %278 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %279 = load %"struct.std::_List_node_base"** %278, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %280 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %280) nounwind
  %281 = icmp eq %"struct.std::_List_node_base"* %10, %279 ; <i1> [#uses=1]
  br i1 %281, label %invcont110, label %bb.i.i.i2

ppad149:                                          ; preds = %bb.i.i.i5, %lpad132, %bb.i.i.i8, %lpad124, %lpad120
  %eh_exception.1 = phi i8* [ %eh_ptr121, %lpad120 ], [ %eh_ptr125, %lpad124 ], [ %eh_ptr133, %lpad132 ], [ %eh_ptr133, %bb.i.i.i5 ], [ %eh_ptr125, %bb.i.i.i8 ] ; <i8*> [#uses=2]
  %282 = load %"struct.std::_List_node_base"** %11, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %283 = icmp eq %"struct.std::_List_node_base"* %13, %282 ; <i1> [#uses=1]
  br i1 %283, label %ppad, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %ppad149
  %__cur.0.in1.i.i.i = phi %"struct.std::_List_node_base"* [ %285, %bb.i.i.i ], [ %282, %ppad149 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %284 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %285 = load %"struct.std::_List_node_base"** %284, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %286 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %286) nounwind
  %287 = icmp eq %"struct.std::_List_node_base"* %13, %285 ; <i1> [#uses=1]
  br i1 %287, label %ppad, label %bb.i.i.i
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
