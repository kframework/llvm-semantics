; ModuleID = 'ofstream_ctor.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct..0._12 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._12 }
%struct._IO_marker = type { %struct._IO_marker*, %struct.__c_file*, i32 }
%struct.__c_file = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.__c_file*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__mbstate_t = type { i32, %struct..0._12 }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::__basic_file<char>" = type { %struct.__c_file*, i8 }
%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>" = type { %"struct.std::locale::facet" }
%"struct.std::basic_filebuf<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >", %struct.pthread_mutex_t, %"struct.std::__basic_file<char>", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i32, i8, i8, i8, i8, i8*, i8*, i8, %"struct.std::codecvt<char,char,__mbstate_t>"*, i8*, i32, i8*, i8* }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* }
%"struct.std::basic_ofstream<char,std::char_traits<char> >" = type { %"struct.std::basic_ostream<char,std::char_traits<char> >.base", %"struct.std::basic_filebuf<char,std::char_traits<char> >", %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >.base" = type { i32 (...)** }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::codecvt<char,char,__mbstate_t>" = type { %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>", %struct.__locale_struct* }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }

@_ZTVSt9basic_iosIcSt11char_traitsIcEE = external constant [4 x i32 (...)*] ; <[4 x i32 (...)*]*> [#uses=1]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external constant [16 x i32 (...)*] ; <[16 x i32 (...)*]*> [#uses=1]
@_ZNSt7codecvtIcc11__mbstate_tE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=2]
@_ZNSt5ctypeIcE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=1]
@_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=2]
@_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE = external global %struct..0._12 ; <%struct..0._12*> [#uses=2]
@_ZTVSt13basic_filebufIcSt11char_traitsIcEE = external constant [16 x i32 (...)*] ; <[16 x i32 (...)*]*> [#uses=1]
@_ZNSt8ios_base7goodbitE = external constant i32  ; <i32*> [#uses=1]
@_ZNSt8ios_base6badbitE = external constant i32   ; <i32*> [#uses=1]
@_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE = external constant [4 x i8*] ; <[4 x i8*]*> [#uses=2]
@_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE = external constant [10 x i32 (...)*] ; <[10 x i32 (...)*]*> [#uses=2]

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

define i32 @main() {
entry:
  %X = alloca %"struct.std::basic_ofstream<char,std::char_traits<char> >", align 8 ; <%"struct.std::basic_ofstream<char,std::char_traits<char> >"*> [#uses=39]
  %0 = ptrtoint %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X to i32 ; <i32> [#uses=5]
  %1 = add i32 %0, 140                            ; <i32> [#uses=1]
  %2 = inttoptr i32 %1 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=13]
  %3 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0 ; <%"struct.std::ios_base"*> [#uses=5]
  call void @_ZNSt8ios_baseC2Ev(%"struct.std::ios_base"* %3)
  %4 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=6]
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
  %10 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 6 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"**> [#uses=2]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* null, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %10, align 4
  %11 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 7 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"**> [#uses=2]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* null, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %11, align 4
  %12 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE, i32 0, i32 1), align 4 ; <i8*> [#uses=2]
  %13 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=6]
  %.c4.i = bitcast i8* %12 to i32 (...)**         ; <i32 (...)**> [#uses=4]
  store i32 (...)** %.c4.i, i32 (...)*** %13, align 8
  %14 = getelementptr inbounds i8* %12, i32 -12   ; <i8*> [#uses=1]
  %15 = bitcast i8* %14 to i32*                   ; <i32*> [#uses=4]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = add i32 %16, %0                           ; <i32> [#uses=1]
  %18 = inttoptr i32 %17 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %19 = load i8** getelementptr inbounds ([4 x i8*]* @_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE, i32 0, i32 2), align 4 ; <i8*> [#uses=1]
  %20 = bitcast i8* %19 to i32 (...)**            ; <i32 (...)**> [#uses=4]
  %21 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %18, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %20, i32 (...)*** %21, align 4
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE, i32 0, i32 3), i32 (...)*** %13, align 8
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE, i32 0, i32 8), i32 (...)*** %4, align 4
  %22 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1 ; <%"struct.std::basic_filebuf<char,std::char_traits<char> >"*> [#uses=2]
  %23 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=9]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  %24 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 1 ; <i8**> [#uses=1]
  store i8* null, i8** %24, align 4
  %25 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 2 ; <i8**> [#uses=1]
  store i8* null, i8** %25, align 4
  %26 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 3 ; <i8**> [#uses=1]
  store i8* null, i8** %26, align 4
  %27 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 4 ; <i8**> [#uses=1]
  store i8* null, i8** %27, align 4
  %28 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 5 ; <i8**> [#uses=1]
  store i8* null, i8** %28, align 4
  %29 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 6 ; <i8**> [#uses=1]
  store i8* null, i8** %29, align 4
  %30 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 7 ; <%"struct.std::locale"*> [#uses=6]
  call void @_ZNSt6localeC1Ev(%"struct.std::locale"* %30) nounwind
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt13basic_filebufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  %31 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %31, align 4
  %32 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %32, align 4
  %33 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 0, i32* %33, align 4
  %34 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %34, align 4
  %35 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %35, align 4
  %36 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %36, align 4
  %37 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 1 ; <%struct.pthread_mutex_t*> [#uses=1]
  %38 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 2 ; <%"struct.std::__basic_file<char>"*> [#uses=4]
  invoke void @_ZNSt12__basic_fileIcEC1EP15pthread_mutex_t(%"struct.std::__basic_file<char>"* %38, %struct.pthread_mutex_t* %37)
          to label %invcont.i.i unwind label %lpad.i.i

invcont.i.i:                                      ; preds = %entry
  %39 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %39, align 4
  %40 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 4, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %40, align 4
  %41 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 4, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %41, align 4
  %42 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 5, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %42, align 4
  %43 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 5, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %43, align 4
  %44 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 6, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %44, align 4
  %45 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 6, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 0, i32* %45, align 4
  %46 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 7 ; <i8**> [#uses=1]
  store i8* null, i8** %46, align 4
  %47 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 8 ; <i32*> [#uses=1]
  store i32 8192, i32* %47, align 4
  %48 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 9 ; <i8*> [#uses=1]
  %49 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 13 ; <i8**> [#uses=1]
  %50 = bitcast i8* %48 to i32*                   ; <i32*> [#uses=1]
  store i32 0, i32* %50, align 4
  store i8* null, i8** %49, align 4
  %51 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 14 ; <i8**> [#uses=1]
  store i8* null, i8** %51, align 4
  %52 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 15 ; <i8*> [#uses=1]
  store i8 0, i8* %52, align 4
  %53 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 16 ; <%"struct.std::codecvt<char,char,__mbstate_t>"**> [#uses=2]
  store %"struct.std::codecvt<char,char,__mbstate_t>"* null, %"struct.std::codecvt<char,char,__mbstate_t>"** %53, align 4
  %54 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 17 ; <i8**> [#uses=1]
  store i8* null, i8** %54, align 4
  %55 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 18 ; <i32*> [#uses=1]
  store i32 0, i32* %55, align 4
  %56 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 19 ; <i8**> [#uses=1]
  store i8* null, i8** %56, align 4
  %57 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 20 ; <i8**> [#uses=1]
  store i8* null, i8** %57, align 4
  %58 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7codecvtIcc11__mbstate_tE2idE)
          to label %invcont.i.i.i unwind label %lpad.i.i.i ; <i32> [#uses=2]

invcont.i.i.i:                                    ; preds = %invcont.i.i
  %59 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0, i32 7, i32 0 ; <%"struct.std::locale::_Impl"**> [#uses=2]
  %60 = load %"struct.std::locale::_Impl"** %59, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %61 = getelementptr inbounds %"struct.std::locale::_Impl"* %60, i32 0, i32 2 ; <i32*> [#uses=1]
  %62 = load i32* %61, align 4                    ; <i32> [#uses=1]
  %63 = icmp ugt i32 %62, %58                     ; <i1> [#uses=1]
  br i1 %63, label %_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i

lpad.i.i.i:                                       ; preds = %invcont.i.i
  %eh_ptr.i.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i: ; preds = %invcont.i.i.i
  %64 = getelementptr inbounds %"struct.std::locale::_Impl"* %60, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %65 = load %"struct.std::locale::facet"*** %64, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %66 = getelementptr inbounds %"struct.std::locale::facet"** %65, i32 %58 ; <%"struct.std::locale::facet"**> [#uses=1]
  %67 = load %"struct.std::locale::facet"** %66, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp.i.i = icmp eq %"struct.std::locale::facet"* %67, null ; <i1> [#uses=1]
  br i1 %phitmp.i.i, label %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i
  %68 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7codecvtIcc11__mbstate_tE2idE)
          to label %.noexc.i.i unwind label %lpad13.i.i ; <i32> [#uses=2]

.noexc.i.i:                                       ; preds = %bb.i.i
  %69 = load %"struct.std::locale::_Impl"** %59, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %70 = getelementptr inbounds %"struct.std::locale::_Impl"* %69, i32 0, i32 2 ; <i32*> [#uses=1]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  %72 = icmp ugt i32 %71, %68                     ; <i1> [#uses=1]
  br i1 %72, label %bb.i.i.i, label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %.noexc.i.i
  %73 = getelementptr inbounds %"struct.std::locale::_Impl"* %69, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %74 = load %"struct.std::locale::facet"*** %73, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %75 = getelementptr inbounds %"struct.std::locale::facet"** %74, i32 %68 ; <%"struct.std::locale::facet"**> [#uses=1]
  %76 = load %"struct.std::locale::facet"** %75, align 4 ; <%"struct.std::locale::facet"*> [#uses=2]
  %77 = icmp eq %"struct.std::locale::facet"* %76, null ; <i1> [#uses=1]
  br i1 %77, label %bb1.i.i.i, label %invcont1.i1.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i, %.noexc.i.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc1.i.i unwind label %lpad13.i.i

.noexc1.i.i:                                      ; preds = %bb1.i.i.i
  unreachable

invcont1.i1.i:                                    ; preds = %bb.i.i.i
  %78 = bitcast %"struct.std::locale::facet"* %76 to %"struct.std::codecvt<char,char,__mbstate_t>"* ; <%"struct.std::codecvt<char,char,__mbstate_t>"*> [#uses=1]
  store %"struct.std::codecvt<char,char,__mbstate_t>"* %78, %"struct.std::codecvt<char,char,__mbstate_t>"** %53, align 4
  br label %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i

invcont8.i.i:                                     ; preds = %lpad13.i.i, %lpad.i.i
  %eh_exception.0.i.i = phi i8* [ %eh_ptr.i2.i, %lpad.i.i ], [ %eh_ptr14.i.i, %lpad13.i.i ] ; <i8*> [#uses=1]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %30) nounwind
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i.i)
          to label %.noexc3.i unwind label %lpad18.i

.noexc3.i:                                        ; preds = %invcont8.i.i
  unreachable

lpad.i.i:                                         ; preds = %entry
  %eh_ptr.i2.i = call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select12.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i2.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %invcont8.i.i

lpad13.i.i:                                       ; preds = %bb1.i.i.i, %bb.i.i
  %eh_ptr14.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select16.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr14.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"* %38)
          to label %invcont8.i.i unwind label %lpad17.i.i

lpad17.i.i:                                       ; preds = %lpad13.i.i
  %eh_ptr18.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=1]
  %eh_select20.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr18.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i: ; preds = %invcont1.i1.i, %_ZSt9has_facetISt7codecvtIcc11__mbstate_tEEbRKSt6locale.exit.i.i, %invcont.i.i.i
  %79 = getelementptr inbounds %"struct.std::basic_ofstream<char,std::char_traits<char> >"* %X, i32 0, i32 1, i32 0 ; <%"struct.std::basic_streambuf<char,std::char_traits<char> >"*> [#uses=2]
  invoke void @_ZNSt8ios_base7_M_initEv(%"struct.std::ios_base"* %3)
          to label %.noexc1.i unwind label %lpad22.i

.noexc1.i:                                        ; preds = %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i
  %80 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 11 ; <%"struct.std::locale"*> [#uses=1]
  %81 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt5ctypeIcE2idE)
          to label %invcont.i.i4.i unwind label %lpad.i.i7.i ; <i32> [#uses=2]

invcont.i.i4.i:                                   ; preds = %.noexc1.i
  %82 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 11, i32 0 ; <%"struct.std::locale::_Impl"**> [#uses=5]
  %83 = load %"struct.std::locale::_Impl"** %82, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %84 = getelementptr inbounds %"struct.std::locale::_Impl"* %83, i32 0, i32 2 ; <i32*> [#uses=1]
  %85 = load i32* %84, align 4                    ; <i32> [#uses=1]
  %86 = icmp ugt i32 %85, %81                     ; <i1> [#uses=1]
  br i1 %86, label %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i, label %bb2.i.i

lpad.i.i7.i:                                      ; preds = %.noexc1.i
  %eh_ptr.i.i5.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i6.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i5.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i5.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i: ; preds = %invcont.i.i4.i
  %87 = getelementptr inbounds %"struct.std::locale::_Impl"* %83, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %88 = load %"struct.std::locale::facet"*** %87, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %89 = getelementptr inbounds %"struct.std::locale::facet"** %88, i32 %81 ; <%"struct.std::locale::facet"**> [#uses=1]
  %90 = load %"struct.std::locale::facet"** %89, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp23.i.i = icmp eq %"struct.std::locale::facet"* %90, null ; <i1> [#uses=1]
  br i1 %phitmp23.i.i, label %bb2.i.i, label %bb.i8.i

bb.i8.i:                                          ; preds = %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i
  %91 = invoke %"struct.std::ctype<char>"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"struct.std::locale"* %80)
          to label %bb2.i.i unwind label %lpad22.i ; <%"struct.std::ctype<char>"*> [#uses=1]

bb2.i.i:                                          ; preds = %bb.i8.i, %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i, %invcont.i.i4.i
  %storemerge = phi %"struct.std::ctype<char>"* [ %91, %bb.i8.i ], [ null, %_ZSt9has_facetISt5ctypeIcEEbRKSt6locale.exit.i.i ], [ null, %invcont.i.i4.i ] ; <%"struct.std::ctype<char>"*> [#uses=1]
  store %"struct.std::ctype<char>"* %storemerge, %"struct.std::ctype<char>"** %9
  %92 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %invcont.i14.i.i unwind label %lpad.i21.i.i ; <i32> [#uses=2]

invcont.i14.i.i:                                  ; preds = %bb2.i.i
  %93 = load %"struct.std::locale::_Impl"** %82, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %94 = getelementptr inbounds %"struct.std::locale::_Impl"* %93, i32 0, i32 2 ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4                    ; <i32> [#uses=1]
  %96 = icmp ugt i32 %95, %92                     ; <i1> [#uses=1]
  br i1 %96, label %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i, label %bb6.i.i

lpad.i21.i.i:                                     ; preds = %bb2.i.i
  %eh_ptr.i19.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i20.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i19.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i19.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i: ; preds = %invcont.i14.i.i
  %97 = getelementptr inbounds %"struct.std::locale::_Impl"* %93, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %98 = load %"struct.std::locale::facet"*** %97, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %99 = getelementptr inbounds %"struct.std::locale::facet"** %98, i32 %92 ; <%"struct.std::locale::facet"**> [#uses=1]
  %100 = load %"struct.std::locale::facet"** %99, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp22.i.i = icmp eq %"struct.std::locale::facet"* %100, null ; <i1> [#uses=1]
  br i1 %phitmp22.i.i, label %bb6.i.i, label %bb4.i.i

bb4.i.i:                                          ; preds = %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i
  %101 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %.noexc12.i unwind label %lpad22.i ; <i32> [#uses=2]

.noexc12.i:                                       ; preds = %bb4.i.i
  %102 = load %"struct.std::locale::_Impl"** %82, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %103 = getelementptr inbounds %"struct.std::locale::_Impl"* %102, i32 0, i32 2 ; <i32*> [#uses=1]
  %104 = load i32* %103, align 4                  ; <i32> [#uses=1]
  %105 = icmp ugt i32 %104, %101                  ; <i1> [#uses=1]
  br i1 %105, label %bb.i11.i.i, label %bb1.i12.i.i

bb.i11.i.i:                                       ; preds = %.noexc12.i
  %106 = getelementptr inbounds %"struct.std::locale::_Impl"* %102, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %107 = load %"struct.std::locale::facet"*** %106, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %108 = getelementptr inbounds %"struct.std::locale::facet"** %107, i32 %101 ; <%"struct.std::locale::facet"**> [#uses=1]
  %109 = load %"struct.std::locale::facet"** %108, align 4 ; <%"struct.std::locale::facet"*> [#uses=2]
  %110 = icmp eq %"struct.std::locale::facet"* %109, null ; <i1> [#uses=1]
  br i1 %110, label %bb1.i12.i.i, label %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i

bb1.i12.i.i:                                      ; preds = %bb.i11.i.i, %.noexc12.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc13.i unwind label %lpad22.i

.noexc13.i:                                       ; preds = %bb1.i12.i.i
  unreachable

_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i: ; preds = %bb.i11.i.i
  %111 = bitcast %"struct.std::locale::facet"* %109 to %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  br label %bb6.i.i

bb6.i.i:                                          ; preds = %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i, %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i, %invcont.i14.i.i
  %storemerge59 = phi %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* [ %111, %_ZSt9use_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i ], [ null, %_ZSt9has_facetISt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i ], [ null, %invcont.i14.i.i ] ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %storemerge59, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %10
  %112 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %invcont.i3.i.i unwind label %lpad.i10.i.i ; <i32> [#uses=2]

invcont.i3.i.i:                                   ; preds = %bb6.i.i
  %113 = load %"struct.std::locale::_Impl"** %82, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %114 = getelementptr inbounds %"struct.std::locale::_Impl"* %113, i32 0, i32 2 ; <i32*> [#uses=1]
  %115 = load i32* %114, align 4                  ; <i32> [#uses=1]
  %116 = icmp ugt i32 %115, %112                  ; <i1> [#uses=1]
  br i1 %116, label %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i, label %_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev.exit

lpad.i10.i.i:                                     ; preds = %bb6.i.i
  %eh_ptr.i8.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i9.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i8.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i8.i.i) noreturn nounwind
  unreachable

_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i: ; preds = %invcont.i3.i.i
  %117 = getelementptr inbounds %"struct.std::locale::_Impl"* %113, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %118 = load %"struct.std::locale::facet"*** %117, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %119 = getelementptr inbounds %"struct.std::locale::facet"** %118, i32 %112 ; <%"struct.std::locale::facet"**> [#uses=1]
  %120 = load %"struct.std::locale::facet"** %119, align 4 ; <%"struct.std::locale::facet"*> [#uses=1]
  %phitmp.i9.i = icmp eq %"struct.std::locale::facet"* %120, null ; <i1> [#uses=1]
  br i1 %phitmp.i9.i, label %_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev.exit, label %bb8.i.i

bb8.i.i:                                          ; preds = %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i
  %121 = invoke i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12* @_ZNSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE2idE)
          to label %.noexc14.i unwind label %lpad22.i ; <i32> [#uses=2]

.noexc14.i:                                       ; preds = %bb8.i.i
  %122 = load %"struct.std::locale::_Impl"** %82, align 4 ; <%"struct.std::locale::_Impl"*> [#uses=2]
  %123 = getelementptr inbounds %"struct.std::locale::_Impl"* %122, i32 0, i32 2 ; <i32*> [#uses=1]
  %124 = load i32* %123, align 4                  ; <i32> [#uses=1]
  %125 = icmp ugt i32 %124, %121                  ; <i1> [#uses=1]
  br i1 %125, label %bb.i1.i.i, label %bb1.i.i10.i

bb.i1.i.i:                                        ; preds = %.noexc14.i
  %126 = getelementptr inbounds %"struct.std::locale::_Impl"* %122, i32 0, i32 1 ; <%"struct.std::locale::facet"***> [#uses=1]
  %127 = load %"struct.std::locale::facet"*** %126, align 4 ; <%"struct.std::locale::facet"**> [#uses=1]
  %128 = getelementptr inbounds %"struct.std::locale::facet"** %127, i32 %121 ; <%"struct.std::locale::facet"**> [#uses=1]
  %129 = load %"struct.std::locale::facet"** %128, align 4 ; <%"struct.std::locale::facet"*> [#uses=2]
  %130 = icmp eq %"struct.std::locale::facet"* %129, null ; <i1> [#uses=1]
  br i1 %130, label %bb1.i.i10.i, label %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i

bb1.i.i10.i:                                      ; preds = %bb.i1.i.i, %.noexc14.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc15.i unwind label %lpad22.i

.noexc15.i:                                       ; preds = %bb1.i.i10.i
  unreachable

_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i: ; preds = %bb.i1.i.i
  %131 = bitcast %"struct.std::locale::facet"* %129 to %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  br label %_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev.exit

invcont13.i:                                      ; preds = %ppad.i
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0.i)
  unreachable

lpad18.i:                                         ; preds = %invcont8.i.i
  %eh_ptr19.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select21.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr19.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad.i

lpad22.i:                                         ; preds = %bb1.i.i10.i, %bb8.i.i, %bb1.i12.i.i, %bb4.i.i, %bb.i8.i, %_ZNSt13basic_filebufIcSt11char_traitsIcEEC2Ev.exit.i
  %eh_ptr23.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select25.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr23.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt13basic_filebufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call fastcc void @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %22) nounwind
  invoke void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"* %38)
          to label %_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i unwind label %invcont1.i.i

invcont1.i.i:                                     ; preds = %lpad22.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select8.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %30) nounwind
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i)
          to label %.noexc.i unwind label %lpad26.i

.noexc.i:                                         ; preds = %invcont1.i.i
  unreachable

_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i: ; preds = %lpad22.i
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %30) nounwind
  br label %ppad.i

lpad26.i:                                         ; preds = %invcont1.i.i
  %eh_ptr27.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select29.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr27.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

lpad34.i:                                         ; preds = %ppad.i
  %eh_ptr35.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select37.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr35.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i:                                           ; preds = %_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i, %lpad18.i
  %eh_exception.0.i = phi i8* [ %eh_ptr19.i, %lpad18.i ], [ %eh_ptr23.i, %_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev.exit.i ] ; <i8*> [#uses=1]
  store i32 (...)** %.c4.i, i32 (...)*** %13, align 8
  %132 = load i32* %15, align 4                   ; <i32> [#uses=1]
  %133 = add i32 %132, %0                         ; <i32> [#uses=1]
  %134 = inttoptr i32 %133 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %135 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %134, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %20, i32 (...)*** %135, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  invoke void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %3)
          to label %invcont13.i unwind label %lpad34.i

_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev.exit: ; preds = %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i, %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i, %invcont.i3.i.i
  %storemerge60 = phi %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* [ %131, %_ZSt9use_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEERKT_RKSt6locale.exit.i.i ], [ null, %_ZSt9has_facetISt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEEEbRKSt6locale.exit.i.i ], [ null, %invcont.i3.i.i ] ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  store %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %storemerge60, %"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"** %11
  store i8 0, i8* %6, align 4
  store i8 0, i8* %7, align 1
  store %"struct.std::basic_ostream<char,std::char_traits<char> >"* null, %"struct.std::basic_ostream<char,std::char_traits<char> >"** %5, align 4
  %136 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 0, i32* %136, align 4
  store %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %79, %"struct.std::basic_streambuf<char,std::char_traits<char> >"** %8, align 4
  %137 = icmp eq %"struct.std::basic_streambuf<char,std::char_traits<char> >"* %79, null ; <i1> [#uses=1]
  %_ZNSt8ios_base6badbitE.val.i.i = load i32* @_ZNSt8ios_base6badbitE ; <i32> [#uses=1]
  %_ZNSt8ios_base7goodbitE.val.i.i = load i32* @_ZNSt8ios_base7goodbitE ; <i32> [#uses=1]
  %iftmp.119.0.i.i = select i1 %137, i32 %_ZNSt8ios_base6badbitE.val.i.i, i32 %_ZNSt8ios_base7goodbitE.val.i.i ; <i32> [#uses=1]
  %138 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %2, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 %iftmp.119.0.i.i, i32* %138, align 4
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE, i32 0, i32 3), i32 (...)*** %13, align 8
  store i32 (...)** getelementptr inbounds ([10 x i32 (...)*]* @_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE, i32 0, i32 8), i32 (...)*** %4, align 4
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt13basic_filebufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call fastcc void @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %22) nounwind
  invoke void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"* %38)
          to label %_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev.exit unwind label %invcont1.i.i3

invcont1.i.i3:                                    ; preds = %_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev.exit
  %eh_ptr.i.i1 = call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select8.i.i2 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i1, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %30) nounwind
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i.i1)
          to label %.noexc.i4 unwind label %ppad.i6

.noexc.i4:                                        ; preds = %invcont1.i.i3
  unreachable

bb12.i:                                           ; preds = %ppad.i6
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr30.i)
  unreachable

lpad37.i:                                         ; preds = %ppad.i6
  %eh_ptr38.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select40.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr38.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad.i6:                                          ; preds = %invcont1.i.i3
  %eh_ptr30.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select32.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr30.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** %.c4.i, i32 (...)*** %13, align 8
  %139 = load i32* %15, align 4                   ; <i32> [#uses=1]
  %140 = add i32 %139, %0                         ; <i32> [#uses=1]
  %141 = inttoptr i32 %140 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %142 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %141, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %20, i32 (...)*** %142, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  invoke void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %3)
          to label %bb12.i unwind label %lpad37.i

_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev.exit: ; preds = %_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev.exit
  store i32 (...)** getelementptr inbounds ([16 x i32 (...)*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %23, align 4
  call void @_ZNSt6localeD1Ev(%"struct.std::locale"* %30) nounwind
  store i32 (...)** %.c4.i, i32 (...)*** %13, align 8
  %143 = load i32* %15, align 4                   ; <i32> [#uses=1]
  %144 = add i32 %143, %0                         ; <i32> [#uses=1]
  %145 = inttoptr i32 %144 to %"struct.std::basic_ios<char,std::char_traits<char> >"* ; <%"struct.std::basic_ios<char,std::char_traits<char> >"*> [#uses=1]
  %146 = getelementptr inbounds %"struct.std::basic_ios<char,std::char_traits<char> >"* %145, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** %20, i32 (...)*** %146, align 4
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTVSt9basic_iosIcSt11char_traitsIcEE, i32 0, i32 2), i32 (...)*** %4, align 4
  call void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"* %3)
  ret i32 0
}

declare void @_ZNSt8ios_baseC2Ev(%"struct.std::ios_base"*)

declare void @_ZNSt6localeC1Ev(%"struct.std::locale"*) nounwind

declare i32 @_ZNKSt6locale2id5_M_idEv(%struct..0._12*)

declare void @__cxa_call_unexpected(i8*) noreturn

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_ZSt16__throw_bad_castv() noreturn

declare void @_ZNSt6localeD1Ev(%"struct.std::locale"*) nounwind

declare void @_ZNSt12__basic_fileIcEC1EP15pthread_mutex_t(%"struct.std::__basic_file<char>"*, %struct.pthread_mutex_t*)

declare void @_ZNSt12__basic_fileIcED1Ev(%"struct.std::__basic_file<char>"*)

declare void @_ZSt9terminatev() noreturn nounwind

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare %"struct.std::ctype<char>"* @_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale(%"struct.std::locale"*)

declare void @_ZNSt8ios_base7_M_initEv(%"struct.std::ios_base"*)

declare zeroext i8 @_ZNKSt12__basic_fileIcE7is_openEv(%"struct.std::__basic_file<char>"*)

declare i32 @_ZNSt12__basic_fileIcE6xsputnEPKci(%"struct.std::__basic_file<char>"*, i8*, i32)

declare void @_ZdaPv(i8*) nounwind

define internal fastcc void @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this) nounwind {
entry:
  %__next.i = alloca i8*, align 4                 ; <i8**> [#uses=2]
  %__buf.i = alloca [128 x i8], align 1           ; <[128 x i8]*> [#uses=3]
  %0 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 2 ; <%"struct.std::__basic_file<char>"*> [#uses=3]
  %1 = invoke zeroext i8 @_ZNKSt12__basic_fileIcE7is_openEv(%"struct.std::__basic_file<char>"* %0)
          to label %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit unwind label %lpad.i ; <i8> [#uses=1]

lpad.i:                                           ; preds = %entry
  %eh_ptr.i = tail call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  tail call void @__cxa_call_unexpected(i8* %eh_ptr.i) noreturn nounwind
  unreachable

_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit: ; preds = %entry
  %toBool = icmp eq i8 %1, 0                      ; <i1> [#uses=1]
  br i1 %toBool, label %bb18, label %bb

bb:                                               ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit
  %2 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 4 ; <i8**> [#uses=2]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 5 ; <i8**> [#uses=2]
  %5 = load i8** %4, align 4                      ; <i8*> [#uses=1]
  %6 = icmp ult i8* %3, %5                        ; <i1> [#uses=1]
  br i1 %6, label %bb.i1, label %bb4.i

bb.i1:                                            ; preds = %bb
  %7 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %8 = load i32 (...)*** %7, align 4              ; <i32 (...)**> [#uses=1]
  %9 = getelementptr inbounds i32 (...)** %8, i32 13 ; <i32 (...)**> [#uses=1]
  %10 = load i32 (...)** %9, align 4              ; <i32 (...)*> [#uses=1]
  %11 = bitcast i32 (...)* %10 to i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %12 = invoke i32 %11(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 -1)
          to label %.noexc unwind label %lpad23   ; <i32> [#uses=1]

.noexc:                                           ; preds = %bb.i1
  %13 = icmp eq i32 %12, -1                       ; <i1> [#uses=1]
  br i1 %13, label %bb3.i2, label %bb4.i

bb3.i2:                                           ; preds = %.noexc
  br label %bb4.i

bb4.i:                                            ; preds = %bb3.i2, %.noexc, %bb
  %__testvalid.0.i = phi i8 [ 0, %bb3.i2 ], [ 1, %bb ], [ 1, %.noexc ] ; <i8> [#uses=2]
  %14 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 11 ; <i8*> [#uses=1]
  %15 = load i8* %14, align 2                     ; <i8> [#uses=1]
  %toBool5.i = icmp eq i8 %15, 0                  ; <i1> [#uses=1]
  br i1 %toBool5.i, label %bb7, label %bb9.i

bb9.i:                                            ; preds = %bb4.i
  %16 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 16 ; <%"struct.std::codecvt<char,char,__mbstate_t>"**> [#uses=2]
  %17 = load %"struct.std::codecvt<char,char,__mbstate_t>"** %16, align 4 ; <%"struct.std::codecvt<char,char,__mbstate_t>"*> [#uses=3]
  %18 = icmp eq %"struct.std::codecvt<char,char,__mbstate_t>"* %17, null ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i, label %_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i

bb.i.i:                                           ; preds = %bb9.i
  invoke void @_ZSt16__throw_bad_castv() noreturn
          to label %.noexc3 unwind label %lpad23

.noexc3:                                          ; preds = %bb.i.i
  unreachable

_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i: ; preds = %bb9.i
  %19 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %17, i32 0, i32 0 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  %20 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %17, i32 0, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %21 = load i32 (...)*** %20, align 4            ; <i32 (...)**> [#uses=1]
  %22 = getelementptr inbounds i32 (...)** %21, i32 6 ; <i32 (...)**> [#uses=1]
  %23 = load i32 (...)** %22, align 4             ; <i32 (...)*> [#uses=1]
  %24 = bitcast i32 (...)* %23 to i8 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*)* ; <i8 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*)*> [#uses=1]
  %25 = invoke zeroext i8 %24(%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %19)
          to label %_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i unwind label %lpad.i.i ; <i8> [#uses=1]

lpad.i.i:                                         ; preds = %_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i
  %eh_ptr.i.i = call i8* @llvm.eh.exception() nounwind ; <i8*> [#uses=2]
  %eh_select.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) nounwind ; <i32> [#uses=0]
  call void @__cxa_call_unexpected(i8* %eh_ptr.i.i) noreturn nounwind
  unreachable

_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i: ; preds = %_ZSt13__check_facetISt7codecvtIcc11__mbstate_tEERKT_PS4_.exit.i
  %toBool10.not.i = icmp ne i8 %25, 0             ; <i1> [#uses=1]
  %toBool18.i = icmp eq i8 %__testvalid.0.i, 0    ; <i1> [#uses=1]
  %or.cond.i = or i1 %toBool10.not.i, %toBool18.i ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb7, label %bb27.preheader.i

bb27.preheader.i:                                 ; preds = %_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i
  %26 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 5 ; <%struct.__mbstate_t*> [#uses=1]
  %27 = getelementptr inbounds [128 x i8]* %__buf.i, i32 0, i32 0 ; <i8*> [#uses=2]
  %28 = getelementptr inbounds [128 x i8]* %__buf.i, i32 0, i32 128 ; <i8*> [#uses=1]
  %__buf31.i = ptrtoint [128 x i8]* %__buf.i to i32 ; <i32> [#uses=1]
  br label %bb27.i

bb27.i:                                           ; preds = %bb35.i, %bb27.preheader.i
  %__ilen.1.i = phi i32 [ 0, %bb27.preheader.i ], [ %__ilen.0.i, %bb35.i ] ; <i32> [#uses=2]
  %__testvalid.2.i = phi i8 [ %__testvalid.0.i, %bb27.preheader.i ], [ %__testvalid.1.i, %bb35.i ] ; <i8> [#uses=3]
  %29 = load %"struct.std::codecvt<char,char,__mbstate_t>"** %16, align 4 ; <%"struct.std::codecvt<char,char,__mbstate_t>"*> [#uses=2]
  %30 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %29, i32 0, i32 0 ; <%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*> [#uses=1]
  %31 = getelementptr inbounds %"struct.std::codecvt<char,char,__mbstate_t>"* %29, i32 0, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %32 = load i32 (...)*** %31, align 4            ; <i32 (...)**> [#uses=1]
  %33 = getelementptr inbounds i32 (...)** %32, i32 3 ; <i32 (...)**> [#uses=1]
  %34 = load i32 (...)** %33, align 4             ; <i32 (...)*> [#uses=1]
  %35 = bitcast i32 (...)* %34 to i32 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*, %struct.__mbstate_t*, i8*, i8*, i8**)* ; <i32 (%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"*, %struct.__mbstate_t*, i8*, i8*, i8**)*> [#uses=1]
  %36 = invoke i32 %35(%"struct.std::__codecvt_abstract_base<char,char,__mbstate_t>"* %30, %struct.__mbstate_t* %26, i8* %27, i8* %28, i8** %__next.i)
          to label %.noexc4 unwind label %lpad23  ; <i32> [#uses=3]

.noexc4:                                          ; preds = %bb27.i
  %37 = icmp eq i32 %36, 2                        ; <i1> [#uses=1]
  br i1 %37, label %bb35.i, label %bb29.i

bb29.i:                                           ; preds = %.noexc4
  %38 = icmp ugt i32 %36, 1                       ; <i1> [#uses=1]
  br i1 %38, label %bb35.i, label %bb30.i

bb30.i:                                           ; preds = %bb29.i
  %39 = load i8** %__next.i, align 4              ; <i8*> [#uses=1]
  %40 = ptrtoint i8* %39 to i32                   ; <i32> [#uses=1]
  %41 = sub i32 %40, %__buf31.i                   ; <i32> [#uses=6]
  %42 = icmp sgt i32 %41, 0                       ; <i1> [#uses=1]
  br i1 %42, label %bb33.i, label %bb35.i

bb33.i:                                           ; preds = %bb30.i
  %43 = invoke i32 @_ZNSt12__basic_fileIcE6xsputnEPKci(%"struct.std::__basic_file<char>"* %0, i8* %27, i32 %41)
          to label %.noexc5 unwind label %lpad23  ; <i32> [#uses=1]

.noexc5:                                          ; preds = %bb33.i
  %44 = icmp eq i32 %43, %41                      ; <i1> [#uses=1]
  br i1 %44, label %bb35.i, label %bb34.i

bb34.i:                                           ; preds = %.noexc5
  br label %bb35.i

bb35.i:                                           ; preds = %bb34.i, %.noexc5, %bb30.i, %bb29.i, %.noexc4
  %__ilen.0.i = phi i32 [ %41, %bb34.i ], [ %__ilen.1.i, %.noexc4 ], [ %__ilen.1.i, %bb29.i ], [ %41, %bb30.i ], [ %41, %.noexc5 ] ; <i32> [#uses=2]
  %__testvalid.1.i = phi i8 [ 0, %bb34.i ], [ 0, %.noexc4 ], [ %__testvalid.2.i, %bb29.i ], [ %__testvalid.2.i, %bb30.i ], [ %__testvalid.2.i, %.noexc5 ] ; <i8> [#uses=2]
  %45 = icmp eq i32 %36, 1                        ; <i1> [#uses=1]
  %46 = icmp sgt i32 %__ilen.0.i, 0               ; <i1> [#uses=1]
  %47 = and i1 %46, %45                           ; <i1> [#uses=1]
  %.not.i = xor i1 %47, true                      ; <i1> [#uses=1]
  %toBool43.i = icmp eq i8 %__testvalid.1.i, 0    ; <i1> [#uses=2]
  %or.cond1.i = or i1 %toBool43.i, %.not.i        ; <i1> [#uses=1]
  br i1 %or.cond1.i, label %bb44.i, label %bb27.i

bb44.i:                                           ; preds = %bb35.i
  br i1 %toBool43.i, label %bb7, label %bb46.i

bb46.i:                                           ; preds = %bb44.i
  %48 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %49 = load i32 (...)*** %48, align 4            ; <i32 (...)**> [#uses=1]
  %50 = getelementptr inbounds i32 (...)** %49, i32 13 ; <i32 (...)**> [#uses=1]
  %51 = load i32 (...)** %50, align 4             ; <i32 (...)*> [#uses=1]
  %52 = bitcast i32 (...)* %51 to i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)* ; <i32 (%"struct.std::basic_filebuf<char,std::char_traits<char> >"*, i32)*> [#uses=1]
  %53 = invoke i32 %52(%"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 -1)
          to label %bb7 unwind label %lpad23      ; <i32> [#uses=0]

bb7:                                              ; preds = %lpad23, %bb46.i, %bb44.i, %_ZNKSt23__codecvt_abstract_baseIcc11__mbstate_tE13always_noconvEv.exit.i, %bb4.i
  %54 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 0, i32* %54, align 4
  %55 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 15 ; <i8*> [#uses=1]
  store i8 0, i8* %55, align 4
  %56 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 9 ; <i8*> [#uses=2]
  %57 = load i8* %56, align 4                     ; <i8> [#uses=1]
  %toBool.i = icmp eq i8 %57, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb3.i, label %bb.i

bb.i:                                             ; preds = %bb7
  %58 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 7 ; <i8**> [#uses=2]
  %59 = load i8** %58, align 4                    ; <i8*> [#uses=2]
  %60 = icmp eq i8* %59, null                     ; <i1> [#uses=1]
  br i1 %60, label %bb2.i, label %bb1.i

bb1.i:                                            ; preds = %bb.i
  tail call void @_ZdaPv(i8* %59) nounwind
  br label %bb2.i

bb2.i:                                            ; preds = %bb1.i, %bb.i
  store i8* null, i8** %58, align 4
  store i8 0, i8* %56, align 4
  br label %bb3.i

bb3.i:                                            ; preds = %bb2.i, %bb7
  %61 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 17 ; <i8**> [#uses=2]
  %62 = load i8** %61, align 4                    ; <i8*> [#uses=2]
  %63 = icmp eq i8* %62, null                     ; <i1> [#uses=1]
  br i1 %63, label %invcont8, label %bb4.i1

bb4.i1:                                           ; preds = %bb3.i
  tail call void @_ZdaPv(i8* %62) nounwind
  br label %invcont8

invcont8:                                         ; preds = %bb4.i1, %bb3.i
  store i8* null, i8** %61, align 4
  %64 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 18 ; <i32*> [#uses=1]
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 19 ; <i8**> [#uses=1]
  store i8* null, i8** %65, align 4
  %66 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 20 ; <i8**> [#uses=1]
  store i8* null, i8** %66, align 4
  %67 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 10 ; <i8*> [#uses=1]
  store i8 0, i8* %67, align 1
  %68 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 11 ; <i8*> [#uses=1]
  store i8 0, i8* %68, align 2
  %69 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 7 ; <i8**> [#uses=1]
  %70 = load i8** %69, align 4                    ; <i8*> [#uses=3]
  %71 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 1 ; <i8**> [#uses=1]
  store i8* %70, i8** %71, align 4
  %72 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 2 ; <i8**> [#uses=1]
  store i8* %70, i8** %72, align 4
  %73 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 3 ; <i8**> [#uses=1]
  store i8* %70, i8** %73, align 4
  store i8* null, i8** %4, align 4
  store i8* null, i8** %2, align 4
  %74 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 0, i32 6 ; <i8**> [#uses=1]
  store i8* null, i8** %74, align 4
  %75 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 4, i32 0 ; <i32*> [#uses=1]
  %76 = load i32* %75, align 4                    ; <i32> [#uses=2]
  %77 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 4, i32 1, i32 0 ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4                    ; <i32> [#uses=2]
  %79 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  store i32 %76, i32* %79, align 4
  %80 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 5, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 %78, i32* %80, align 4
  %81 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 6, i32 0 ; <i32*> [#uses=1]
  store i32 %76, i32* %81, align 4
  %82 = getelementptr inbounds %"struct.std::basic_filebuf<char,std::char_traits<char> >"* %this, i32 0, i32 6, i32 1, i32 0 ; <i32*> [#uses=1]
  store i32 %78, i32* %82, align 4
  %83 = invoke %"struct.std::__basic_file<char>"* @_ZNSt12__basic_fileIcE5closeEv(%"struct.std::__basic_file<char>"* %0)
          to label %invcont9 unwind label %lpad   ; <%"struct.std::__basic_file<char>"*> [#uses=0]

invcont9:                                         ; preds = %invcont8
  ret void

bb18:                                             ; preds = %_ZNKSt13basic_filebufIcSt11char_traitsIcEE7is_openEv.exit
  ret void

lpad:                                             ; preds = %invcont8
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=2]
  %eh_select = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  br label %ppad

lpad23:                                           ; preds = %bb46.i, %bb33.i, %bb27.i, %bb.i.i, %bb.i1
  %eh_ptr24 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select26 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %84 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr24) nounwind ; <i8*> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %bb7 unwind label %lpad27

lpad27:                                           ; preds = %lpad23
  %eh_ptr28 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select30 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr28, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  br label %ppad

ppad:                                             ; preds = %lpad27, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr28, %lpad27 ] ; <i8*> [#uses=1]
  tail call void @__cxa_call_unexpected(i8* %eh_exception.0) noreturn nounwind
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare %"struct.std::__basic_file<char>"* @_ZNSt12__basic_fileIcE5closeEv(%"struct.std::__basic_file<char>"*)

declare void @_ZNSt8ios_baseD2Ev(%"struct.std::ios_base"*)

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
