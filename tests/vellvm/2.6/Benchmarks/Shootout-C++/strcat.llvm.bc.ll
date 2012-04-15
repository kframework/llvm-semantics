; ModuleID = 'strcat.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%"struct.__gnu_cxx::new_allocator<char>" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Alloc_hider" = type { i8* }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep" = type { %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep_base" }
%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep_base" = type { i32, i32, i32 }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }

@_ZNSs4_Rep20_S_empty_rep_storageE = external global [4 x i32] ; <[4 x i32]*> [#uses=2]
@_ZNSs4_Rep11_S_terminalE = external constant i8  ; <i8*> [#uses=2]
@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<char>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<char>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [24 x i8] c"basic_string::_S_create\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str1 = private constant [21 x i8] c"basic_string::append\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str2 = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str3 = private constant [7 x i8] c"hello\0A\00", align 1 ; <[7 x i8]*> [#uses=2]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_main }] ; <[1 x %0]*> [#uses=0]

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

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__s.i = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %0 = alloca %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >", align 8 ; <%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*> [#uses=2]
  %__cerb.i.i = alloca %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry", align 8 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"*> [#uses=4]
  %str = alloca %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=5]
  %1 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb2

bb:                                               ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = call i32 @atoi(i8* %3) nounwind readonly   ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.88.0 = phi i32 [ %4, %bb ], [ 5000000, %entry ] ; <i32> [#uses=1]
  %5 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %str, i32 0, i32 0, i32 0 ; <i8**> [#uses=8]
  store i8* bitcast (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* getelementptr (%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"* bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >::_Rep"*), i32 1) to i8*), i8** %5, align 8
  invoke fastcc void @_ZNSs7reserveEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %str, i32 31)
          to label %bb8 unwind label %lpad

bb3:                                              ; preds = %bb8
  %tmp = mul i32 %42, 6                           ; <i32> [#uses=1]
  %newLength.0 = add i32 %tmp, 6                  ; <i32> [#uses=1]
  %6 = icmp ugt i32 %newLength.0, %capacity.1     ; <i1> [#uses=1]
  br i1 %6, label %bb4, label %bb6

bb4:                                              ; preds = %bb3
  %7 = shl i32 %capacity.1, 1                     ; <i32> [#uses=2]
  invoke fastcc void @_ZNSs7reserveEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %str, i32 %7)
          to label %bb6 unwind label %lpad

bb6:                                              ; preds = %bb4, %bb3
  %capacity.0 = phi i32 [ %capacity.1, %bb3 ], [ %7, %bb4 ] ; <i32> [#uses=1]
  %8 = load i8** %5, align 8                      ; <i8*> [#uses=7]
  %9 = getelementptr inbounds i8* %8, i32 -12     ; <i8*> [#uses=1]
  %10 = bitcast i8* %9 to i32*                    ; <i32*> [#uses=1]
  %11 = load i32* %10, align 4                    ; <i32> [#uses=3]
  %12 = sub i32 1073741820, %11                   ; <i32> [#uses=1]
  %13 = icmp ult i32 %12, 6                       ; <i1> [#uses=1]
  br i1 %13, label %bb.i.i2, label %_ZNKSs15_M_check_lengthEjjPKc.exit.i

bb.i.i2:                                          ; preds = %bb6
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0)) noreturn
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %bb.i.i2
  unreachable

_ZNKSs15_M_check_lengthEjjPKc.exit.i:             ; preds = %bb6
  %14 = add i32 %11, 6                            ; <i32> [#uses=5]
  %15 = getelementptr inbounds i8* %8, i32 -8     ; <i8*> [#uses=1]
  %16 = bitcast i8* %15 to i32*                   ; <i32*> [#uses=1]
  %17 = load i32* %16, align 4                    ; <i32> [#uses=1]
  %18 = icmp ult i32 %17, %14                     ; <i1> [#uses=1]
  br i1 %18, label %bb6.i, label %bb1.i

bb1.i:                                            ; preds = %_ZNKSs15_M_check_lengthEjjPKc.exit.i
  %19 = getelementptr inbounds i8* %8, i32 -4     ; <i8*> [#uses=1]
  %20 = bitcast i8* %19 to i32*                   ; <i32*> [#uses=1]
  %21 = load i32* %20, align 4                    ; <i32> [#uses=1]
  %22 = icmp sgt i32 %21, 0                       ; <i1> [#uses=1]
  br i1 %22, label %bb6.i, label %invcont7

bb6.i:                                            ; preds = %bb1.i, %_ZNKSs15_M_check_lengthEjjPKc.exit.i
  %23 = icmp ugt i8* %8, getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %23, label %bb8.i, label %_ZNKSs11_M_disjunctEPKc.exit.i

_ZNKSs11_M_disjunctEPKc.exit.i:                   ; preds = %bb6.i
  %24 = getelementptr inbounds i8* %8, i32 %11    ; <i8*> [#uses=1]
  %phitmp.i = icmp ult i8* %24, getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %phitmp.i, label %bb8.i, label %bb9.i

bb8.i:                                            ; preds = %_ZNKSs11_M_disjunctEPKc.exit.i, %bb6.i
  invoke fastcc void @_ZNSs7reserveEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %str, i32 %14)
          to label %.noexc3 unwind label %lpad

.noexc3:                                          ; preds = %bb8.i
  %.pre.i = load i8** %5, align 8                 ; <i8*> [#uses=1]
  br label %invcont7

bb9.i:                                            ; preds = %_ZNKSs11_M_disjunctEPKc.exit.i
  invoke fastcc void @_ZNSs7reserveEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %str, i32 %14)
          to label %.noexc4 unwind label %lpad

.noexc4:                                          ; preds = %bb9.i
  %25 = ptrtoint i8* %8 to i32                    ; <i32> [#uses=1]
  %26 = sub i32 ptrtoint ([7 x i8]* @.str3 to i32), %25 ; <i32> [#uses=1]
  %27 = load i8** %5, align 8                     ; <i8*> [#uses=2]
  %28 = getelementptr inbounds i8* %27, i32 %26   ; <i8*> [#uses=1]
  br label %invcont7

invcont7:                                         ; preds = %.noexc4, %.noexc3, %bb1.i
  %29 = phi i8* [ %27, %.noexc4 ], [ %.pre.i, %.noexc3 ], [ %8, %bb1.i ] ; <i8*> [#uses=2]
  %__s_addr.0.i = phi i8* [ getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), %.noexc3 ], [ %28, %.noexc4 ], [ getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), %bb1.i ] ; <i8*> [#uses=1]
  %30 = getelementptr inbounds i8* %29, i32 -12   ; <i8*> [#uses=1]
  %31 = bitcast i8* %30 to i32*                   ; <i32*> [#uses=1]
  %32 = load i32* %31, align 4                    ; <i32> [#uses=1]
  %33 = getelementptr inbounds i8* %29, i32 %32   ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %33, i8* %__s_addr.0.i, i32 6, i32 1) nounwind
  %34 = load i8** %5, align 8                     ; <i8*> [#uses=3]
  %35 = getelementptr inbounds i8* %34, i32 -12   ; <i8*> [#uses=1]
  %36 = getelementptr inbounds i8* %34, i32 -4    ; <i8*> [#uses=1]
  %37 = bitcast i8* %36 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %37, align 4
  %38 = bitcast i8* %35 to i32*                   ; <i32*> [#uses=1]
  store i32 %14, i32* %38, align 4
  %39 = getelementptr inbounds i8* %34, i32 %14   ; <i8*> [#uses=1]
  %40 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %40, i8* %39, align 1
  %41 = add i32 %42, 1                            ; <i32> [#uses=1]
  br label %bb8

bb8:                                              ; preds = %invcont7, %bb2
  %capacity.1 = phi i32 [ %capacity.0, %invcont7 ], [ 31, %bb2 ] ; <i32> [#uses=3]
  %42 = phi i32 [ %41, %invcont7 ], [ 0, %bb2 ]   ; <i32> [#uses=3]
  %43 = icmp slt i32 %42, %iftmp.88.0             ; <i1> [#uses=1]
  br i1 %43, label %bb3, label %invcont10

invcont10:                                        ; preds = %bb8
  %44 = load i8** %5, align 8                     ; <i8*> [#uses=1]
  %45 = getelementptr inbounds i8* %44, i32 -12   ; <i8*> [#uses=1]
  %46 = bitcast i8* %45 to i32*                   ; <i32*> [#uses=1]
  %47 = load i32* %46, align 4                    ; <i32> [#uses=1]
  %48 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %48, align 8
  %49 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %49, align 4
  %50 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %51 = getelementptr inbounds i32 (...)** %50, i32 -3 ; <i32 (...)**> [#uses=1]
  %52 = bitcast i32 (...)** %51 to i32*           ; <i32*> [#uses=1]
  %53 = load i32* %52, align 4                    ; <i32> [#uses=1]
  %54 = add i32 %53, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %55 = inttoptr i32 %54 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %56 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %55, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %57 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %56, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %58 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %57, null ; <i1> [#uses=1]
  br i1 %58, label %bb9.i.i.i, label %bb.i.i.i13

bb.i.i.i13:                                       ; preds = %invcont10
  %59 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %55, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %60 = load i32* %59, align 4                    ; <i32> [#uses=1]
  %61 = icmp eq i32 %60, 0                        ; <i1> [#uses=1]
  br i1 %61, label %bb8.i.i.i, label %bb9.i.i.i

bb8.i.i.i:                                        ; preds = %bb.i.i.i13
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %57)
          to label %.noexc17 unwind label %lpad

.noexc17:                                         ; preds = %bb8.i.i.i
  %.pre.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %.noexc17, %bb.i.i.i13, %invcont10
  %62 = phi i32 (...)** [ %.pre.i.i.i, %.noexc17 ], [ %50, %invcont10 ], [ %50, %bb.i.i.i13 ] ; <i32 (...)**> [#uses=1]
  %63 = getelementptr inbounds i32 (...)** %62, i32 -3 ; <i32 (...)**> [#uses=1]
  %64 = bitcast i32 (...)** %63 to i32*           ; <i32*> [#uses=1]
  %65 = load i32* %64, align 4                    ; <i32> [#uses=1]
  %66 = add i32 %65, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %67 = inttoptr i32 %66 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %68 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %69 = load i32* %68, align 4                    ; <i32> [#uses=2]
  %70 = icmp eq i32 %69, 0                        ; <i1> [#uses=1]
  br i1 %70, label %invcont.i.thread, label %bb12.i.i.i

invcont.i.thread:                                 ; preds = %bb9.i.i.i
  store i8 1, i8* %48, align 8
  br label %bb.i

bb12.i.i.i:                                       ; preds = %bb9.i.i.i
  %71 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %72 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %71, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %73 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %72, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i = select i1 %73, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i = or i32 %storemerge.i.v.i.i.i, %69 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i, i32* %68
  %74 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %67, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %75 = load i32* %74, align 4                    ; <i32> [#uses=1]
  %76 = and i32 %storemerge.i.i.i.i, %75          ; <i32> [#uses=1]
  %77 = icmp eq i32 %76, 0                        ; <i1> [#uses=1]
  br i1 %77, label %invcont.i, label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb12.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc18 unwind label %lpad

.noexc18:                                         ; preds = %bb4.i.i.i.i.i
  unreachable

invcont.i:                                        ; preds = %bb12.i.i.i
  %.pr = load i8* %48, align 8                    ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %.pr, 0                  ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb17.i, label %bb.i

bb.i:                                             ; preds = %invcont.i, %invcont.i.thread
  %78 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=2]
  %79 = getelementptr inbounds i32 (...)** %78, i32 -3 ; <i32 (...)**> [#uses=1]
  %80 = bitcast i32 (...)** %79 to i32*           ; <i32*> [#uses=1]
  %81 = load i32* %80, align 4                    ; <i32> [#uses=1]
  %82 = add i32 %81, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %83 = inttoptr i32 %82 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=5]
  %84 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 6 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"**> [#uses=1]
  %85 = load %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"** %84, align 4 ; <%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*> [#uses=3]
  %86 = icmp eq %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %85, null ; <i1> [#uses=1]
  br i1 %86, label %bb.i6.i, label %invcont1.i

bb.i6.i:                                          ; preds = %bb.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc7.i unwind label %lpad26.i

.noexc7.i:                                        ; preds = %bb.i6.i
  unreachable

invcont1.i:                                       ; preds = %bb.i
  %87 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 3 ; <i8*> [#uses=2]
  %88 = load i8* %87, align 1                     ; <i8> [#uses=1]
  %toBool.i.i14 = icmp eq i8 %88, 0               ; <i1> [#uses=1]
  br i1 %toBool.i.i14, label %bb.i4.i, label %invcont2.i

bb.i4.i:                                          ; preds = %invcont1.i
  %.idx = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx.val = load %"struct.std::ctype<char>"** %.idx ; <%"struct.std::ctype<char>"*> [#uses=1]
  %89 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val, i8 signext 32)
          to label %.noexc5.i unwind label %lpad26.i ; <i8> [#uses=1]

.noexc5.i:                                        ; preds = %bb.i4.i
  %90 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 %89, i8* %90, align 4
  store i8 1, i8* %87, align 1
  %.pre.i15 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %invcont2.i

invcont2.i:                                       ; preds = %.noexc5.i, %invcont1.i
  %91 = phi i32 (...)** [ %.pre.i15, %.noexc5.i ], [ %78, %invcont1.i ] ; <i32 (...)**> [#uses=1]
  %92 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %83, i32 0, i32 2 ; <i8*> [#uses=1]
  %93 = load i8* %92, align 4                     ; <i8> [#uses=1]
  %94 = getelementptr inbounds i32 (...)** %91, i32 -3 ; <i32 (...)**> [#uses=1]
  %95 = bitcast i32 (...)** %94 to i32*           ; <i32*> [#uses=1]
  %96 = load i32* %95, align 4                    ; <i32> [#uses=1]
  %97 = add i32 %96, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=2]
  %98 = inttoptr i32 %97 to %"struct.std::ios_base"* ; <%"struct.std::ios_base"*> [#uses=1]
  %99 = inttoptr i32 %97 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %100 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %99, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %101 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %100, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  %tmp.i = ptrtoint %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %101 to i32 ; <i32> [#uses=1]
  %102 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %101, null ; <i1> [#uses=1]
  %tmp9.i = bitcast %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %__s.i to i64* ; <i64*> [#uses=1]
  %103 = zext i32 %tmp.i to i64                   ; <i64> [#uses=1]
  %104 = zext i1 %102 to i64                      ; <i64> [#uses=1]
  %105 = shl i64 %104, 32                         ; <i64> [#uses=1]
  %106 = or i64 %105, %103                        ; <i64> [#uses=1]
  store i64 %106, i64* %tmp9.i, align 8
  %107 = getelementptr inbounds %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %85, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %108 = load i32 (...)*** %107, align 4          ; <i32 (...)**> [#uses=1]
  %109 = getelementptr inbounds i32 (...)** %108, i32 4 ; <i32 (...)**> [#uses=1]
  %110 = load i32 (...)** %109, align 4           ; <i32 (...)*> [#uses=1]
  %111 = bitcast i32 (...)* %110 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %111(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %85, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s.i, %"struct.std::ios_base"* %98, i8 signext %93, i32 %47)
          to label %invcont3.i unwind label %lpad26.i

invcont3.i:                                       ; preds = %invcont2.i
  %112 = getelementptr inbounds %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* %0, i32 0, i32 1 ; <i8*> [#uses=1]
  %113 = load i8* %112, align 4                   ; <i8> [#uses=1]
  %toBool4.i = icmp eq i8 %113, 0                 ; <i1> [#uses=1]
  br i1 %toBool4.i, label %bb17.i, label %bb15.i

bb12.i:                                           ; preds = %lpad26.i
  invoke void @__cxa_end_catch()
          to label %bb17.i unwind label %lpad30.i

bb15.i:                                           ; preds = %invcont3.i
  %114 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %115 = getelementptr inbounds i32 (...)** %114, i32 -3 ; <i32 (...)**> [#uses=1]
  %116 = bitcast i32 (...)** %115 to i32*         ; <i32*> [#uses=1]
  %117 = load i32* %116, align 4                  ; <i32> [#uses=1]
  %118 = add i32 %117, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %119 = inttoptr i32 %118 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %120 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %119, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %121 = load i32* %120, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i = or i32 %121, 1                ; <i32> [#uses=2]
  store i32 %storemerge.i.i, i32* %120
  %122 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %119, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %123 = load i32* %122, align 4                  ; <i32> [#uses=1]
  %124 = and i32 %storemerge.i.i, %123            ; <i32> [#uses=1]
  %125 = icmp eq i32 %124, 0                      ; <i1> [#uses=1]
  br i1 %125, label %bb17.i, label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb15.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc1.i unwind label %lpad.i

.noexc1.i:                                        ; preds = %bb4.i.i.i
  unreachable

bb17.i:                                           ; preds = %bb15.i, %bb12.i, %invcont3.i, %invcont.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont11 unwind label %lpad

invcont21.i:                                      ; preds = %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
          to label %.noexc20 unwind label %lpad

.noexc20:                                         ; preds = %invcont21.i
  unreachable

lpad.i:                                           ; preds = %bb4.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont2.i, %bb.i4.i, %bb.i6.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %126 = call i8* @__cxa_begin_catch(i8* %eh_ptr27.i) nounwind ; <i8*> [#uses=0]
  %127 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %128 = getelementptr inbounds i32 (...)** %127, i32 -3 ; <i32 (...)**> [#uses=1]
  %129 = bitcast i32 (...)** %128 to i32*         ; <i32*> [#uses=1]
  %130 = load i32* %129, align 4                  ; <i32> [#uses=1]
  %131 = add i32 %130, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %132 = inttoptr i32 %131 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %133 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %134 = load i32* %133, align 4                  ; <i32> [#uses=1]
  %135 = or i32 %134, 1                           ; <i32> [#uses=1]
  store i32 %135, i32* %133, align 4
  %136 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %132, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %137 = load i32* %136, align 4                  ; <i32> [#uses=1]
  %138 = and i32 %137, 1                          ; <i32> [#uses=1]
  %139 = icmp eq i32 %138, 0                      ; <i1> [#uses=1]
  br i1 %139, label %bb12.i, label %bb.i.i16

bb.i.i16:                                         ; preds = %lpad26.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i unwind label %lpad34.i

.noexc.i:                                         ; preds = %bb.i.i16
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

ppad.i:                                           ; preds = %lpad34.i, %lpad30.i, %lpad.i
  %eh_exception.0.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_ptr31.i, %lpad30.i ], [ %eh_ptr35.i, %lpad34.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i)
          to label %invcont21.i unwind label %lpad42.i

invcont11:                                        ; preds = %bb17.i
  %140 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %141 = getelementptr inbounds i32 (...)** %140, i32 -3 ; <i32 (...)**> [#uses=1]
  %142 = bitcast i32 (...)** %141 to i32*         ; <i32*> [#uses=1]
  %143 = load i32* %142, align 4                  ; <i32> [#uses=1]
  %144 = add i32 %143, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %145 = inttoptr i32 %144 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %.idx21 = getelementptr %"struct.std::basic_ios<char,std::char_traits<char> >"* %145, i32 0, i32 5 ; <%"struct.std::ctype<char>"**> [#uses=1]
  %.idx21.val = load %"struct.std::ctype<char>"** %.idx21 ; <%"struct.std::ctype<char>"*> [#uses=1]
  %146 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx21.val, i8 signext 10)
          to label %.noexc7 unwind label %lpad    ; <i8> [#uses=3]

.noexc7:                                          ; preds = %invcont11
  %147 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 0, i8* %147, align 8
  %148 = getelementptr inbounds %"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %148, align 4
  %149 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=3]
  %150 = getelementptr inbounds i32 (...)** %149, i32 -3 ; <i32 (...)**> [#uses=1]
  %151 = bitcast i32 (...)** %150 to i32*         ; <i32*> [#uses=1]
  %152 = load i32* %151, align 4                  ; <i32> [#uses=1]
  %153 = add i32 %152, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %154 = inttoptr i32 %153 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %155 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %154, i32 0, i32 1 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"**> [#uses=1]
  %156 = load %"struct.std::basic_ostream<char,std::char_traits<char> >"** %155, align 4 ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=2]
  %157 = icmp eq %"struct.std::basic_ostream<char,std::char_traits<char> >"* %156, null ; <i1> [#uses=1]
  br i1 %157, label %bb9.i.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %.noexc7
  %158 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %154, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %159 = load i32* %158, align 4                  ; <i32> [#uses=1]
  %160 = icmp eq i32 %159, 0                      ; <i1> [#uses=1]
  br i1 %160, label %bb8.i.i.i.i, label %bb9.i.i.i.i

bb8.i.i.i.i:                                      ; preds = %bb.i.i.i.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* %156)
          to label %.noexc8 unwind label %lpad

.noexc8:                                          ; preds = %bb8.i.i.i.i
  %.pre.i.i.i.i = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  br label %bb9.i.i.i.i

bb9.i.i.i.i:                                      ; preds = %.noexc8, %bb.i.i.i.i, %.noexc7
  %161 = phi i32 (...)** [ %.pre.i.i.i.i, %.noexc8 ], [ %149, %.noexc7 ], [ %149, %bb.i.i.i.i ] ; <i32 (...)**> [#uses=1]
  %162 = getelementptr inbounds i32 (...)** %161, i32 -3 ; <i32 (...)**> [#uses=1]
  %163 = bitcast i32 (...)** %162 to i32*         ; <i32*> [#uses=1]
  %164 = load i32* %163, align 4                  ; <i32> [#uses=1]
  %165 = add i32 %164, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %166 = inttoptr i32 %165 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=3]
  %167 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %166, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %168 = load i32* %167, align 4                  ; <i32> [#uses=2]
  %169 = icmp eq i32 %168, 0                      ; <i1> [#uses=1]
  br i1 %169, label %invcont.i.i.thread, label %bb12.i.i.i.i

invcont.i.i.thread:                               ; preds = %bb9.i.i.i.i
  store i8 1, i8* %147, align 8
  br label %invcont1.i.i

bb12.i.i.i.i:                                     ; preds = %bb9.i.i.i.i
  %170 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %166, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %171 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %170, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=1]
  %172 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %171, null ; <i1> [#uses=1]
  %storemerge.i.v.i.i.i.i = select i1 %172, i32 5, i32 4 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i = or i32 %storemerge.i.v.i.i.i.i, %168 ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i.i.i, i32* %167
  %173 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %166, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %174 = load i32* %173, align 4                  ; <i32> [#uses=1]
  %175 = and i32 %storemerge.i.i.i.i.i, %174      ; <i32> [#uses=1]
  %176 = icmp eq i32 %175, 0                      ; <i1> [#uses=1]
  br i1 %176, label %invcont.i.i, label %bb4.i.i.i.i.i.i

bb4.i.i.i.i.i.i:                                  ; preds = %bb12.i.i.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc9 unwind label %lpad

.noexc9:                                          ; preds = %bb4.i.i.i.i.i.i
  unreachable

invcont.i.i:                                      ; preds = %bb12.i.i.i.i
  %.pr23 = load i8* %147, align 8                 ; <i8> [#uses=1]
  %toBool.i.i = icmp eq i8 %.pr23, 0              ; <i1> [#uses=1]
  br i1 %toBool.i.i, label %_ZNSo3putEc.exit.i, label %invcont1.i.i

invcont1.i.i:                                     ; preds = %invcont.i.i, %invcont.i.i.thread
  %177 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %178 = getelementptr inbounds i32 (...)** %177, i32 -3 ; <i32 (...)**> [#uses=1]
  %179 = bitcast i32 (...)** %178 to i32*         ; <i32*> [#uses=1]
  %180 = load i32* %179, align 4                  ; <i32> [#uses=1]
  %181 = add i32 %180, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %182 = inttoptr i32 %181 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %183 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %182, i32 0, i32 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"**> [#uses=1]
  %184 = load %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %183, align 4 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=4]
  %185 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %184, i32 0, i32 5 ; <i8**> [#uses=3]
  %186 = load i8** %185, align 4                  ; <i8*> [#uses=2]
  %187 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %184, i32 0, i32 6 ; <i8**> [#uses=1]
  %188 = load i8** %187, align 4                  ; <i8*> [#uses=1]
  %189 = icmp ult i8* %186, %188                  ; <i1> [#uses=1]
  br i1 %189, label %bb.i2.i.i, label %bb1.i.i.i5

bb.i2.i.i:                                        ; preds = %invcont1.i.i
  store i8 %146, i8* %186, align 1
  %190 = load i8** %185, align 4                  ; <i8*> [#uses=1]
  %191 = getelementptr inbounds i8* %190, i32 1   ; <i8*> [#uses=1]
  store i8* %191, i8** %185, align 4
  %192 = zext i8 %146 to i32                      ; <i32> [#uses=1]
  br label %invcont2.i.i

bb1.i.i.i5:                                       ; preds = %invcont1.i.i
  %193 = getelementptr inbounds %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %184, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %194 = load i32 (...)*** %193, align 4          ; <i32 (...)**> [#uses=1]
  %195 = getelementptr inbounds i32 (...)** %194, i32 13 ; <i32 (...)**> [#uses=1]
  %196 = load i32 (...)** %195, align 4           ; <i32 (...)*> [#uses=1]
  %197 = zext i8 %146 to i32                      ; <i32> [#uses=1]
  %198 = bitcast i32 (...)* %196 to i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %199 = invoke i32 %198(%"struct.std::basic_streambuf<char,std::char_traits<char> >"* %184, i32 %197)
          to label %invcont2.i.i unwind label %lpad25.i.i ; <i32> [#uses=1]

invcont2.i.i:                                     ; preds = %bb1.i.i.i5, %bb.i2.i.i
  %200 = phi i32 [ %192, %bb.i2.i.i ], [ %199, %bb1.i.i.i5 ] ; <i32> [#uses=1]
  %201 = icmp eq i32 %200, -1                     ; <i1> [#uses=1]
  br i1 %201, label %bb14.i.i, label %_ZNSo3putEc.exit.i

bb11.i.i:                                         ; preds = %lpad25.i.i
  invoke void @__cxa_end_catch()
          to label %_ZNSo3putEc.exit.i unwind label %lpad29.i.i

bb14.i.i:                                         ; preds = %invcont2.i.i
  %202 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %203 = getelementptr inbounds i32 (...)** %202, i32 -3 ; <i32 (...)**> [#uses=1]
  %204 = bitcast i32 (...)** %203 to i32*         ; <i32*> [#uses=1]
  %205 = load i32* %204, align 4                  ; <i32> [#uses=1]
  %206 = add i32 %205, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %207 = inttoptr i32 %206 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %208 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %207, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %209 = load i32* %208, align 4                  ; <i32> [#uses=1]
  %storemerge.i.i.i = or i32 %209, 1              ; <i32> [#uses=2]
  store i32 %storemerge.i.i.i, i32* %208
  %210 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %207, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %211 = load i32* %210, align 4                  ; <i32> [#uses=1]
  %212 = and i32 %storemerge.i.i.i, %211          ; <i32> [#uses=1]
  %213 = icmp eq i32 %212, 0                      ; <i1> [#uses=1]
  br i1 %213, label %_ZNSo3putEc.exit.i, label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb14.i.i
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
          to label %.noexc1.i.i unwind label %lpad.i.i

.noexc1.i.i:                                      ; preds = %bb4.i.i.i.i
  unreachable

invcont20.i.i:                                    ; preds = %ppad.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc10 unwind label %lpad

.noexc10:                                         ; preds = %invcont20.i.i
  unreachable

lpad.i.i:                                         ; preds = %bb4.i.i.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select24.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i.i

lpad25.i.i:                                       ; preds = %bb1.i.i.i5
  %eh_ptr26.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select28.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr26.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %214 = call i8* @__cxa_begin_catch(i8* %eh_ptr26.i.i) nounwind ; <i8*> [#uses=0]
  %215 = load i32 (...)*** getelementptr inbounds (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout, i32 0, i32 0), align 4 ; <i32 (...)**> [#uses=1]
  %216 = getelementptr inbounds i32 (...)** %215, i32 -3 ; <i32 (...)**> [#uses=1]
  %217 = bitcast i32 (...)** %216 to i32*         ; <i32*> [#uses=1]
  %218 = load i32* %217, align 4                  ; <i32> [#uses=1]
  %219 = add i32 %218, ptrtoint (%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout to i32) ; <i32> [#uses=1]
  %220 = inttoptr i32 %219 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=2]
  %221 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %220, i32 0, i32 0, i32 5 ; <i32*> [#uses=2]
  %222 = load i32* %221, align 4                  ; <i32> [#uses=1]
  %223 = or i32 %222, 1                           ; <i32> [#uses=1]
  store i32 %223, i32* %221, align 4
  %224 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %220, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %225 = load i32* %224, align 4                  ; <i32> [#uses=1]
  %226 = and i32 %225, 1                          ; <i32> [#uses=1]
  %227 = icmp eq i32 %226, 0                      ; <i1> [#uses=1]
  br i1 %227, label %bb11.i.i, label %bb.i.i.i6

bb.i.i.i6:                                        ; preds = %lpad25.i.i
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc.i.i unwind label %lpad33.i.i

.noexc.i.i:                                       ; preds = %bb.i.i.i6
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

ppad.i.i:                                         ; preds = %lpad33.i.i, %lpad29.i.i, %lpad.i.i
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i.i, %lpad.i.i ], [ %eh_ptr30.i.i, %lpad29.i.i ], [ %eh_ptr34.i.i, %lpad33.i.i ] ; <i8*> [#uses=1]
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
          to label %invcont20.i.i unwind label %lpad41.i.i

_ZNSo3putEc.exit.i:                               ; preds = %bb14.i.i, %bb11.i.i, %invcont2.i.i, %invcont.i.i
  invoke fastcc void @_ZNSo6sentryD2Ev(%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry"* %__cerb.i.i)
          to label %.noexc11 unwind label %lpad

.noexc11:                                         ; preds = %_ZNSo3putEc.exit.i
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
          to label %invcont12 unwind label %lpad

invcont12:                                        ; preds = %.noexc11
  %228 = load i8** %5, align 8                    ; <i8*> [#uses=2]
  %229 = getelementptr inbounds i8* %228, i32 -12 ; <i8*> [#uses=2]
  %230 = icmp eq i8* %229, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %230, label %_ZNSsD1Ev.exit7, label %bb.i.i1

bb.i.i1:                                          ; preds = %invcont12
  %231 = getelementptr inbounds i8* %228, i32 -4  ; <i8*> [#uses=1]
  %232 = bitcast i8* %231 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i2, label %bb1.i.i.i3

bb.i.i.i2:                                        ; preds = %bb.i.i1
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %233 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %232, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4

bb1.i.i.i3:                                       ; preds = %bb.i.i1
  %234 = load i32* %232, align 4                  ; <i32> [#uses=2]
  %235 = add nsw i32 %234, -1                     ; <i32> [#uses=1]
  store i32 %235, i32* %232, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4: ; preds = %bb1.i.i.i3, %bb.i.i.i2
  %236 = phi i32 [ %234, %bb1.i.i.i3 ], [ %233, %bb.i.i.i2 ] ; <i32> [#uses=1]
  %237 = icmp slt i32 %236, 1                     ; <i1> [#uses=1]
  br i1 %237, label %bb2.i.i5, label %_ZNSsD1Ev.exit7

bb2.i.i5:                                         ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4
  call void @_ZdlPv(i8* %229) nounwind
  ret i32 0

_ZNSsD1Ev.exit7:                                  ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i4, %invcont12
  ret i32 0

invcont14:                                        ; preds = %bb2.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i, %lpad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable

lpad:                                             ; preds = %.noexc11, %_ZNSo3putEc.exit.i, %invcont20.i.i, %bb4.i.i.i.i.i.i, %bb8.i.i.i.i, %invcont11, %invcont21.i, %bb17.i, %bb4.i.i.i.i.i, %bb8.i.i.i, %bb9.i, %bb8.i, %bb.i.i2, %bb4, %bb2
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select18 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %238 = load i8** %5, align 8                    ; <i8*> [#uses=2]
  %239 = getelementptr inbounds i8* %238, i32 -12 ; <i8*> [#uses=2]
  %240 = icmp eq i8* %239, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %240, label %invcont14, label %bb.i.i

bb.i.i:                                           ; preds = %lpad
  %241 = getelementptr inbounds i8* %238, i32 -4  ; <i8*> [#uses=1]
  %242 = bitcast i8* %241 to i32*                 ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %243 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %242, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i
  %244 = load i32* %242, align 4                  ; <i32> [#uses=2]
  %245 = add nsw i32 %244, -1                     ; <i32> [#uses=1]
  store i32 %245, i32* %242, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i: ; preds = %bb1.i.i.i, %bb.i.i.i
  %246 = phi i32 [ %244, %bb1.i.i.i ], [ %243, %bb.i.i.i ] ; <i32> [#uses=1]
  %247 = icmp slt i32 %246, 1                     ; <i1> [#uses=1]
  br i1 %247, label %bb2.i.i, label %invcont14

bb2.i.i:                                          ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i
  call void @_ZdlPv(i8* %239) nounwind
  br label %invcont14
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<char>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  ret void
}

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<char>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<char>"* @_ZStL8__ioinit)
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<char>"*)

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

declare i8* @_Znwj(i32)

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @llvm.memory.barrier(i1, i1, i1, i1, i1) nounwind

declare i32 @llvm.atomic.load.add.i32.p0i32(i32* nocapture, i32) nounwind

declare void @_ZdlPv(i8*) nounwind

define internal fastcc void @_ZNSs7reserveEj(%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* nocapture %this, i32 %__res) {
entry:
  %0 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %this, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  %1 = load i8** %0, align 4                      ; <i8*> [#uses=5]
  %2 = getelementptr inbounds i8* %1, i32 -8      ; <i8*> [#uses=1]
  %3 = bitcast i8* %2 to i32*                     ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=4]
  %5 = icmp eq i32 %4, %__res                     ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb5

bb:                                               ; preds = %entry
  %6 = getelementptr inbounds i8* %1, i32 -4      ; <i8*> [#uses=1]
  %7 = bitcast i8* %6 to i32*                     ; <i32*> [#uses=1]
  %8 = load i32* %7, align 4                      ; <i32> [#uses=1]
  %9 = icmp sgt i32 %8, 0                         ; <i1> [#uses=1]
  br i1 %9, label %bb5, label %bb2

bb2:                                              ; preds = %bb
  ret void

bb5:                                              ; preds = %bb, %entry
  %10 = getelementptr inbounds i8* %1, i32 -12    ; <i8*> [#uses=1]
  %11 = bitcast i8* %10 to i32*                   ; <i32*> [#uses=3]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=2]
  %13 = icmp ugt i32 %12, %__res                  ; <i1> [#uses=1]
  %__res_addr.0 = select i1 %13, i32 %12, i32 %__res ; <i32> [#uses=5]
  %14 = icmp ugt i32 %__res_addr.0, 1073741820    ; <i1> [#uses=1]
  br i1 %14, label %bb.i.i1, label %bb1.i.i2

bb.i.i1:                                          ; preds = %bb5
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %bb.i.i1
  unreachable

bb1.i.i2:                                         ; preds = %bb5
  %15 = icmp ugt i32 %__res_addr.0, %4            ; <i1> [#uses=1]
  br i1 %15, label %bb2.i.i, label %bb4.i.i

bb2.i.i:                                          ; preds = %bb1.i.i2
  %16 = shl i32 %4, 1                             ; <i32> [#uses=2]
  %17 = icmp ugt i32 %16, %__res_addr.0           ; <i1> [#uses=1]
  %.__capacity.i.i = select i1 %17, i32 %16, i32 %__res_addr.0 ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb2.i.i, %bb1.i.i2
  %__capacity_addr.0.i.i = phi i32 [ %.__capacity.i.i, %bb2.i.i ], [ %__res_addr.0, %bb1.i.i2 ] ; <i32> [#uses=5]
  %18 = add i32 %__capacity_addr.0.i.i, 29        ; <i32> [#uses=2]
  %19 = icmp ugt i32 %18, 4096                    ; <i1> [#uses=1]
  %20 = icmp ugt i32 %__capacity_addr.0.i.i, %4   ; <i1> [#uses=1]
  %21 = and i1 %19, %20                           ; <i1> [#uses=1]
  br i1 %21, label %bb7.i.i, label %bb10.i.i

bb7.i.i:                                          ; preds = %bb4.i.i
  %22 = and i32 %18, 4095                         ; <i32> [#uses=1]
  %23 = sub i32 4096, %22                         ; <i32> [#uses=1]
  %24 = add i32 %23, %__capacity_addr.0.i.i       ; <i32> [#uses=2]
  %25 = icmp ugt i32 %24, 1073741820              ; <i1> [#uses=1]
  %__capacity_addr.2.i.i = select i1 %25, i32 1073741820, i32 %24 ; <i32> [#uses=2]
  br label %bb10.i.i

bb10.i.i:                                         ; preds = %bb7.i.i, %bb4.i.i
  %__size.0.in.i.i = phi i32 [ %__capacity_addr.2.i.i, %bb7.i.i ], [ %__capacity_addr.0.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %__capacity_addr.1.i.i = phi i32 [ %__capacity_addr.2.i.i, %bb7.i.i ], [ %__capacity_addr.0.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %__size.0.i.i = add i32 %__size.0.in.i.i, 13    ; <i32> [#uses=1]
  %26 = invoke i8* @_Znwj(i32 %__size.0.i.i)
          to label %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i unwind label %lpad.i.i ; <i8*> [#uses=6]

lpad.i.i:                                         ; preds = %bb10.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select14.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc4 unwind label %lpad

.noexc4:                                          ; preds = %lpad.i.i
  unreachable

_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i:            ; preds = %bb10.i.i
  %27 = getelementptr inbounds i8* %26, i32 4     ; <i8*> [#uses=1]
  %28 = bitcast i8* %27 to i32*                   ; <i32*> [#uses=1]
  store i32 %__capacity_addr.1.i.i, i32* %28, align 4
  %29 = getelementptr inbounds i8* %26, i32 8     ; <i8*> [#uses=1]
  %30 = bitcast i8* %29 to i32*                   ; <i32*> [#uses=2]
  store i32 0, i32* %30, align 4
  %31 = load i32* %11, align 4                    ; <i32> [#uses=3]
  %32 = icmp eq i32 %31, 0                        ; <i1> [#uses=1]
  br i1 %32, label %invcont11, label %bb.i3

bb.i3:                                            ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i
  %33 = getelementptr inbounds i8* %26, i32 12    ; <i8*> [#uses=2]
  %34 = icmp eq i32 %31, 1                        ; <i1> [#uses=1]
  br i1 %34, label %bb.i1.i, label %bb1.i2.i

bb.i1.i:                                          ; preds = %bb.i3
  %35 = load i8* %1                               ; <i8> [#uses=1]
  store i8 %35, i8* %33
  br label %invcont11

bb1.i2.i:                                         ; preds = %bb.i3
  call void @llvm.memcpy.i32(i8* %33, i8* %1, i32 %31, i32 1) nounwind
  br label %invcont11

invcont11:                                        ; preds = %bb1.i2.i, %bb.i1.i, %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i
  %36 = load i32* %11, align 4                    ; <i32> [#uses=2]
  store i32 0, i32* %30, align 4
  %37 = bitcast i8* %26 to i32*                   ; <i32*> [#uses=1]
  store i32 %36, i32* %37, align 4
  %.sum.i = add i32 %36, 12                       ; <i32> [#uses=1]
  %38 = getelementptr inbounds i8* %26, i32 %.sum.i ; <i8*> [#uses=1]
  %39 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %39, i8* %38, align 1
  %40 = getelementptr inbounds i8* %26, i32 12    ; <i8*> [#uses=1]
  %41 = load i8** %0, align 4                     ; <i8*> [#uses=2]
  %42 = getelementptr inbounds i8* %41, i32 -12   ; <i8*> [#uses=2]
  %43 = icmp eq i8* %42, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %43, label %bb16, label %bb.i

bb.i:                                             ; preds = %invcont11
  %44 = getelementptr inbounds i8* %41, i32 -4    ; <i8*> [#uses=1]
  %45 = bitcast i8* %44 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i, label %bb1.i.i

bb.i.i:                                           ; preds = %bb.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %46 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %45, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i

bb1.i.i:                                          ; preds = %bb.i
  %47 = load i32* %45, align 4                    ; <i32> [#uses=2]
  %48 = add nsw i32 %47, -1                       ; <i32> [#uses=1]
  store i32 %48, i32* %45, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i: ; preds = %bb1.i.i, %bb.i.i
  %49 = phi i32 [ %47, %bb1.i.i ], [ %46, %bb.i.i ] ; <i32> [#uses=1]
  %50 = icmp slt i32 %49, 1                       ; <i1> [#uses=1]
  br i1 %50, label %bb2.i, label %bb16

bb2.i:                                            ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i
  call void @_ZdlPv(i8* %42) nounwind
  br label %bb16

bb16:                                             ; preds = %bb2.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i, %invcont11
  store i8* %40, i8** %0, align 4
  ret void

lpad:                                             ; preds = %lpad.i.i, %bb.i.i1
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select19 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) noreturn
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
