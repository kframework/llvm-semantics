; ModuleID = 'fftbench.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { double, double }
%1 = type { i32, void ()* }
%struct..0._46 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._46 }
%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%"struct.__gnu_cxx::new_allocator<char>" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__si_class_type_info_pseudo = type { %struct.__type_info_pseudo, %"struct.std::type_info"* }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.locale_data = type opaque
%"struct.polynomial<double>" = type { i32 (...)**, double*, i32 }
%"struct.polynomial<std::complex<double> >" = type { i32 (...)**, %"struct.std::complex<double>"*, i32 }
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
%"struct.std::complex<double>" = type { %0 }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::exception" = type { i32 (...)** }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }
%"struct.std::overflow_error" = type { %"struct.std::runtime_error" }
%"struct.std::runtime_error" = type { %"struct.std::exception", %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >" }
%"struct.std::type_info" = type { i32 (...)**, i8* }

@_ZNSs4_Rep20_S_empty_rep_storageE = external global [4 x i32] ; <[4 x i32]*> [#uses=1]
@_ZNSs4_Rep11_S_terminalE = external constant i8  ; <i8*> [#uses=1]
@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<char>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<char>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@_ZGVN10polynomialIdE4PI2IE = internal global i64 0, align 8 ; <i64*> [#uses=1]
@_ZN10polynomialIdE4PI2IE.0.1 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@_ZTV10polynomialIdE = internal constant [4 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__class_type_info_pseudo* @_ZTI10polynomialIdE to i32 (...)*), i32 (...)* bitcast (void (%"struct.polynomial<double>"*)* @_ZN10polynomialIdED1Ev to i32 (...)*), i32 (...)* bitcast (void (%"struct.polynomial<double>"*)* @_ZN10polynomialIdED0Ev to i32 (...)*)], align 8 ; <[4 x i32 (...)*]*> [#uses=1]
@_ZTI10polynomialIdE = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([16 x i8]* @_ZTS10polynomialIdE, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS10polynomialIdE = internal constant [16 x i8] c"10polynomialIdE\00" ; <[16 x i8]*> [#uses=1]
@_ZTV10polynomialISt7complexIdEE = internal constant [4 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__class_type_info_pseudo* @_ZTI10polynomialISt7complexIdEE to i32 (...)*), i32 (...)* bitcast (void (%"struct.polynomial<std::complex<double> >"*)* @_ZN10polynomialISt7complexIdEED1Ev to i32 (...)*), i32 (...)* bitcast (void (%"struct.polynomial<std::complex<double> >"*)* @_ZN10polynomialISt7complexIdEED0Ev to i32 (...)*)], align 8 ; <[4 x i32 (...)*]*> [#uses=1]
@_ZTI10polynomialISt7complexIdEE = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([28 x i8]* @_ZTS10polynomialISt7complexIdEE, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTS10polynomialISt7complexIdEE = internal constant [28 x i8] c"10polynomialISt7complexIdEE\00" ; <[28 x i8]*> [#uses=1]
@.str = private constant [24 x i8] c"basic_string::_S_create\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str2 = private constant [35 x i8] c"overflow in fft polynomial stretch\00", align 1 ; <[35 x i8]*> [#uses=3]
@_ZTISt14overflow_error = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([19 x i8]* @_ZTSSt14overflow_error, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__si_class_type_info_pseudo* @_ZTISt13runtime_error to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=2]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTSSt14overflow_error = internal constant [19 x i8] c"St14overflow_error\00" ; <[19 x i8]*> [#uses=1]
@_ZTISt13runtime_error = external constant %struct.__si_class_type_info_pseudo ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTVSt14overflow_error = internal constant [5 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTISt14overflow_error to i32 (...)*), i32 (...)* bitcast (void (%"struct.std::overflow_error"*)* @_ZNSt14overflow_errorD1Ev to i32 (...)*), i32 (...)* bitcast (void (%"struct.std::overflow_error"*)* @_ZNSt14overflow_errorD0Ev to i32 (...)*), i32 (...)* bitcast (i8* (%"struct.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i32 (...)*)], align 8 ; <[5 x i32 (...)*]*> [#uses=1]
@.str3 = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str4 = private constant [4 x i8] c"-ga\00", align 1 ; <[4 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=5]
@.str5 = private constant [32 x i8] c"\0Afftbench (Std. C++) run time: \00", align 1 ; <[32 x i8]*> [#uses=1]
@.str6 = private constant [3 x i8] c"\0A\0A\00", align 1 ; <[3 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %1] [%1 { i32 65535, void ()* @_GLOBAL__I_main }] ; <[1 x %1]*> [#uses=0]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=1]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._46*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._46*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._46*)* @pthread_mutexattr_init ; <i32 (%struct..0._46*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._46*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._46*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._46*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._46*)*> [#uses=0]

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %memtmp.i.i.i.i = alloca %0, align 8            ; <%0*> [#uses=3]
  %dft2.i = alloca %"struct.polynomial<std::complex<double> >", align 8 ; <%"struct.polynomial<std::complex<double> >"*> [#uses=10]
  %dft1.i = alloca %"struct.polynomial<std::complex<double> >", align 8 ; <%"struct.polynomial<std::complex<double> >"*> [#uses=8]
  %a2.i = alloca %"struct.polynomial<double>", align 8 ; <%"struct.polynomial<double>"*> [#uses=5]
  %a1.i = alloca %"struct.polynomial<double>", align 8 ; <%"struct.polynomial<double>"*> [#uses=5]
  %0 = alloca %"struct.polynomial<double>", align 8 ; <%"struct.polynomial<double>"*> [#uses=3]
  %1 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %1, label %bb4.preheader, label %bb5

bb4.preheader:                                    ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  br label %bb4

bb1:                                              ; preds = %bb4
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0)) nounwind readonly ; <i32> [#uses=1]
  %5 = icmp eq i32 %4, 0                          ; <i1> [#uses=1]
  br i1 %5, label %bb5, label %bb3

bb3:                                              ; preds = %bb1
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb4

bb4:                                              ; preds = %bb3, %bb4.preheader
  %indvar = phi i32 [ 1, %bb4.preheader ], [ %phitmp, %bb3 ] ; <i32> [#uses=2]
  %6 = icmp slt i32 %indvar, %argc                ; <i1> [#uses=1]
  br i1 %6, label %bb1, label %bb5

bb5:                                              ; preds = %bb4, %bb1, %entry
  %ga_testing.0 = phi i8 [ 0, %entry ], [ 0, %bb4 ], [ 1, %bb1 ] ; <i8> [#uses=1]
  %7 = call i8* @_Znaj(i32 4194304)               ; <i8*> [#uses=5]
  %8 = bitcast i8* %7 to double*                  ; <double*> [#uses=2]
  %9 = invoke i8* @_Znaj(i32 4194304)
          to label %invcont unwind label %lpad    ; <i8*> [#uses=5]

invcont:                                          ; preds = %bb5
  %10 = bitcast i8* %9 to double*                 ; <double*> [#uses=2]
  %11 = invoke i8* @_Znaj(i32 8388600)
          to label %_ZN10polynomialIdEC1Ej.exit27 unwind label %lpad47 ; <i8*> [#uses=3]

_ZN10polynomialIdEC1Ej.exit27:                    ; preds = %invcont
  %12 = bitcast i8* %11 to double*                ; <double*> [#uses=5]
  br label %bb7

bb7:                                              ; preds = %bb7, %_ZN10polynomialIdEC1Ej.exit27
  %_ZZL13random_doublevE4seed.tmp.0 = phi i32 [ 1325, %_ZN10polynomialIdEC1Ej.exit27 ], [ %34, %bb7 ] ; <i32> [#uses=1]
  %n.029 = phi i32 [ 0, %_ZN10polynomialIdEC1Ej.exit27 ], [ %35, %bb7 ] ; <i32> [#uses=3]
  %13 = xor i32 %_ZZL13random_doublevE4seed.tmp.0, 123459876 ; <i32> [#uses=2]
  %14 = sdiv i32 %13, 127773                      ; <i32> [#uses=2]
  %15 = mul i32 %14, 127773                       ; <i32> [#uses=1]
  %16 = sub i32 %13, %15                          ; <i32> [#uses=1]
  %17 = mul i32 %16, 16807                        ; <i32> [#uses=1]
  %18 = mul i32 %14, 2836                         ; <i32> [#uses=1]
  %19 = sub i32 %17, %18                          ; <i32> [#uses=3]
  %20 = add nsw i32 %19, 2147483647               ; <i32> [#uses=1]
  %21 = icmp slt i32 %19, 0                       ; <i1> [#uses=1]
  %..i28 = select i1 %21, i32 %20, i32 %19        ; <i32> [#uses=3]
  %22 = sitofp i32 %..i28 to double               ; <double> [#uses=1]
  %23 = fmul double %22, 0x3E340000002813D9       ; <double> [#uses=1]
  %scevgep31 = getelementptr double* %8, i32 %n.029 ; <double*> [#uses=1]
  store double %23, double* %scevgep31, align 8
  %24 = sdiv i32 %..i28, 127773                   ; <i32> [#uses=2]
  %25 = mul i32 %24, 127773                       ; <i32> [#uses=1]
  %26 = sub i32 %..i28, %25                       ; <i32> [#uses=1]
  %27 = mul i32 %26, 16807                        ; <i32> [#uses=1]
  %28 = mul i32 %24, 2836                         ; <i32> [#uses=1]
  %29 = sub i32 %27, %28                          ; <i32> [#uses=3]
  %30 = add nsw i32 %29, 2147483647               ; <i32> [#uses=1]
  %31 = icmp slt i32 %29, 0                       ; <i1> [#uses=1]
  %..i = select i1 %31, i32 %30, i32 %29          ; <i32> [#uses=2]
  %32 = sitofp i32 %..i to double                 ; <double> [#uses=1]
  %33 = fmul double %32, 0x3E340000002813D9       ; <double> [#uses=1]
  %34 = xor i32 %..i, 123459876                   ; <i32> [#uses=1]
  %scevgep = getelementptr double* %10, i32 %n.029 ; <double*> [#uses=1]
  store double %33, double* %scevgep, align 8
  %35 = add nsw i32 %n.029, 1                     ; <i32> [#uses=2]
  %exitcond30 = icmp eq i32 %35, 524288           ; <i1> [#uses=1]
  br i1 %exitcond30, label %bb8.bb9_crit_edge, label %bb7

bb8.bb9_crit_edge:                                ; preds = %bb7
  %36 = getelementptr inbounds %"struct.polynomial<double>"* %a1.i, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %36, align 8
  %37 = getelementptr inbounds %"struct.polynomial<double>"* %a1.i, i32 0, i32 1 ; <double**> [#uses=9]
  store double* null, double** %37, align 4
  %38 = getelementptr inbounds %"struct.polynomial<double>"* %a1.i, i32 0, i32 2 ; <i32*> [#uses=8]
  store i32 524288, i32* %38, align 8
  %39 = invoke i8* @_Znaj(i32 4194304)
          to label %bb.i.i.i.preheader unwind label %lpad51 ; <i8*> [#uses=1]

bb.i.i.i.preheader:                               ; preds = %bb8.bb9_crit_edge
  %40 = bitcast i8* %39 to double*                ; <double*> [#uses=1]
  store double* %40, double** %37, align 4
  br label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %bb.i.i.i.preheader
  %n.01.i.i.i = phi i32 [ %tmp.i.i, %bb.i.i.i ], [ 0, %bb.i.i.i.preheader ] ; <i32> [#uses=3]
  %tmp.i.i = add i32 %n.01.i.i.i, 1               ; <i32> [#uses=2]
  %scevgep.i.i.i = getelementptr double* %8, i32 %n.01.i.i.i ; <double*> [#uses=1]
  %41 = load double** %37, align 4                ; <double*> [#uses=1]
  %42 = load double* %scevgep.i.i.i, align 4      ; <double> [#uses=1]
  %scevgep2.i.i.i = getelementptr double* %41, i32 %n.01.i.i.i ; <double*> [#uses=1]
  store double %42, double* %scevgep2.i.i.i, align 4
  %43 = load i32* %38, align 8                    ; <i32> [#uses=1]
  %44 = icmp ugt i32 %43, %tmp.i.i                ; <i1> [#uses=1]
  br i1 %44, label %bb.i.i.i, label %_ZN10polynomialIdEC1ERKS0_.exit.i

_ZN10polynomialIdEC1ERKS0_.exit.i:                ; preds = %bb.i.i.i
  %45 = getelementptr inbounds %"struct.polynomial<double>"* %a2.i, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %45, align 8
  %46 = getelementptr inbounds %"struct.polynomial<double>"* %a2.i, i32 0, i32 1 ; <double**> [#uses=9]
  store double* null, double** %46, align 4
  %47 = getelementptr inbounds %"struct.polynomial<double>"* %a2.i, i32 0, i32 2 ; <i32*> [#uses=5]
  store i32 524288, i32* %47, align 8
  %48 = invoke i8* @_Znaj(i32 4194304)
          to label %bb.i.i31.i.preheader unwind label %lpad.i ; <i8*> [#uses=1]

bb.i.i31.i.preheader:                             ; preds = %_ZN10polynomialIdEC1ERKS0_.exit.i
  %49 = bitcast i8* %48 to double*                ; <double*> [#uses=1]
  store double* %49, double** %46, align 4
  br label %bb.i.i31.i

bb.i.i31.i:                                       ; preds = %bb.i.i31.i, %bb.i.i31.i.preheader
  %n.01.i.i27.i = phi i32 [ %tmp.i28.i, %bb.i.i31.i ], [ 0, %bb.i.i31.i.preheader ] ; <i32> [#uses=3]
  %tmp.i28.i = add i32 %n.01.i.i27.i, 1           ; <i32> [#uses=2]
  %scevgep.i.i29.i = getelementptr double* %10, i32 %n.01.i.i27.i ; <double*> [#uses=1]
  %50 = load double** %46, align 4                ; <double*> [#uses=1]
  %51 = load double* %scevgep.i.i29.i, align 4    ; <double> [#uses=1]
  %scevgep2.i.i30.i = getelementptr double* %50, i32 %n.01.i.i27.i ; <double*> [#uses=1]
  store double %51, double* %scevgep2.i.i30.i, align 4
  %52 = load i32* %47, align 8                    ; <i32> [#uses=6]
  %53 = icmp ugt i32 %52, %tmp.i28.i              ; <i1> [#uses=1]
  br i1 %53, label %bb.i.i31.i, label %invcont.i

invcont.i:                                        ; preds = %bb.i.i31.i
  %.pre22 = load i32* %38, align 8                ; <i32> [#uses=1]
  %54 = icmp ugt i32 %.pre22, %52                 ; <i1> [#uses=1]
  br i1 %54, label %bb.i1, label %bb26.i

bb.i1:                                            ; preds = %invcont.i
  %55 = invoke fastcc i32 @_ZN10polynomialIdE11stretch_fftEv(%"struct.polynomial<double>"* %a1.i)
          to label %invcont24.i unwind label %lpad76.i ; <i32> [#uses=2]

invcont24.i:                                      ; preds = %bb.i1
  %56 = icmp eq i32 %55, 0                        ; <i1> [#uses=1]
  br i1 %56, label %bb29.i, label %bb.i.i2

bb.i.i2:                                          ; preds = %invcont24.i
  %57 = load double** %46, align 4                ; <double*> [#uses=1]
  %58 = add i32 %52, %55                          ; <i32> [#uses=3]
  store i32 %58, i32* %47, align 8
  %59 = shl i32 %58, 3                            ; <i32> [#uses=1]
  %60 = invoke i8* @_Znaj(i32 %59)
          to label %.noexc34.i unwind label %lpad76.i ; <i8*> [#uses=1]

.noexc34.i:                                       ; preds = %bb.i.i2
  %61 = bitcast i8* %60 to double*                ; <double*> [#uses=1]
  store double* %61, double** %46, align 4
  %62 = icmp eq i32 %52, 0                        ; <i1> [#uses=1]
  br i1 %62, label %bb4.loopexit.i.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb1.i.i, %.noexc34.i
  %n.02.i.i = phi i32 [ %65, %bb1.i.i ], [ 0, %.noexc34.i ] ; <i32> [#uses=3]
  %scevgep7.i.i = getelementptr double* %57, i32 %n.02.i.i ; <double*> [#uses=1]
  %63 = load double** %46, align 4                ; <double*> [#uses=1]
  %64 = load double* %scevgep7.i.i, align 4       ; <double> [#uses=1]
  %scevgep8.i.i = getelementptr double* %63, i32 %n.02.i.i ; <double*> [#uses=1]
  store double %64, double* %scevgep8.i.i, align 4
  %65 = add i32 %n.02.i.i, 1                      ; <i32> [#uses=2]
  %exitcond57.i = icmp eq i32 %65, %52            ; <i1> [#uses=1]
  br i1 %exitcond57.i, label %bb4.loopexit.i.i.loopexit, label %bb1.i.i

bb.nph.i.i:                                       ; preds = %bb4.loopexit.i.i
  %tmp5.i.i = add i32 %n.0.lcssa.i.i, 1           ; <i32> [#uses=1]
  br label %bb3.i.i

bb3.i.i:                                          ; preds = %bb3.i.i, %bb.nph.i.i
  %indvar.i.i = phi i32 [ 0, %bb.nph.i.i ], [ %indvar.next.i.i, %bb3.i.i ] ; <i32> [#uses=3]
  %tmp6.i.i = add i32 %indvar.i.i, %tmp5.i.i      ; <i32> [#uses=1]
  %tmp59.i = add i32 %indvar.i.i, %n.0.lcssa.i.i  ; <i32> [#uses=1]
  %66 = load double** %46, align 4                ; <double*> [#uses=1]
  %scevgep.i.i3 = getelementptr double* %66, i32 %tmp59.i ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep.i.i3, align 4
  %67 = load i32* %47, align 8                    ; <i32> [#uses=1]
  %68 = icmp ugt i32 %67, %tmp6.i.i               ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %68, label %bb3.i.i, label %bb29.i

bb4.loopexit.i.i.loopexit:                        ; preds = %bb1.i.i
  %.pre24 = load i32* %47, align 8                ; <i32> [#uses=1]
  br label %bb4.loopexit.i.i

bb4.loopexit.i.i:                                 ; preds = %bb4.loopexit.i.i.loopexit, %.noexc34.i
  %69 = phi i32 [ %.pre24, %bb4.loopexit.i.i.loopexit ], [ %58, %.noexc34.i ] ; <i32> [#uses=1]
  %n.0.lcssa.i.i = phi i32 [ 0, %.noexc34.i ], [ %52, %bb4.loopexit.i.i.loopexit ] ; <i32> [#uses=3]
  %70 = icmp ugt i32 %69, %n.0.lcssa.i.i          ; <i1> [#uses=1]
  br i1 %70, label %bb.nph.i.i, label %bb29.i

bb26.i:                                           ; preds = %invcont.i
  %71 = invoke fastcc i32 @_ZN10polynomialIdE11stretch_fftEv(%"struct.polynomial<double>"* %a2.i)
          to label %invcont27.i unwind label %lpad76.i ; <i32> [#uses=2]

invcont27.i:                                      ; preds = %bb26.i
  %72 = icmp eq i32 %71, 0                        ; <i1> [#uses=1]
  br i1 %72, label %bb29.i, label %bb.i35.i

bb.i35.i:                                         ; preds = %invcont27.i
  %73 = load double** %37, align 4                ; <double*> [#uses=1]
  %74 = load i32* %38, align 8                    ; <i32> [#uses=4]
  %75 = add i32 %74, %71                          ; <i32> [#uses=3]
  store i32 %75, i32* %38, align 8
  %76 = shl i32 %75, 3                            ; <i32> [#uses=1]
  %77 = invoke i8* @_Znaj(i32 %76)
          to label %.noexc51.i unwind label %lpad76.i ; <i8*> [#uses=1]

.noexc51.i:                                       ; preds = %bb.i35.i
  %78 = bitcast i8* %77 to double*                ; <double*> [#uses=1]
  store double* %78, double** %37, align 4
  %79 = icmp eq i32 %74, 0                        ; <i1> [#uses=1]
  br i1 %79, label %bb4.loopexit.i50.i, label %bb1.i40.i

bb1.i40.i:                                        ; preds = %bb1.i40.i, %.noexc51.i
  %n.02.i36.i = phi i32 [ %82, %bb1.i40.i ], [ 0, %.noexc51.i ] ; <i32> [#uses=3]
  %scevgep7.i37.i = getelementptr double* %73, i32 %n.02.i36.i ; <double*> [#uses=1]
  %80 = load double** %37, align 4                ; <double*> [#uses=1]
  %81 = load double* %scevgep7.i37.i, align 4     ; <double> [#uses=1]
  %scevgep8.i38.i = getelementptr double* %80, i32 %n.02.i36.i ; <double*> [#uses=1]
  store double %81, double* %scevgep8.i38.i, align 4
  %82 = add i32 %n.02.i36.i, 1                    ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %82, %74              ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb4.loopexit.i50.i.loopexit, label %bb1.i40.i

bb.nph.i42.i:                                     ; preds = %bb4.loopexit.i50.i
  %tmp5.i41.i = add i32 %n.0.lcssa.i49.i, 1       ; <i32> [#uses=1]
  br label %bb3.i48.i

bb3.i48.i:                                        ; preds = %bb3.i48.i, %bb.nph.i42.i
  %indvar.i43.i = phi i32 [ 0, %bb.nph.i42.i ], [ %indvar.next.i47.i, %bb3.i48.i ] ; <i32> [#uses=3]
  %tmp6.i46.i = add i32 %indvar.i43.i, %tmp5.i41.i ; <i32> [#uses=1]
  %tmp.i4 = add i32 %indvar.i43.i, %n.0.lcssa.i49.i ; <i32> [#uses=1]
  %83 = load double** %37, align 4                ; <double*> [#uses=1]
  %scevgep.i45.i = getelementptr double* %83, i32 %tmp.i4 ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep.i45.i, align 4
  %84 = load i32* %38, align 8                    ; <i32> [#uses=1]
  %85 = icmp ugt i32 %84, %tmp6.i46.i             ; <i1> [#uses=1]
  %indvar.next.i47.i = add i32 %indvar.i43.i, 1   ; <i32> [#uses=1]
  br i1 %85, label %bb3.i48.i, label %bb29.i

bb4.loopexit.i50.i.loopexit:                      ; preds = %bb1.i40.i
  %.pre56 = load i32* %38, align 8                ; <i32> [#uses=1]
  br label %bb4.loopexit.i50.i

bb4.loopexit.i50.i:                               ; preds = %bb4.loopexit.i50.i.loopexit, %.noexc51.i
  %86 = phi i32 [ %.pre56, %bb4.loopexit.i50.i.loopexit ], [ %75, %.noexc51.i ] ; <i32> [#uses=1]
  %n.0.lcssa.i49.i = phi i32 [ 0, %.noexc51.i ], [ %74, %bb4.loopexit.i50.i.loopexit ] ; <i32> [#uses=3]
  %87 = icmp ugt i32 %86, %n.0.lcssa.i49.i        ; <i1> [#uses=1]
  br i1 %87, label %bb.nph.i42.i, label %bb29.i

bb29.i:                                           ; preds = %bb4.loopexit.i50.i, %bb3.i48.i, %invcont27.i, %bb4.loopexit.i.i, %bb3.i.i, %invcont24.i
  invoke fastcc void @_ZN10polynomialIdE3fftERKS0_(%"struct.polynomial<std::complex<double> >"* noalias sret %dft1.i, %"struct.polynomial<double>"* %a1.i)
          to label %invcont30.i unwind label %lpad76.i

invcont30.i:                                      ; preds = %bb29.i
  invoke fastcc void @_ZN10polynomialIdE3fftERKS0_(%"struct.polynomial<std::complex<double> >"* noalias sret %dft2.i, %"struct.polynomial<double>"* %a2.i)
          to label %invcont31.i unwind label %lpad80.i

invcont31.i:                                      ; preds = %invcont30.i
  %88 = load i32* %38, align 8                    ; <i32> [#uses=3]
  %89 = icmp eq i32 %88, 0                        ; <i1> [#uses=1]
  br i1 %89, label %bb34.i, label %bb.nph56.i

bb.nph56.i:                                       ; preds = %invcont31.i
  %90 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %91 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  br label %bb32.i

bb32.i:                                           ; preds = %bb32.i, %bb.nph56.i
  %k15.055.i = phi i32 [ 0, %bb.nph56.i ], [ %104, %bb32.i ] ; <i32> [#uses=5]
  %92 = load %"struct.std::complex<double>"** %90, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %93 = load %"struct.std::complex<double>"** %91, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %scevgep7273.i = getelementptr inbounds %"struct.std::complex<double>"* %92, i32 %k15.055.i, i32 0, i32 0 ; <double*> [#uses=1]
  %94 = load double* %scevgep7273.i, align 8      ; <double> [#uses=2]
  %scevgep71.i = getelementptr %"struct.std::complex<double>"* %92, i32 %k15.055.i, i32 0, i32 1 ; <double*> [#uses=1]
  %95 = load double* %scevgep71.i, align 8        ; <double> [#uses=2]
  %scevgep6970.i = getelementptr inbounds %"struct.std::complex<double>"* %93, i32 %k15.055.i, i32 0, i32 0 ; <double*> [#uses=2]
  %96 = load double* %scevgep6970.i, align 4      ; <double> [#uses=2]
  %scevgep66.i = getelementptr %"struct.std::complex<double>"* %93, i32 %k15.055.i, i32 0, i32 1 ; <double*> [#uses=2]
  %97 = load double* %scevgep66.i, align 4        ; <double> [#uses=2]
  %98 = fmul double %96, %94                      ; <double> [#uses=1]
  %99 = fmul double %97, %95                      ; <double> [#uses=1]
  %100 = fsub double %98, %99                     ; <double> [#uses=1]
  %101 = fmul double %96, %95                     ; <double> [#uses=1]
  %102 = fmul double %94, %97                     ; <double> [#uses=1]
  %103 = fadd double %101, %102                   ; <double> [#uses=1]
  store double %100, double* %scevgep6970.i, align 4
  store double %103, double* %scevgep66.i, align 4
  %104 = add i32 %k15.055.i, 1                    ; <i32> [#uses=2]
  %exitcond64.i = icmp eq i32 %104, %88           ; <i1> [#uses=1]
  br i1 %exitcond64.i, label %bb34.i, label %bb32.i

bb34.i:                                           ; preds = %bb32.i, %invcont31.i
  %105 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 2 ; <i32*> [#uses=1]
  %106 = load i32* %105, align 8                  ; <i32> [#uses=16]
  br label %bb1.i.i.i

bb.i.i3.i:                                        ; preds = %bb1.i.i.i
  %107 = shl i32 %x.0.i.i.i, 1                    ; <i32> [#uses=2]
  %108 = icmp eq i32 %107, 0                      ; <i1> [#uses=1]
  br i1 %108, label %_ZN10polynomialIdE4log2Ej.exit.i.i, label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i3.i, %bb34.i
  %109 = phi i32 [ 0, %bb34.i ], [ %tmp.i.i.i, %bb.i.i3.i ] ; <i32> [#uses=2]
  %x.0.i.i.i = phi i32 [ 1, %bb34.i ], [ %107, %bb.i.i3.i ] ; <i32> [#uses=2]
  %tmp.i.i.i = add i32 %109, 1                    ; <i32> [#uses=2]
  %110 = icmp ult i32 %x.0.i.i.i, %106            ; <i1> [#uses=1]
  br i1 %110, label %bb.i.i3.i, label %_ZN10polynomialIdE4log2Ej.exit.i.i

_ZN10polynomialIdE4log2Ej.exit.i.i:               ; preds = %bb1.i.i.i, %bb.i.i3.i
  %c.1.i.i.i = phi i32 [ %tmp.i.i.i, %bb.i.i3.i ], [ %109, %bb1.i.i.i ] ; <i32> [#uses=2]
  br label %bb1.i.i.i.i

bb.i1.i.i.i:                                      ; preds = %bb1.i.i.i.i
  %111 = shl i32 %x.0.i.i.i.i, 1                  ; <i32> [#uses=2]
  %112 = icmp eq i32 %111, 0                      ; <i1> [#uses=1]
  br i1 %112, label %_ZN10polynomialIdE4log2Ej.exit.i.i.i, label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i1.i.i.i, %_ZN10polynomialIdE4log2Ej.exit.i.i
  %113 = phi i32 [ 0, %_ZN10polynomialIdE4log2Ej.exit.i.i ], [ %tmp.i2.i.i.i, %bb.i1.i.i.i ] ; <i32> [#uses=2]
  %x.0.i.i.i.i = phi i32 [ 1, %_ZN10polynomialIdE4log2Ej.exit.i.i ], [ %111, %bb.i1.i.i.i ] ; <i32> [#uses=2]
  %tmp.i2.i.i.i = add i32 %113, 1                 ; <i32> [#uses=2]
  %114 = icmp ult i32 %x.0.i.i.i.i, %106          ; <i1> [#uses=1]
  br i1 %114, label %bb.i1.i.i.i, label %_ZN10polynomialIdE4log2Ej.exit.i.i.i

_ZN10polynomialIdE4log2Ej.exit.i.i.i:             ; preds = %bb1.i.i.i.i, %bb.i1.i.i.i
  %c.1.i.i.i.i = phi i32 [ %tmp.i2.i.i.i, %bb.i1.i.i.i ], [ %113, %bb1.i.i.i.i ] ; <i32> [#uses=1]
  %115 = shl i32 %106, 4                          ; <i32> [#uses=2]
  %116 = invoke i8* @_Znaj(i32 %115)
          to label %.noexc8.i unwind label %lpad84.i ; <i8*> [#uses=10]

.noexc8.i:                                        ; preds = %_ZN10polynomialIdE4log2Ej.exit.i.i.i
  %117 = icmp eq i32 %106, 0                      ; <i1> [#uses=3]
  br i1 %117, label %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i.thread, label %bb.i.i.i.i.i

_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i.thread: ; preds = %.noexc8.i
  %118 = bitcast i8* %116 to %"struct.std::complex<double>"* ; <%"struct.std::complex<double>"*> [#uses=1]
  br label %_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %.noexc8.i
  %indvar.i.i.i.i.i = phi i32 [ %indvar.next.i.i.i.i.i, %bb.i.i.i.i.i ], [ 0, %.noexc8.i ] ; <i32> [#uses=2]
  %tmp6.i.i.i = shl i32 %indvar.i.i.i.i.i, 4      ; <i32> [#uses=2]
  %tmp717.i.i.i = or i32 %tmp6.i.i.i, 8           ; <i32> [#uses=1]
  %scevgep8.i.i.i = getelementptr i8* %116, i32 %tmp717.i.i.i ; <i8*> [#uses=1]
  %scevgep89.i.i.i.i.i = bitcast i8* %scevgep8.i.i.i to double* ; <double*> [#uses=1]
  %scevgep10.i.i.i = getelementptr i8* %116, i32 %tmp6.i.i.i ; <i8*> [#uses=1]
  %scevgep6.i.i.i.i.i = bitcast i8* %scevgep10.i.i.i to double* ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep6.i.i.i.i.i, align 4
  store double 0.000000e+00, double* %scevgep89.i.i.i.i.i, align 4
  %indvar.next.i.i.i.i.i = add i32 %indvar.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond.i.i.i = icmp eq i32 %indvar.next.i.i.i.i.i, %106 ; <i1> [#uses=1]
  br i1 %exitcond.i.i.i, label %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i, label %bb.i.i.i.i.i

_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i:    ; preds = %bb.i.i.i.i.i
  %119 = bitcast i8* %116 to %"struct.std::complex<double>"* ; <%"struct.std::complex<double>"*> [#uses=5]
  br i1 %117, label %_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i, label %bb.nph.i.i.i

bb.nph.i.i.i:                                     ; preds = %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i
  %120 = add i32 %c.1.i.i.i.i, -1                 ; <i32> [#uses=1]
  %121 = shl i32 1, %120                          ; <i32> [#uses=2]
  %122 = icmp eq i32 %121, 0                      ; <i1> [#uses=1]
  %123 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=2]
  br i1 %122, label %bb.us.i.i.i.preheader, label %bb.i2.i.i

bb.us.i.i.i.preheader:                            ; preds = %bb.nph.i.i.i
  %124 = bitcast i8* %116 to double*              ; <double*> [#uses=1]
  %125 = getelementptr inbounds i8* %116, i32 8   ; <i8*> [#uses=1]
  %126 = bitcast i8* %125 to double*              ; <double*> [#uses=1]
  br label %bb.us.i.i.i

bb.us.i.i.i:                                      ; preds = %bb.us.i.i.i, %bb.us.i.i.i.preheader
  %n.03.us.i.i.i = phi i32 [ %tmp.i1.i.i, %bb.us.i.i.i ], [ 0, %bb.us.i.i.i.preheader ] ; <i32> [#uses=3]
  %tmp.i1.i.i = add i32 %n.03.us.i.i.i, 1         ; <i32> [#uses=2]
  %127 = load %"struct.std::complex<double>"** %123, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %scevgep45.i.i.i = getelementptr inbounds %"struct.std::complex<double>"* %127, i32 %n.03.us.i.i.i, i32 0, i32 0 ; <double*> [#uses=1]
  %128 = load double* %scevgep45.i.i.i, align 4   ; <double> [#uses=1]
  %scevgep.i.i4.i = getelementptr %"struct.std::complex<double>"* %127, i32 %n.03.us.i.i.i, i32 0, i32 1 ; <double*> [#uses=1]
  %129 = load double* %scevgep.i.i4.i, align 4    ; <double> [#uses=1]
  store double %128, double* %124, align 4
  store double %129, double* %126, align 4
  %130 = icmp ugt i32 %106, %tmp.i1.i.i           ; <i1> [#uses=1]
  br i1 %130, label %bb.us.i.i.i, label %_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i

bb.i2.i.i:                                        ; preds = %_ZN10polynomialIdE9flip_bitsEjj.exit.i.i.i, %bb.nph.i.i.i
  %131 = phi i32 [ %tmp15.i.i.i, %_ZN10polynomialIdE9flip_bitsEjj.exit.i.i.i ], [ 0, %bb.nph.i.i.i ] ; <i32> [#uses=4]
  %tmp15.i.i.i = add i32 %131, 1                  ; <i32> [#uses=2]
  br label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %bb.i2.i.i
  %lm.03.i.i.i.i = phi i32 [ %121, %bb.i2.i.i ], [ %135, %bb.i.i.i.i ] ; <i32> [#uses=2]
  %rm.02.i.i.i.i = phi i32 [ 1, %bb.i2.i.i ], [ %136, %bb.i.i.i.i ] ; <i32> [#uses=2]
  %r.11.i.i.i.i = phi i32 [ 0, %bb.i2.i.i ], [ %r.1..i.i.i.i, %bb.i.i.i.i ] ; <i32> [#uses=1]
  %132 = and i32 %rm.02.i.i.i.i, %131             ; <i32> [#uses=1]
  %133 = icmp eq i32 %132, 0                      ; <i1> [#uses=1]
  %134 = select i1 %133, i32 0, i32 %lm.03.i.i.i.i ; <i32> [#uses=1]
  %r.1..i.i.i.i = or i32 %134, %r.11.i.i.i.i      ; <i32> [#uses=3]
  %135 = lshr i32 %lm.03.i.i.i.i, 1               ; <i32> [#uses=2]
  %136 = shl i32 %rm.02.i.i.i.i, 1                ; <i32> [#uses=1]
  %phitmp.i.i.i.i = icmp eq i32 %135, 0           ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i.i, label %_ZN10polynomialIdE9flip_bitsEjj.exit.i.i.i, label %bb.i.i.i.i

_ZN10polynomialIdE9flip_bitsEjj.exit.i.i.i:       ; preds = %bb.i.i.i.i
  %137 = load %"struct.std::complex<double>"** %123, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %scevgep1213.i.i.i = getelementptr inbounds %"struct.std::complex<double>"* %137, i32 %131, i32 0, i32 0 ; <double*> [#uses=1]
  %138 = load double* %scevgep1213.i.i.i, align 4 ; <double> [#uses=1]
  %scevgep14.i.i.i = getelementptr %"struct.std::complex<double>"* %137, i32 %131, i32 0, i32 1 ; <double*> [#uses=1]
  %139 = load double* %scevgep14.i.i.i, align 4   ; <double> [#uses=1]
  %140 = getelementptr inbounds %"struct.std::complex<double>"* %119, i32 %r.1..i.i.i.i, i32 0, i32 0 ; <double*> [#uses=1]
  store double %138, double* %140, align 4
  %141 = getelementptr inbounds %"struct.std::complex<double>"* %119, i32 %r.1..i.i.i.i, i32 0, i32 1 ; <double*> [#uses=1]
  store double %139, double* %141, align 4
  %142 = icmp ugt i32 %106, %tmp15.i.i.i          ; <i1> [#uses=1]
  br i1 %142, label %bb.i2.i.i, label %_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i

_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i: ; preds = %_ZN10polynomialIdE9flip_bitsEjj.exit.i.i.i, %bb.us.i.i.i, %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i, %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i.thread
  %.reg2mem.0 = phi %"struct.std::complex<double>"* [ %118, %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i.thread ], [ %119, %_ZN10polynomialISt7complexIdEEC1Ej.exit.i.i.i ], [ %119, %bb.us.i.i.i ], [ %119, %_ZN10polynomialIdE9flip_bitsEjj.exit.i.i.i ] ; <%"struct.std::complex<double>"*> [#uses=8]
  %143 = icmp eq i32 %c.1.i.i.i, 0                ; <i1> [#uses=1]
  br i1 %143, label %bb37.loopexit.i.i, label %bb.nph15.i.i

bb.nph15.i.i:                                     ; preds = %_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i
  %144 = getelementptr inbounds %0* %memtmp.i.i.i.i, i32 0, i32 0 ; <double*> [#uses=1]
  %145 = getelementptr inbounds %0* %memtmp.i.i.i.i, i32 0, i32 1 ; <double*> [#uses=1]
  %146 = add i32 %106, -1                         ; <i32> [#uses=1]
  br label %invcont.i.i

invcont.i.i:                                      ; preds = %bb33.i.i, %bb.nph15.i.i
  %m.014.i.i = phi i32 [ 2, %bb.nph15.i.i ], [ %187, %bb33.i.i ] ; <i32> [#uses=4]
  %s.013.i.i = phi i32 [ 0, %bb.nph15.i.i ], [ %189, %bb33.i.i ] ; <i32> [#uses=1]
  %m2.012.i.i = phi i32 [ 1, %bb.nph15.i.i ], [ %188, %bb33.i.i ] ; <i32> [#uses=3]
  %147 = uitofp i32 %m.014.i.i to double          ; <double> [#uses=4]
  %148 = load double* @_ZN10polynomialIdE4PI2IE.0.1, align 8 ; <double> [#uses=2]
  %149 = fsub double -0.000000e+00, %148          ; <double> [#uses=1]
  %150 = fmul double %147, -0.000000e+00          ; <double> [#uses=1]
  %151 = fmul double %148, -0.000000e+00          ; <double> [#uses=1]
  %152 = fadd double %150, %151                   ; <double> [#uses=1]
  %153 = fmul double %147, %147                   ; <double> [#uses=1]
  %154 = fadd double %153, 0.000000e+00           ; <double> [#uses=2]
  %155 = fdiv double %152, %154                   ; <double> [#uses=1]
  %156 = fmul double %147, %149                   ; <double> [#uses=1]
  %157 = fadd double %156, 0.000000e+00           ; <double> [#uses=1]
  %158 = fdiv double %157, %154                   ; <double> [#uses=1]
  %insert.i.i.i = insertvalue %0 undef, double %155, 0 ; <%0> [#uses=1]
  %insert2.i.i.i = insertvalue %0 %insert.i.i.i, double %158, 1 ; <%0> [#uses=1]
  call void @cexp(%0* noalias sret %memtmp.i.i.i.i, %0 %insert2.i.i.i) nounwind
  %159 = load double* %144, align 8               ; <double> [#uses=2]
  %160 = load double* %145, align 8               ; <double> [#uses=2]
  %161 = add i32 %m2.012.i.i, -1                  ; <i32> [#uses=1]
  br label %bb30.preheader.i.i

invcont29.i.i:                                    ; preds = %invcont29.i.i.preheader, %invcont29.i.i
  %indvar.i5.i = phi i32 [ %indvar.next.i6.i, %invcont29.i.i ], [ 0, %invcont29.i.i.preheader ] ; <i32> [#uses=2]
  %tmp21.i.i = mul i32 %indvar.i5.i, %m.014.i.i   ; <i32> [#uses=3]
  %tmp22.i.i = add i32 %184, %tmp21.i.i           ; <i32> [#uses=2]
  %tmp30.i.i = add i32 %tmp21.i.i, %tmp29.i.i     ; <i32> [#uses=2]
  %scevgep3132.i.i = getelementptr inbounds %"struct.std::complex<double>"* %.reg2mem.0, i32 %tmp30.i.i, i32 0, i32 0 ; <double*> [#uses=2]
  %162 = load double* %scevgep3132.i.i, align 8   ; <double> [#uses=2]
  %scevgep33.i.i = getelementptr %"struct.std::complex<double>"* %.reg2mem.0, i32 %tmp30.i.i, i32 0, i32 1 ; <double*> [#uses=2]
  %163 = load double* %scevgep33.i.i, align 8     ; <double> [#uses=2]
  %164 = fmul double %w.0.0.09.i.i, %162          ; <double> [#uses=1]
  %165 = fmul double %w.0.1.08.i.i, %163          ; <double> [#uses=1]
  %166 = fsub double %164, %165                   ; <double> [#uses=2]
  %167 = fmul double %w.0.0.09.i.i, %163          ; <double> [#uses=1]
  %168 = fmul double %162, %w.0.1.08.i.i          ; <double> [#uses=1]
  %169 = fadd double %167, %168                   ; <double> [#uses=2]
  %scevgep2728.i.i = getelementptr inbounds %"struct.std::complex<double>"* %.reg2mem.0, i32 %tmp22.i.i, i32 0, i32 0 ; <double*> [#uses=2]
  %170 = load double* %scevgep2728.i.i, align 4   ; <double> [#uses=2]
  %scevgep26.i.i = getelementptr %"struct.std::complex<double>"* %.reg2mem.0, i32 %tmp22.i.i, i32 0, i32 1 ; <double*> [#uses=2]
  %171 = load double* %scevgep26.i.i, align 4     ; <double> [#uses=2]
  %172 = fadd double %170, %166                   ; <double> [#uses=1]
  %173 = fadd double %171, %169                   ; <double> [#uses=1]
  store double %172, double* %scevgep2728.i.i, align 4
  store double %173, double* %scevgep26.i.i, align 4
  %174 = fsub double %170, %166                   ; <double> [#uses=1]
  %175 = fsub double %171, %169                   ; <double> [#uses=1]
  store double %174, double* %scevgep3132.i.i, align 4
  store double %175, double* %scevgep33.i.i, align 4
  %tmp38.i.i = add i32 %tmp21.i.i, %tmp37.i.i     ; <i32> [#uses=1]
  %176 = icmp ult i32 %186, %tmp38.i.i            ; <i1> [#uses=1]
  %indvar.next.i6.i = add i32 %indvar.i5.i, 1     ; <i32> [#uses=1]
  br i1 %176, label %bb31.i.i, label %invcont29.i.i

bb31.i.i:                                         ; preds = %bb30.preheader.i.i, %invcont29.i.i
  %177 = fmul double %w.0.0.09.i.i, %159          ; <double> [#uses=1]
  %178 = fmul double %w.0.1.08.i.i, %160          ; <double> [#uses=1]
  %179 = fsub double %177, %178                   ; <double> [#uses=1]
  %180 = fmul double %w.0.0.09.i.i, %160          ; <double> [#uses=1]
  %181 = fmul double %159, %w.0.1.08.i.i          ; <double> [#uses=1]
  %182 = fadd double %180, %181                   ; <double> [#uses=1]
  %183 = icmp ult i32 %161, %tmp41.i.i            ; <i1> [#uses=1]
  br i1 %183, label %bb33.i.i, label %bb30.preheader.i.i

bb30.preheader.i.i:                               ; preds = %bb31.i.i, %invcont.i.i
  %184 = phi i32 [ 0, %invcont.i.i ], [ %tmp41.i.i, %bb31.i.i ] ; <i32> [#uses=5]
  %w.0.0.09.i.i = phi double [ 1.000000e+00, %invcont.i.i ], [ %179, %bb31.i.i ] ; <double> [#uses=4]
  %w.0.1.08.i.i = phi double [ 0.000000e+00, %invcont.i.i ], [ %182, %bb31.i.i ] ; <double> [#uses=4]
  %tmp37.i.i = add i32 %184, %m.014.i.i           ; <i32> [#uses=1]
  %tmp29.i.i = add i32 %184, %m2.012.i.i          ; <i32> [#uses=1]
  %tmp41.i.i = add i32 %184, 1                    ; <i32> [#uses=2]
  %185 = icmp ult i32 %146, %184                  ; <i1> [#uses=1]
  br i1 %185, label %bb31.i.i, label %invcont29.i.i.preheader

invcont29.i.i.preheader:                          ; preds = %bb30.preheader.i.i
  %186 = add i32 %106, -1                         ; <i32> [#uses=1]
  br label %invcont29.i.i

bb33.i.i:                                         ; preds = %bb31.i.i
  %187 = shl i32 %m.014.i.i, 1                    ; <i32> [#uses=1]
  %188 = shl i32 %m2.012.i.i, 1                   ; <i32> [#uses=1]
  %189 = add i32 %s.013.i.i, 1                    ; <i32> [#uses=2]
  %exitcond.i.i = icmp eq i32 %189, %c.1.i.i.i    ; <i1> [#uses=1]
  br i1 %exitcond.i.i, label %bb37.loopexit.i.i, label %invcont.i.i

bb36.i.i:                                         ; preds = %bb37.loopexit.i.i, %bb36.i.i
  %j.15.i.i = phi i32 [ %203, %bb36.i.i ], [ 0, %bb37.loopexit.i.i ] ; <i32> [#uses=3]
  %190 = uitofp i32 %106 to double                ; <double> [#uses=4]
  %scevgep1920.i.i = getelementptr inbounds %"struct.std::complex<double>"* %.reg2mem.0, i32 %j.15.i.i, i32 0, i32 0 ; <double*> [#uses=2]
  %191 = load double* %scevgep1920.i.i, align 4   ; <double> [#uses=2]
  %scevgep16.i.i = getelementptr %"struct.std::complex<double>"* %.reg2mem.0, i32 %j.15.i.i, i32 0, i32 1 ; <double*> [#uses=2]
  %192 = load double* %scevgep16.i.i, align 4     ; <double> [#uses=2]
  %193 = fmul double %191, %190                   ; <double> [#uses=1]
  %194 = fmul double %192, 0.000000e+00           ; <double> [#uses=1]
  %195 = fadd double %193, %194                   ; <double> [#uses=1]
  %196 = fmul double %190, %190                   ; <double> [#uses=1]
  %197 = fadd double %196, 0.000000e+00           ; <double> [#uses=2]
  %198 = fdiv double %195, %197                   ; <double> [#uses=1]
  %199 = fmul double %192, %190                   ; <double> [#uses=1]
  %200 = fmul double %191, 0.000000e+00           ; <double> [#uses=1]
  %201 = fsub double %199, %200                   ; <double> [#uses=1]
  %202 = fdiv double %201, %197                   ; <double> [#uses=1]
  store double %198, double* %scevgep1920.i.i, align 4
  store double %202, double* %scevgep16.i.i, align 4
  %203 = add i32 %j.15.i.i, 1                     ; <i32> [#uses=2]
  %204 = icmp ugt i32 %106, %203                  ; <i1> [#uses=1]
  br i1 %204, label %bb36.i.i, label %_ZN10polynomialIdE11inverse_fftERKS_ISt7complexIdEE.exit.i

bb37.loopexit.i.i:                                ; preds = %bb33.i.i, %_ZN10polynomialIdE11bit_reverseERKS_ISt7complexIdEE.exit.i.i
  %205 = icmp eq i32 %106, 0                      ; <i1> [#uses=1]
  br i1 %205, label %_ZN10polynomialIdE11inverse_fftERKS_ISt7complexIdEE.exit.i, label %bb36.i.i

_ZN10polynomialIdE11inverse_fftERKS_ISt7complexIdEE.exit.i: ; preds = %bb37.loopexit.i.i, %bb36.i.i
  %206 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 2 ; <i32*> [#uses=3]
  %207 = load i32* %206, align 8                  ; <i32> [#uses=2]
  %208 = icmp eq i32 %207, %106                   ; <i1> [#uses=1]
  br i1 %208, label %bb1.i15.i, label %bb.i9.i

bb.i9.i:                                          ; preds = %_ZN10polynomialIdE11inverse_fftERKS_ISt7complexIdEE.exit.i
  %209 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=2]
  %210 = load %"struct.std::complex<double>"** %209, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %211 = icmp eq %"struct.std::complex<double>"* %210, null ; <i1> [#uses=1]
  br i1 %211, label %_ZN10polynomialISt7complexIdEE7releaseEv.exit.i.i, label %bb.i.i10.i

bb.i.i10.i:                                       ; preds = %bb.i9.i
  %212 = bitcast %"struct.std::complex<double>"* %210 to i8* ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %212) nounwind
  br label %_ZN10polynomialISt7complexIdEE7releaseEv.exit.i.i

_ZN10polynomialISt7complexIdEE7releaseEv.exit.i.i: ; preds = %bb.i.i10.i, %bb.i9.i
  store i32 %106, i32* %206, align 8
  %213 = invoke i8* @_Znaj(i32 %115)
          to label %.noexc20.i unwind label %lpad88.i ; <i8*> [#uses=3]

.noexc20.i:                                       ; preds = %_ZN10polynomialISt7complexIdEE7releaseEv.exit.i.i
  br i1 %117, label %_ZN10polynomialISt7complexIdEE7acquireEv.exit.i.i, label %bb.i4.i.i

bb.i4.i.i:                                        ; preds = %bb.i4.i.i, %.noexc20.i
  %indvar.i.i.i = phi i32 [ %indvar.next.i.i.i, %bb.i4.i.i ], [ 0, %.noexc20.i ] ; <i32> [#uses=2]
  %tmp.i11.i = shl i32 %indvar.i.i.i, 4           ; <i32> [#uses=2]
  %tmp516.i.i = or i32 %tmp.i11.i, 8              ; <i32> [#uses=1]
  %scevgep.i12.i = getelementptr i8* %213, i32 %tmp516.i.i ; <i8*> [#uses=1]
  %scevgep89.i.i.i = bitcast i8* %scevgep.i12.i to double* ; <double*> [#uses=1]
  %scevgep7.i13.i = getelementptr i8* %213, i32 %tmp.i11.i ; <i8*> [#uses=1]
  %scevgep6.i3.i.i = bitcast i8* %scevgep7.i13.i to double* ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep6.i3.i.i, align 4
  store double 0.000000e+00, double* %scevgep89.i.i.i, align 4
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=2]
  %exitcond.i14.i = icmp eq i32 %indvar.next.i.i.i, %106 ; <i1> [#uses=1]
  br i1 %exitcond.i14.i, label %_ZN10polynomialISt7complexIdEE7acquireEv.exit.i.i, label %bb.i4.i.i

_ZN10polynomialISt7complexIdEE7acquireEv.exit.i.i: ; preds = %bb.i4.i.i, %.noexc20.i
  %214 = bitcast i8* %213 to %"struct.std::complex<double>"* ; <%"struct.std::complex<double>"*> [#uses=1]
  store %"struct.std::complex<double>"* %214, %"struct.std::complex<double>"** %209, align 4
  br label %bb1.i15.i

bb1.i15.i:                                        ; preds = %_ZN10polynomialISt7complexIdEE7acquireEv.exit.i.i, %_ZN10polynomialIdE11inverse_fftERKS_ISt7complexIdEE.exit.i
  %215 = phi i32 [ %106, %_ZN10polynomialISt7complexIdEE7acquireEv.exit.i.i ], [ %207, %_ZN10polynomialIdE11inverse_fftERKS_ISt7complexIdEE.exit.i ] ; <i32> [#uses=1]
  %216 = icmp eq i32 %215, 0                      ; <i1> [#uses=1]
  br i1 %216, label %_ZN10polynomialISt7complexIdEEaSERKS2_.exit.i, label %bb.nph.i.i16.i

bb.nph.i.i16.i:                                   ; preds = %bb1.i15.i
  %217 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  br label %bb.i1.i.i

bb.i1.i.i:                                        ; preds = %bb.i1.i.i, %bb.nph.i.i16.i
  %n.01.i.i17.i = phi i32 [ 0, %bb.nph.i.i16.i ], [ %tmp9.i.i, %bb.i1.i.i ] ; <i32> [#uses=5]
  %tmp9.i.i = add i32 %n.01.i.i17.i, 1            ; <i32> [#uses=2]
  %scevgep3.i.i.i = getelementptr %"struct.std::complex<double>"* %.reg2mem.0, i32 %n.01.i.i17.i, i32 0, i32 1 ; <double*> [#uses=1]
  %scevgep2.i.i18.i = getelementptr inbounds %"struct.std::complex<double>"* %.reg2mem.0, i32 %n.01.i.i17.i, i32 0, i32 0 ; <double*> [#uses=1]
  %218 = load %"struct.std::complex<double>"** %217, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %219 = load double* %scevgep2.i.i18.i, align 4  ; <double> [#uses=1]
  %scevgep45.i.i19.i = getelementptr inbounds %"struct.std::complex<double>"* %218, i32 %n.01.i.i17.i, i32 0, i32 0 ; <double*> [#uses=1]
  store double %219, double* %scevgep45.i.i19.i, align 4
  %220 = load double* %scevgep3.i.i.i, align 4    ; <double> [#uses=1]
  %scevgep6.i.i.i = getelementptr %"struct.std::complex<double>"* %218, i32 %n.01.i.i17.i, i32 0, i32 1 ; <double*> [#uses=1]
  store double %220, double* %scevgep6.i.i.i, align 4
  %221 = load i32* %206, align 8                  ; <i32> [#uses=1]
  %222 = icmp ugt i32 %221, %tmp9.i.i             ; <i1> [#uses=1]
  br i1 %222, label %bb.i1.i.i, label %_ZN10polynomialISt7complexIdEEaSERKS2_.exit.i

_ZN10polynomialISt7complexIdEEaSERKS2_.exit.i:    ; preds = %bb.i1.i.i, %bb1.i15.i
  %223 = icmp eq i8* %116, null                   ; <i1> [#uses=1]
  br i1 %223, label %invcont43.i, label %bb.i.i24.i

bb.i.i24.i:                                       ; preds = %_ZN10polynomialISt7complexIdEEaSERKS2_.exit.i
  call void @_ZdaPv(i8* %116) nounwind
  br label %invcont43.i

invcont43.i:                                      ; preds = %bb.i.i24.i, %_ZN10polynomialISt7complexIdEEaSERKS2_.exit.i
  %224 = add i32 %88, -1                          ; <i32> [#uses=4]
  %225 = getelementptr inbounds %"struct.polynomial<double>"* %0, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %225, align 8
  %226 = getelementptr inbounds %"struct.polynomial<double>"* %0, i32 0, i32 1 ; <double**> [#uses=7]
  store double* null, double** %226, align 4
  %227 = getelementptr inbounds %"struct.polynomial<double>"* %0, i32 0, i32 2 ; <i32*> [#uses=2]
  store i32 %224, i32* %227, align 8
  %228 = shl i32 %224, 3                          ; <i32> [#uses=1]
  %229 = invoke i8* @_Znaj(i32 %228)
          to label %_ZN10polynomialIdEC1Ej.exit.i unwind label %lpad84.i ; <i8*> [#uses=1]

_ZN10polynomialIdEC1Ej.exit.i:                    ; preds = %invcont43.i
  %230 = bitcast i8* %229 to double*              ; <double*> [#uses=1]
  store double* %230, double** %226, align 4
  %231 = icmp eq i32 %224, 0                      ; <i1> [#uses=1]
  br i1 %231, label %bb52.i, label %bb.nph.i

bb.nph.i:                                         ; preds = %_ZN10polynomialIdEC1Ej.exit.i
  %232 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  br label %bb45.i

bb45.i:                                           ; preds = %bb45.i, %bb.nph.i
  %k.054.i = phi i32 [ 0, %bb.nph.i ], [ %236, %bb45.i ] ; <i32> [#uses=3]
  %233 = load double** %226, align 4              ; <double*> [#uses=1]
  %234 = load %"struct.std::complex<double>"** %232, align 4 ; <%"struct.std::complex<double>"*> [#uses=1]
  %scevgep6263.i = getelementptr inbounds %"struct.std::complex<double>"* %234, i32 %k.054.i, i32 0, i32 0 ; <double*> [#uses=1]
  %235 = load double* %scevgep6263.i, align 8     ; <double> [#uses=1]
  %scevgep.i = getelementptr double* %233, i32 %k.054.i ; <double*> [#uses=1]
  store double %235, double* %scevgep.i, align 8
  %236 = add i32 %k.054.i, 1                      ; <i32> [#uses=2]
  %exitcond61.i = icmp eq i32 %236, %224          ; <i1> [#uses=1]
  br i1 %exitcond61.i, label %bb52.i, label %bb45.i

bb52.i:                                           ; preds = %bb45.i, %_ZN10polynomialIdEC1Ej.exit.i
  %237 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %237, align 8
  %238 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %239 = load %"struct.std::complex<double>"** %238, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %240 = icmp eq %"struct.std::complex<double>"* %239, null ; <i1> [#uses=1]
  br i1 %240, label %bb59.i, label %bb.i.i21.i

bb.i.i21.i:                                       ; preds = %bb52.i
  %241 = bitcast %"struct.std::complex<double>"* %239 to i8* ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %241) nounwind
  br label %bb59.i

bb59.i:                                           ; preds = %bb.i.i21.i, %bb52.i
  %242 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %242, align 8
  %243 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %244 = load %"struct.std::complex<double>"** %243, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %245 = icmp eq %"struct.std::complex<double>"* %244, null ; <i1> [#uses=1]
  br i1 %245, label %bb66.i, label %bb.i.i18.i

bb.i.i18.i:                                       ; preds = %bb59.i
  %246 = bitcast %"struct.std::complex<double>"* %244 to i8* ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %246) nounwind
  br label %bb66.i

bb66.i:                                           ; preds = %bb.i.i18.i, %bb59.i
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %45, align 8
  %247 = load double** %46, align 4               ; <double*> [#uses=2]
  %248 = icmp eq double* %247, null               ; <i1> [#uses=1]
  br i1 %248, label %bb73.i, label %bb.i.i15.i

bb.i.i15.i:                                       ; preds = %bb66.i
  %249 = bitcast double* %247 to i8*              ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %249) nounwind
  br label %bb73.i

invcont71.i:                                      ; preds = %bb.i.i6.i, %ppad.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.3.i)
          to label %.noexc6 unwind label %lpad51

.noexc6:                                          ; preds = %invcont71.i
  unreachable

bb73.i:                                           ; preds = %bb.i.i15.i, %bb66.i
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %36, align 8
  %250 = load double** %37, align 4               ; <double*> [#uses=2]
  %251 = icmp eq double* %250, null               ; <i1> [#uses=1]
  br i1 %251, label %invcont10, label %bb.i.i12.i

bb.i.i12.i:                                       ; preds = %bb73.i
  %252 = bitcast double* %250 to i8*              ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %252) nounwind
  br label %invcont10

lpad.i:                                           ; preds = %_ZN10polynomialIdEC1ERKS0_.exit.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select75.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad76.i:                                         ; preds = %bb29.i, %bb.i35.i, %bb26.i, %bb.i.i2, %bb.i1
  %eh_ptr77.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select79.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr77.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad112.i

lpad80.i:                                         ; preds = %invcont30.i
  %eh_ptr81.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select83.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr81.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad113.i

lpad84.i:                                         ; preds = %invcont43.i, %_ZN10polynomialIdE4log2Ej.exit.i.i.i
  %eh_ptr85.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select87.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr85.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad114.i

lpad88.i:                                         ; preds = %_ZN10polynomialISt7complexIdEE7releaseEv.exit.i.i
  %eh_ptr89.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=3]
  %eh_select91.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr89.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %253 = icmp eq i8* %116, null                   ; <i1> [#uses=1]
  br i1 %253, label %ppad114.i, label %bb.i.i9.i

bb.i.i9.i:                                        ; preds = %lpad88.i
  call void @_ZdaPv(i8* %116) nounwind
  br label %ppad114.i

ppad.i:                                           ; preds = %bb.i.i5.i, %ppad112.i, %lpad.i
  %eh_exception.3.i = phi i8* [ %eh_ptr.i, %lpad.i ], [ %eh_exception.2.i, %bb.i.i5.i ], [ %eh_exception.2.i, %ppad112.i ] ; <i8*> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %36, align 8
  %254 = load double** %37, align 4               ; <double*> [#uses=2]
  %255 = icmp eq double* %254, null               ; <i1> [#uses=1]
  br i1 %255, label %invcont71.i, label %bb.i.i6.i

bb.i.i6.i:                                        ; preds = %ppad.i
  %256 = bitcast double* %254 to i8*              ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %256) nounwind
  br label %invcont71.i

ppad112.i:                                        ; preds = %bb.i.i2.i, %ppad113.i, %lpad76.i
  %eh_exception.2.i = phi i8* [ %eh_ptr77.i, %lpad76.i ], [ %eh_exception.1.i, %bb.i.i2.i ], [ %eh_exception.1.i, %ppad113.i ] ; <i8*> [#uses=2]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %45, align 8
  %257 = load double** %46, align 4               ; <double*> [#uses=2]
  %258 = icmp eq double* %257, null               ; <i1> [#uses=1]
  br i1 %258, label %ppad.i, label %bb.i.i5.i

bb.i.i5.i:                                        ; preds = %ppad112.i
  %259 = bitcast double* %257 to i8*              ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %259) nounwind
  br label %ppad.i

ppad113.i:                                        ; preds = %bb.i.i1.i, %ppad114.i, %lpad80.i
  %eh_exception.1.i = phi i8* [ %eh_ptr81.i, %lpad80.i ], [ %eh_exception.0.i, %bb.i.i1.i ], [ %eh_exception.0.i, %ppad114.i ] ; <i8*> [#uses=2]
  %260 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %260, align 8
  %261 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft1.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %262 = load %"struct.std::complex<double>"** %261, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %263 = icmp eq %"struct.std::complex<double>"* %262, null ; <i1> [#uses=1]
  br i1 %263, label %ppad112.i, label %bb.i.i2.i

bb.i.i2.i:                                        ; preds = %ppad113.i
  %264 = bitcast %"struct.std::complex<double>"* %262 to i8* ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %264) nounwind
  br label %ppad112.i

ppad114.i:                                        ; preds = %bb.i.i9.i, %lpad88.i, %lpad84.i
  %eh_exception.0.i = phi i8* [ %eh_ptr85.i, %lpad84.i ], [ %eh_ptr89.i, %bb.i.i9.i ], [ %eh_ptr89.i, %lpad88.i ] ; <i8*> [#uses=2]
  %265 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %265, align 8
  %266 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %dft2.i, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %267 = load %"struct.std::complex<double>"** %266, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %268 = icmp eq %"struct.std::complex<double>"* %267, null ; <i1> [#uses=1]
  br i1 %268, label %ppad113.i, label %bb.i.i1.i

bb.i.i1.i:                                        ; preds = %ppad114.i
  %269 = bitcast %"struct.std::complex<double>"* %267 to i8* ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %269) nounwind
  br label %ppad113.i

invcont10:                                        ; preds = %bb.i.i12.i, %bb73.i
  %270 = load i32* %227, align 8                  ; <i32> [#uses=4]
  %271 = icmp eq i32 %270, 1048575                ; <i1> [#uses=1]
  br i1 %271, label %bb1.i.thread, label %bb.i

bb1.i.thread:                                     ; preds = %invcont10
  %272 = load double** %226, align 4              ; <double*> [#uses=1]
  br label %bb.i1.i.preheader

bb.i:                                             ; preds = %invcont10
  %273 = icmp eq i8* %11, null                    ; <i1> [#uses=1]
  br i1 %273, label %_ZN10polynomialIdE7releaseEv.exit.i25, label %bb.i.i24

bb.i.i24:                                         ; preds = %bb.i
  call void @_ZdaPv(i8* %11) nounwind
  br label %_ZN10polynomialIdE7releaseEv.exit.i25

_ZN10polynomialIdE7releaseEv.exit.i25:            ; preds = %bb.i.i24, %bb.i
  %274 = shl i32 %270, 3                          ; <i32> [#uses=1]
  %275 = invoke i8* @_Znaj(i32 %274)
          to label %bb1.i unwind label %lpad55    ; <i8*> [#uses=1]

bb1.i:                                            ; preds = %_ZN10polynomialIdE7releaseEv.exit.i25
  %276 = bitcast i8* %275 to double*              ; <double*> [#uses=2]
  %phitmp32 = icmp eq i32 %270, 0                 ; <i1> [#uses=1]
  %277 = load double** %226, align 4              ; <double*> [#uses=2]
  br i1 %phitmp32, label %bb15, label %bb.i1.i.preheader

bb.i1.i.preheader:                                ; preds = %bb1.i, %bb1.i.thread
  %poly3.2.0.reg2mem.0.ph = phi i32 [ 1048575, %bb1.i.thread ], [ %270, %bb1.i ] ; <i32> [#uses=1]
  %poly3.1.0.reg2mem.0.ph = phi double* [ %12, %bb1.i.thread ], [ %276, %bb1.i ] ; <double*> [#uses=2]
  %.reg2mem15.0.ph = phi double* [ %272, %bb1.i.thread ], [ %277, %bb1.i ] ; <double*> [#uses=1]
  br label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i1.i, %bb.i1.i.preheader
  %n.01.i.i = phi i32 [ %tmp.i, %bb.i1.i ], [ 0, %bb.i1.i.preheader ] ; <i32> [#uses=3]
  %scevgep2.i.i = getelementptr double* %poly3.1.0.reg2mem.0.ph, i32 %n.01.i.i ; <double*> [#uses=1]
  %scevgep.i.i = getelementptr double* %.reg2mem15.0.ph, i32 %n.01.i.i ; <double*> [#uses=1]
  %tmp.i = add i32 %n.01.i.i, 1                   ; <i32> [#uses=2]
  %278 = load double* %scevgep.i.i, align 4       ; <double> [#uses=1]
  store double %278, double* %scevgep2.i.i, align 4
  %exitcond = icmp eq i32 %tmp.i, %poly3.2.0.reg2mem.0.ph ; <i1> [#uses=1]
  br i1 %exitcond, label %bb15.loopexit, label %bb.i1.i

bb15.loopexit:                                    ; preds = %bb.i1.i
  %.pre = load double** %226, align 4             ; <double*> [#uses=1]
  br label %bb15

bb15:                                             ; preds = %bb15.loopexit, %bb1.i
  %poly3.1.0.reg2mem.1 = phi double* [ %poly3.1.0.reg2mem.0.ph, %bb15.loopexit ], [ %276, %bb1.i ] ; <double*> [#uses=7]
  %279 = phi double* [ %.pre, %bb15.loopexit ], [ %277, %bb1.i ] ; <double*> [#uses=2]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %225, align 8
  %280 = icmp eq double* %279, null               ; <i1> [#uses=1]
  br i1 %280, label %invcont16, label %bb.i.i21

bb.i.i21:                                         ; preds = %bb15
  %281 = bitcast double* %279 to i8*              ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %281) nounwind
  br label %invcont16

invcont16:                                        ; preds = %bb.i.i21, %bb15
  %toBool = icmp eq i8 %ga_testing.0, 0           ; <i1> [#uses=1]
  br i1 %toBool, label %bb19, label %bb17

bb17:                                             ; preds = %invcont16
  invoke fastcc void @_ZNSo9_M_insertIdEERSoT_()
          to label %bb23 unwind label %lpad51

bb19:                                             ; preds = %invcont16
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), i32 31)
          to label %invcont20 unwind label %lpad51

invcont20:                                        ; preds = %bb19
  invoke fastcc void @_ZNSo9_M_insertIdEERSoT_()
          to label %invcont21 unwind label %lpad51

invcont21:                                        ; preds = %invcont20
  invoke fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i32 2)
          to label %bb23 unwind label %lpad51

bb23:                                             ; preds = %invcont21, %bb17
  invoke fastcc void @_ZNSo5flushEv(%"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4cout)
          to label %invcont24 unwind label %lpad51

invcont24:                                        ; preds = %bb23
  %282 = icmp eq double* %poly3.1.0.reg2mem.1, null ; <i1> [#uses=1]
  br i1 %282, label %bb36, label %bb.i.i16

bb.i.i16:                                         ; preds = %invcont24
  %283 = bitcast double* %poly3.1.0.reg2mem.1 to i8* ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %283) nounwind
  br label %bb36

bb36:                                             ; preds = %bb.i.i16, %invcont24
  %284 = icmp eq i8* %9, null                     ; <i1> [#uses=1]
  br i1 %284, label %bb43, label %bb.i.i13

bb.i.i13:                                         ; preds = %bb36
  call void @_ZdaPv(i8* %9) nounwind
  br label %bb43

invcont41:                                        ; preds = %bb.i.i4, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.2)
  unreachable

bb43:                                             ; preds = %bb.i.i13, %bb36
  %285 = icmp eq i8* %7, null                     ; <i1> [#uses=1]
  br i1 %285, label %_ZN10polynomialIdED1Ev.exit12, label %bb.i.i10

bb.i.i10:                                         ; preds = %bb43
  call void @_ZdaPv(i8* %7) nounwind
  ret i32 0

_ZN10polynomialIdED1Ev.exit12:                    ; preds = %bb43
  ret i32 0

lpad:                                             ; preds = %bb5
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select46 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad47:                                           ; preds = %invcont
  %eh_ptr48 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select50 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr48, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad75

lpad51:                                           ; preds = %bb23, %invcont21, %invcont20, %bb19, %bb17, %invcont71.i, %bb8.bb9_crit_edge
  %poly3.1.1 = phi double* [ %poly3.1.0.reg2mem.1, %bb17 ], [ %poly3.1.0.reg2mem.1, %bb19 ], [ %poly3.1.0.reg2mem.1, %invcont20 ], [ %poly3.1.0.reg2mem.1, %invcont21 ], [ %poly3.1.0.reg2mem.1, %bb23 ], [ %12, %bb8.bb9_crit_edge ], [ %12, %invcont71.i ] ; <double*> [#uses=1]
  %eh_ptr52 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select54 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr52, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad76

lpad55:                                           ; preds = %_ZN10polynomialIdE7releaseEv.exit.i25
  %eh_ptr56 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=3]
  %eh_select58 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr56, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %225, align 8
  %286 = load double** %226, align 4              ; <double*> [#uses=2]
  %287 = icmp eq double* %286, null               ; <i1> [#uses=1]
  br i1 %287, label %ppad76, label %bb.i.i7

bb.i.i7:                                          ; preds = %lpad55
  %288 = bitcast double* %286 to i8*              ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %288) nounwind
  br label %ppad76

ppad:                                             ; preds = %bb.i.i1, %ppad75, %lpad
  %eh_exception.2 = phi i8* [ %eh_ptr, %lpad ], [ %eh_exception.1, %bb.i.i1 ], [ %eh_exception.1, %ppad75 ] ; <i8*> [#uses=1]
  %289 = icmp eq i8* %7, null                     ; <i1> [#uses=1]
  br i1 %289, label %invcont41, label %bb.i.i4

bb.i.i4:                                          ; preds = %ppad
  call void @_ZdaPv(i8* %7) nounwind
  br label %invcont41

ppad75:                                           ; preds = %bb.i.i, %ppad76, %lpad47
  %eh_exception.1 = phi i8* [ %eh_ptr48, %lpad47 ], [ %eh_exception.0, %bb.i.i ], [ %eh_exception.0, %ppad76 ] ; <i8*> [#uses=2]
  %290 = icmp eq i8* %9, null                     ; <i1> [#uses=1]
  br i1 %290, label %ppad, label %bb.i.i1

bb.i.i1:                                          ; preds = %ppad75
  call void @_ZdaPv(i8* %9) nounwind
  br label %ppad

ppad76:                                           ; preds = %bb.i.i7, %lpad55, %lpad51
  %poly3.1.2 = phi double* [ %poly3.1.1, %lpad51 ], [ %12, %bb.i.i7 ], [ %12, %lpad55 ] ; <double*> [#uses=2]
  %eh_exception.0 = phi i8* [ %eh_ptr52, %lpad51 ], [ %eh_ptr56, %bb.i.i7 ], [ %eh_ptr56, %lpad55 ] ; <i8*> [#uses=2]
  %291 = icmp eq double* %poly3.1.2, null         ; <i1> [#uses=1]
  br i1 %291, label %ppad75, label %bb.i.i

bb.i.i:                                           ; preds = %ppad76
  %292 = bitcast double* %poly3.1.2 to i8*        ; <i8*> [#uses=1]
  call void @_ZdaPv(i8* %292) nounwind
  br label %ppad75
}

define internal void @_GLOBAL__I_main() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<char>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  %1 = load i8* bitcast (i64* @_ZGVN10polynomialIdE4PI2IE to i8*), align 8 ; <i8> [#uses=1]
  %2 = icmp eq i8 %1, 0                           ; <i1> [#uses=1]
  br i1 %2, label %bb2.i, label %_Z41__static_initialization_and_destruction_0ii.exit

bb2.i:                                            ; preds = %entry
  store i8 1, i8* bitcast (i64* @_ZGVN10polynomialIdE4PI2IE to i8*), align 8
  store double 0x401921FB54442D18, double* @_ZN10polynomialIdE4PI2IE.0.1, align 8
  ret void

_Z41__static_initialization_and_destruction_0ii.exit: ; preds = %entry
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

declare void @_ZdlPv(i8*) nounwind

declare void @_ZdaPv(i8*) nounwind

define internal void @_ZN10polynomialIdED0Ev(%"struct.polynomial<double>"* %this) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.polynomial<double>"* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %"struct.polynomial<double>"* %this, i32 0, i32 1 ; <double**> [#uses=1]
  %2 = load double** %1, align 4                  ; <double*> [#uses=2]
  %3 = icmp eq double* %2, null                   ; <i1> [#uses=1]
  br i1 %3, label %_ZN10polynomialIdE7releaseEv.exit, label %bb.i

bb.i:                                             ; preds = %entry
  %4 = bitcast double* %2 to i8*                  ; <i8*> [#uses=1]
  tail call void @_ZdaPv(i8* %4) nounwind
  br label %_ZN10polynomialIdE7releaseEv.exit

_ZN10polynomialIdE7releaseEv.exit:                ; preds = %bb.i, %entry
  %5 = bitcast %"struct.polynomial<double>"* %this to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %5) nounwind
  ret void
}

define internal void @_ZN10polynomialIdED1Ev(%"struct.polynomial<double>"* nocapture %this) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.polynomial<double>"* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialIdE, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %"struct.polynomial<double>"* %this, i32 0, i32 1 ; <double**> [#uses=1]
  %2 = load double** %1, align 4                  ; <double*> [#uses=2]
  %3 = icmp eq double* %2, null                   ; <i1> [#uses=1]
  br i1 %3, label %_ZN10polynomialIdE7releaseEv.exit, label %bb.i

bb.i:                                             ; preds = %entry
  %4 = bitcast double* %2 to i8*                  ; <i8*> [#uses=1]
  tail call void @_ZdaPv(i8* %4) nounwind
  ret void

_ZN10polynomialIdE7releaseEv.exit:                ; preds = %entry
  ret void
}

define internal void @_ZN10polynomialISt7complexIdEED0Ev(%"struct.polynomial<std::complex<double> >"* %this) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %this, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %2 = load %"struct.std::complex<double>"** %1, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %3 = icmp eq %"struct.std::complex<double>"* %2, null ; <i1> [#uses=1]
  br i1 %3, label %_ZN10polynomialISt7complexIdEE7releaseEv.exit, label %bb.i

bb.i:                                             ; preds = %entry
  %4 = bitcast %"struct.std::complex<double>"* %2 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdaPv(i8* %4) nounwind
  br label %_ZN10polynomialISt7complexIdEE7releaseEv.exit

_ZN10polynomialISt7complexIdEE7releaseEv.exit:    ; preds = %bb.i, %entry
  %5 = bitcast %"struct.polynomial<std::complex<double> >"* %this to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %5) nounwind
  ret void
}

define internal void @_ZN10polynomialISt7complexIdEED1Ev(%"struct.polynomial<std::complex<double> >"* nocapture %this) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %this, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=1]
  %2 = load %"struct.std::complex<double>"** %1, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %3 = icmp eq %"struct.std::complex<double>"* %2, null ; <i1> [#uses=1]
  br i1 %3, label %_ZN10polynomialISt7complexIdEE7releaseEv.exit, label %bb.i

bb.i:                                             ; preds = %entry
  %4 = bitcast %"struct.std::complex<double>"* %2 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdaPv(i8* %4) nounwind
  ret void

_ZN10polynomialISt7complexIdEE7releaseEv.exit:    ; preds = %entry
  ret void
}

declare i8* @_Znaj(i32)

declare void @__cxa_rethrow() noreturn

declare i8* @_Znwj(i32)

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare void @llvm.memory.barrier(i1, i1, i1, i1, i1) nounwind

declare i32 @llvm.atomic.load.add.i32.p0i32(i32* nocapture, i32) nounwind

define internal fastcc i32 @_ZN10polynomialIdE11stretch_fftEv(%"struct.polynomial<double>"* nocapture %this) {
entry:
  %0 = alloca %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >", align 8 ; <%"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*> [#uses=2]
  %1 = getelementptr inbounds %"struct.polynomial<double>"* %this, i32 0, i32 2 ; <i32*> [#uses=4]
  %2 = load i32* %1, align 4                      ; <i32> [#uses=6]
  br label %bb

bb:                                               ; preds = %bb1, %entry
  %n.0 = phi i32 [ 1, %entry ], [ %4, %bb1 ]      ; <i32> [#uses=3]
  %3 = icmp ugt i32 %2, %n.0                      ; <i1> [#uses=1]
  %4 = shl i32 %n.0, 1                            ; <i32> [#uses=5]
  br i1 %3, label %bb1, label %bb18

bb1:                                              ; preds = %bb
  %5 = icmp eq i32 %4, 0                          ; <i1> [#uses=1]
  br i1 %5, label %bb2.i, label %bb

bb2.i:                                            ; preds = %bb1
  br i1 icmp ugt (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 1073741820), label %bb.i.i1, label %bb1.i.i

bb.i.i1:                                          ; preds = %bb2.i
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %bb.i.i1
  unreachable

bb1.i.i:                                          ; preds = %bb2.i
  %6 = invoke i8* @_Znwj(i32 select (i1 icmp ugt (i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 29), i32 4096), i32 add (i32 select (i1 icmp ugt (i32 add (i32 sub (i32 4096, i32 and (i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 29), i32 4095)), i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32))), i32 1073741820), i32 1073741820, i32 add (i32 sub (i32 4096, i32 and (i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 29), i32 4095)), i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)))), i32 13), i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 13)))
          to label %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i unwind label %lpad.i.i ; <i8*> [#uses=5]

lpad.i.i:                                         ; preds = %bb1.i.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select14.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc4 unwind label %lpad

.noexc4:                                          ; preds = %lpad.i.i
  unreachable

_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i:            ; preds = %bb1.i.i
  %7 = getelementptr inbounds i8* %6, i32 4       ; <i8*> [#uses=1]
  %8 = bitcast i8* %7 to i32*                     ; <i32*> [#uses=1]
  store i32 select (i1 icmp ugt (i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 29), i32 4096), i32 select (i1 icmp ugt (i32 add (i32 sub (i32 4096, i32 and (i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 29), i32 4095)), i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32))), i32 1073741820), i32 1073741820, i32 add (i32 sub (i32 4096, i32 and (i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 29), i32 4095)), i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)))), i32 34), i32* %8, align 4
  %9 = getelementptr inbounds i8* %6, i32 8       ; <i8*> [#uses=1]
  %10 = bitcast i8* %9 to i32*                    ; <i32*> [#uses=2]
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i8* %6, i32 12     ; <i8*> [#uses=3]
  br i1 icmp eq (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 1), label %bb.i.i.i2, label %bb1.i.i.i3

bb.i.i.i2:                                        ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i
  store i8 111, i8* %11
  br label %invcont

bb1.i.i.i3:                                       ; preds = %_ZNSs4_Rep9_S_createEjjRKSaIcE.exit.i
  call void @llvm.memcpy.i32(i8* %11, i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0), i32 34, i32 1) nounwind
  br label %invcont

invcont:                                          ; preds = %bb1.i.i.i3, %bb.i.i.i2
  store i32 0, i32* %10, align 4
  %12 = bitcast i8* %6 to i32*                    ; <i32*> [#uses=1]
  store i32 34, i32* %12, align 4
  %13 = getelementptr inbounds i8* %6, i32 add (i32 sub (i32 ptrtoint (i8* getelementptr ([35 x i8]* @.str2, i32 0, i32 34) to i32), i32 ptrtoint ([35 x i8]* @.str2 to i32)), i32 12) ; <i8*> [#uses=1]
  %14 = load i8* @_ZNSs4_Rep11_S_terminalE, align 1 ; <i8> [#uses=1]
  store i8 %14, i8* %13, align 1
  %15 = getelementptr inbounds %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %0, i32 0, i32 0, i32 0 ; <i8**> [#uses=3]
  store i8* %11, i8** %15, align 8
  %16 = call i8* @__cxa_allocate_exception(i32 8) nounwind ; <i8*> [#uses=3]
  %17 = bitcast i8* %16 to %"struct.std::overflow_error"* ; <%"struct.std::overflow_error"*> [#uses=1]
  invoke void @_ZNSt14overflow_errorC1ERKSs(%"struct.std::overflow_error"* %17, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"* %0)
          to label %bb11 unwind label %lpad24

bb11:                                             ; preds = %invcont
  %18 = load i8** %15, align 8                    ; <i8*> [#uses=2]
  %19 = getelementptr inbounds i8* %18, i32 -12   ; <i8*> [#uses=2]
  %20 = icmp eq i8* %19, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %20, label %bb17, label %bb.i.i2

bb.i.i2:                                          ; preds = %bb11
  %21 = getelementptr inbounds i8* %18, i32 -4    ; <i8*> [#uses=1]
  %22 = bitcast i8* %21 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i3, label %bb1.i.i.i4

bb.i.i.i3:                                        ; preds = %bb.i.i2
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %23 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %22, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5

bb1.i.i.i4:                                       ; preds = %bb.i.i2
  %24 = load i32* %22, align 4                    ; <i32> [#uses=2]
  %25 = add nsw i32 %24, -1                       ; <i32> [#uses=1]
  store i32 %25, i32* %22, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5: ; preds = %bb1.i.i.i4, %bb.i.i.i3
  %26 = phi i32 [ %24, %bb1.i.i.i4 ], [ %23, %bb.i.i.i3 ] ; <i32> [#uses=1]
  %27 = icmp slt i32 %26, 1                       ; <i1> [#uses=1]
  br i1 %27, label %bb2.i.i6, label %bb17

bb2.i.i6:                                         ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5
  call void @_ZdlPv(i8* %19) nounwind
  br label %bb17

bb17:                                             ; preds = %bb2.i.i6, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i5, %bb11
  call void @__cxa_throw(i8* %16, i8* bitcast (%struct.__si_class_type_info_pseudo* @_ZTISt14overflow_error to i8*), void (i8*)* bitcast (void (%"struct.std::overflow_error"*)* @_ZNSt14overflow_errorD1Ev to void (i8*)*)) noreturn
  unreachable

bb18:                                             ; preds = %bb
  %28 = sub i32 %4, %2                            ; <i32> [#uses=2]
  %29 = icmp eq i32 %4, %2                        ; <i1> [#uses=1]
  br i1 %29, label %bb20, label %bb.i

bb.i:                                             ; preds = %bb18
  %30 = getelementptr inbounds %"struct.polynomial<double>"* %this, i32 0, i32 1 ; <double**> [#uses=4]
  %31 = load double** %30, align 4                ; <double*> [#uses=1]
  store i32 %4, i32* %1, align 4
  %32 = shl i32 %n.0, 4                           ; <i32> [#uses=1]
  %33 = call i8* @_Znaj(i32 %32)                  ; <i8*> [#uses=1]
  %34 = bitcast i8* %33 to double*                ; <double*> [#uses=1]
  store double* %34, double** %30, align 4
  %35 = icmp eq i32 %2, 0                         ; <i1> [#uses=1]
  br i1 %35, label %bb4.loopexit.i, label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb.i
  %n.02.i = phi i32 [ %38, %bb1.i ], [ 0, %bb.i ] ; <i32> [#uses=3]
  %scevgep7.i = getelementptr double* %31, i32 %n.02.i ; <double*> [#uses=1]
  %36 = load double** %30, align 4                ; <double*> [#uses=1]
  %37 = load double* %scevgep7.i, align 4         ; <double> [#uses=1]
  %scevgep8.i = getelementptr double* %36, i32 %n.02.i ; <double*> [#uses=1]
  store double %37, double* %scevgep8.i, align 4
  %38 = add i32 %n.02.i, 1                        ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %38, %2                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4.loopexit.i, label %bb1.i

bb.nph.i:                                         ; preds = %bb4.loopexit.i
  %tmp5.i = add i32 %n.0.lcssa.i, 1               ; <i32> [#uses=1]
  br label %bb3.i1

bb3.i1:                                           ; preds = %bb3.i1, %bb.nph.i
  %indvar.i = phi i32 [ 0, %bb.nph.i ], [ %indvar.next.i, %bb3.i1 ] ; <i32> [#uses=3]
  %tmp6.i = add i32 %indvar.i, %tmp5.i            ; <i32> [#uses=1]
  %tmp = add i32 %indvar.i, %n.0.lcssa.i          ; <i32> [#uses=1]
  %39 = load double** %30, align 4                ; <double*> [#uses=1]
  %scevgep.i = getelementptr double* %39, i32 %tmp ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep.i, align 4
  %40 = load i32* %1, align 4                     ; <i32> [#uses=1]
  %41 = icmp ugt i32 %40, %tmp6.i                 ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %41, label %bb3.i1, label %_ZN10polynomialIdE7stretchEj.exit

bb4.loopexit.i:                                   ; preds = %bb1.i, %bb.i
  %n.0.lcssa.i = phi i32 [ 0, %bb.i ], [ %2, %bb1.i ] ; <i32> [#uses=3]
  %42 = load i32* %1, align 4                     ; <i32> [#uses=1]
  %43 = icmp ugt i32 %42, %n.0.lcssa.i            ; <i1> [#uses=1]
  br i1 %43, label %bb.nph.i, label %_ZN10polynomialIdE7stretchEj.exit

_ZN10polynomialIdE7stretchEj.exit:                ; preds = %bb4.loopexit.i, %bb3.i1
  ret i32 %28

bb20:                                             ; preds = %bb18
  ret i32 %28

lpad:                                             ; preds = %lpad.i.i, %bb.i.i1
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select23 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad24:                                           ; preds = %invcont
  %eh_ptr25 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=4]
  %eh_select27 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr25, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @__cxa_free_exception(i8* %16) nounwind
  %44 = load i8** %15, align 8                    ; <i8*> [#uses=2]
  %45 = getelementptr inbounds i8* %44, i32 -12   ; <i8*> [#uses=2]
  %46 = icmp eq i8* %45, bitcast ([4 x i32]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*) ; <i1> [#uses=1]
  br i1 %46, label %ppad, label %bb.i.i

bb.i.i:                                           ; preds = %lpad24
  %47 = getelementptr inbounds i8* %44, i32 -4    ; <i8*> [#uses=1]
  %48 = bitcast i8* %47 to i32*                   ; <i32*> [#uses=3]
  br i1 icmp ne (i8 zext (i1 icmp ne (i32 zext (i1 icmp ne (i32 (i32)* @_ZL22__gthrw_pthread_cancelm, i32 (i32)* null) to i32), i32 0) to i8), i8 0), label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i
  call void @llvm.memory.barrier(i1 true, i1 true, i1 true, i1 true, i1 true) nounwind
  %49 = call i32 @llvm.atomic.load.add.i32.p0i32(i32* %48, i32 -1) nounwind ; <i32> [#uses=1]
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i
  %50 = load i32* %48, align 4                    ; <i32> [#uses=2]
  %51 = add nsw i32 %50, -1                       ; <i32> [#uses=1]
  store i32 %51, i32* %48, align 4
  br label %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i

_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i: ; preds = %bb1.i.i.i, %bb.i.i.i
  %52 = phi i32 [ %50, %bb1.i.i.i ], [ %49, %bb.i.i.i ] ; <i32> [#uses=1]
  %53 = icmp slt i32 %52, 1                       ; <i1> [#uses=1]
  br i1 %53, label %bb2.i.i, label %ppad

bb2.i.i:                                          ; preds = %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i
  call void @_ZdlPv(i8* %45) nounwind
  br label %ppad

ppad:                                             ; preds = %bb2.i.i, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i, %lpad24, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr25, %bb2.i.i ], [ %eh_ptr25, %lpad24 ], [ %eh_ptr25, %_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii.exit.i.i ] ; <i8*> [#uses=1]
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable
}

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @_ZNSt14overflow_errorC1ERKSs(%"struct.std::overflow_error"*, %"struct.std::basic_string<char,std::char_traits<char>,std::allocator<char> >"*)

declare void @__cxa_free_exception(i8*) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

define internal void @_ZNSt14overflow_errorD1Ev(%"struct.std::overflow_error"* %this) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.std::overflow_error"* %this, i32 0, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTVSt14overflow_error, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %"struct.std::overflow_error"* %this, i32 0, i32 0 ; <%"struct.std::runtime_error"*> [#uses=1]
  tail call void @_ZNSt13runtime_errorD2Ev(%"struct.std::runtime_error"* %1) nounwind
  ret void
}

define internal void @_ZNSt14overflow_errorD0Ev(%"struct.std::overflow_error"* %this) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.std::overflow_error"* %this, i32 0, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTVSt14overflow_error, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %"struct.std::overflow_error"* %this, i32 0, i32 0 ; <%"struct.std::runtime_error"*> [#uses=1]
  tail call void @_ZNSt13runtime_errorD2Ev(%"struct.std::runtime_error"* %1) nounwind
  %2 = bitcast %"struct.std::overflow_error"* %this to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %2) nounwind
  ret void
}

declare i8* @_ZNKSt13runtime_error4whatEv(%"struct.std::runtime_error"*) nounwind

declare void @_ZNSt13runtime_errorD2Ev(%"struct.std::runtime_error"*) nounwind

declare void @cexp(%0* noalias sret, %0) nounwind

define internal fastcc void @_ZN10polynomialIdE3fftERKS0_(%"struct.polynomial<std::complex<double> >"* noalias nocapture sret %agg.result, %"struct.polynomial<double>"* nocapture %poly) {
entry:
  %memtmp.i.i = alloca %0, align 8                ; <%0*> [#uses=3]
  %0 = getelementptr inbounds %"struct.polynomial<double>"* %poly, i32 0, i32 2 ; <i32*> [#uses=6]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=6]
  br label %bb1.i

bb.i:                                             ; preds = %bb1.i
  %2 = shl i32 %x.0.i, 1                          ; <i32> [#uses=2]
  %3 = icmp eq i32 %2, 0                          ; <i1> [#uses=1]
  br i1 %3, label %_ZN10polynomialIdE4log2Ej.exit, label %bb1.i

bb1.i:                                            ; preds = %bb.i, %entry
  %4 = phi i32 [ 0, %entry ], [ %tmp.i, %bb.i ]   ; <i32> [#uses=2]
  %x.0.i = phi i32 [ 1, %entry ], [ %2, %bb.i ]   ; <i32> [#uses=2]
  %tmp.i = add i32 %4, 1                          ; <i32> [#uses=2]
  %5 = icmp ult i32 %x.0.i, %1                    ; <i1> [#uses=1]
  br i1 %5, label %bb.i, label %_ZN10polynomialIdE4log2Ej.exit

_ZN10polynomialIdE4log2Ej.exit:                   ; preds = %bb1.i, %bb.i
  %c.1.i = phi i32 [ %tmp.i, %bb.i ], [ %4, %bb1.i ] ; <i32> [#uses=2]
  br label %bb1.i.i

bb.i1.i:                                          ; preds = %bb1.i.i
  %6 = shl i32 %x.0.i.i, 1                        ; <i32> [#uses=2]
  %7 = icmp eq i32 %6, 0                          ; <i1> [#uses=1]
  br i1 %7, label %_ZN10polynomialIdE4log2Ej.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb.i1.i, %_ZN10polynomialIdE4log2Ej.exit
  %8 = phi i32 [ 0, %_ZN10polynomialIdE4log2Ej.exit ], [ %tmp.i2.i, %bb.i1.i ] ; <i32> [#uses=2]
  %x.0.i.i = phi i32 [ 1, %_ZN10polynomialIdE4log2Ej.exit ], [ %6, %bb.i1.i ] ; <i32> [#uses=2]
  %tmp.i2.i = add i32 %8, 1                       ; <i32> [#uses=2]
  %9 = icmp ult i32 %x.0.i.i, %1                  ; <i1> [#uses=1]
  br i1 %9, label %bb.i1.i, label %_ZN10polynomialIdE4log2Ej.exit.i

_ZN10polynomialIdE4log2Ej.exit.i:                 ; preds = %bb1.i.i, %bb.i1.i
  %c.1.i.i = phi i32 [ %tmp.i2.i, %bb.i1.i ], [ %8, %bb1.i.i ] ; <i32> [#uses=1]
  %10 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %agg.result, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV10polynomialISt7complexIdEE, i32 0, i32 2), i32 (...)*** %10, align 4
  %11 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %agg.result, i32 0, i32 1 ; <%"struct.std::complex<double>"**> [#uses=6]
  store %"struct.std::complex<double>"* null, %"struct.std::complex<double>"** %11, align 4
  %12 = getelementptr inbounds %"struct.polynomial<std::complex<double> >"* %agg.result, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %1, i32* %12, align 4
  %13 = shl i32 %1, 4                             ; <i32> [#uses=1]
  %14 = call i8* @_Znaj(i32 %13)                  ; <i8*> [#uses=3]
  %15 = icmp eq i32 %1, 0                         ; <i1> [#uses=1]
  br i1 %15, label %_ZN10polynomialISt7complexIdEEC1Ej.exit.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %_ZN10polynomialIdE4log2Ej.exit.i
  %indvar.i.i.i = phi i32 [ %indvar.next.i.i.i, %bb.i.i.i ], [ 0, %_ZN10polynomialIdE4log2Ej.exit.i ] ; <i32> [#uses=2]
  %tmp4.i = shl i32 %indvar.i.i.i, 4              ; <i32> [#uses=2]
  %tmp513.i = or i32 %tmp4.i, 8                   ; <i32> [#uses=1]
  %scevgep6.i = getelementptr i8* %14, i32 %tmp513.i ; <i8*> [#uses=1]
  %scevgep89.i.i.i = bitcast i8* %scevgep6.i to double* ; <double*> [#uses=1]
  %scevgep8.i = getelementptr i8* %14, i32 %tmp4.i ; <i8*> [#uses=1]
  %scevgep6.i.i.i = bitcast i8* %scevgep8.i to double* ; <double*> [#uses=1]
  store double 0.000000e+00, double* %scevgep6.i.i.i, align 4
  store double 0.000000e+00, double* %scevgep89.i.i.i, align 4
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i.i.i, %1 ; <i1> [#uses=1]
  br i1 %exitcond.i, label %_ZN10polynomialISt7complexIdEEC1Ej.exit.i, label %bb.i.i.i

_ZN10polynomialISt7complexIdEEC1Ej.exit.i:        ; preds = %bb.i.i.i, %_ZN10polynomialIdE4log2Ej.exit.i
  %16 = bitcast i8* %14 to %"struct.std::complex<double>"* ; <%"struct.std::complex<double>"*> [#uses=1]
  store %"struct.std::complex<double>"* %16, %"struct.std::complex<double>"** %11, align 4
  %17 = load i32* %0, align 4                     ; <i32> [#uses=1]
  %18 = icmp eq i32 %17, 0                        ; <i1> [#uses=1]
  br i1 %18, label %_ZN10polynomialIdE11bit_reverseERKS0_.exit, label %bb.nph.i

bb.nph.i:                                         ; preds = %_ZN10polynomialISt7complexIdEEC1Ej.exit.i
  %19 = getelementptr inbounds %"struct.polynomial<double>"* %poly, i32 0, i32 1 ; <double**> [#uses=2]
  %20 = add i32 %c.1.i.i, -1                      ; <i32> [#uses=1]
  %21 = shl i32 1, %20                            ; <i32> [#uses=2]
  %22 = icmp eq i32 %21, 0                        ; <i1> [#uses=1]
  br i1 %22, label %bb.us.i, label %bb.i2

bb.us.i:                                          ; preds = %bb.us.i, %bb.nph.i
  %n.03.us.i = phi i32 [ %tmp.i1, %bb.us.i ], [ 0, %bb.nph.i ] ; <i32> [#uses=2]
  %tmp.i1 = add i32 %n.03.us.i, 1                 ; <i32> [#uses=2]
  %23 = load double** %19, align 4                ; <double*> [#uses=1]
  %scevgep.i = getelementptr double* %23, i32 %n.03.us.i ; <double*> [#uses=1]
  %24 = load double* %scevgep.i, align 4          ; <double> [#uses=1]
  %25 = load %"struct.std::complex<double>"** %11, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %26 = getelementptr inbounds %"struct.std::complex<double>"* %25, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %24, double* %26, align 4
  %27 = getelementptr inbounds %"struct.std::complex<double>"* %25, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  store double 0.000000e+00, double* %27, align 4
  %28 = load i32* %0, align 4                     ; <i32> [#uses=1]
  %29 = icmp ugt i32 %28, %tmp.i1                 ; <i1> [#uses=1]
  br i1 %29, label %bb.us.i, label %_ZN10polynomialIdE11bit_reverseERKS0_.exit

bb.i2:                                            ; preds = %_ZN10polynomialIdE9flip_bitsEjj.exit.i, %bb.nph.i
  %30 = phi i32 [ %tmp11.i, %_ZN10polynomialIdE9flip_bitsEjj.exit.i ], [ 0, %bb.nph.i ] ; <i32> [#uses=3]
  %tmp11.i = add i32 %30, 1                       ; <i32> [#uses=2]
  %31 = load double** %19, align 4                ; <double*> [#uses=1]
  %scevgep10.i = getelementptr double* %31, i32 %30 ; <double*> [#uses=1]
  %32 = load double* %scevgep10.i, align 4        ; <double> [#uses=1]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i2
  %lm.03.i.i = phi i32 [ %21, %bb.i2 ], [ %36, %bb.i.i ] ; <i32> [#uses=2]
  %rm.02.i.i = phi i32 [ 1, %bb.i2 ], [ %37, %bb.i.i ] ; <i32> [#uses=2]
  %r.11.i.i = phi i32 [ 0, %bb.i2 ], [ %r.1..i.i, %bb.i.i ] ; <i32> [#uses=1]
  %33 = and i32 %rm.02.i.i, %30                   ; <i32> [#uses=1]
  %34 = icmp eq i32 %33, 0                        ; <i1> [#uses=1]
  %35 = select i1 %34, i32 0, i32 %lm.03.i.i      ; <i32> [#uses=1]
  %r.1..i.i = or i32 %35, %r.11.i.i               ; <i32> [#uses=3]
  %36 = lshr i32 %lm.03.i.i, 1                    ; <i32> [#uses=2]
  %37 = shl i32 %rm.02.i.i, 1                     ; <i32> [#uses=1]
  %phitmp.i.i = icmp eq i32 %36, 0                ; <i1> [#uses=1]
  br i1 %phitmp.i.i, label %_ZN10polynomialIdE9flip_bitsEjj.exit.i, label %bb.i.i

_ZN10polynomialIdE9flip_bitsEjj.exit.i:           ; preds = %bb.i.i
  %38 = load %"struct.std::complex<double>"** %11, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %39 = getelementptr inbounds %"struct.std::complex<double>"* %38, i32 %r.1..i.i, i32 0, i32 0 ; <double*> [#uses=1]
  store double %32, double* %39, align 4
  %40 = getelementptr inbounds %"struct.std::complex<double>"* %38, i32 %r.1..i.i, i32 0, i32 1 ; <double*> [#uses=1]
  store double 0.000000e+00, double* %40, align 4
  %41 = load i32* %0, align 4                     ; <i32> [#uses=1]
  %42 = icmp ugt i32 %41, %tmp11.i                ; <i1> [#uses=1]
  br i1 %42, label %bb.i2, label %_ZN10polynomialIdE11bit_reverseERKS0_.exit

_ZN10polynomialIdE11bit_reverseERKS0_.exit:       ; preds = %_ZN10polynomialIdE9flip_bitsEjj.exit.i, %bb.us.i, %_ZN10polynomialISt7complexIdEEC1Ej.exit.i
  %43 = icmp eq i32 %c.1.i, 0                     ; <i1> [#uses=1]
  br i1 %43, label %return, label %bb.nph11

bb.nph11:                                         ; preds = %_ZN10polynomialIdE11bit_reverseERKS0_.exit
  %44 = getelementptr inbounds %0* %memtmp.i.i, i32 0, i32 0 ; <double*> [#uses=1]
  %45 = getelementptr inbounds %0* %memtmp.i.i, i32 0, i32 1 ; <double*> [#uses=1]
  br label %invcont

invcont:                                          ; preds = %bb31, %bb.nph11
  %m.010 = phi i32 [ 2, %bb.nph11 ], [ %89, %bb31 ] ; <i32> [#uses=4]
  %s.09 = phi i32 [ 0, %bb.nph11 ], [ %91, %bb31 ] ; <i32> [#uses=1]
  %m2.08 = phi i32 [ 1, %bb.nph11 ], [ %90, %bb31 ] ; <i32> [#uses=3]
  %46 = uitofp i32 %m.010 to double               ; <double> [#uses=4]
  %47 = load double* @_ZN10polynomialIdE4PI2IE.0.1, align 8 ; <double> [#uses=2]
  %48 = fmul double %46, 0.000000e+00             ; <double> [#uses=1]
  %49 = fmul double %47, 0.000000e+00             ; <double> [#uses=1]
  %50 = fadd double %48, %49                      ; <double> [#uses=1]
  %51 = fmul double %46, %46                      ; <double> [#uses=1]
  %52 = fadd double %51, 0.000000e+00             ; <double> [#uses=2]
  %53 = fdiv double %50, %52                      ; <double> [#uses=1]
  %54 = fmul double %47, %46                      ; <double> [#uses=1]
  %55 = fdiv double %54, %52                      ; <double> [#uses=1]
  %insert.i = insertvalue %0 undef, double %53, 0 ; <%0> [#uses=1]
  %insert2.i = insertvalue %0 %insert.i, double %55, 1 ; <%0> [#uses=1]
  call void @cexp(%0* noalias sret %memtmp.i.i, %0 %insert2.i) nounwind
  %56 = load double* %44, align 8                 ; <double> [#uses=2]
  %57 = load double* %45, align 8                 ; <double> [#uses=2]
  %58 = add i32 %m2.08, -1                        ; <i32> [#uses=1]
  br label %bb28.preheader

invcont27:                                        ; preds = %bb28.preheader, %invcont27
  %indvar = phi i32 [ %indvar.next, %invcont27 ], [ 0, %bb28.preheader ] ; <i32> [#uses=2]
  %tmp = mul i32 %indvar, %m.010                  ; <i32> [#uses=3]
  %tmp12 = add i32 %85, %tmp                      ; <i32> [#uses=2]
  %tmp19 = add i32 %tmp, %tmp18                   ; <i32> [#uses=4]
  %59 = load %"struct.std::complex<double>"** %11, align 4 ; <%"struct.std::complex<double>"*> [#uses=4]
  %scevgep2021 = getelementptr inbounds %"struct.std::complex<double>"* %59, i32 %tmp19, i32 0, i32 0 ; <double*> [#uses=1]
  %60 = load double* %scevgep2021, align 8        ; <double> [#uses=2]
  %scevgep22 = getelementptr %"struct.std::complex<double>"* %59, i32 %tmp19, i32 0, i32 1 ; <double*> [#uses=1]
  %61 = load double* %scevgep22, align 8          ; <double> [#uses=2]
  %62 = fmul double %w.0.0.05, %60                ; <double> [#uses=1]
  %63 = fmul double %w.0.1.04, %61                ; <double> [#uses=1]
  %64 = fsub double %62, %63                      ; <double> [#uses=2]
  %65 = fmul double %w.0.0.05, %61                ; <double> [#uses=1]
  %66 = fmul double %60, %w.0.1.04                ; <double> [#uses=1]
  %67 = fadd double %65, %66                      ; <double> [#uses=2]
  %scevgep1617 = getelementptr inbounds %"struct.std::complex<double>"* %59, i32 %tmp12, i32 0, i32 0 ; <double*> [#uses=2]
  %68 = load double* %scevgep1617, align 4        ; <double> [#uses=2]
  %scevgep15 = getelementptr %"struct.std::complex<double>"* %59, i32 %tmp12, i32 0, i32 1 ; <double*> [#uses=2]
  %69 = load double* %scevgep15, align 4          ; <double> [#uses=2]
  %70 = fadd double %68, %64                      ; <double> [#uses=1]
  %71 = fadd double %69, %67                      ; <double> [#uses=1]
  store double %70, double* %scevgep1617, align 4
  store double %71, double* %scevgep15, align 4
  %72 = load %"struct.std::complex<double>"** %11, align 4 ; <%"struct.std::complex<double>"*> [#uses=2]
  %73 = fsub double %68, %64                      ; <double> [#uses=1]
  %74 = fsub double %69, %67                      ; <double> [#uses=1]
  %scevgep2324 = getelementptr inbounds %"struct.std::complex<double>"* %72, i32 %tmp19, i32 0, i32 0 ; <double*> [#uses=1]
  store double %73, double* %scevgep2324, align 4
  %scevgep25 = getelementptr %"struct.std::complex<double>"* %72, i32 %tmp19, i32 0, i32 1 ; <double*> [#uses=1]
  store double %74, double* %scevgep25, align 4
  %tmp27 = add i32 %tmp, %tmp26                   ; <i32> [#uses=1]
  %75 = load i32* %0, align 4                     ; <i32> [#uses=1]
  %76 = add i32 %75, -1                           ; <i32> [#uses=1]
  %77 = icmp ult i32 %76, %tmp27                  ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %77, label %bb29, label %invcont27

bb29:                                             ; preds = %bb28.preheader, %invcont27
  %78 = fmul double %w.0.0.05, %56                ; <double> [#uses=1]
  %79 = fmul double %w.0.1.04, %57                ; <double> [#uses=1]
  %80 = fsub double %78, %79                      ; <double> [#uses=1]
  %81 = fmul double %w.0.0.05, %57                ; <double> [#uses=1]
  %82 = fmul double %56, %w.0.1.04                ; <double> [#uses=1]
  %83 = fadd double %81, %82                      ; <double> [#uses=1]
  %84 = icmp ult i32 %58, %tmp30                  ; <i1> [#uses=1]
  br i1 %84, label %bb31, label %bb28.preheader

bb28.preheader:                                   ; preds = %bb29, %invcont
  %85 = phi i32 [ 0, %invcont ], [ %tmp30, %bb29 ] ; <i32> [#uses=5]
  %w.0.0.05 = phi double [ 1.000000e+00, %invcont ], [ %80, %bb29 ] ; <double> [#uses=4]
  %w.0.1.04 = phi double [ 0.000000e+00, %invcont ], [ %83, %bb29 ] ; <double> [#uses=4]
  %tmp26 = add i32 %85, %m.010                    ; <i32> [#uses=1]
  %tmp18 = add i32 %85, %m2.08                    ; <i32> [#uses=1]
  %tmp30 = add i32 %85, 1                         ; <i32> [#uses=2]
  %86 = load i32* %0, align 4                     ; <i32> [#uses=1]
  %87 = add i32 %86, -1                           ; <i32> [#uses=1]
  %88 = icmp ult i32 %87, %85                     ; <i1> [#uses=1]
  br i1 %88, label %bb29, label %invcont27

bb31:                                             ; preds = %bb29
  %89 = shl i32 %m.010, 1                         ; <i32> [#uses=1]
  %90 = shl i32 %m2.08, 1                         ; <i32> [#uses=1]
  %91 = add i32 %s.09, 1                          ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %91, %c.1.i             ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %invcont

return:                                           ; preds = %bb31, %_ZN10polynomialIdE11bit_reverseERKS0_.exit
  ret void
}

declare void @_ZSt16__throw_bad_castv() noreturn

declare i32 @memcmp(i8* nocapture, i8* nocapture, i32) nounwind readonly

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
  %8 = tail call fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val) ; <i8> [#uses=1]
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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
  tail call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
  unreachable

_ZNSt9basic_iosIcSt11char_traitsIcEE8setstateESt12_Ios_Iostate.exit: ; preds = %bb17
  ret void
}

declare zeroext i8 @_ZSt18uncaught_exceptionv() nounwind

define internal fastcc void @_ZNSo9_M_insertIdEERSoT_() {
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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
  %42 = invoke fastcc signext i8 @_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc(%"struct.std::ctype<char>"* %.idx.val)
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
  %62 = getelementptr inbounds i32 (...)** %61, i32 7 ; <i32 (...)**> [#uses=1]
  %63 = load i32 (...)** %62, align 4             ; <i32 (...)*> [#uses=1]
  %64 = bitcast i32 (...)* %63 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, double)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, double)*> [#uses=1]
  invoke void %64(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s, %"struct.std::ios_base"* %51, i8 signext %46, double 0.000000e+00)
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0)) noreturn
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

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare extern_weak i32 @pthread_once(i32*, void ()*)

declare extern_weak i8* @pthread_getspecific(i32)

declare extern_weak i32 @pthread_setspecific(i32, i8*)

declare extern_weak i32 @pthread_create(i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)

declare extern_weak i32 @pthread_cancel(i32)

declare extern_weak i32 @pthread_mutex_lock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_trylock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._46*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._46*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._46*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._46*)
