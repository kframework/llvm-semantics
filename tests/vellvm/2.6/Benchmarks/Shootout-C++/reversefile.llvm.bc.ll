; ModuleID = 'reversefile.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%"struct.__gnu_cxx::new_allocator<char>" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Deque_base<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >" = type { %"struct.std::_Deque_base<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Deque_impl" }
%"struct.std::_Deque_base<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Deque_impl" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**, i32, %"struct.std::_Deque_iterator<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::basic_string<char, std::char_traits<char>, std::allocator<char> >&,std::basic_string<char, std::char_traits<char>, std::allocator<char> >*>", %"struct.std::_Deque_iterator<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::basic_string<char, std::char_traits<char>, std::allocator<char> >&,std::basic_string<char, std::char_traits<char>, std::allocator<char> >*>" }
%"struct.std::_Deque_iterator<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::basic_string<char, std::char_traits<char>, std::allocator<char> >&,std::basic_string<char, std::char_traits<char>, std::allocator<char> >*>" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_istream<char,std::char_traits<char> >" = type { i32 (...)**, i32, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Alloc_hider" = type { i8* }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep_base" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep_base" = type { i32, i32, i32 }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >" = type { %"struct.std::_Deque_base<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >" }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostream_iterator<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,char,std::char_traits<char> >" = type { %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8* }

@_ZNSs4_Rep20_S_empty_rep_storageE = external global [4 x i32] ; <[4 x i32]*> [#uses=2]
@_ZNSs4_Rep11_S_terminalE = external constant i8  ; <i8*> [#uses=2]
@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<char>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<char>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [24 x i8] c"basic_string::_S_create\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str2 = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZSt3cin = external global %"struct.std::basic_istream<char,std::char_traits<char> >" ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=4]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=3]
@.str3 = private constant [2 x i8] c"\0A\00", align 1 ; <[2 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_main }] ; <[1 x %0]*> [#uses=0]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=1]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._12*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._12*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._12*)* @pthread_mutexattr_init ; <i32 (%struct..0._12*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._12*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._12*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._12*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._12*)*> [#uses=0]

define i32 @main() {
entry:
  %buff = alloca [4096 x i8], align 1             ; <[4096 x i8]*> [#uses=1]
  %line = alloca [256 x i8], align 1              ; <[256 x i8]*> [#uses=3]
  %l = alloca %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >", align 8 ; <%"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"*> [#uses=12]
  %0 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"***> [#uses=7]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8
  %1 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 1 ; <i32*> [#uses=4]
  %2 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 2, i32 0 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=10]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8
  %3 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 2, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=6]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %3, align 4
  %4 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 2, i32 2 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=7]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8
  %5 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 2, i32 3 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"***> [#uses=10]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4
  %6 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 3, i32 0 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %6, align 8
  %7 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 3, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=4]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %7, align 4
  %8 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 3, i32 2 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %8, align 8
  %9 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l, i32 0, i32 0, i32 0, i32 3, i32 3 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"***> [#uses=5]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %9, align 4
  store i32 8, i32* %1, align 4
  %10 = invoke i8* @_Znwj(i32 32)
          to label %_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i unwind label %lpad.i.i4 ; <i8*> [#uses=2]

lpad.i.i4:                                        ; preds = %entry
  %eh_ptr.i.i2 = call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select3.i.i3 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i2, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i2)
          to label %.noexc7 unwind label %lpad.i.i

.noexc7:                                          ; preds = %lpad.i.i4
  unreachable

_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i: ; preds = %entry
  %11 = bitcast i8* %10 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8
  %12 = getelementptr inbounds i8* %10, i32 12    ; <i8*> [#uses=1]
  %13 = bitcast i8* %12 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  br label %bb1.i.i

bb.i.i5:                                          ; preds = %bb1.i.i
  %14 = invoke i8* @_Znwj(i32 512)
          to label %invcont.i.i unwind label %lpad.i2.i ; <i8*> [#uses=1]

invcont.i.i:                                      ; preds = %bb.i.i5
  %15 = bitcast i8* %14 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %15, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__cur.0.i.i, align 4
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %invcont.i.i, %_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i
  %indvar.i.i = phi i32 [ 0, %_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i ], [ %indvar.next.i.i, %invcont.i.i ] ; <i32> [#uses=3]
  %.sum32 = add i32 %indvar.i.i, 3                ; <i32> [#uses=3]
  %__cur.0.i.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, i32 %.sum32 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %16 = icmp slt i32 %.sum32, 4                   ; <i1> [#uses=1]
  br i1 %16, label %bb.i.i5, label %invcont

invcont3.i.i:                                     ; preds = %bb.i.i.i6, %lpad.i2.i
  invoke void @__cxa_rethrow() noreturn
          to label %invcont4.i.i unwind label %lpad12.i.i

invcont4.i.i:                                     ; preds = %invcont3.i.i
  unreachable

invcont7.i.i:                                     ; preds = %lpad12.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr13.i.i)
          to label %.noexc.i unwind label %invcont1.i

.noexc.i:                                         ; preds = %invcont7.i.i
  unreachable

lpad.i2.i:                                        ; preds = %bb.i.i5
  %eh_ptr.i1.i = call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select11.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i1.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %17 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i1.i) nounwind ; <i8*> [#uses=0]
  %18 = icmp sgt i32 %.sum32, 3                   ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i.i6, label %invcont3.i.i

bb.i.i.i6:                                        ; preds = %bb.i.i.i6, %lpad.i2.i
  %indvar.i.i.i = phi i32 [ %tmp.i.i, %bb.i.i.i6 ], [ 0, %lpad.i2.i ] ; <i32> [#uses=2]
  %tmp.i.i = add i32 %indvar.i.i.i, 1             ; <i32> [#uses=2]
  %.sum = add i32 %indvar.i.i.i, 3                ; <i32> [#uses=1]
  %__n.01.i.i.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, i32 %.sum ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %19 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__n.01.i.i.i, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %20 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %19 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %20) nounwind
  %21 = icmp slt i32 %tmp.i.i, %indvar.i.i        ; <i1> [#uses=1]
  br i1 %21, label %bb.i.i.i6, label %invcont3.i.i

lpad12.i.i:                                       ; preds = %invcont3.i.i
  %eh_ptr13.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select15.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr13.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont7.i.i unwind label %lpad16.i.i

lpad16.i.i:                                       ; preds = %lpad12.i.i
  %eh_ptr17.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select19.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr17.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

invcont1.i:                                       ; preds = %invcont7.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select9.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %22 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i) nounwind ; <i8*> [#uses=0]
  %23 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %24 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %23 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %24) nounwind
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** null, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8
  store i32 0, i32* %1, align 4
  invoke void @__cxa_rethrow() noreturn
          to label %invcont2.i unwind label %lpad10.i

invcont2.i:                                       ; preds = %invcont1.i
  unreachable

invcont5.i:                                       ; preds = %lpad10.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr11.i)
          to label %.noexc8 unwind label %lpad.i.i

.noexc8:                                          ; preds = %invcont5.i
  unreachable

lpad10.i:                                         ; preds = %invcont1.i
  %eh_ptr11.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select13.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr11.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont5.i unwind label %lpad14.i

lpad14.i:                                         ; preds = %lpad10.i
  %eh_ptr15.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select17.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr15.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad.i.i:                                         ; preds = %invcont5.i, %lpad.i.i4
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select3.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
  unreachable

invcont:                                          ; preds = %bb1.i.i
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %13, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4
  %25 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %13, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=5]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %25, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %3, align 4
  %26 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %25, i32 128 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %26, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %13, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %9, align 4
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %25, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %7, align 4
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %26, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %8, align 8
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %25, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %25, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %6, align 8
  %27 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 2, i32 4), align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %28 = getelementptr inbounds [4096 x i8]* %buff, i32 0, i32 0 ; <i8*> [#uses=2]
  %29 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %27, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %30 = load i32 (...)*** %29, align 4            ; <i32 (...)**> [#uses=1]
  %31 = getelementptr inbounds i32 (...)** %30, i32 3 ; <i32 (...)**> [#uses=1]
  %32 = load i32 (...)** %31, align 4             ; <i32 (...)*> [#uses=1]
  %33 = bitcast i32 (...)* %32 to %"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %34 = invoke %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %33(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %27, i8* %28, i32 4096)
          to label %invcont2 unwind label %lpad   ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=0]

invcont2:                                         ; preds = %invcont
  %35 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 1, i32 4), align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %36 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %35, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %37 = load i32 (...)*** %36, align 4            ; <i32 (...)**> [#uses=1]
  %38 = getelementptr inbounds i32 (...)** %37, i32 3 ; <i32 (...)**> [#uses=1]
  %39 = load i32 (...)** %38, align 4             ; <i32 (...)*> [#uses=1]
  %40 = bitcast i32 (...)* %39 to %"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"* (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %41 = invoke %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %40(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %35, i8* %28, i32 4096)
          to label %bb15.preheader unwind label %lpad ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=0]

bb15.preheader:                                   ; preds = %invcont2
  %42 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0 ; <i8*> [#uses=4]
  %43 = ptrtoint [256 x i8]* %line to i32         ; <i32> [#uses=1]
  br label %bb15

bb2.i10:                                          ; preds = %invcont17
  %44 = call i32 @strlen(i8* %42) nounwind readonly ; <i32> [#uses=3]
  %45 = icmp eq i32 %44, 0                        ; <i1> [#uses=1]
  br i1 %45, label %invcont4, label %bb23.i

bb23.i:                                           ; preds = %bb2.i10
  %46 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 %44 ; <i8*> [#uses=1]
  %47 = ptrtoint i8* %46 to i32                   ; <i32> [#uses=1]
  %48 = sub i32 %47, %43                          ; <i32> [#uses=9]
  %49 = icmp ugt i32 %48, 1073741820              ; <i1> [#uses=1]
  br i1 %49, label %bb.i.i9, label %bb1.i.i10

bb.i.i9:                                          ; preds = %bb23.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc17 unwind label %lpad33

.noexc17:                                         ; preds = %bb.i.i9
  unreachable

bb1.i.i10:                                        ; preds = %bb23.i
  %50 = add i32 %48, 29                           ; <i32> [#uses=2]
  %51 = icmp ugt i32 %50, 4096                    ; <i1> [#uses=1]
  %52 = icmp ne i32 %44, 0                        ; <i1> [#uses=1]
  %53 = and i1 %51, %52                           ; <i1> [#uses=1]
  br i1 %53, label %bb7.i.i, label %bb10.i.i

bb7.i.i:                                          ; preds = %bb1.i.i10
  %54 = and i32 %50, 4095                         ; <i32> [#uses=1]
  %55 = sub i32 4096, %54                         ; <i32> [#uses=1]
  %56 = add i32 %55, %48                          ; <i32> [#uses=2]
  %57 = icmp ugt i32 %56, 1073741820              ; <i1> [#uses=1]
  %__capacity_addr.2.i.i = select i1 %57, i32 1073741820, i32 %56 ; <i32> [#uses=2]
  br label %bb10.i.i

bb10.i.i:                                         ; preds = %bb7.i.i, %bb1.i.i10
  %__size.0.in.i.i = phi i32 [ %__capacity_addr.2.i.i, %bb7.i.i ], [ %48, %bb1.i.i10 ] ; <i32> [#uses=1]
  %__capacity_addr.1.i.i = phi i32 [ %__capacity_addr.2.i.i, %bb7.i.i ], [ %48, %bb1.i.i10 ] ; <i32> [#uses=1]
  %__size.0.i.i = add i32 %__size.0.in.i.i, 13    ; <i32> [#uses=1]
  %58 = invoke i8* @_Znwj(i32 %__size.0.i.i)
          to label %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i unwind label %lpad.i.i12 ; <i8*> [#uses=5]

lpad.i.i12:                                       ; preds = %bb10.i.i
  %eh_ptr.i.i11 = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select14.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i11, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i11)
          to label %.noexc18 unwind label %lpad33

.noexc18:                                         ; preds = %lpad.i.i12
  unreachable

_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i:            ; preds = %bb10.i.i
  %59 = getelementptr inbounds i8* %58, i32 4     ; <i8*> [#uses=1]
  %60 = bitcast i8* %59 to i32*                   ; <i32*> [#uses=1]
  store i32 %__capacity_addr.1.i.i, i32* %60, align 4
  %61 = getelementptr inbounds i8* %58, i32 8     ; <i8*> [#uses=1]
  %62 = bitcast i8* %61 to i32*                   ; <i32*> [#uses=2]
  store i32 0, i32* %62, align 4
  %63 = getelementptr inbounds i8* %58, i32 12    ; <i8*> [#uses=3]
  %64 = icmp eq i32 %48, 1                        ; <i1> [#uses=1]
  br i1 %64, label %bb.i.i.i13, label %bb1.i.i.i14

bb.i.i.i13:                                       ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i
  %65 = load i8* %42, align 1                     ; <i8> [#uses=1]
  store i8 %65, i8* %63
  br label %bb30.i

bb1.i.i.i14:                                      ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i
  call void @llvm.memcpy.i32(i8* %63, i8* %42, i32 %48, i32 1) nounwind
  br label %bb30.i

bb30.i:                                           ; preds = %bb1.i.i.i14, %bb.i.i.i13
  store i32 0, i32* %62, align 4
  %66 = bitcast i8* %58 to i32*                   ; <i32*> [#uses=1]
  store i32 %48, i32* %66, align 4
  %.sum.i15 = add i32 %48, 12                     ; <i32> [#uses=1]
  %67 = getelementptr inbounds i8* %58, i32 %.sum.i15 ; <i8*> [#uses=1]
  %68 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %68, i8* %67, align 1
  br label %invcont4

invcont4:                                         ; preds = %bb30.i, %bb2.i10
  %69 = phi i8* [ %63, %bb30.i ], [ bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), %bb2.i10 ] ; <i8*> [#uses=14]
  %70 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=4]
  %71 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %3, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %72 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %70, %71 ; <i1> [#uses=1]
  br i1 %72, label %bb1.i, label %bb.i

bb.i:                                             ; preds = %invcont4
  %73 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %70, i32 -1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %74 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %73, null ; <i1> [#uses=1]
  br i1 %74, label %_ZN9__gnu_cxx13new_allocatorISsE9constructEPSsRKSs.exit.i, label %bb.i.i19

bb.i.i19:                                         ; preds = %bb.i
  %75 = getelementptr inbounds i8* %69, i32 -12   ; <i8*> [#uses=2]
  %76 = getelementptr inbounds i8* %69, i32 -4    ; <i8*> [#uses=1]
  %77 = bitcast i8* %76 to i32*                   ; <i32*> [#uses=3]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=2]
  %toBool.i.i.i.i.i = icmp slt i32 %78, 0         ; <i1> [#uses=1]
  br i1 %toBool.i.i.i.i.i, label %bb12.i.i.i.i.i, label %bb11.i.i.i.i.i

bb11.i.i.i.i.i:                                   ; preds = %bb.i.i19
  %79 = icmp eq i8* %75, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %79, label %bb2.i.i20, label %bb.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb11.i.i.i.i.i
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i.i, label %bb1.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %80 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %77, i32 1) nounwind ; <i32> [#uses=0]
  br label %bb2.i.i20

bb1.i.i.i.i.i.i.i:                                ; preds = %bb.i.i.i.i.i.i
  %81 = add nsw i32 %78, 1                        ; <i32> [#uses=1]
  store i32 %81, i32* %77, align 4
  br label %bb2.i.i20

bb12.i.i.i.i.i:                                   ; preds = %bb.i.i19
  %82 = bitcast i8* %75 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*> [#uses=1]
  %83 = invoke fastcc i8* @_ZNSs4_Rep8_M_cloneERKSaIcEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %82)
          to label %bb2.i.i20 unwind label %ppad.i.i.i.i ; <i8*> [#uses=1]

ppad.i.i.i.i:                                     ; preds = %bb12.i.i.i.i.i
  %eh_ptr19.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select21.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr19.i.i.i.i)
          to label %.noexc.i.i unwind label %lpad.i.i22

.noexc.i.i:                                       ; preds = %ppad.i.i.i.i
  unreachable

bb2.i.i20:                                        ; preds = %bb12.i.i.i.i.i, %bb1.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i, %bb11.i.i.i.i.i
  %84 = phi i8* [ %69, %bb1.i.i.i.i.i.i.i ], [ %69, %bb.i.i.i.i.i.i.i ], [ %69, %bb11.i.i.i.i.i ], [ %83, %bb12.i.i.i.i.i ] ; <i8*> [#uses=1]
  %85 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %70, i32 -1, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* %84, i8** %85, align 4
  %.pre.i = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  br label %_ZN9__gnu_cxx13new_allocatorISsE9constructEPSsRKSs.exit.i

lpad.i.i22:                                       ; preds = %ppad.i.i.i.i
  %eh_ptr.i.i21 = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select6.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i21, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i21)
          to label %.noexc25 unwind label %lpad37

.noexc25:                                         ; preds = %lpad.i.i22
  unreachable

_ZN9__gnu_cxx13new_allocatorISsE9constructEPSsRKSs.exit.i: ; preds = %bb2.i.i20, %bb.i
  %86 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %.pre.i, %bb2.i.i20 ], [ %70, %bb.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %87 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %86, i32 -1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %87, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8
  br label %bb9

bb1.i:                                            ; preds = %invcont4
  %88 = getelementptr inbounds i8* %69, i32 -12   ; <i8*> [#uses=2]
  %89 = getelementptr inbounds i8* %69, i32 -4    ; <i8*> [#uses=1]
  %90 = bitcast i8* %89 to i32*                   ; <i32*> [#uses=3]
  %91 = load i32* %90, align 4                    ; <i32> [#uses=2]
  %toBool.i.i.i.i1.i = icmp slt i32 %91, 0        ; <i1> [#uses=1]
  br i1 %toBool.i.i.i.i1.i, label %bb12.i.i.i.i6.i, label %bb11.i.i.i.i2.i

bb11.i.i.i.i2.i:                                  ; preds = %bb1.i
  %92 = icmp eq i8* %88, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %92, label %_ZNSsC1ERKSs.exit.i.i, label %bb.i.i.i.i.i3.i

bb.i.i.i.i.i3.i:                                  ; preds = %bb11.i.i.i.i2.i
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i4.i, label %bb1.i.i.i.i.i.i5.i

bb.i.i.i.i.i.i4.i:                                ; preds = %bb.i.i.i.i.i3.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %93 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %90, i32 1) nounwind ; <i32> [#uses=0]
  br label %_ZNSsC1ERKSs.exit.i.i

bb1.i.i.i.i.i.i5.i:                               ; preds = %bb.i.i.i.i.i3.i
  %94 = add nsw i32 %91, 1                        ; <i32> [#uses=1]
  store i32 %94, i32* %90, align 4
  br label %_ZNSsC1ERKSs.exit.i.i

bb12.i.i.i.i6.i:                                  ; preds = %bb1.i
  %95 = bitcast i8* %88 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*> [#uses=1]
  %96 = invoke fastcc i8* @_ZNSs4_Rep8_M_cloneERKSaIcEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %95)
          to label %_ZNSsC1ERKSs.exit.i.i unwind label %ppad.i.i.i9.i ; <i8*> [#uses=1]

ppad.i.i.i9.i:                                    ; preds = %bb12.i.i.i.i6.i
  %eh_ptr19.i.i.i7.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select21.i.i.i8.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i.i.i7.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr19.i.i.i7.i)
          to label %.noexc26 unwind label %lpad37

.noexc26:                                         ; preds = %ppad.i.i.i9.i
  unreachable

_ZNSsC1ERKSs.exit.i.i:                            ; preds = %bb12.i.i.i.i6.i, %bb1.i.i.i.i.i.i5.i, %bb.i.i.i.i.i.i4.i, %bb11.i.i.i.i2.i
  %97 = phi i8* [ %69, %bb1.i.i.i.i.i.i5.i ], [ %69, %bb.i.i.i.i.i.i4.i ], [ %69, %bb11.i.i.i.i2.i ], [ %96, %bb12.i.i.i.i6.i ] ; <i8*> [#uses=9]
  %98 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=6]
  %99 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %98 to i32 ; <i32> [#uses=4]
  %100 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  %101 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %100 to i32 ; <i32> [#uses=1]
  %102 = sub i32 %99, %101                        ; <i32> [#uses=1]
  %103 = icmp ult i32 %102, 4                     ; <i1> [#uses=1]
  br i1 %103, label %bb.i12.i.i, label %invcont.i.i23

bb.i12.i.i:                                       ; preds = %_ZNSsC1ERKSs.exit.i.i
  %104 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %9, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  %105 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %104 to i32 ; <i32> [#uses=1]
  %106 = sub i32 %105, %99                        ; <i32> [#uses=1]
  %107 = ashr i32 %106, 2                         ; <i32> [#uses=3]
  %108 = add nsw i32 %107, 1                      ; <i32> [#uses=1]
  %109 = add i32 %107, 2                          ; <i32> [#uses=3]
  %110 = load i32* %1, align 4                    ; <i32> [#uses=5]
  %111 = shl i32 %109, 1                          ; <i32> [#uses=1]
  %112 = icmp ugt i32 %110, %111                  ; <i1> [#uses=1]
  br i1 %112, label %bb.i1.i.i, label %bb6.i.i.i

bb.i1.i.i:                                        ; preds = %bb.i12.i.i
  %113 = sub i32 %110, %109                       ; <i32> [#uses=1]
  %114 = lshr i32 %113, 1                         ; <i32> [#uses=1]
  %.sum.i.i.i = add i32 %114, 1                   ; <i32> [#uses=2]
  %115 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %100, i32 %.sum.i.i.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=4]
  %116 = icmp ugt %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %98, %115 ; <i1> [#uses=1]
  %117 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %104, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %118 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %117 to i32 ; <i32> [#uses=1]
  %119 = sub i32 %118, %99                        ; <i32> [#uses=3]
  br i1 %116, label %bb4.i.i.i, label %bb5.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i1.i.i
  %120 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %115 to i8* ; <i8*> [#uses=1]
  %121 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %98 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %120, i8* %121, i32 %119, i32 4) nounwind
  br label %_ZNSt5dequeISsSaISsEE17_M_reallocate_mapEjb.exit.i.i

bb5.i.i.i:                                        ; preds = %bb.i1.i.i
  %122 = ashr i32 %119, 2                         ; <i32> [#uses=1]
  %123 = and i32 %119, -4                         ; <i32> [#uses=1]
  %.sum1.i.i.i = add i32 %.sum.i.i.i, %108        ; <i32> [#uses=1]
  %.sum4.i.i.i = sub i32 %.sum1.i.i.i, %122       ; <i32> [#uses=1]
  %124 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %100, i32 %.sum4.i.i.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %125 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %124 to i8* ; <i8*> [#uses=1]
  %126 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %98 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %125, i8* %126, i32 %123, i32 4) nounwind
  br label %_ZNSt5dequeISsSaISsEE17_M_reallocate_mapEjb.exit.i.i

bb6.i.i.i:                                        ; preds = %bb.i12.i.i
  %127 = icmp eq i32 %110, 0                      ; <i1> [#uses=1]
  %128 = select i1 %127, i32 1, i32 %110          ; <i32> [#uses=1]
  %129 = add i32 %110, 2                          ; <i32> [#uses=1]
  %130 = add i32 %129, %128                       ; <i32> [#uses=4]
  %131 = icmp ugt i32 %130, 1073741823            ; <i1> [#uses=1]
  br i1 %131, label %bb.i.i.i3.i.i, label %bb1.i.i.i4.i.i

bb.i.i.i3.i.i:                                    ; preds = %bb6.i.i.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc.i.i.i.i unwind label %lpad.i.i.i.i

.noexc.i.i.i.i:                                   ; preds = %bb.i.i.i3.i.i
  unreachable

bb1.i.i.i4.i.i:                                   ; preds = %bb6.i.i.i
  %132 = shl i32 %130, 2                          ; <i32> [#uses=1]
  %133 = invoke i8* @_Znwj(i32 %132)
          to label %_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i.i.i unwind label %lpad.i.i.i.i ; <i8*> [#uses=1]

lpad.i.i.i.i:                                     ; preds = %bb1.i.i.i4.i.i, %bb.i.i.i3.i.i
  %eh_ptr.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select3.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i.i)
          to label %.noexc5.i.i unwind label %lpad.i12.i

.noexc5.i.i:                                      ; preds = %lpad.i.i.i.i
  unreachable

_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i.i.i: ; preds = %bb1.i.i.i4.i.i
  %134 = bitcast i8* %133 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %135 = sub i32 %130, %109                       ; <i32> [#uses=1]
  %136 = lshr i32 %135, 1                         ; <i32> [#uses=1]
  %.sum3.i.i.i = add i32 %136, 1                  ; <i32> [#uses=1]
  %137 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %134, i32 %.sum3.i.i.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %138 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %104, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %139 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %138 to i32 ; <i32> [#uses=1]
  %140 = sub i32 %139, %99                        ; <i32> [#uses=1]
  %141 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %137 to i8* ; <i8*> [#uses=1]
  %142 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %98 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %141, i8* %142, i32 %140, i32 4) nounwind
  %143 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %144 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %143 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %144) nounwind
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %134, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %0, align 8
  store i32 %130, i32* %1, align 4
  br label %_ZNSt5dequeISsSaISsEE17_M_reallocate_mapEjb.exit.i.i

_ZNSt5dequeISsSaISsEE17_M_reallocate_mapEjb.exit.i.i: ; preds = %_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i.i.i, %bb5.i.i.i, %bb4.i.i.i
  %__new_nstart.0.i.i.i = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** [ %115, %bb4.i.i.i ], [ %115, %bb5.i.i.i ], [ %137, %_ZNSt11_Deque_baseISsSaISsEE15_M_allocate_mapEj.exit.i.i.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=4]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__new_nstart.0.i.i.i, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4
  %145 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__new_nstart.0.i.i.i, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %145, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %3, align 4
  %146 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %145, i32 128 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %146, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8
  %147 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__new_nstart.0.i.i.i, i32 %107 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %147, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %9, align 4
  %148 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %147, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %148, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %7, align 4
  %149 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %148, i32 128 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %149, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %8, align 8
  br label %invcont.i.i23

invcont.i.i23:                                    ; preds = %_ZNSt5dequeISsSaISsEE17_M_reallocate_mapEjb.exit.i.i, %_ZNSsC1ERKSs.exit.i.i
  %150 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** [ %__new_nstart.0.i.i.i, %_ZNSt5dequeISsSaISsEE17_M_reallocate_mapEjb.exit.i.i ], [ %98, %_ZNSsC1ERKSs.exit.i.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %151 = invoke i8* @_Znwj(i32 512)
          to label %invcont2.i.i unwind label %lpad.i12.i ; <i8*> [#uses=1]

invcont2.i.i:                                     ; preds = %invcont.i.i23
  %152 = bitcast i8* %151 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %153 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %150, i32 -1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %152, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %153, align 4
  %154 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %155 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %154, i32 -1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %155, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4
  %156 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %155, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=4]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %156, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %3, align 4
  %157 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %156, i32 128 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %157, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8
  %158 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %156, i32 127 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %158, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8
  %159 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %158, null ; <i1> [#uses=1]
  br i1 %159, label %bb16.i.i, label %bb.i8.i.i

bb.i8.i.i:                                        ; preds = %invcont2.i.i
  %160 = getelementptr inbounds i8* %97, i32 -12  ; <i8*> [#uses=2]
  %161 = getelementptr inbounds i8* %97, i32 -4   ; <i8*> [#uses=1]
  %162 = bitcast i8* %161 to i32*                 ; <i32*> [#uses=3]
  %163 = load i32* %162, align 4                  ; <i32> [#uses=2]
  %toBool.i.i.i.i.i.i = icmp slt i32 %163, 0      ; <i1> [#uses=1]
  br i1 %toBool.i.i.i.i.i.i, label %bb12.i.i.i.i.i.i, label %bb11.i.i.i.i.i.i

bb11.i.i.i.i.i.i:                                 ; preds = %bb.i8.i.i
  %164 = icmp eq i8* %160, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %164, label %bb2.i.i.i, label %bb.i.i.i.i.i9.i.i

bb.i.i.i.i.i9.i.i:                                ; preds = %bb11.i.i.i.i.i.i
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i.i.i, label %bb1.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %bb.i.i.i.i.i9.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %165 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %162, i32 1) nounwind ; <i32> [#uses=0]
  br label %bb2.i.i.i

bb1.i.i.i.i.i.i.i.i:                              ; preds = %bb.i.i.i.i.i9.i.i
  %166 = add nsw i32 %163, 1                      ; <i32> [#uses=1]
  store i32 %166, i32* %162, align 4
  br label %bb2.i.i.i

bb12.i.i.i.i.i.i:                                 ; preds = %bb.i8.i.i
  %167 = bitcast i8* %160 to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*> [#uses=1]
  %168 = invoke fastcc i8* @_ZNSs4_Rep8_M_cloneERKSaIcEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* %167)
          to label %bb2.i.i.i unwind label %ppad.i.i.i.i.i ; <i8*> [#uses=1]

ppad.i.i.i.i.i:                                   ; preds = %bb12.i.i.i.i.i.i
  %eh_ptr19.i.i.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select21.i.i.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i.i.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr19.i.i.i.i.i)
          to label %.noexc.i.i.i unwind label %lpad.i.i.i

.noexc.i.i.i:                                     ; preds = %ppad.i.i.i.i.i
  unreachable

bb2.i.i.i:                                        ; preds = %bb12.i.i.i.i.i.i, %bb1.i.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i.i, %bb11.i.i.i.i.i.i
  %169 = phi i8* [ %97, %bb1.i.i.i.i.i.i.i.i ], [ %97, %bb.i.i.i.i.i.i.i.i ], [ %97, %bb11.i.i.i.i.i.i ], [ %168, %bb12.i.i.i.i.i.i ] ; <i8*> [#uses=1]
  %170 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %156, i32 127, i32 0, i32 0 ; <i8**> [#uses=1]
  store i8* %169, i8** %170, align 4
  br label %bb16.i.i

lpad.i.i.i:                                       ; preds = %ppad.i.i.i.i.i
  %eh_ptr.i.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select6.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i.i)
          to label %.noexc.i10.i unwind label %lpad19.i.i

.noexc.i10.i:                                     ; preds = %lpad.i.i.i
  unreachable

invcont5.i.i:                                     ; preds = %bb.i.i.i24, %lpad19.i.i
  %171 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %172 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %171, i32 -1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %173 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %172, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %174 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %173 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %174) nounwind
  invoke void @__cxa_rethrow() noreturn
          to label %invcont6.i.i unwind label %lpad23.i.i

invcont6.i.i:                                     ; preds = %invcont5.i.i
  unreachable

invcont14.i.i:                                    ; preds = %bb2.i.i.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i, %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc27 unwind label %lpad37

.noexc27:                                         ; preds = %invcont14.i.i
  unreachable

bb16.i.i:                                         ; preds = %bb2.i.i.i, %invcont2.i.i
  %175 = getelementptr inbounds i8* %97, i32 -12  ; <i8*> [#uses=2]
  %176 = icmp eq i8* %175, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %176, label %bb9, label %bb.i.i1.i.i

bb.i.i1.i.i:                                      ; preds = %bb16.i.i
  %177 = getelementptr inbounds i8* %97, i32 -4   ; <i8*> [#uses=1]
  %178 = bitcast i8* %177 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2.i.i, label %bb1.i.i.i3.i.i

bb.i.i.i2.i.i:                                    ; preds = %bb.i.i1.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %179 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %178, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i.i

bb1.i.i.i3.i.i:                                   ; preds = %bb.i.i1.i.i
  %180 = load i32* %178, align 4                  ; <i32> [#uses=2]
  %181 = add nsw i32 %180, -1                     ; <i32> [#uses=1]
  store i32 %181, i32* %178, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i.i: ; preds = %bb1.i.i.i3.i.i, %bb.i.i.i2.i.i
  %182 = phi i32 [ %180, %bb1.i.i.i3.i.i ], [ %179, %bb.i.i.i2.i.i ] ; <i32> [#uses=1]
  %183 = icmp slt i32 %182, 1                     ; <i1> [#uses=1]
  br i1 %183, label %bb2.i.i5.i.i, label %bb9

bb2.i.i5.i.i:                                     ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i.i
  call void @_ZdlPv(i8* %175) nounwind
  br label %bb9

lpad.i12.i:                                       ; preds = %invcont.i.i23, %lpad.i.i.i.i
  %eh_ptr.i11.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select18.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i11.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad19.i.i:                                       ; preds = %lpad.i.i.i
  %eh_ptr20.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select22.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr20.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %184 = call i8* @__cxa_begin_catch(i8* %eh_ptr20.i.i) nounwind ; <i8*> [#uses=0]
  %185 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %186 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %185, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %186, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8
  %187 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %188 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %186, %187 ; <i1> [#uses=1]
  br i1 %188, label %bb.i.i.i24, label %invcont5.i.i

bb.i.i.i24:                                       ; preds = %lpad19.i.i
  %189 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %190 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %189, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %190, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4
  %191 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %190, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=3]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %191, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %3, align 4
  %192 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %191, i32 128 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %192, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8
  store %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %191, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8
  br label %invcont5.i.i

lpad23.i.i:                                       ; preds = %invcont5.i.i
  %eh_ptr24.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select26.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %ppad.i.i unwind label %lpad27.i.i

lpad27.i.i:                                       ; preds = %lpad23.i.i
  %eh_ptr28.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select30.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr28.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i.i:                                         ; preds = %lpad23.i.i, %lpad.i12.i
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i11.i, %lpad.i12.i ], [ %eh_ptr24.i.i, %lpad23.i.i ] ; <i8*> [#uses=1]
  %193 = getelementptr inbounds i8* %97, i32 -12  ; <i8*> [#uses=2]
  %194 = icmp eq i8* %193, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %194, label %invcont14.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %ppad.i.i
  %195 = getelementptr inbounds i8* %97, i32 -4   ; <i8*> [#uses=1]
  %196 = bitcast i8* %195 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i, label %bb1.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %197 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %196, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i

bb1.i.i.i.i.i:                                    ; preds = %bb.i.i.i.i
  %198 = load i32* %196, align 4                  ; <i32> [#uses=2]
  %199 = add nsw i32 %198, -1                     ; <i32> [#uses=1]
  store i32 %199, i32* %196, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i: ; preds = %bb1.i.i.i.i.i, %bb.i.i.i.i.i
  %200 = phi i32 [ %198, %bb1.i.i.i.i.i ], [ %197, %bb.i.i.i.i.i ] ; <i32> [#uses=1]
  %201 = icmp slt i32 %200, 1                     ; <i1> [#uses=1]
  br i1 %201, label %bb2.i.i.i.i, label %invcont14.i.i

bb2.i.i.i.i:                                      ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i
  call void @_ZdlPv(i8* %193) nounwind
  br label %invcont14.i.i

bb9:                                              ; preds = %bb2.i.i5.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4.i.i, %bb16.i.i, %_ZN9__gnu_cxx13new_allocatorISsE9constructEPSsRKSs.exit.i
  %202 = getelementptr inbounds i8* %69, i32 -12  ; <i8*> [#uses=2]
  %203 = icmp eq i8* %202, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %203, label %bb15, label %bb.i.i2

bb.i.i2:                                          ; preds = %bb9
  %204 = getelementptr inbounds i8* %69, i32 -4   ; <i8*> [#uses=1]
  %205 = bitcast i8* %204 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i3, label %bb1.i.i.i4

bb.i.i.i3:                                        ; preds = %bb.i.i2
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %206 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %205, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5

bb1.i.i.i4:                                       ; preds = %bb.i.i2
  %207 = load i32* %205, align 4                  ; <i32> [#uses=2]
  %208 = add nsw i32 %207, -1                     ; <i32> [#uses=1]
  store i32 %208, i32* %205, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5: ; preds = %bb1.i.i.i4, %bb.i.i.i3
  %209 = phi i32 [ %207, %bb1.i.i.i4 ], [ %206, %bb.i.i.i3 ] ; <i32> [#uses=1]
  %210 = icmp slt i32 %209, 1                     ; <i1> [#uses=1]
  br i1 %210, label %bb2.i.i6, label %bb15

bb2.i.i6:                                         ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5
  call void @_ZdlPv(i8* %202) nounwind
  br label %bb15

bb15:                                             ; preds = %bb2.i.i6, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5, %bb9, %bb15.preheader
  %211 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %212 = getelementptr inbounds i32 (...)** %211, i32 -3 ; <i32 (...)**> [#uses=1]
  %213 = bitcast i32 (...)** %212 to i32*         ; <i32*> [#uses=1]
  %214 = load i32* %213, align 4                  ; <i32> [#uses=1]
  %215 = add i32 %214, ptrtoint (%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin to i32) ; <i32> [#uses=1]
  %216 = inttoptr i32 %215 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %216, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %217 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 10)
          to label %.noexc unwind label %lpad     ; <i8> [#uses=1]

.noexc:                                           ; preds = %bb15
  %218 = invoke %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZSt3cin, i8* %42, i32 256, i8 signext %217)
          to label %invcont16 unwind label %lpad  ; <%"struct.std::basic_istream<char,std::char_traits<char> >"*> [#uses=2]

invcont16:                                        ; preds = %.noexc
  %219 = getelementptr inbounds %"struct.std::basic_istream<char,std::char_traits<char> >"* %218, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %220 = load i32 (...)*** %219, align 4          ; <i32 (...)**> [#uses=1]
  %221 = getelementptr inbounds i32 (...)** %220, i32 -3 ; <i32 (...)**> [#uses=1]
  %222 = bitcast i32 (...)** %221 to i32*         ; <i32*> [#uses=1]
  %223 = load i32* %222, align 4                  ; <i32> [#uses=1]
  %224 = ptrtoint %"struct.std::basic_istream<char,std::char_traits<char> >"* %218 to i32 ; <i32> [#uses=1]
  %225 = add i32 %223, %224                       ; <i32> [#uses=2]
  %226 = inttoptr i32 %225 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %227 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %226, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %228 = load i32* %227, align 4                  ; <i32> [#uses=1]
  %229 = and i32 %228, 5                          ; <i32> [#uses=1]
  %230 = icmp eq i32 %229, 0                      ; <i1> [#uses=1]
  br i1 %230, label %invcont17, label %invcont20

invcont17:                                        ; preds = %invcont16
  %231 = inttoptr i32 %225 to i8*                 ; <i8*> [#uses=1]
  %232 = icmp eq i8* %231, null                   ; <i1> [#uses=1]
  br i1 %232, label %invcont20, label %bb2.i10

invcont20:                                        ; preds = %invcont17, %invcont16
  %233 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %6, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %234 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %7, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %235 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %9, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %236 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=3]
  %237 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %4, align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %238 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %5, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %239 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %235 to i32 ; <i32> [#uses=1]
  %240 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %238 to i32 ; <i32> [#uses=1]
  %241 = sub i32 %239, %240                       ; <i32> [#uses=1]
  %242 = shl i32 %241, 5                          ; <i32> [#uses=1]
  %243 = add i32 %242, -128                       ; <i32> [#uses=1]
  %244 = and i32 %243, -128                       ; <i32> [#uses=1]
  %245 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %233 to i32 ; <i32> [#uses=1]
  %246 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %234 to i32 ; <i32> [#uses=1]
  %247 = sub i32 %245, %246                       ; <i32> [#uses=1]
  %248 = ashr i32 %247, 2                         ; <i32> [#uses=1]
  %249 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %237 to i32 ; <i32> [#uses=1]
  %250 = ptrtoint %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %236 to i32 ; <i32> [#uses=1]
  %251 = sub i32 %249, %250                       ; <i32> [#uses=1]
  %252 = ashr i32 %251, 2                         ; <i32> [#uses=2]
  %253 = add nsw i32 %244, %248                   ; <i32> [#uses=2]
  %__n.06.i = add i32 %252, %253                  ; <i32> [#uses=1]
  %254 = icmp sgt i32 %__n.06.i, 0                ; <i1> [#uses=1]
  br i1 %254, label %bb.nph.i, label %invcont23

bb.nph.i:                                         ; preds = %invcont20
  %tmp8.i = add i32 %253, %252                    ; <i32> [#uses=1]
  br label %bb.i28

bb.i28:                                           ; preds = %bb5.backedge.i, %bb.nph.i
  %.338.1 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** [ %238, %bb.nph.i ], [ %.338.0, %bb5.backedge.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %.237.1 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %237, %bb.nph.i ], [ %.237.0, %bb5.backedge.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %.035.1 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %236, %bb.nph.i ], [ %.035.0, %bb5.backedge.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %255 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %236, %bb.nph.i ], [ %.rle9.i, %bb5.backedge.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %indvar.i = phi i32 [ 0, %bb.nph.i ], [ %indvar.next.i, %bb5.backedge.i ] ; <i32> [#uses=1]
  %256 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %255, i32 0, i32 0, i32 0 ; <i8**> [#uses=1]
  %257 = load i8** %256, align 4                  ; <i8*> [#uses=2]
  %258 = getelementptr inbounds i8* %257, i32 -12 ; <i8*> [#uses=1]
  %259 = bitcast i8* %258 to i32*                 ; <i32*> [#uses=1]
  %260 = load i32* %259, align 4                  ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* %257, i32 %260)
          to label %bb.i1.i unwind label %lpad

bb.i1.i:                                          ; preds = %bb.i28
  %261 = call i32 @strlen(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)) nounwind readonly ; <i32> [#uses=1]
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), i32 %261)
          to label %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i unwind label %lpad

_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i: ; preds = %bb.i1.i
  %262 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %.035.1, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=3]
  %263 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %262, %.237.1 ; <i1> [#uses=1]
  br i1 %263, label %bb.i.i29, label %bb5.backedge.i

bb.i.i29:                                         ; preds = %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i
  %264 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %.338.1, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %265 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %264, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=3]
  %266 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %265, i32 128 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  br label %bb5.backedge.i

bb5.backedge.i:                                   ; preds = %bb.i.i29, %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i
  %.338.0 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** [ %264, %bb.i.i29 ], [ %.338.1, %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %.237.0 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %266, %bb.i.i29 ], [ %.237.1, %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %.035.0 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %265, %bb.i.i29 ], [ %262, %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %.rle9.i = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* [ %265, %bb.i.i29 ], [ %262, %_ZNSt16ostream_iteratorISscSt11char_traitsIcEEaSERKSs.exit.i ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i, %tmp8.i ; <i1> [#uses=1]
  br i1 %exitcond.i, label %invcont23, label %bb.i28

invcont23:                                        ; preds = %bb5.backedge.i, %invcont20
  call fastcc void @_ZNSt5dequeISsSaISsEED2Ev(%"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l)
  ret i32 0

invcont27:                                        ; preds = %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.1)
  unreachable

lpad:                                             ; preds = %bb.i1.i, %bb.i28, %.noexc, %bb15, %invcont2, %invcont
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select32 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad33:                                           ; preds = %lpad.i.i12, %bb.i.i9
  %eh_ptr34 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select36 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr34, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad37:                                           ; preds = %invcont14.i.i, %ppad.i.i.i9.i, %lpad.i.i22
  %eh_ptr38 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=4]
  %eh_select40 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr38, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %267 = getelementptr inbounds i8* %69, i32 -12  ; <i8*> [#uses=2]
  %268 = icmp eq i8* %267, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %268, label %ppad, label %bb.i.i

bb.i.i:                                           ; preds = %lpad37
  %269 = getelementptr inbounds i8* %69, i32 -4   ; <i8*> [#uses=1]
  %270 = bitcast i8* %269 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %271 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %270, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i
  %272 = load i32* %270, align 4                  ; <i32> [#uses=2]
  %273 = add nsw i32 %272, -1                     ; <i32> [#uses=1]
  store i32 %273, i32* %270, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i: ; preds = %bb1.i.i.i, %bb.i.i.i
  %274 = phi i32 [ %272, %bb1.i.i.i ], [ %271, %bb.i.i.i ] ; <i32> [#uses=1]
  %275 = icmp slt i32 %274, 1                     ; <i1> [#uses=1]
  br i1 %275, label %bb2.i.i, label %ppad

bb2.i.i:                                          ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i
  call void @_ZdlPv(i8* %267) nounwind
  br label %ppad

lpad45:                                           ; preds = %ppad
  %eh_ptr46 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=1]
  %eh_select48 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr46, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad:                                             ; preds = %bb2.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i, %lpad37, %lpad33, %lpad
  %eh_exception.1 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr34, %lpad33 ], [ %eh_ptr38, %bb2.i.i ], [ %eh_ptr38, %lpad37 ], [ %eh_ptr38, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSt5dequeISsSaISsEED2Ev(%"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %l)
          to label %invcont27 unwind label %lpad45
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<char>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<char>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<char>"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<char>"*)

declare void @__cxa_rethrow() noreturn

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZdlPv(i8*) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare i32 @strlen(i8* nocapture) nounwind readonly

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

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

declare void @llvm.memory.barrier(i1, i1, i1, i1, i1) nounwind

declare i32 @llvm.atomic.load.add.i32.p0i32(i32* nocapture, i32) nounwind

define internal fastcc void @_ZNSt5dequeISsSaISsEED2Ev(%"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* nocapture %this) {
invcont1:
  %0 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 3, i32 0 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %1 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %0, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=4]
  %2 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 3, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %3 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %2, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=3]
  %4 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 3, i32 3 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"***> [#uses=2]
  %5 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %4, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  %6 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 2, i32 0 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %7 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %6, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=6]
  %8 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 2, i32 2 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %9 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %8, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %10 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 2, i32 3 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"***> [#uses=2]
  %11 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %10, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=4]
  %__node.038.i = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %12 = icmp ugt %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %5, %__node.038.i ; <i1> [#uses=1]
  br i1 %12, label %bb.i2, label %bb4.i

bb.i2:                                            ; preds = %bb3.loopexit.i, %invcont1
  %indvar.i = phi i32 [ %tmp53.i, %bb3.loopexit.i ], [ 0, %invcont1 ] ; <i32> [#uses=2]
  %tmp51.i = add i32 %indvar.i, 2                 ; <i32> [#uses=1]
  %__node.0.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, i32 %tmp51.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %tmp53.i = add i32 %indvar.i, 1                 ; <i32> [#uses=2]
  %__node.039.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, i32 %tmp53.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %13 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__node.039.i, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  br label %bb.i.i.i29.i

bb.i.i.i29.i:                                     ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i, %bb.i2
  %indvar.i.i.i25.i = phi i32 [ 0, %bb.i2 ], [ %tmp.i26.i, %_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i ] ; <i32> [#uses=2]
  %scevgep23.i.i.i28.i = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %13, i32 %indvar.i.i.i25.i, i32 0, i32 0 ; <i8**> [#uses=1]
  %tmp.i26.i = add i32 %indvar.i.i.i25.i, 1       ; <i32> [#uses=2]
  %14 = load i8** %scevgep23.i.i.i28.i, align 4   ; <i8*> [#uses=2]
  %15 = getelementptr inbounds i8* %14, i32 -12   ; <i8*> [#uses=2]
  %16 = icmp eq i8* %15, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %16, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i, label %bb.i.i.i.i.i.i30.i

bb.i.i.i.i.i.i30.i:                               ; preds = %bb.i.i.i29.i
  %17 = getelementptr inbounds i8* %14, i32 -4    ; <i8*> [#uses=1]
  %18 = bitcast i8* %17 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i.i31.i, label %bb1.i.i.i.i.i.i.i32.i

bb.i.i.i.i.i.i.i31.i:                             ; preds = %bb.i.i.i.i.i.i30.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %19 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %18, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i33.i

bb1.i.i.i.i.i.i.i32.i:                            ; preds = %bb.i.i.i.i.i.i30.i
  %20 = load i32* %18, align 4                    ; <i32> [#uses=2]
  %21 = add nsw i32 %20, -1                       ; <i32> [#uses=1]
  store i32 %21, i32* %18, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i33.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i33.i: ; preds = %bb1.i.i.i.i.i.i.i32.i, %bb.i.i.i.i.i.i.i31.i
  %22 = phi i32 [ %20, %bb1.i.i.i.i.i.i.i32.i ], [ %19, %bb.i.i.i.i.i.i.i31.i ] ; <i32> [#uses=1]
  %23 = icmp slt i32 %22, 1                       ; <i1> [#uses=1]
  br i1 %23, label %bb2.i.i.i.i.i.i34.i, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i

bb2.i.i.i.i.i.i34.i:                              ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i33.i
  call void @_ZdlPv(i8* %15) nounwind
  br label %_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i

_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i:             ; preds = %bb2.i.i.i.i.i.i34.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i33.i, %bb.i.i.i29.i
  %exitcond.i = icmp eq i32 %tmp.i26.i, 128       ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb3.loopexit.i, label %bb.i.i.i29.i

bb3.loopexit.i:                                   ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i35.i
  %24 = icmp ugt %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %5, %__node.0.i ; <i1> [#uses=1]
  br i1 %24, label %bb.i2, label %bb4.i

bb4.i:                                            ; preds = %bb3.loopexit.i, %invcont1
  %25 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %11, %5 ; <i1> [#uses=1]
  br i1 %25, label %bb16.i, label %bb5.i

bb5.i:                                            ; preds = %bb4.i
  %26 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %7, %9 ; <i1> [#uses=1]
  br i1 %26, label %bb10.i, label %bb.i.i.i17.i

bb.i.i.i17.i:                                     ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i, %bb5.i
  %indvar.i.i.i13.i = phi i32 [ %tmp.i, %_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i ], [ 0, %bb5.i ] ; <i32> [#uses=2]
  %tmp.i = add i32 %indvar.i.i.i13.i, 1           ; <i32> [#uses=2]
  %scevgep.i.i.i15.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %7, i32 %tmp.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %scevgep23.i.i.i16.i = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %7, i32 %indvar.i.i.i13.i, i32 0, i32 0 ; <i8**> [#uses=1]
  %27 = load i8** %scevgep23.i.i.i16.i, align 4   ; <i8*> [#uses=2]
  %28 = getelementptr inbounds i8* %27, i32 -12   ; <i8*> [#uses=2]
  %29 = icmp eq i8* %28, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %29, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i, label %bb.i.i.i.i.i.i18.i

bb.i.i.i.i.i.i18.i:                               ; preds = %bb.i.i.i17.i
  %30 = getelementptr inbounds i8* %27, i32 -4    ; <i8*> [#uses=1]
  %31 = bitcast i8* %30 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i.i19.i, label %bb1.i.i.i.i.i.i.i20.i

bb.i.i.i.i.i.i.i19.i:                             ; preds = %bb.i.i.i.i.i.i18.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %32 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %31, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i21.i

bb1.i.i.i.i.i.i.i20.i:                            ; preds = %bb.i.i.i.i.i.i18.i
  %33 = load i32* %31, align 4                    ; <i32> [#uses=2]
  %34 = add nsw i32 %33, -1                       ; <i32> [#uses=1]
  store i32 %34, i32* %31, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i21.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i21.i: ; preds = %bb1.i.i.i.i.i.i.i20.i, %bb.i.i.i.i.i.i.i19.i
  %35 = phi i32 [ %33, %bb1.i.i.i.i.i.i.i20.i ], [ %32, %bb.i.i.i.i.i.i.i19.i ] ; <i32> [#uses=1]
  %36 = icmp slt i32 %35, 1                       ; <i1> [#uses=1]
  br i1 %36, label %bb2.i.i.i.i.i.i22.i, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i

bb2.i.i.i.i.i.i22.i:                              ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i21.i
  call void @_ZdlPv(i8* %28) nounwind
  br label %_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i

_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i:             ; preds = %bb2.i.i.i.i.i.i22.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i21.i, %bb.i.i.i17.i
  %37 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %scevgep.i.i.i15.i, %9 ; <i1> [#uses=1]
  br i1 %37, label %bb10.i, label %bb.i.i.i17.i

bb10.i:                                           ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i23.i, %bb5.i
  %38 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %3, %1 ; <i1> [#uses=1]
  br i1 %38, label %bb5, label %bb.i.i.i5.i

bb.i.i.i5.i:                                      ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i, %bb10.i
  %indvar.i.i.i1.i = phi i32 [ %tmp41.i, %_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i ], [ 0, %bb10.i ] ; <i32> [#uses=2]
  %tmp41.i = add i32 %indvar.i.i.i1.i, 1          ; <i32> [#uses=2]
  %scevgep.i.i.i3.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %3, i32 %tmp41.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %scevgep23.i.i.i4.i = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %3, i32 %indvar.i.i.i1.i, i32 0, i32 0 ; <i8**> [#uses=1]
  %39 = load i8** %scevgep23.i.i.i4.i, align 4    ; <i8*> [#uses=2]
  %40 = getelementptr inbounds i8* %39, i32 -12   ; <i8*> [#uses=2]
  %41 = icmp eq i8* %40, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %41, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i, label %bb.i.i.i.i.i.i6.i

bb.i.i.i.i.i.i6.i:                                ; preds = %bb.i.i.i5.i
  %42 = getelementptr inbounds i8* %39, i32 -4    ; <i8*> [#uses=1]
  %43 = bitcast i8* %42 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i.i7.i, label %bb1.i.i.i.i.i.i.i8.i

bb.i.i.i.i.i.i.i7.i:                              ; preds = %bb.i.i.i.i.i.i6.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %44 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %43, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i9.i

bb1.i.i.i.i.i.i.i8.i:                             ; preds = %bb.i.i.i.i.i.i6.i
  %45 = load i32* %43, align 4                    ; <i32> [#uses=2]
  %46 = add nsw i32 %45, -1                       ; <i32> [#uses=1]
  store i32 %46, i32* %43, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i9.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i9.i: ; preds = %bb1.i.i.i.i.i.i.i8.i, %bb.i.i.i.i.i.i.i7.i
  %47 = phi i32 [ %45, %bb1.i.i.i.i.i.i.i8.i ], [ %44, %bb.i.i.i.i.i.i.i7.i ] ; <i32> [#uses=1]
  %48 = icmp slt i32 %47, 1                       ; <i1> [#uses=1]
  br i1 %48, label %bb2.i.i.i.i.i.i10.i, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i

bb2.i.i.i.i.i.i10.i:                              ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i9.i
  call void @_ZdlPv(i8* %40) nounwind
  br label %_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i

_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i:             ; preds = %bb2.i.i.i.i.i.i10.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i9.i, %bb.i.i.i5.i
  %49 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %scevgep.i.i.i3.i, %1 ; <i1> [#uses=1]
  br i1 %49, label %bb5, label %bb.i.i.i5.i

bb16.i:                                           ; preds = %bb4.i
  %50 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %7, %1 ; <i1> [#uses=1]
  br i1 %50, label %bb5, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i.i, %bb16.i
  %indvar.i.i.i.i = phi i32 [ %tmp45.i, %_ZSt8_DestroyISsEvPT_.exit.i.i.i.i ], [ 0, %bb16.i ] ; <i32> [#uses=2]
  %tmp45.i = add i32 %indvar.i.i.i.i, 1           ; <i32> [#uses=2]
  %scevgep.i.i.i.i = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %7, i32 %tmp45.i ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %scevgep23.i.i.i.i = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %7, i32 %indvar.i.i.i.i, i32 0, i32 0 ; <i8**> [#uses=1]
  %51 = load i8** %scevgep23.i.i.i.i, align 4     ; <i8*> [#uses=2]
  %52 = getelementptr inbounds i8* %51, i32 -12   ; <i8*> [#uses=2]
  %53 = icmp eq i8* %52, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %53, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i.i, label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %bb.i.i.i.i
  %54 = getelementptr inbounds i8* %51, i32 -4    ; <i8*> [#uses=1]
  %55 = bitcast i8* %54 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i.i.i.i.i.i, label %bb1.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %bb.i.i.i.i.i.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %56 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %55, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i.i

bb1.i.i.i.i.i.i.i.i:                              ; preds = %bb.i.i.i.i.i.i.i
  %57 = load i32* %55, align 4                    ; <i32> [#uses=2]
  %58 = add nsw i32 %57, -1                       ; <i32> [#uses=1]
  store i32 %58, i32* %55, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i.i: ; preds = %bb1.i.i.i.i.i.i.i.i, %bb.i.i.i.i.i.i.i.i
  %59 = phi i32 [ %57, %bb1.i.i.i.i.i.i.i.i ], [ %56, %bb.i.i.i.i.i.i.i.i ] ; <i32> [#uses=1]
  %60 = icmp slt i32 %59, 1                       ; <i1> [#uses=1]
  br i1 %60, label %bb2.i.i.i.i.i.i.i, label %_ZSt8_DestroyISsEvPT_.exit.i.i.i.i

bb2.i.i.i.i.i.i.i:                                ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i.i
  call void @_ZdlPv(i8* %52) nounwind
  br label %_ZSt8_DestroyISsEvPT_.exit.i.i.i.i

_ZSt8_DestroyISsEvPT_.exit.i.i.i.i:               ; preds = %bb2.i.i.i.i.i.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i.i.i.i.i.i, %bb.i.i.i.i
  %61 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %scevgep.i.i.i.i, %1 ; <i1> [#uses=1]
  br i1 %61, label %bb5, label %bb.i.i.i.i

bb5:                                              ; preds = %_ZSt8_DestroyISsEvPT_.exit.i.i.i.i, %bb16.i, %_ZSt8_DestroyISsEvPT_.exit.i.i.i11.i, %bb10.i
  %62 = getelementptr inbounds %"struct.std::deque<std::basic_string<char, std::char_traits<char>, std::allocator<char> >,std::allocator<std::basic_string<char, std::char_traits<char>, std::allocator<char> > > >"* %this, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"***> [#uses=2]
  %63 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %62, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %64 = icmp eq %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %63, null ; <i1> [#uses=1]
  br i1 %64, label %_ZNSt11_Deque_baseISsSaISsEED2Ev.exit11, label %bb.i1

bb.i1:                                            ; preds = %bb5
  %65 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %4, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %66 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %65, i32 1 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=2]
  %67 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %10, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=3]
  %68 = icmp ult %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %67, %66 ; <i1> [#uses=1]
  br i1 %68, label %bb.i.i6, label %invcont.i9

bb.i.i6:                                          ; preds = %bb.i.i6, %bb.i1
  %indvar.i.i2 = phi i32 [ %tmp16, %bb.i.i6 ], [ 0, %bb.i1 ] ; <i32> [#uses=2]
  %tmp16 = add i32 %indvar.i.i2, 1                ; <i32> [#uses=2]
  %scevgep.i.i4 = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %67, i32 %tmp16 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %__n.01.i.i5 = getelementptr %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %67, i32 %indvar.i.i2 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %69 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %__n.01.i.i5, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=1]
  %70 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %69 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %70) nounwind
  %71 = icmp ult %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %scevgep.i.i4, %66 ; <i1> [#uses=1]
  br i1 %71, label %bb.i.i6, label %invcont.loopexit.i8

invcont.loopexit.i8:                              ; preds = %bb.i.i6
  %.pre.i7 = load %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*** %62, align 4 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  br label %invcont.i9

invcont.i9:                                       ; preds = %invcont.loopexit.i8, %bb.i1
  %72 = phi %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** [ %.pre.i7, %invcont.loopexit.i8 ], [ %63, %bb.i1 ] ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"**> [#uses=1]
  %73 = bitcast %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"** %72 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %73) nounwind
  ret void

_ZNSt11_Deque_baseISsSaISsEED2Ev.exit11:          ; preds = %bb5
  ret void
}

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

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

declare %"struct.std::basic_istream<char,std::char_traits<char> >"* @_ZNSi7getlineEPcic(%"struct.std::basic_istream<char,std::char_traits<char> >"*, i8*, i32, i8 signext)

declare void @_ZSt19__throw_ios_failurePKc(i8*) noreturn

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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
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
  %11 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %10, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=3]
  %12 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %11, null ; <i1> [#uses=1]
  br i1 %12, label %bb9.i.i, label %bb.i.i

bb.i.i:                                           ; preds = %entry
  %13 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %9, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = icmp eq i32 %14, 0                        ; <i1> [#uses=1]
  br i1 %15, label %bb8.i.i, label %bb9.i.i

bb8.i.i:                                          ; preds = %bb.i.i
  %16 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >"* %11, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  %17 = load i32 (...)*** %16, align 4            ; <i32 (...)**> [#uses=1]
  %18 = getelementptr inbounds i32 (...)** %17, i32 -3 ; <i32 (...)**> [#uses=1]
  %19 = bitcast i32 (...)** %18 to i32*           ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  %21 = ptrtoint %"struct.std::basic_ostream<char,std::char_traits<char> >"* %11 to i32 ; <i32> [#uses=3]
  %22 = add i32 %20, %21                          ; <i32> [#uses=1]
  %23 = inttoptr i32 %22 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %24 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %23, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %25 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %24, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=3]
  %26 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25, null ; <i1> [#uses=1]
  br i1 %26, label %_ZNSo5flushEv.exit, label %invcont1.i

invcont1.i:                                       ; preds = %bb8.i.i
  %27 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %28 = load i32 (...)*** %27, align 4            ; <i32 (...)**> [#uses=1]
  %29 = getelementptr inbounds i32 (...)** %28, i32 6 ; <i32 (...)**> [#uses=1]
  %30 = load i32 (...)** %29, align 4             ; <i32 (...)*> [#uses=1]
  %31 = bitcast i32 (...)* %30 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*)*> [#uses=1]
  %32 = invoke i32 %31(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %25)
          to label %invcont2.i unwind label %lpad.i ; <i32> [#uses=1]

invcont2.i:                                       ; preds = %invcont1.i
  %33 = icmp eq i32 %32, -1                       ; <i1> [#uses=1]
  br i1 %33, label %bb15.i, label %_ZNSo5flushEv.exit

invcont11.i:                                      ; preds = %lpad20.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr21.i)
  unreachable

bb13.i:                                           ; preds = %lpad.i
  call void @__cxa_end_catch()
  br label %_ZNSo5flushEv.exit

bb15.i:                                           ; preds = %invcont2.i
  %34 = load i32 (...)*** %16, align 4            ; <i32 (...)**> [#uses=1]
  %35 = getelementptr inbounds i32 (...)** %34, i32 -3 ; <i32 (...)**> [#uses=1]
  %36 = bitcast i32 (...)** %35 to i32*           ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4                    ; <i32> [#uses=1]
  %38 = add i32 %37, %21                          ; <i32> [#uses=1]
  %39 = inttoptr i32 %38 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %40 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %39, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %41 = load i32* %40, align 4                    ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %41, 1                 ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %40
  %42 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %39, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %43 = load i32* %42, align 4                    ; <i32> [#uses=1]
  %44 = and i32 %storemerge.i.i, %43              ; <i32> [#uses=1]
  %45 = icmp eq i32 %44, 0                        ; <i1> [#uses=1]
  br i1 %45, label %_ZNSo5flushEv.exit, label %bb4.i.i.i1

bb4.i.i.i1:                                       ; preds = %bb15.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

lpad.i:                                           ; preds = %invcont1.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select19.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %46 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i) nounwind ; <i8*> [#uses=0]
  %47 = load i32 (...)*** %16, align 4            ; <i32 (...)**> [#uses=1]
  %48 = getelementptr inbounds i32 (...)** %47, i32 -3 ; <i32 (...)**> [#uses=1]
  %49 = bitcast i32 (...)** %48 to i32*           ; <i32*> [#uses=1]
  %50 = load i32* %49, align 4                    ; <i32> [#uses=1]
  %51 = add i32 %50, %21                          ; <i32> [#uses=1]
  %52 = inttoptr i32 %51 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %53 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %54 = load i32* %53, align 4                    ; <i32> [#uses=1]
  %55 = or i32 %54, 1                             ; <i32> [#uses=1]
  store i32 %55, i32* %53, align 4
  %56 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %52, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %57 = load i32* %56, align 4                    ; <i32> [#uses=1]
  %58 = and i32 %57, 1                            ; <i32> [#uses=1]
  %59 = icmp eq i32 %58, 0                        ; <i1> [#uses=1]
  br i1 %59, label %bb13.i, label %bb.i.i2

bb.i.i2:                                          ; preds = %lpad.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i unwind label %lpad20.i

.noexc.i:                                         ; preds = %bb.i.i2
  unreachable

lpad20.i:                                         ; preds = %bb.i.i2
  %eh_ptr21.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select23.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr21.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont11.i unwind label %lpad24.i

lpad24.i:                                         ; preds = %lpad20.i
  %eh_ptr25.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select27.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr25.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_ZNSo5flushEv.exit:                               ; preds = %bb15.i, %bb13.i, %invcont2.i, %bb8.i.i
  %.pre.i.i = load i32 (...)*** %2, align 4       ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i

bb9.i.i:                                          ; preds = %_ZNSo5flushEv.exit, %bb.i.i, %entry
  %60 = phi i32 (...)** [ %.pre.i.i, %_ZNSo5flushEv.exit ], [ %3, %entry ], [ %3, %bb.i.i ] ; <i32 (...)**> [#uses=1]
  %61 = getelementptr inbounds i32 (...)** %60, i32 -3 ; <i32 (...)**> [#uses=1]
  %62 = bitcast i32 (...)** %61 to i32*           ; <i32*> [#uses=1]
  %63 = load i32* %62, align 4                    ; <i32> [#uses=1]
  %64 = add i32 %63, %7                           ; <i32> [#uses=1]
  %65 = inttoptr i32 %64 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %66 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %65, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %67 = load i32* %66, align 4                    ; <i32> [#uses=2]
  %68 = icmp eq i32 %67, 0                        ; <i1> [#uses=1]
  br i1 %68, label %invcont.thread, label %bb12.i.i

invcont.thread:                                   ; preds = %bb9.i.i
  store i8 1, i8* %0, align 8
  br label %bb

bb12.i.i:                                         ; preds = %bb9.i.i
  %69 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %65, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %70 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %69, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %71 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %70, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i = select i1 %71, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %storemerge.i.v.i.i, %67 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %66
  %72 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %65, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %73 = load i32* %72, align 4                    ; <i32> [#uses=1]
  %74 = and i32 %storemerge.i.i.i, %73            ; <i32> [#uses=1]
  %75 = icmp eq i32 %74, 0                        ; <i1> [#uses=1]
  br i1 %75, label %invcont, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb12.i.i
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

invcont:                                          ; preds = %bb12.i.i
  %.pr = load i8* %0, align 8                     ; <i8> [#uses=1]
  %toBool = icmp eq i8 %.pr, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb41, label %bb

bb:                                               ; preds = %invcont, %invcont.thread
  %76 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %77 = getelementptr inbounds i32 (...)** %76, i32 -3 ; <i32 (...)**> [#uses=1]
  %78 = bitcast i32 (...)** %77 to i32*           ; <i32*> [#uses=1]
  %79 = load i32* %78, align 4                    ; <i32> [#uses=1]
  %80 = add i32 %79, %7                           ; <i32> [#uses=2]
  %81 = inttoptr i32 %80 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=2]
  %82 = getelementptr inbounds %"struct.std::ios_base"* %81, i32 0, i32 2 ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=3]
  %84 = icmp sgt i32 %83, %__n                    ; <i1> [#uses=1]
  br i1 %84, label %bb1, label %bb30

bb1:                                              ; preds = %bb
  %85 = getelementptr inbounds %"struct.std::ios_base"* %81, i32 0, i32 3 ; <i32*> [#uses=1]
  %86 = load i32* %85, align 4                    ; <i32> [#uses=1]
  %87 = and i32 %86, 176                          ; <i32> [#uses=1]
  %88 = icmp eq i32 %87, 32                       ; <i1> [#uses=2]
  br i1 %88, label %invcont9, label %bb6

bb6:                                              ; preds = %bb1
  %89 = sub i32 %83, %__n                         ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 %89)
          to label %invcont9 unwind label %lpad50

invcont9:                                         ; preds = %bb6, %bb1
  %90 = load i32 (...)*** %2, align 4             ; <i32 (...)**> [#uses=1]
  %91 = getelementptr inbounds i32 (...)** %90, i32 -3 ; <i32 (...)**> [#uses=1]
  %92 = bitcast i32 (...)** %91 to i32*           ; <i32*> [#uses=1]
  %93 = load i32* %92, align 4                    ; <i32> [#uses=1]
  %94 = add i32 %93, %7                           ; <i32> [#uses=1]
  %95 = inttoptr i32 %94 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %96 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %95, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %97 = load i32* %96, align 4                    ; <i32> [#uses=1]
  %98 = icmp eq i32 %97, 0                        ; <i1> [#uses=1]
  br i1 %98, label %bb11, label %bb13

bb11:                                             ; preds = %invcont9
  %99 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %95, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %100 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %99, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %101 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %100, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %102 = load i32 (...)*** %101, align 4          ; <i32 (...)**> [#uses=1]
  %103 = getelementptr inbounds i32 (...)** %102, i32 12 ; <i32 (...)**> [#uses=1]
  %104 = load i32 (...)** %103, align 4           ; <i32 (...)*> [#uses=1]
  %105 = bitcast i32 (...)* %104 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %106 = invoke i32 %105(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %100, i8* %__s, i32 %__n)
          to label %.noexc8 unwind label %lpad50  ; <i32> [#uses=1]

.noexc8:                                          ; preds = %bb11
  %107 = icmp eq i32 %106, %__n                   ; <i1> [#uses=1]
  br i1 %107, label %bb13, label %bb.i4

bb.i4:                                            ; preds = %.noexc8
  %108 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %109 = getelementptr inbounds i32 (...)** %108, i32 -3 ; <i32 (...)**> [#uses=1]
  %110 = bitcast i32 (...)** %109 to i32*         ; <i32*> [#uses=1]
  %111 = load i32* %110, align 4                  ; <i32> [#uses=1]
  %112 = add i32 %111, %7                         ; <i32> [#uses=1]
  %113 = inttoptr i32 %112 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %114 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %113, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %115 = load i32* %114, align 4                  ; <i32> [#uses=1]
  %116 = or i32 %115, 1                           ; <i32> [#uses=2]
  store i32 %116, i32* %114
  %117 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %113, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %118 = load i32* %117, align 4                  ; <i32> [#uses=1]
  %119 = and i32 %116, %118                       ; <i32> [#uses=1]
  %120 = icmp eq i32 %119, 0                      ; <i1> [#uses=1]
  br i1 %120, label %bb13, label %bb4.i.i.i5

bb4.i.i.i5:                                       ; preds = %bb.i4
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc9 unwind label %lpad50

.noexc9:                                          ; preds = %bb4.i.i.i5
  unreachable

bb13:                                             ; preds = %bb.i4, %.noexc8, %invcont9
  br i1 %88, label %invcont19, label %bb32

invcont19:                                        ; preds = %bb13
  %121 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %122 = getelementptr inbounds i32 (...)** %121, i32 -3 ; <i32 (...)**> [#uses=1]
  %123 = bitcast i32 (...)** %122 to i32*         ; <i32*> [#uses=1]
  %124 = load i32* %123, align 4                  ; <i32> [#uses=1]
  %125 = add i32 %124, %7                         ; <i32> [#uses=1]
  %126 = inttoptr i32 %125 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %127 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %126, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %128 = load i32* %127, align 4                  ; <i32> [#uses=1]
  %129 = icmp eq i32 %128, 0                      ; <i1> [#uses=1]
  br i1 %129, label %bb28, label %bb32

bb28:                                             ; preds = %invcont19
  %130 = sub i32 %83, %__n                        ; <i32> [#uses=1]
  invoke fastcc void @_ZSt14__ostream_fillIcSt11char_traitsIcEEvRSt13basic_ostreamIT_T0_Ei(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %__out, i32 %130)
          to label %bb32 unwind label %lpad50

bb30:                                             ; preds = %bb
  %131 = inttoptr i32 %80 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %132 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %131, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %133 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %132, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %134 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %133, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %135 = load i32 (...)*** %134, align 4          ; <i32 (...)**> [#uses=1]
  %136 = getelementptr inbounds i32 (...)** %135, i32 12 ; <i32 (...)**> [#uses=1]
  %137 = load i32 (...)** %136, align 4           ; <i32 (...)*> [#uses=1]
  %138 = bitcast i32 (...)* %137 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8*, i32)*> [#uses=1]
  %139 = invoke i32 %138(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %133, i8* %__s, i32 %__n)
          to label %.noexc2 unwind label %lpad50  ; <i32> [#uses=1]

.noexc2:                                          ; preds = %bb30
  %140 = icmp eq i32 %139, %__n                   ; <i1> [#uses=1]
  br i1 %140, label %bb32, label %bb.i1

bb.i1:                                            ; preds = %.noexc2
  %141 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %142 = getelementptr inbounds i32 (...)** %141, i32 -3 ; <i32 (...)**> [#uses=1]
  %143 = bitcast i32 (...)** %142 to i32*         ; <i32*> [#uses=1]
  %144 = load i32* %143, align 4                  ; <i32> [#uses=1]
  %145 = add i32 %144, %7                         ; <i32> [#uses=1]
  %146 = inttoptr i32 %145 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %147 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %146, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %148 = load i32* %147, align 4                  ; <i32> [#uses=1]
  %149 = or i32 %148, 1                           ; <i32> [#uses=2]
  store i32 %149, i32* %147
  %150 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %146, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %151 = load i32* %150, align 4                  ; <i32> [#uses=1]
  %152 = and i32 %149, %151                       ; <i32> [#uses=1]
  %153 = icmp eq i32 %152, 0                      ; <i1> [#uses=1]
  br i1 %153, label %bb32, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i1
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc3 unwind label %lpad50

.noexc3:                                          ; preds = %bb4.i.i.i
  unreachable

bb32:                                             ; preds = %bb.i1, %.noexc2, %bb28, %invcont19, %bb13
  %154 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %155 = getelementptr inbounds i32 (...)** %154, i32 -3 ; <i32 (...)**> [#uses=1]
  %156 = bitcast i32 (...)** %155 to i32*         ; <i32*> [#uses=1]
  %157 = load i32* %156, align 4                  ; <i32> [#uses=1]
  %158 = add i32 %157, %7                         ; <i32> [#uses=1]
  %159 = inttoptr i32 %158 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %160 = getelementptr inbounds %"struct.std::ios_base"* %159, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %160, align 4
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
  %161 = call i8* @__cxa_begin_catch(i8* %eh_ptr51) nounwind ; <i8*> [#uses=0]
  %162 = load i32 (...)*** %2, align 4            ; <i32 (...)**> [#uses=1]
  %163 = getelementptr inbounds i32 (...)** %162, i32 -3 ; <i32 (...)**> [#uses=1]
  %164 = bitcast i32 (...)** %163 to i32*         ; <i32*> [#uses=1]
  %165 = load i32* %164, align 4                  ; <i32> [#uses=1]
  %166 = add i32 %165, %7                         ; <i32> [#uses=1]
  %167 = inttoptr i32 %166 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %168 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %167, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %169 = load i32* %168, align 4                  ; <i32> [#uses=1]
  %170 = or i32 %169, 1                           ; <i32> [#uses=1]
  store i32 %170, i32* %168, align 4
  %171 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %167, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %172 = load i32* %171, align 4                  ; <i32> [#uses=1]
  %173 = and i32 %172, 1                          ; <i32> [#uses=1]
  %174 = icmp eq i32 %173, 0                      ; <i1> [#uses=1]
  br i1 %174, label %bb39, label %bb.i

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
