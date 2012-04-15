; ModuleID = 'ray.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%struct.Group = type { %struct.Scene, %struct.Sphere, %"struct.std::list<Scene*,std::allocator<Scene*> >" }
%struct.Ray = type { %struct.Vec, %struct.Vec }
%struct.Scene = type { i32 (...)** }
%struct.Sphere = type { %struct.Scene, %struct.Vec, double }
%struct.Vec = type { double, double, double }
%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%"struct.__gnu_cxx::new_allocator<Scene*>" = type <{ i8 }>
%struct.__locale_struct = type { [13 x %struct.locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__si_class_type_info_pseudo = type { %struct.__type_info_pseudo, %"struct.std::type_info"* }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.locale_data = type opaque
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::Hit" = type { double, %struct.Vec }
%"struct.std::_List_base<Scene*,std::allocator<Scene*> >" = type { %"struct.std::_List_base<Scene*,std::allocator<Scene*> >::_List_impl" }
%"struct.std::_List_base<Scene*,std::allocator<Scene*> >::_List_impl" = type { %"struct.std::_List_node_base" }
%"struct.std::_List_node_base" = type { %"struct.std::_List_node_base"*, %"struct.std::_List_node_base"* }
%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
%"struct.std::basic_ostream<char,std::char_traits<char> >::sentry" = type { i8, %"struct.std::basic_ostream<char,std::char_traits<char> >"* }
%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"struct.std::list<Scene*,std::allocator<Scene*> >" = type { %"struct.std::_List_base<Scene*,std::allocator<Scene*> >" }
%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
%"struct.std::locale::facet" = type { i32 (...)**, i32 }
%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >" = type { %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, i8 }
%"struct.std::type_info" = type { i32 (...)**, i8* }

@_ZTV5Scene = internal constant [5 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__class_type_info_pseudo* @_ZTI5Scene to i32 (...)*), i32 (...)* bitcast (void (%struct.Scene*)* @_ZN5SceneD1Ev to i32 (...)*), i32 (...)* bitcast (void (%struct.Scene*)* @_ZN5SceneD0Ev to i32 (...)*), i32 (...)* bitcast (void ()* @__cxa_pure_virtual to i32 (...)*)], align 8 ; <[5 x i32 (...)*]*> [#uses=1]
@_ZTI5Scene = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([7 x i8]* @_ZTS5Scene, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=2]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS5Scene = internal constant [7 x i8] c"5Scene\00" ; <[7 x i8]*> [#uses=1]
@_ZTV6Sphere = internal constant [5 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI6Sphere to i32 (...)*), i32 (...)* bitcast (void (%struct.Sphere*)* @_ZN6SphereD1Ev to i32 (...)*), i32 (...)* bitcast (void (%struct.Sphere*)* @_ZN6SphereD0Ev to i32 (...)*), i32 (...)* bitcast (void (%"struct.std::Hit"*, %struct.Sphere*, %"struct.std::Hit"*, %struct.Ray*)* @_ZNK6Sphere9intersectERKSt4pairId3VecERK3Ray to i32 (...)*)], align 8 ; <[5 x i32 (...)*]*> [#uses=1]
@_ZTI6Sphere = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([8 x i8]* @_ZTS6Sphere, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI5Scene to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS6Sphere = internal constant [8 x i8] c"6Sphere\00" ; <[8 x i8]*> [#uses=1]
@infinity = internal global double 0.000000e+00, align 8 ; <double*> [#uses=8]
@delta = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@_ZStL8__ioinit = internal global %"struct.__gnu_cxx::new_allocator<Scene*>" zeroinitializer ; <%"struct.__gnu_cxx::new_allocator<Scene*>"*> [#uses=2]
@__dso_handle = external global i8*               ; <i8**> [#uses=1]
@.str = private constant [17 x i8] c"basic_ios::clear\00", align 1 ; <[17 x i8]*> [#uses=1]
@_ZTV5Group = internal constant [5 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI5Group to i32 (...)*), i32 (...)* bitcast (void (%struct.Group*)* @_ZN5GroupD1Ev to i32 (...)*), i32 (...)* bitcast (void (%struct.Group*)* @_ZN5GroupD0Ev to i32 (...)*), i32 (...)* bitcast (void (%"struct.std::Hit"*, %struct.Group*, %"struct.std::Hit"*, %struct.Ray*)* @_ZNK5Group9intersectERKSt4pairId3VecERK3Ray to i32 (...)*)], align 8 ; <[5 x i32 (...)*]*> [#uses=1]
@_ZTI5Group = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([7 x i8]* @_ZTS5Group, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI5Scene to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTS5Group = internal constant [7 x i8] c"5Group\00" ; <[7 x i8]*> [#uses=1]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >" ; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=4]
@.str1 = private constant [4 x i8] c"P5\0A\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str2 = private constant [2 x i8] c" \00", align 1 ; <[2 x i8]*> [#uses=1]
@.str3 = private constant [6 x i8] c"\0A255\0A\00", align 1 ; <[6 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [1 x %0] [%0 { i32 65535, void ()* @_GLOBAL__I_real }] ; <[1 x %0]*> [#uses=0]

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

define internal void @_GLOBAL__I_real() {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<Scene*>"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* @__tcf_0, i8* null, i8* bitcast (i8** @__dso_handle to i8*)) nounwind ; <i32> [#uses=0]
  store double 0x3E50000000000000, double* @delta, align 8
  store double 0x7FF0000000000000, double* @infinity, align 8
  ret void
}

define internal void @_ZN5SceneD1Ev(%struct.Scene* nocapture %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.Scene* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV5Scene, i32 0, i32 2), i32 (...)*** %0, align 4
  ret void
}

define internal void @_ZN5SceneD0Ev(%struct.Scene* %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.Scene* %this, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV5Scene, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = bitcast %struct.Scene* %this to i8*        ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %1) nounwind
  ret void
}

declare void @__cxa_pure_virtual() nounwind

define internal void @_ZN6SphereD1Ev(%struct.Sphere* nocapture %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %0, align 4
  ret void
}

define internal void @_ZN6SphereD0Ev(%struct.Sphere* %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = bitcast %struct.Sphere* %this to i8*       ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %1) nounwind
  ret void
}

define internal void @_ZNK6Sphere9intersectERKSt4pairId3VecERK3Ray(%"struct.std::Hit"* noalias nocapture sret %agg.result, %struct.Sphere* nocapture %this, %"struct.std::Hit"* nocapture %hit, %struct.Ray* nocapture %ray) nounwind {
entry:
  %0 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %1 = load double* %0, align 4                   ; <double> [#uses=2]
  %2 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  %3 = load double* %2, align 4                   ; <double> [#uses=2]
  %4 = fsub double %1, %3                         ; <double> [#uses=3]
  %5 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %6 = load double* %5, align 4                   ; <double> [#uses=2]
  %7 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %8 = load double* %7, align 4                   ; <double> [#uses=2]
  %9 = fsub double %6, %8                         ; <double> [#uses=3]
  %10 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %11 = load double* %10, align 4                 ; <double> [#uses=2]
  %12 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %13 = load double* %12, align 4                 ; <double> [#uses=2]
  %14 = fsub double %11, %13                      ; <double> [#uses=3]
  %15 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %16 = load double* %15, align 4                 ; <double> [#uses=2]
  %17 = fmul double %14, %16                      ; <double> [#uses=1]
  %18 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %19 = load double* %18, align 4                 ; <double> [#uses=2]
  %20 = fmul double %9, %19                       ; <double> [#uses=1]
  %21 = fadd double %17, %20                      ; <double> [#uses=1]
  %22 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %23 = load double* %22, align 4                 ; <double> [#uses=2]
  %24 = fmul double %4, %23                       ; <double> [#uses=1]
  %25 = fadd double %21, %24                      ; <double> [#uses=4]
  %26 = fmul double %25, %25                      ; <double> [#uses=1]
  %27 = fmul double %14, %14                      ; <double> [#uses=1]
  %28 = fmul double %9, %9                        ; <double> [#uses=1]
  %29 = fadd double %27, %28                      ; <double> [#uses=1]
  %30 = fmul double %4, %4                        ; <double> [#uses=1]
  %31 = fadd double %29, %30                      ; <double> [#uses=1]
  %32 = fsub double %26, %31                      ; <double> [#uses=1]
  %33 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 2 ; <double*> [#uses=1]
  %34 = load double* %33, align 4                 ; <double> [#uses=2]
  %35 = fmul double %34, %34                      ; <double> [#uses=1]
  %36 = fadd double %32, %35                      ; <double> [#uses=2]
  %37 = fcmp olt double %36, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %37, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %entry
  %38 = load double* @infinity, align 8           ; <double> [#uses=1]
  br label %_ZNK6Sphere10ray_sphereERK3Ray.exit

bb1.i:                                            ; preds = %entry
  %39 = tail call double @llvm.sqrt.f64(double %36) nounwind ; <double> [#uses=2]
  %40 = fadd double %25, %39                      ; <double> [#uses=2]
  %41 = fcmp olt double %40, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %41, label %bb2.i, label %bb3.i

bb2.i:                                            ; preds = %bb1.i
  %42 = load double* @infinity, align 8           ; <double> [#uses=1]
  br label %_ZNK6Sphere10ray_sphereERK3Ray.exit

bb3.i:                                            ; preds = %bb1.i
  %43 = fsub double %25, %39                      ; <double> [#uses=2]
  %44 = fcmp ogt double %43, 0.000000e+00         ; <i1> [#uses=1]
  %iftmp.89.0.i = select i1 %44, double %43, double %40 ; <double> [#uses=1]
  br label %_ZNK6Sphere10ray_sphereERK3Ray.exit

_ZNK6Sphere10ray_sphereERK3Ray.exit:              ; preds = %bb3.i, %bb2.i, %bb.i
  %45 = phi double [ %iftmp.89.0.i, %bb3.i ], [ %42, %bb2.i ], [ %38, %bb.i ] ; <double> [#uses=5]
  %46 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 0 ; <double*> [#uses=1]
  %47 = load double* %46, align 4                 ; <double> [#uses=2]
  %48 = fcmp ugt double %47, %45                  ; <i1> [#uses=1]
  br i1 %48, label %bb1, label %bb

bb:                                               ; preds = %_ZNK6Sphere10ray_sphereERK3Ray.exit
  %49 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 0 ; <double*> [#uses=1]
  store double %47, double* %49, align 4
  %50 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %51 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %52 = load double* %51, align 4                 ; <double> [#uses=1]
  store double %52, double* %50, align 4
  %53 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %54 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %55 = load double* %54, align 4                 ; <double> [#uses=1]
  store double %55, double* %53, align 4
  %56 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %57 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %58 = load double* %57, align 4                 ; <double> [#uses=1]
  store double %58, double* %56, align 4
  ret void

bb1:                                              ; preds = %_ZNK6Sphere10ray_sphereERK3Ray.exit
  %59 = fmul double %23, %45                      ; <double> [#uses=1]
  %60 = fmul double %19, %45                      ; <double> [#uses=1]
  %61 = fmul double %16, %45                      ; <double> [#uses=1]
  %62 = fadd double %3, %59                       ; <double> [#uses=1]
  %63 = fadd double %8, %60                       ; <double> [#uses=1]
  %64 = fadd double %13, %61                      ; <double> [#uses=1]
  %65 = fsub double %62, %1                       ; <double> [#uses=3]
  %66 = fsub double %63, %6                       ; <double> [#uses=3]
  %67 = fsub double %64, %11                      ; <double> [#uses=3]
  %68 = fmul double %67, %67                      ; <double> [#uses=1]
  %69 = fmul double %66, %66                      ; <double> [#uses=1]
  %70 = fadd double %68, %69                      ; <double> [#uses=1]
  %71 = fmul double %65, %65                      ; <double> [#uses=1]
  %72 = fadd double %70, %71                      ; <double> [#uses=1]
  %73 = tail call double @llvm.sqrt.f64(double %72) nounwind ; <double> [#uses=1]
  %74 = fdiv double 1.000000e+00, %73             ; <double> [#uses=3]
  %75 = fmul double %65, %74                      ; <double> [#uses=1]
  %76 = fmul double %66, %74                      ; <double> [#uses=1]
  %77 = fmul double %67, %74                      ; <double> [#uses=1]
  %78 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 0 ; <double*> [#uses=1]
  store double %45, double* %78, align 4
  %79 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  store double %77, double* %79, align 4
  %80 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  store double %76, double* %80, align 4
  %81 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  store double %75, double* %81, align 4
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.__gnu_cxx::new_allocator<Scene*>"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

define internal void @__tcf_0(i8* nocapture %unnamed_arg) {
entry:
  tail call void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<Scene*>"* @_ZStL8__ioinit)
  ret void
}

declare double @llvm.sqrt.f64(double) nounwind readonly

define internal void @_ZNK5Group9intersectERKSt4pairId3VecERK3Ray(%"struct.std::Hit"* noalias nocapture sret %agg.result, %struct.Group* %this, %"struct.std::Hit"* nocapture %hit, %struct.Ray* %ray) {
entry:
  %hit2 = alloca %"struct.std::Hit", align 8      ; <%"struct.std::Hit"*> [#uses=5]
  %memtmp = alloca %"struct.std::Hit", align 8    ; <%"struct.std::Hit"*> [#uses=5]
  %0 = getelementptr inbounds %"struct.std::Hit"* %hit2, i32 0, i32 0 ; <double*> [#uses=2]
  %1 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 0 ; <double*> [#uses=1]
  %2 = load double* %1, align 4                   ; <double> [#uses=4]
  store double %2, double* %0, align 8
  %3 = getelementptr inbounds %"struct.std::Hit"* %hit2, i32 0, i32 1, i32 0 ; <double*> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 1, i32 0 ; <double*> [#uses=2]
  %5 = load double* %4, align 4                   ; <double> [#uses=2]
  store double %5, double* %3, align 8
  %6 = getelementptr inbounds %"struct.std::Hit"* %hit2, i32 0, i32 1, i32 1 ; <double*> [#uses=2]
  %7 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 1, i32 1 ; <double*> [#uses=2]
  %8 = load double* %7, align 4                   ; <double> [#uses=2]
  store double %8, double* %6, align 8
  %9 = getelementptr inbounds %"struct.std::Hit"* %hit2, i32 0, i32 1, i32 2 ; <double*> [#uses=2]
  %10 = getelementptr inbounds %"struct.std::Hit"* %hit, i32 0, i32 1, i32 2 ; <double*> [#uses=2]
  %11 = load double* %10, align 4                 ; <double> [#uses=2]
  store double %11, double* %9, align 8
  %12 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 1, i32 2 ; <double*> [#uses=1]
  %13 = load double* %12, align 4                 ; <double> [#uses=1]
  %14 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  %15 = load double* %14, align 4                 ; <double> [#uses=1]
  %16 = fsub double %13, %15                      ; <double> [#uses=3]
  %17 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 1, i32 1 ; <double*> [#uses=1]
  %18 = load double* %17, align 4                 ; <double> [#uses=1]
  %19 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %20 = load double* %19, align 4                 ; <double> [#uses=1]
  %21 = fsub double %18, %20                      ; <double> [#uses=3]
  %22 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 1, i32 0 ; <double*> [#uses=1]
  %23 = load double* %22, align 4                 ; <double> [#uses=1]
  %24 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %25 = load double* %24, align 4                 ; <double> [#uses=1]
  %26 = fsub double %23, %25                      ; <double> [#uses=3]
  %27 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %28 = load double* %27, align 4                 ; <double> [#uses=1]
  %29 = fmul double %26, %28                      ; <double> [#uses=1]
  %30 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %31 = load double* %30, align 4                 ; <double> [#uses=1]
  %32 = fmul double %21, %31                      ; <double> [#uses=1]
  %33 = fadd double %29, %32                      ; <double> [#uses=1]
  %34 = getelementptr inbounds %struct.Ray* %ray, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %35 = load double* %34, align 4                 ; <double> [#uses=1]
  %36 = fmul double %16, %35                      ; <double> [#uses=1]
  %37 = fadd double %33, %36                      ; <double> [#uses=4]
  %38 = fmul double %37, %37                      ; <double> [#uses=1]
  %39 = fmul double %26, %26                      ; <double> [#uses=1]
  %40 = fmul double %21, %21                      ; <double> [#uses=1]
  %41 = fadd double %39, %40                      ; <double> [#uses=1]
  %42 = fmul double %16, %16                      ; <double> [#uses=1]
  %43 = fadd double %41, %42                      ; <double> [#uses=1]
  %44 = fsub double %38, %43                      ; <double> [#uses=1]
  %45 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %46 = load double* %45, align 4                 ; <double> [#uses=2]
  %47 = fmul double %46, %46                      ; <double> [#uses=1]
  %48 = fadd double %44, %47                      ; <double> [#uses=2]
  %49 = fcmp olt double %48, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %49, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %entry
  %50 = load double* @infinity, align 8           ; <double> [#uses=1]
  br label %_ZNK6Sphere10ray_sphereERK3Ray.exit

bb1.i:                                            ; preds = %entry
  %51 = call double @llvm.sqrt.f64(double %48) nounwind ; <double> [#uses=2]
  %52 = fadd double %37, %51                      ; <double> [#uses=2]
  %53 = fcmp olt double %52, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %53, label %bb2.i, label %bb3.i

bb2.i:                                            ; preds = %bb1.i
  %54 = load double* @infinity, align 8           ; <double> [#uses=1]
  br label %_ZNK6Sphere10ray_sphereERK3Ray.exit

bb3.i:                                            ; preds = %bb1.i
  %55 = fsub double %37, %51                      ; <double> [#uses=2]
  %56 = fcmp ogt double %55, 0.000000e+00         ; <i1> [#uses=1]
  %iftmp.89.0.i = select i1 %56, double %55, double %52 ; <double> [#uses=1]
  br label %_ZNK6Sphere10ray_sphereERK3Ray.exit

_ZNK6Sphere10ray_sphereERK3Ray.exit:              ; preds = %bb3.i, %bb2.i, %bb.i
  %57 = phi double [ %iftmp.89.0.i, %bb3.i ], [ %54, %bb2.i ], [ %50, %bb.i ] ; <double> [#uses=1]
  %58 = fcmp ugt double %2, %57                   ; <i1> [#uses=1]
  br i1 %58, label %bb1, label %bb

bb:                                               ; preds = %_ZNK6Sphere10ray_sphereERK3Ray.exit
  %59 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 0 ; <double*> [#uses=1]
  store double %2, double* %59, align 4
  %60 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %61 = load double* %4, align 4                  ; <double> [#uses=1]
  store double %61, double* %60, align 4
  %62 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %63 = load double* %7, align 4                  ; <double> [#uses=1]
  store double %63, double* %62, align 4
  %64 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %65 = load double* %10, align 4                 ; <double> [#uses=1]
  store double %65, double* %64, align 4
  ret void

bb1:                                              ; preds = %_ZNK6Sphere10ray_sphereERK3Ray.exit
  %66 = getelementptr inbounds %struct.Group* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %it.0.02 = load %"struct.std::_List_node_base"** %66 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %67 = getelementptr inbounds %struct.Group* %this, i32 0, i32 2, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %68 = icmp eq %"struct.std::_List_node_base"* %it.0.02, %67 ; <i1> [#uses=1]
  br i1 %68, label %bb4, label %bb.nph

bb.nph:                                           ; preds = %bb1
  %69 = getelementptr inbounds %"struct.std::Hit"* %memtmp, i32 0, i32 0 ; <double*> [#uses=1]
  %70 = getelementptr inbounds %"struct.std::Hit"* %memtmp, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %71 = getelementptr inbounds %"struct.std::Hit"* %memtmp, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %72 = getelementptr inbounds %"struct.std::Hit"* %memtmp, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb2, %bb.nph
  %it.0.03 = phi %"struct.std::_List_node_base"* [ %it.0.02, %bb.nph ], [ %it.0.0, %bb2 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %73 = getelementptr inbounds %"struct.std::_List_node_base"* %it.0.03, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %74 = bitcast %"struct.std::_List_node_base"* %73 to %struct.Scene** ; <%struct.Scene**> [#uses=1]
  %75 = load %struct.Scene** %74, align 4         ; <%struct.Scene*> [#uses=2]
  %76 = getelementptr inbounds %struct.Scene* %75, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %77 = load i32 (...)*** %76, align 4            ; <i32 (...)**> [#uses=1]
  %78 = getelementptr inbounds i32 (...)** %77, i32 2 ; <i32 (...)**> [#uses=1]
  %79 = load i32 (...)** %78, align 4             ; <i32 (...)*> [#uses=1]
  %80 = bitcast i32 (...)* %79 to void (%"struct.std::Hit"*, %struct.Scene*, %"struct.std::Hit"*, %struct.Ray*)* ; <void (%"struct.std::Hit"*, %struct.Scene*, %"struct.std::Hit"*, %struct.Ray*)*> [#uses=1]
  call void %80(%"struct.std::Hit"* noalias sret %memtmp, %struct.Scene* %75, %"struct.std::Hit"* %hit2, %struct.Ray* %ray)
  %81 = load double* %69, align 8                 ; <double> [#uses=2]
  store double %81, double* %0, align 8
  %82 = load double* %70, align 8                 ; <double> [#uses=2]
  store double %82, double* %3, align 8
  %83 = load double* %71, align 8                 ; <double> [#uses=2]
  store double %83, double* %6, align 8
  %84 = load double* %72, align 8                 ; <double> [#uses=2]
  store double %84, double* %9, align 8
  %85 = getelementptr inbounds %"struct.std::_List_node_base"* %it.0.03, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %it.0.0 = load %"struct.std::_List_node_base"** %85 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %86 = icmp eq %"struct.std::_List_node_base"* %it.0.0, %67 ; <i1> [#uses=1]
  br i1 %86, label %bb4, label %bb2

bb4:                                              ; preds = %bb2, %bb1
  %87 = phi double [ %11, %bb1 ], [ %84, %bb2 ]   ; <double> [#uses=1]
  %88 = phi double [ %8, %bb1 ], [ %83, %bb2 ]    ; <double> [#uses=1]
  %89 = phi double [ %5, %bb1 ], [ %82, %bb2 ]    ; <double> [#uses=1]
  %90 = phi double [ %2, %bb1 ], [ %81, %bb2 ]    ; <double> [#uses=1]
  %91 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 0 ; <double*> [#uses=1]
  store double %90, double* %91, align 4
  %92 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  store double %89, double* %92, align 4
  %93 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  store double %88, double* %93, align 4
  %94 = getelementptr inbounds %"struct.std::Hit"* %agg.result, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  store double %87, double* %94, align 4
  ret void
}

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.__gnu_cxx::new_allocator<Scene*>"*)

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

define internal fastcc void @_ZNSo9_M_insertIlEERSoT_() {
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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
  %62 = getelementptr inbounds i32 (...)** %61, i32 3 ; <i32 (...)**> [#uses=1]
  %63 = load i32 (...)** %62, align 4             ; <i32 (...)*> [#uses=1]
  %64 = bitcast i32 (...)* %63 to void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)* ; <void (%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"*, %"struct.std::ios_base"*, i8, i32)*> [#uses=1]
  invoke void %64(%"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* noalias sret %0, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* %38, %"struct.std::ostreambuf_iterator<char,std::char_traits<char> >"* byval align 4 %__s, %"struct.std::ios_base"* %51, i8 signext %46, i32 512)
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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
  call void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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
  invoke void @_ZSt19__throw_ios_failurePKc(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)) noreturn
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

declare void @_ZdlPv(i8*) nounwind

define internal void @_ZN5GroupD0Ev(%struct.Group* %this) {
invcont:
  %0 = getelementptr inbounds %struct.Group* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV5Group, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %struct.Group* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=3]
  %2 = getelementptr inbounds %struct.Group* %this, i32 0, i32 2, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=5]
  br label %invcont5

bb:                                               ; preds = %invcont5
  %3 = getelementptr inbounds %"struct.std::_List_node_base"* %it.0.0, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %4 = bitcast %"struct.std::_List_node_base"* %3 to %struct.Scene** ; <%struct.Scene**> [#uses=1]
  %5 = load %struct.Scene** %4, align 4           ; <%struct.Scene*> [#uses=3]
  %6 = icmp eq %struct.Scene* %5, null            ; <i1> [#uses=1]
  br i1 %6, label %bb3, label %bb1

bb1:                                              ; preds = %bb
  %7 = getelementptr inbounds %struct.Scene* %5, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %8 = load i32 (...)*** %7, align 4              ; <i32 (...)**> [#uses=1]
  %9 = getelementptr inbounds i32 (...)** %8, i32 1 ; <i32 (...)**> [#uses=1]
  %10 = load i32 (...)** %9, align 4              ; <i32 (...)*> [#uses=1]
  %11 = bitcast i32 (...)* %10 to void (%struct.Scene*)* ; <void (%struct.Scene*)*> [#uses=1]
  invoke void %11(%struct.Scene* %5)
          to label %bb3 unwind label %lpad23

bb3:                                              ; preds = %bb1, %bb
  %12 = getelementptr inbounds %"struct.std::_List_node_base"* %it.0.0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  br label %invcont5

invcont5:                                         ; preds = %bb3, %invcont
  %it.0.0.in = phi %"struct.std::_List_node_base"** [ %1, %invcont ], [ %12, %bb3 ] ; <%"struct.std::_List_node_base"**> [#uses=1]
  %it.0.0 = load %"struct.std::_List_node_base"** %it.0.0.in ; <%"struct.std::_List_node_base"*> [#uses=3]
  %13 = icmp eq %"struct.std::_List_node_base"* %it.0.0, %2 ; <i1> [#uses=1]
  br i1 %13, label %bb9, label %bb

bb9:                                              ; preds = %invcont5
  %14 = load %"struct.std::_List_node_base"** %1, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %15 = icmp eq %"struct.std::_List_node_base"* %2, %14 ; <i1> [#uses=1]
  br i1 %15, label %bb14, label %bb.i.i.i2

bb.i.i.i2:                                        ; preds = %bb.i.i.i2, %bb9
  %__cur.0.in1.i.i.i1 = phi %"struct.std::_List_node_base"* [ %17, %bb.i.i.i2 ], [ %14, %bb9 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %16 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %17 = load %"struct.std::_List_node_base"** %16, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %18 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1 to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %18) nounwind
  %19 = icmp eq %"struct.std::_List_node_base"* %2, %17 ; <i1> [#uses=1]
  br i1 %19, label %bb14, label %bb.i.i.i2

bb14:                                             ; preds = %bb.i.i.i2, %bb9
  %20 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %20, align 4
  %21 = bitcast %struct.Group* %this to i8*       ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %21) nounwind
  ret void

lpad23:                                           ; preds = %bb1
  %eh_ptr24 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select26 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %22 = load %"struct.std::_List_node_base"** %1, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %23 = icmp eq %"struct.std::_List_node_base"* %2, %22 ; <i1> [#uses=1]
  br i1 %23, label %ppad, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %lpad23
  %__cur.0.in1.i.i.i = phi %"struct.std::_List_node_base"* [ %25, %bb.i.i.i ], [ %22, %lpad23 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %24 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %25 = load %"struct.std::_List_node_base"** %24, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %26 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %26) nounwind
  %27 = icmp eq %"struct.std::_List_node_base"* %2, %25 ; <i1> [#uses=1]
  br i1 %27, label %ppad, label %bb.i.i.i

ppad:                                             ; preds = %bb.i.i.i, %lpad23
  %28 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %28, align 4
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr24)
  unreachable
}

define internal void @_ZN5GroupD1Ev(%struct.Group* %this) {
entry:
  %0 = getelementptr inbounds %struct.Group* %this, i32 0, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV5Group, i32 0, i32 2), i32 (...)*** %0, align 4
  %1 = getelementptr inbounds %struct.Group* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=3]
  %2 = getelementptr inbounds %struct.Group* %this, i32 0, i32 2, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=5]
  br label %invcont5.i

bb.i:                                             ; preds = %invcont5.i
  %3 = getelementptr inbounds %"struct.std::_List_node_base"* %it.0.0.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %4 = bitcast %"struct.std::_List_node_base"* %3 to %struct.Scene** ; <%struct.Scene**> [#uses=1]
  %5 = load %struct.Scene** %4, align 4           ; <%struct.Scene*> [#uses=3]
  %6 = icmp eq %struct.Scene* %5, null            ; <i1> [#uses=1]
  br i1 %6, label %bb3.i, label %bb1.i

bb1.i:                                            ; preds = %bb.i
  %7 = getelementptr inbounds %struct.Scene* %5, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  %8 = load i32 (...)*** %7, align 4              ; <i32 (...)**> [#uses=1]
  %9 = getelementptr inbounds i32 (...)** %8, i32 1 ; <i32 (...)**> [#uses=1]
  %10 = load i32 (...)** %9, align 4              ; <i32 (...)*> [#uses=1]
  %11 = bitcast i32 (...)* %10 to void (%struct.Scene*)* ; <void (%struct.Scene*)*> [#uses=1]
  invoke void %11(%struct.Scene* %5)
          to label %bb3.i unwind label %lpad23.i

bb3.i:                                            ; preds = %bb1.i, %bb.i
  %12 = getelementptr inbounds %"struct.std::_List_node_base"* %it.0.0.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  br label %invcont5.i

invcont5.i:                                       ; preds = %bb3.i, %entry
  %it.0.0.in.i = phi %"struct.std::_List_node_base"** [ %1, %entry ], [ %12, %bb3.i ] ; <%"struct.std::_List_node_base"**> [#uses=1]
  %it.0.0.i = load %"struct.std::_List_node_base"** %it.0.0.in.i ; <%"struct.std::_List_node_base"*> [#uses=3]
  %13 = icmp eq %"struct.std::_List_node_base"* %it.0.0.i, %2 ; <i1> [#uses=1]
  br i1 %13, label %bb9.i, label %bb.i

bb9.i:                                            ; preds = %invcont5.i
  %14 = load %"struct.std::_List_node_base"** %1, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %15 = icmp eq %"struct.std::_List_node_base"* %2, %14 ; <i1> [#uses=1]
  br i1 %15, label %_ZN5GroupD2Ev.exit, label %bb.i.i.i2.i

bb.i.i.i2.i:                                      ; preds = %bb.i.i.i2.i, %bb9.i
  %__cur.0.in1.i.i.i1.i = phi %"struct.std::_List_node_base"* [ %17, %bb.i.i.i2.i ], [ %14, %bb9.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %16 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %17 = load %"struct.std::_List_node_base"** %16, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %18 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i1.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %18) nounwind
  %19 = icmp eq %"struct.std::_List_node_base"* %2, %17 ; <i1> [#uses=1]
  br i1 %19, label %_ZN5GroupD2Ev.exit, label %bb.i.i.i2.i

lpad23.i:                                         ; preds = %bb1.i
  %eh_ptr24.i = tail call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select26.i = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr24.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %20 = load %"struct.std::_List_node_base"** %1, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %21 = icmp eq %"struct.std::_List_node_base"* %2, %20 ; <i1> [#uses=1]
  br i1 %21, label %ppad.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %lpad23.i
  %__cur.0.in1.i.i.i.i = phi %"struct.std::_List_node_base"* [ %23, %bb.i.i.i.i ], [ %20, %lpad23.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %22 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %23 = load %"struct.std::_List_node_base"** %22, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %24 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i to i8* ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %24) nounwind
  %25 = icmp eq %"struct.std::_List_node_base"* %2, %23 ; <i1> [#uses=1]
  br i1 %25, label %ppad.i, label %bb.i.i.i.i

ppad.i:                                           ; preds = %bb.i.i.i.i, %lpad23.i
  %26 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %26, align 4
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr24.i)
  unreachable

_ZN5GroupD2Ev.exit:                               ; preds = %bb.i.i.i2.i, %bb9.i
  %27 = getelementptr inbounds %struct.Group* %this, i32 0, i32 1, i32 0, i32 0 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %27, align 4
  ret void
}

declare i8* @_Znwj(i32)

declare void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"*, %"struct.std::_List_node_base"*)

define internal fastcc %struct.Scene* @_Z6createiRK3Vecd(i32 %level, %struct.Vec* nocapture %c, double %r) {
entry:
  %child = alloca %"struct.std::list<Scene*,std::allocator<Scene*> >", align 8 ; <%"struct.std::list<Scene*,std::allocator<Scene*> >"*> [#uses=3]
  %0 = alloca %"struct.std::list<Scene*,std::allocator<Scene*> >", align 8 ; <%"struct.std::list<Scene*,std::allocator<Scene*> >"*> [#uses=3]
  %1 = alloca %struct.Vec, align 8                ; <%struct.Vec*> [#uses=4]
  %2 = call i8* @_Znwj(i32 36)                    ; <i8*> [#uses=6]
  %c.0 = getelementptr %struct.Vec* %c, i32 0, i32 0 ; <double*> [#uses=3]
  %tmp27 = load double* %c.0, align 1             ; <double> [#uses=1]
  %c.1 = getelementptr %struct.Vec* %c, i32 0, i32 1 ; <double*> [#uses=3]
  %tmp28 = load double* %c.1, align 1             ; <double> [#uses=1]
  %c.2 = getelementptr %struct.Vec* %c, i32 0, i32 2 ; <double*> [#uses=3]
  %tmp29 = load double* %c.2, align 1             ; <double> [#uses=1]
  %3 = bitcast i8* %2 to i32 (...)***             ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %3, align 4
  %4 = getelementptr inbounds i8* %2, i32 4       ; <i8*> [#uses=1]
  %5 = bitcast i8* %4 to double*                  ; <double*> [#uses=1]
  store double %tmp27, double* %5, align 4
  %6 = getelementptr inbounds i8* %2, i32 12      ; <i8*> [#uses=1]
  %7 = bitcast i8* %6 to double*                  ; <double*> [#uses=1]
  store double %tmp28, double* %7, align 4
  %8 = getelementptr inbounds i8* %2, i32 20      ; <i8*> [#uses=1]
  %9 = bitcast i8* %8 to double*                  ; <double*> [#uses=1]
  store double %tmp29, double* %9, align 4
  %10 = getelementptr inbounds i8* %2, i32 28     ; <i8*> [#uses=1]
  %11 = bitcast i8* %10 to double*                ; <double*> [#uses=1]
  store double %r, double* %11, align 4
  %12 = bitcast i8* %2 to %struct.Scene*          ; <%struct.Scene*> [#uses=2]
  %13 = icmp eq i32 %level, 1                     ; <i1> [#uses=1]
  br i1 %13, label %bb, label %bb1

bb:                                               ; preds = %entry
  ret %struct.Scene* %12

bb1:                                              ; preds = %entry
  %14 = getelementptr inbounds %"struct.std::list<Scene*,std::allocator<Scene*> >"* %child, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=4]
  %15 = getelementptr inbounds %"struct.std::list<Scene*,std::allocator<Scene*> >"* %child, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %16 = getelementptr inbounds %"struct.std::list<Scene*,std::allocator<Scene*> >"* %child, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=10]
  store %"struct.std::_List_node_base"* %16, %"struct.std::_List_node_base"** %14, align 8
  store %"struct.std::_List_node_base"* %16, %"struct.std::_List_node_base"** %15, align 4
  %17 = invoke i8* @_Znwj(i32 12)
          to label %.noexc21 unwind label %lpad   ; <i8*> [#uses=2]

.noexc21:                                         ; preds = %bb1
  %18 = getelementptr inbounds i8* %17, i32 8     ; <i8*> [#uses=2]
  %19 = icmp eq i8* %18, null                     ; <i1> [#uses=1]
  br i1 %19, label %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i20, label %bb.i.i.i.i19

bb.i.i.i.i19:                                     ; preds = %.noexc21
  %20 = bitcast i8* %18 to %struct.Scene**        ; <%struct.Scene**> [#uses=1]
  store %struct.Scene* %12, %struct.Scene** %20
  br label %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i20

_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i20: ; preds = %bb.i.i.i.i19, %.noexc21
  %21 = bitcast i8* %17 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %21, %"struct.std::_List_node_base"* %16)
          to label %invcont unwind label %lpad

invcont:                                          ; preds = %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i20
  %22 = fmul double %r, 3.000000e+00              ; <double> [#uses=2]
  %23 = fdiv double %22, 0x400BB67AE8584CAA       ; <double> [#uses=3]
  %24 = fmul double %r, 5.000000e-01              ; <double> [#uses=1]
  %25 = getelementptr inbounds %struct.Vec* %1, i32 0, i32 0 ; <double*> [#uses=1]
  %26 = getelementptr inbounds %struct.Vec* %1, i32 0, i32 1 ; <double*> [#uses=1]
  %27 = getelementptr inbounds %struct.Vec* %1, i32 0, i32 2 ; <double*> [#uses=1]
  %28 = add i32 %level, -1                        ; <i32> [#uses=1]
  br label %bb8

bb3:                                              ; preds = %bb6
  %29 = sitofp i32 %dx.0 to double                ; <double> [#uses=1]
  %30 = fmul double %29, %23                      ; <double> [#uses=1]
  %31 = load double* %c.2, align 4                ; <double> [#uses=1]
  %32 = fadd double %31, %46                      ; <double> [#uses=1]
  %33 = load double* %c.1, align 4                ; <double> [#uses=1]
  %34 = fadd double %33, %23                      ; <double> [#uses=1]
  %35 = load double* %c.0, align 4                ; <double> [#uses=1]
  %36 = fadd double %35, %30                      ; <double> [#uses=1]
  store double %36, double* %25, align 8
  store double %34, double* %26, align 8
  store double %32, double* %27, align 8
  %37 = invoke fastcc %struct.Scene* @_Z6createiRK3Vecd(i32 %28, %struct.Vec* %1, double %24)
          to label %invcont4 unwind label %lpad   ; <%struct.Scene*> [#uses=1]

invcont4:                                         ; preds = %bb3
  %38 = invoke i8* @_Znwj(i32 12)
          to label %.noexc14 unwind label %lpad   ; <i8*> [#uses=2]

.noexc14:                                         ; preds = %invcont4
  %39 = getelementptr inbounds i8* %38, i32 8     ; <i8*> [#uses=2]
  %40 = icmp eq i8* %39, null                     ; <i1> [#uses=1]
  br i1 %40, label %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i, label %bb.i.i.i.i13

bb.i.i.i.i13:                                     ; preds = %.noexc14
  %41 = bitcast i8* %39 to %struct.Scene**        ; <%struct.Scene**> [#uses=1]
  store %struct.Scene* %37, %struct.Scene** %41
  br label %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i

_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i: ; preds = %bb.i.i.i.i13, %.noexc14
  %42 = bitcast i8* %38 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %42, %"struct.std::_List_node_base"* %16)
          to label %invcont5 unwind label %lpad

invcont5:                                         ; preds = %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb6.preheader, %invcont5
  %indvar = phi i32 [ 0, %bb6.preheader ], [ %indvar.next, %invcont5 ] ; <i32> [#uses=2]
  %tmp35 = shl i32 %indvar, 1                     ; <i32> [#uses=1]
  %dx.0 = add i32 %tmp35, -1                      ; <i32> [#uses=2]
  %43 = icmp sgt i32 %dx.0, 1                     ; <i1> [#uses=1]
  br i1 %43, label %bb7, label %bb3

bb7:                                              ; preds = %bb6
  %indvar.next38 = add i32 %indvar37, 1           ; <i32> [#uses=1]
  br label %bb8

bb8:                                              ; preds = %bb7, %invcont
  %indvar37 = phi i32 [ 0, %invcont ], [ %indvar.next38, %bb7 ] ; <i32> [#uses=2]
  %tmp39 = shl i32 %indvar37, 1                   ; <i32> [#uses=1]
  %dz.0 = add i32 %tmp39, -1                      ; <i32> [#uses=2]
  %44 = icmp sgt i32 %dz.0, 1                     ; <i1> [#uses=1]
  br i1 %44, label %bb9, label %bb6.preheader

bb6.preheader:                                    ; preds = %bb8
  %45 = sitofp i32 %dz.0 to double                ; <double> [#uses=1]
  %46 = fmul double %45, %23                      ; <double> [#uses=1]
  br label %bb6

bb9:                                              ; preds = %bb8
  %tmp = load double* %c.0, align 1               ; <double> [#uses=1]
  %tmp32 = load double* %c.1, align 1             ; <double> [#uses=1]
  %tmp34 = load double* %c.2, align 1             ; <double> [#uses=1]
  %47 = getelementptr inbounds %"struct.std::list<Scene*,std::allocator<Scene*> >"* %0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=5]
  %48 = getelementptr inbounds %"struct.std::list<Scene*,std::allocator<Scene*> >"* %0, i32 0, i32 0, i32 0, i32 0, i32 1 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %49 = getelementptr inbounds %"struct.std::list<Scene*,std::allocator<Scene*> >"* %0, i32 0, i32 0, i32 0, i32 0 ; <%"struct.std::_List_node_base"*> [#uses=11]
  store %"struct.std::_List_node_base"* %49, %"struct.std::_List_node_base"** %47, align 8
  store %"struct.std::_List_node_base"* %49, %"struct.std::_List_node_base"** %48, align 4
  %50 = load %"struct.std::_List_node_base"** %14, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %51 = icmp eq %"struct.std::_List_node_base"* %50, %16 ; <i1> [#uses=1]
  br i1 %51, label %invcont10, label %bb.i.i.i9

bb.i.i.i9:                                        ; preds = %.noexc2.i.i, %bb9
  %__first_addr.0.01.i.i.i = phi %"struct.std::_List_node_base"* [ %61, %.noexc2.i.i ], [ %50, %bb9 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %52 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i.i unwind label %lpad15.i.i ; <i8*> [#uses=2]

.noexc.i.i:                                       ; preds = %bb.i.i.i9
  %53 = getelementptr inbounds i8* %52, i32 8     ; <i8*> [#uses=2]
  %54 = icmp eq i8* %53, null                     ; <i1> [#uses=1]
  br i1 %54, label %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i, label %bb.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i:                                 ; preds = %.noexc.i.i
  %55 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %56 = bitcast %"struct.std::_List_node_base"* %55 to %struct.Scene** ; <%struct.Scene**> [#uses=1]
  %57 = bitcast i8* %53 to %struct.Scene**        ; <%struct.Scene**> [#uses=1]
  %58 = load %struct.Scene** %56, align 4         ; <%struct.Scene*> [#uses=1]
  store %struct.Scene* %58, %struct.Scene** %57
  br label %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i

_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i: ; preds = %bb.i.i.i.i.i.i.i, %.noexc.i.i
  %59 = bitcast i8* %52 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %59, %"struct.std::_List_node_base"* %49)
          to label %.noexc2.i.i unwind label %lpad15.i.i

.noexc2.i.i:                                      ; preds = %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i
  %60 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %61 = load %"struct.std::_List_node_base"** %60, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %62 = icmp eq %"struct.std::_List_node_base"* %61, %16 ; <i1> [#uses=1]
  br i1 %62, label %invcont10, label %bb.i.i.i9

lpad15.i.i:                                       ; preds = %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i, %bb.i.i.i9
  %eh_ptr16.i.i = call i8* @llvm.eh.exception()   ; <i8*> [#uses=2]
  %eh_select18.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr16.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %63 = load %"struct.std::_List_node_base"** %47, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %64 = icmp eq %"struct.std::_List_node_base"* %49, %63 ; <i1> [#uses=1]
  br i1 %64, label %Unwind.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %lpad15.i.i
  %__cur.0.in1.i.i.i.i = phi %"struct.std::_List_node_base"* [ %66, %bb.i.i.i.i ], [ %63, %lpad15.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %65 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %66 = load %"struct.std::_List_node_base"** %65, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %67 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %67) nounwind
  %68 = icmp eq %"struct.std::_List_node_base"* %49, %66 ; <i1> [#uses=1]
  br i1 %68, label %Unwind.i.i, label %bb.i.i.i.i

Unwind.i.i:                                       ; preds = %bb.i.i.i.i, %lpad15.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr16.i.i)
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %Unwind.i.i
  unreachable

invcont10:                                        ; preds = %.noexc2.i.i, %bb9
  %69 = invoke i8* @_Znwj(i32 48)
          to label %invcont11 unwind label %lpad31 ; <i8*> [#uses=10]

invcont11:                                        ; preds = %invcont10
  %70 = bitcast i8* %69 to i32 (...)***           ; <i32 (...)***> [#uses=2]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV5Group, i32 0, i32 2), i32 (...)*** %70, align 4
  %71 = getelementptr inbounds i8* %69, i32 4     ; <i8*> [#uses=1]
  %72 = bitcast i8* %71 to i32 (...)***           ; <i32 (...)***> [#uses=2]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %72, align 4
  %73 = getelementptr inbounds i8* %69, i32 8     ; <i8*> [#uses=1]
  %74 = bitcast i8* %73 to double*                ; <double*> [#uses=1]
  store double %tmp, double* %74, align 4
  %75 = getelementptr inbounds i8* %69, i32 16    ; <i8*> [#uses=1]
  %76 = bitcast i8* %75 to double*                ; <double*> [#uses=1]
  store double %tmp32, double* %76, align 4
  %77 = getelementptr inbounds i8* %69, i32 24    ; <i8*> [#uses=1]
  %78 = bitcast i8* %77 to double*                ; <double*> [#uses=1]
  store double %tmp34, double* %78, align 4
  %79 = getelementptr inbounds i8* %69, i32 32    ; <i8*> [#uses=1]
  %80 = bitcast i8* %79 to double*                ; <double*> [#uses=1]
  store double %22, double* %80, align 4
  %81 = getelementptr inbounds i8* %69, i32 40    ; <i8*> [#uses=2]
  %82 = bitcast i8* %81 to %"struct.std::_List_node_base"** ; <%"struct.std::_List_node_base"**> [#uses=2]
  %83 = getelementptr inbounds i8* %69, i32 44    ; <i8*> [#uses=1]
  %84 = bitcast i8* %83 to %"struct.std::_List_node_base"** ; <%"struct.std::_List_node_base"**> [#uses=1]
  %85 = bitcast i8* %81 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=5]
  store %"struct.std::_List_node_base"* %85, %"struct.std::_List_node_base"** %82, align 4
  store %"struct.std::_List_node_base"* %85, %"struct.std::_List_node_base"** %84, align 4
  %86 = load %"struct.std::_List_node_base"** %47, align 8 ; <%"struct.std::_List_node_base"*> [#uses=3]
  %87 = icmp eq %"struct.std::_List_node_base"* %86, %49 ; <i1> [#uses=1]
  br i1 %87, label %bb14, label %bb.i.i.i.i1

bb.i.i.i.i1:                                      ; preds = %.noexc2.i.i.i, %invcont11
  %__first_addr.0.01.i.i.i.i = phi %"struct.std::_List_node_base"* [ %97, %.noexc2.i.i.i ], [ %86, %invcont11 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %88 = invoke i8* @_Znwj(i32 12)
          to label %.noexc.i.i.i unwind label %lpad15.i.i.i ; <i8*> [#uses=2]

.noexc.i.i.i:                                     ; preds = %bb.i.i.i.i1
  %89 = getelementptr inbounds i8* %88, i32 8     ; <i8*> [#uses=2]
  %90 = icmp eq i8* %89, null                     ; <i1> [#uses=1]
  br i1 %90, label %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i.i, label %bb.i.i.i.i.i.i.i.i

bb.i.i.i.i.i.i.i.i:                               ; preds = %.noexc.i.i.i
  %91 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i.i, i32 1 ; <%"struct.std::_List_node_base"*> [#uses=1]
  %92 = bitcast %"struct.std::_List_node_base"* %91 to %struct.Scene** ; <%struct.Scene**> [#uses=1]
  %93 = bitcast i8* %89 to %struct.Scene**        ; <%struct.Scene**> [#uses=1]
  %94 = load %struct.Scene** %92, align 4         ; <%struct.Scene*> [#uses=1]
  store %struct.Scene* %94, %struct.Scene** %93
  br label %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i.i

_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i.i: ; preds = %bb.i.i.i.i.i.i.i.i, %.noexc.i.i.i
  %95 = bitcast i8* %88 to %"struct.std::_List_node_base"* ; <%"struct.std::_List_node_base"*> [#uses=1]
  invoke void @_ZNSt15_List_node_base4hookEPS_(%"struct.std::_List_node_base"* %95, %"struct.std::_List_node_base"* %85)
          to label %.noexc2.i.i.i unwind label %lpad15.i.i.i

.noexc2.i.i.i:                                    ; preds = %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i.i
  %96 = getelementptr inbounds %"struct.std::_List_node_base"* %__first_addr.0.01.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %97 = load %"struct.std::_List_node_base"** %96, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %98 = icmp eq %"struct.std::_List_node_base"* %97, %49 ; <i1> [#uses=1]
  br i1 %98, label %bb14.loopexit, label %bb.i.i.i.i1

lpad15.i.i.i:                                     ; preds = %_ZNSt4listIP5SceneSaIS1_EE9push_backERKS1_.exit.i.i.i.i, %bb.i.i.i.i1
  %eh_ptr16.i.i.i = call i8* @llvm.eh.exception() ; <i8*> [#uses=2]
  %eh_select18.i.i.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr16.i.i.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %99 = load %"struct.std::_List_node_base"** %82, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %100 = icmp eq %"struct.std::_List_node_base"* %85, %99 ; <i1> [#uses=1]
  br i1 %100, label %Unwind.i.i.i, label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %lpad15.i.i.i
  %__cur.0.in1.i.i.i.i.i = phi %"struct.std::_List_node_base"* [ %102, %bb.i.i.i.i.i ], [ %99, %lpad15.i.i.i ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %101 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %102 = load %"struct.std::_List_node_base"** %101, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %103 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %103) nounwind
  %104 = icmp eq %"struct.std::_List_node_base"* %85, %102 ; <i1> [#uses=1]
  br i1 %104, label %Unwind.i.i.i, label %bb.i.i.i.i.i

Unwind.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %lpad15.i.i.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr16.i.i.i)
          to label %.noexc.i unwind label %lpad.i

.noexc.i:                                         ; preds = %Unwind.i.i.i
  unreachable

lpad.i:                                           ; preds = %Unwind.i.i.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select6.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV6Sphere, i32 0, i32 2), i32 (...)*** %72, align 4
  store i32 (...)** getelementptr inbounds ([5 x i32 (...)*]* @_ZTV5Scene, i32 0, i32 2), i32 (...)*** %70, align 4
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr.i)
          to label %.noexc2 unwind label %lpad35

.noexc2:                                          ; preds = %lpad.i
  unreachable

bb14.loopexit:                                    ; preds = %.noexc2.i.i.i
  %.pre = load %"struct.std::_List_node_base"** %47, align 8 ; <%"struct.std::_List_node_base"*> [#uses=1]
  br label %bb14

bb14:                                             ; preds = %bb14.loopexit, %invcont11
  %105 = phi %"struct.std::_List_node_base"* [ %.pre, %bb14.loopexit ], [ %86, %invcont11 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %106 = bitcast i8* %69 to %struct.Scene*        ; <%struct.Scene*> [#uses=1]
  %107 = icmp eq %"struct.std::_List_node_base"* %49, %105 ; <i1> [#uses=1]
  br i1 %107, label %bb26, label %bb.i.i.i7

bb.i.i.i7:                                        ; preds = %bb.i.i.i7, %bb14
  %__cur.0.in1.i.i.i6 = phi %"struct.std::_List_node_base"* [ %109, %bb.i.i.i7 ], [ %105, %bb14 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %108 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i6, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %109 = load %"struct.std::_List_node_base"** %108, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %110 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i6 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %110) nounwind
  %111 = icmp eq %"struct.std::_List_node_base"* %49, %109 ; <i1> [#uses=1]
  br i1 %111, label %bb26, label %bb.i.i.i7

invcont24:                                        ; preds = %bb.i.i.i, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.1)
  unreachable

bb26:                                             ; preds = %bb.i.i.i7, %bb14
  %112 = load %"struct.std::_List_node_base"** %14, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %113 = icmp eq %"struct.std::_List_node_base"* %16, %112 ; <i1> [#uses=1]
  br i1 %113, label %_ZNSt4listIP5SceneSaIS1_EED1Ev.exit5, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb.i.i.i4, %bb26
  %__cur.0.in1.i.i.i3 = phi %"struct.std::_List_node_base"* [ %115, %bb.i.i.i4 ], [ %112, %bb26 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %114 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i3, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %115 = load %"struct.std::_List_node_base"** %114, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %116 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i3 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %116) nounwind
  %117 = icmp eq %"struct.std::_List_node_base"* %16, %115 ; <i1> [#uses=1]
  br i1 %117, label %_ZNSt4listIP5SceneSaIS1_EED1Ev.exit5, label %bb.i.i.i4

_ZNSt4listIP5SceneSaIS1_EED1Ev.exit5:             ; preds = %bb.i.i.i4, %bb26
  ret %struct.Scene* %106

lpad:                                             ; preds = %Unwind.i.i, %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i, %invcont4, %bb3, %_ZNSt4listIP5SceneSaIS1_EE9_M_insertESt14_List_iteratorIS1_ERKS1_.exit.i20, %bb1
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select30 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad31:                                           ; preds = %invcont10
  %eh_ptr32 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select34 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr32, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad47

lpad35:                                           ; preds = %lpad.i
  %eh_ptr36 = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select38 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr36, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  call void @_ZdlPv(i8* %69) nounwind
  br label %ppad47

ppad:                                             ; preds = %bb.i.i.i17, %ppad47, %lpad
  %eh_exception.1 = phi i8* [ %eh_ptr, %lpad ], [ %eh_exception.0, %ppad47 ], [ %eh_exception.0, %bb.i.i.i17 ] ; <i8*> [#uses=1]
  %118 = load %"struct.std::_List_node_base"** %14, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %119 = icmp eq %"struct.std::_List_node_base"* %16, %118 ; <i1> [#uses=1]
  br i1 %119, label %invcont24, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %ppad
  %__cur.0.in1.i.i.i = phi %"struct.std::_List_node_base"* [ %121, %bb.i.i.i ], [ %118, %ppad ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %120 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %121 = load %"struct.std::_List_node_base"** %120, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %122 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %122) nounwind
  %123 = icmp eq %"struct.std::_List_node_base"* %16, %121 ; <i1> [#uses=1]
  br i1 %123, label %invcont24, label %bb.i.i.i

ppad47:                                           ; preds = %lpad35, %lpad31
  %eh_exception.0 = phi i8* [ %eh_ptr36, %lpad35 ], [ %eh_ptr32, %lpad31 ] ; <i8*> [#uses=2]
  %124 = load %"struct.std::_List_node_base"** %47, align 8 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %125 = icmp eq %"struct.std::_List_node_base"* %49, %124 ; <i1> [#uses=1]
  br i1 %125, label %ppad, label %bb.i.i.i17

bb.i.i.i17:                                       ; preds = %bb.i.i.i17, %ppad47
  %__cur.0.in1.i.i.i16 = phi %"struct.std::_List_node_base"* [ %127, %bb.i.i.i17 ], [ %124, %ppad47 ] ; <%"struct.std::_List_node_base"*> [#uses=2]
  %126 = getelementptr inbounds %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i16, i32 0, i32 0 ; <%"struct.std::_List_node_base"**> [#uses=1]
  %127 = load %"struct.std::_List_node_base"** %126, align 4 ; <%"struct.std::_List_node_base"*> [#uses=2]
  %128 = bitcast %"struct.std::_List_node_base"* %__cur.0.in1.i.i.i16 to i8* ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %128) nounwind
  %129 = icmp eq %"struct.std::_List_node_base"* %49, %127 ; <i1> [#uses=1]
  br i1 %129, label %ppad, label %bb.i.i.i17
}

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %0 = alloca %"struct.std::Hit", align 8         ; <%"struct.std::Hit"*> [#uses=5]
  %1 = alloca %"struct.std::Hit", align 8         ; <%"struct.std::Hit"*> [#uses=5]
  %hit.i = alloca %"struct.std::Hit", align 8     ; <%"struct.std::Hit"*> [#uses=5]
  %2 = alloca %struct.Ray, align 8                ; <%struct.Ray*> [#uses=7]
  %3 = alloca %"struct.std::Hit", align 8         ; <%"struct.std::Hit"*> [#uses=2]
  %__c_addr.i = alloca i8, align 1                ; <i8*> [#uses=2]
  %4 = alloca %struct.Ray, align 8                ; <%struct.Ray*> [#uses=7]
  %5 = alloca %struct.Vec, align 8                ; <%struct.Vec*> [#uses=4]
  %6 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %6, label %bb, label %bb1

bb:                                               ; preds = %entry
  %7 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=1]
  %9 = call i32 @atoi(i8* %8) nounwind readonly   ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %level.0 = phi i32 [ %9, %bb ], [ 6, %entry ]   ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.Vec* %5, i32 0, i32 0 ; <double*> [#uses=1]
  store double 0.000000e+00, double* %10, align 8
  %11 = getelementptr inbounds %struct.Vec* %5, i32 0, i32 1 ; <double*> [#uses=1]
  store double -1.000000e+00, double* %11, align 8
  %12 = getelementptr inbounds %struct.Vec* %5, i32 0, i32 2 ; <double*> [#uses=1]
  store double 0.000000e+00, double* %12, align 8
  %13 = call fastcc %struct.Scene* @_Z6createiRK3Vecd(i32 %level.0, %struct.Vec* %5, double 1.000000e+00) ; <%struct.Scene*> [#uses=5]
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 3)
  call fastcc void @_ZNSo9_M_insertIlEERSoT_()
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i32 1)
  call fastcc void @_ZNSo9_M_insertIlEERSoT_()
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 5)
  %14 = getelementptr inbounds %struct.Ray* %4, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %15 = getelementptr inbounds %struct.Ray* %4, i32 0, i32 0, i32 1 ; <double*> [#uses=2]
  %16 = getelementptr inbounds %struct.Ray* %4, i32 0, i32 0, i32 2 ; <double*> [#uses=2]
  %17 = getelementptr inbounds %struct.Ray* %4, i32 0, i32 1, i32 0 ; <double*> [#uses=2]
  %18 = getelementptr inbounds %struct.Ray* %4, i32 0, i32 1, i32 1 ; <double*> [#uses=2]
  %19 = getelementptr inbounds %struct.Ray* %4, i32 0, i32 1, i32 2 ; <double*> [#uses=2]
  %20 = getelementptr inbounds %struct.Scene* %13, i32 0, i32 0 ; <i32 (...)***> [#uses=3]
  %21 = getelementptr inbounds %"struct.std::Hit"* %1, i32 0, i32 0 ; <double*> [#uses=1]
  %22 = getelementptr inbounds %"struct.std::Hit"* %1, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %23 = getelementptr inbounds %"struct.std::Hit"* %1, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %24 = getelementptr inbounds %"struct.std::Hit"* %1, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %25 = getelementptr inbounds %"struct.std::Hit"* %hit.i, i32 0, i32 0 ; <double*> [#uses=1]
  %26 = getelementptr inbounds %"struct.std::Hit"* %hit.i, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %27 = getelementptr inbounds %"struct.std::Hit"* %hit.i, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %28 = getelementptr inbounds %"struct.std::Hit"* %hit.i, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %29 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %30 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 0, i32 1 ; <double*> [#uses=1]
  %31 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 0, i32 2 ; <double*> [#uses=1]
  %32 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %33 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %34 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %35 = getelementptr inbounds %"struct.std::Hit"* %0, i32 0, i32 0 ; <double*> [#uses=1]
  %36 = getelementptr inbounds %"struct.std::Hit"* %0, i32 0, i32 1, i32 0 ; <double*> [#uses=1]
  %37 = getelementptr inbounds %"struct.std::Hit"* %0, i32 0, i32 1, i32 1 ; <double*> [#uses=1]
  %38 = getelementptr inbounds %"struct.std::Hit"* %0, i32 0, i32 1, i32 2 ; <double*> [#uses=1]
  %39 = getelementptr inbounds %"struct.std::Hit"* %3, i32 0, i32 0 ; <double*> [#uses=1]
  br label %bb10.preheader

bb6.preheader.us:                                 ; preds = %bb8.preheader, %bb6.bb7_crit_edge.us
  %.pre = phi double [ %.pre.pre, %bb8.preheader ], [ %.pre.rle3, %bb6.bb7_crit_edge.us ] ; <double> [#uses=1]
  %40 = phi i32 [ 0, %bb8.preheader ], [ %106, %bb6.bb7_crit_edge.us ] ; <i32> [#uses=2]
  %g.110.us = phi double [ 0.000000e+00, %bb8.preheader ], [ %104, %bb6.bb7_crit_edge.us ] ; <double> [#uses=1]
  %41 = sitofp i32 %40 to double                  ; <double> [#uses=1]
  %42 = fdiv double %41, 4.000000e+00             ; <double> [#uses=1]
  %43 = fadd double %114, %42                     ; <double> [#uses=1]
  %44 = fadd double %43, -2.560000e+02            ; <double> [#uses=3]
  %45 = fmul double %44, %44                      ; <double> [#uses=1]
  br label %bb5.us

bb5.us:                                           ; preds = %_Z9ray_traceRK3VecRK3RayRK5Scene.exit, %bb6.preheader.us
  %46 = phi double [ %.rle1, %_Z9ray_traceRK3VecRK3RayRK5Scene.exit ], [ %.pre, %bb6.preheader.us ] ; <double> [#uses=1]
  %47 = phi i32 [ 0, %bb6.preheader.us ], [ %105, %_Z9ray_traceRK3VecRK3RayRK5Scene.exit ] ; <i32> [#uses=2]
  %g.07.us = phi double [ %g.110.us, %bb6.preheader.us ], [ %104, %_Z9ray_traceRK3VecRK3RayRK5Scene.exit ] ; <double> [#uses=1]
  %48 = sitofp i32 %47 to double                  ; <double> [#uses=1]
  %49 = fdiv double %48, 4.000000e+00             ; <double> [#uses=1]
  %50 = fadd double %115, %49                     ; <double> [#uses=1]
  %51 = fadd double %50, -2.560000e+02            ; <double> [#uses=3]
  %52 = fmul double %51, %51                      ; <double> [#uses=1]
  %53 = fadd double %45, %52                      ; <double> [#uses=1]
  %54 = fadd double %53, 2.621440e+05             ; <double> [#uses=1]
  %55 = call double @llvm.sqrt.f64(double %54) nounwind ; <double> [#uses=1]
  %56 = fdiv double 1.000000e+00, %55             ; <double> [#uses=3]
  %57 = fmul double %56, 5.120000e+02             ; <double> [#uses=1]
  %58 = fmul double %51, %56                      ; <double> [#uses=1]
  %59 = fmul double %44, %56                      ; <double> [#uses=1]
  store double 0.000000e+00, double* %14, align 8
  store double 0.000000e+00, double* %15, align 8
  store double -4.000000e+00, double* %16, align 8
  store double %59, double* %17, align 8
  store double %58, double* %18, align 8
  store double %57, double* %19, align 8
  %60 = load i32 (...)*** %20, align 4            ; <i32 (...)**> [#uses=1]
  %61 = getelementptr inbounds i32 (...)** %60, i32 2 ; <i32 (...)**> [#uses=1]
  %62 = load i32 (...)** %61, align 4             ; <i32 (...)*> [#uses=1]
  store double %46, double* %21, align 8
  store double 0.000000e+00, double* %22, align 8
  store double 0.000000e+00, double* %23, align 8
  store double 0.000000e+00, double* %24, align 8
  %63 = bitcast i32 (...)* %62 to void (%"struct.std::Hit"*, %struct.Scene*, %"struct.std::Hit"*, %struct.Ray*)* ; <void (%"struct.std::Hit"*, %struct.Scene*, %"struct.std::Hit"*, %struct.Ray*)*> [#uses=1]
  call void %63(%"struct.std::Hit"* noalias sret %hit.i, %struct.Scene* %13, %"struct.std::Hit"* %1, %struct.Ray* %4)
  %64 = load double* %25, align 8                 ; <double> [#uses=4]
  %65 = load double* @infinity, align 8           ; <double> [#uses=6]
  %66 = fcmp oeq double %64, %65                  ; <i1> [#uses=1]
  br i1 %66, label %_Z9ray_traceRK3VecRK3RayRK5Scene.exit, label %bb1.i

bb1.i:                                            ; preds = %bb5.us
  %67 = load double* %26, align 8                 ; <double> [#uses=2]
  %68 = fmul double %67, 0xBFD11ACEE560242A       ; <double> [#uses=1]
  %69 = load double* %27, align 8                 ; <double> [#uses=2]
  %70 = fmul double %69, 0xBFE9A8365810363F       ; <double> [#uses=1]
  %71 = fadd double %68, %70                      ; <double> [#uses=1]
  %72 = load double* %28, align 8                 ; <double> [#uses=2]
  %73 = fmul double %72, 0x3FE11ACEE560242A       ; <double> [#uses=1]
  %74 = fadd double %71, %73                      ; <double> [#uses=2]
  %75 = fcmp ult double %74, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %75, label %bb3.i, label %_Z9ray_traceRK3VecRK3RayRK5Scene.exit

bb3.i:                                            ; preds = %bb1.i
  %76 = load double* @delta, align 8              ; <double> [#uses=3]
  %77 = fmul double %72, %76                      ; <double> [#uses=1]
  %78 = fmul double %69, %76                      ; <double> [#uses=1]
  %79 = fmul double %67, %76                      ; <double> [#uses=1]
  %80 = load double* %19, align 8                 ; <double> [#uses=1]
  %81 = fmul double %80, %64                      ; <double> [#uses=1]
  %82 = load double* %18, align 8                 ; <double> [#uses=1]
  %83 = fmul double %82, %64                      ; <double> [#uses=1]
  %84 = load double* %17, align 8                 ; <double> [#uses=1]
  %85 = fmul double %84, %64                      ; <double> [#uses=1]
  %86 = load double* %16, align 8                 ; <double> [#uses=1]
  %87 = fadd double %86, %81                      ; <double> [#uses=1]
  %88 = load double* %15, align 8                 ; <double> [#uses=1]
  %89 = fadd double %88, %83                      ; <double> [#uses=1]
  %90 = load double* %14, align 8                 ; <double> [#uses=1]
  %91 = fadd double %90, %85                      ; <double> [#uses=1]
  %92 = fadd double %87, %77                      ; <double> [#uses=1]
  %93 = fadd double %89, %78                      ; <double> [#uses=1]
  %94 = fadd double %91, %79                      ; <double> [#uses=1]
  store double %94, double* %29, align 8
  store double %93, double* %30, align 8
  store double %92, double* %31, align 8
  store double 0x3FD11ACEE560242A, double* %32, align 8
  store double 0x3FE9A8365810363F, double* %33, align 8
  store double 0xBFE11ACEE560242A, double* %34, align 8
  %95 = load i32 (...)*** %20, align 4            ; <i32 (...)**> [#uses=1]
  %96 = getelementptr inbounds i32 (...)** %95, i32 2 ; <i32 (...)**> [#uses=1]
  %97 = load i32 (...)** %96, align 4             ; <i32 (...)*> [#uses=1]
  store double %65, double* %35, align 8
  store double 0.000000e+00, double* %36, align 8
  store double 0.000000e+00, double* %37, align 8
  store double 0.000000e+00, double* %38, align 8
  %98 = bitcast i32 (...)* %97 to void (%"struct.std::Hit"*, %struct.Scene*, %"struct.std::Hit"*, %struct.Ray*)* ; <void (%"struct.std::Hit"*, %struct.Scene*, %"struct.std::Hit"*, %struct.Ray*)*> [#uses=1]
  call void %98(%"struct.std::Hit"* noalias sret %3, %struct.Scene* %13, %"struct.std::Hit"* %0, %struct.Ray* %2)
  %99 = load double* %39, align 8                 ; <double> [#uses=1]
  %100 = load double* @infinity, align 8          ; <double> [#uses=5]
  %101 = fcmp uge double %99, %100                ; <i1> [#uses=1]
  br i1 %101, label %bb4.i, label %_Z9ray_traceRK3VecRK3RayRK5Scene.exit

bb4.i:                                            ; preds = %bb3.i
  %102 = fsub double -0.000000e+00, %74           ; <double> [#uses=1]
  br label %_Z9ray_traceRK3VecRK3RayRK5Scene.exit

_Z9ray_traceRK3VecRK3RayRK5Scene.exit:            ; preds = %bb4.i, %bb3.i, %bb1.i, %bb5.us
  %.pre.rle3 = phi double [ %100, %bb4.i ], [ %100, %bb3.i ], [ %65, %bb1.i ], [ %65, %bb5.us ] ; <double> [#uses=1]
  %.rle1 = phi double [ %100, %bb4.i ], [ %100, %bb3.i ], [ %65, %bb1.i ], [ %65, %bb5.us ] ; <double> [#uses=1]
  %103 = phi double [ %102, %bb4.i ], [ 0.000000e+00, %bb3.i ], [ 0.000000e+00, %bb1.i ], [ 0.000000e+00, %bb5.us ] ; <double> [#uses=1]
  %104 = fadd double %103, %g.07.us               ; <double> [#uses=3]
  %105 = add nsw i32 %47, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %105, 4                 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb6.bb7_crit_edge.us, label %bb5.us

bb6.bb7_crit_edge.us:                             ; preds = %_Z9ray_traceRK3VecRK3RayRK5Scene.exit
  %106 = add nsw i32 %40, 1                       ; <i32> [#uses=2]
  %exitcond21 = icmp eq i32 %106, 4               ; <i1> [#uses=1]
  br i1 %exitcond21, label %bb9, label %bb6.preheader.us

bb9:                                              ; preds = %bb6.bb7_crit_edge.us
  %107 = fmul double %104, 2.550000e+02           ; <double> [#uses=1]
  %108 = fdiv double %107, 1.600000e+01           ; <double> [#uses=1]
  %109 = fadd double %108, 5.000000e-01           ; <double> [#uses=1]
  %110 = fptosi double %109 to i32                ; <i32> [#uses=1]
  %111 = trunc i32 %110 to i8                     ; <i8> [#uses=1]
  store i8 %111, i8* %__c_addr.i
  call fastcc void @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(i8* %__c_addr.i, i32 1)
  %112 = add i32 %113, 1                          ; <i32> [#uses=2]
  %exitcond22 = icmp eq i32 %112, 512             ; <i1> [#uses=1]
  br i1 %exitcond22, label %bb11, label %bb8.preheader

bb8.preheader:                                    ; preds = %bb10.preheader, %bb9
  %113 = phi i32 [ 0, %bb10.preheader ], [ %112, %bb9 ] ; <i32> [#uses=2]
  %114 = sitofp i32 %113 to double                ; <double> [#uses=1]
  %.pre.pre = load double* @infinity, align 8     ; <double> [#uses=1]
  br label %bb6.preheader.us

bb11:                                             ; preds = %bb9
  %phitmp = icmp slt i32 %tmp24, 0                ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %phitmp, label %bb13, label %bb10.preheader

bb10.preheader:                                   ; preds = %bb11, %bb1
  %indvar = phi i32 [ 0, %bb1 ], [ %indvar.next, %bb11 ] ; <i32> [#uses=3]
  %tmp24 = sub i32 510, %indvar                   ; <i32> [#uses=1]
  %y.016 = sub i32 511, %indvar                   ; <i32> [#uses=1]
  %115 = sitofp i32 %y.016 to double              ; <double> [#uses=1]
  br label %bb8.preheader

bb13:                                             ; preds = %bb11
  %116 = icmp eq %struct.Scene* %13, null         ; <i1> [#uses=1]
  br i1 %116, label %bb15, label %bb14

bb14:                                             ; preds = %bb13
  %117 = load i32 (...)*** %20, align 4           ; <i32 (...)**> [#uses=1]
  %118 = getelementptr inbounds i32 (...)** %117, i32 1 ; <i32 (...)**> [#uses=1]
  %119 = load i32 (...)** %118, align 4           ; <i32 (...)*> [#uses=1]
  %120 = bitcast i32 (...)* %119 to void (%struct.Scene*)* ; <void (%struct.Scene*)*> [#uses=1]
  call void %120(%struct.Scene* %13)
  ret i32 0

bb15:                                             ; preds = %bb13
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
