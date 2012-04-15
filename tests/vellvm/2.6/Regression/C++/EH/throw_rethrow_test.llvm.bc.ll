; ModuleID = 'throw_rethrow_test.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@_ZTIi = external constant %struct.__class_type_info_pseudo ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTId = external constant %struct.__class_type_info_pseudo ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTI3foo = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([5 x i8]* @_ZTS3foo, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS3foo = internal constant [5 x i8] c"3foo\00" ; <[5 x i8]*> [#uses=1]
@.str = private constant [7 x i8] c"%d: 3\0A\00", align 1 ; <[7 x i8]*> [#uses=1]
@.str1 = private constant [7 x i8] c"%d: 1\0A\00", align 1 ; <[7 x i8]*> [#uses=1]
@.str2 = private constant [7 x i8] c"%d: 2\0A\00", align 1 ; <[7 x i8]*> [#uses=1]

declare void @__cxa_rethrow() noreturn

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

define i32 @main() {
entry:
  br label %bb38

bb:                                               ; preds = %bb38
  %0 = icmp ugt i32 %15, 2                        ; <i1> [#uses=1]
  br i1 %0, label %bb1.i, label %bb.i

bb.i:                                             ; preds = %bb
  %1 = call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %2 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  store i32 %15, i32* %2, align 4
  invoke void @__cxa_throw(i8* %1, i8* bitcast (%struct.__class_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
          to label %.noexc1 unwind label %lpad

.noexc1:                                          ; preds = %bb.i
  unreachable

bb1.i:                                            ; preds = %bb
  %3 = icmp ugt i32 %15, 5                        ; <i1> [#uses=1]
  br i1 %3, label %bb3.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %4 = call i8* @__cxa_allocate_exception(i32 8) nounwind ; <i8*> [#uses=2]
  %5 = bitcast i8* %4 to double*                  ; <double*> [#uses=1]
  store double 1.000000e+00, double* %5, align 8
  invoke void @__cxa_throw(i8* %4, i8* bitcast (%struct.__class_type_info_pseudo* @_ZTId to i8*), void (i8*)* null) noreturn
          to label %.noexc2 unwind label %lpad

.noexc2:                                          ; preds = %bb2.i
  unreachable

bb3.i:                                            ; preds = %bb1.i
  %6 = icmp ugt i32 %15, 8                        ; <i1> [#uses=1]
  br i1 %6, label %bb40, label %bb4.i

bb4.i:                                            ; preds = %bb3.i
  %7 = call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %8 = bitcast i8* %7 to i32*                     ; <i32*> [#uses=1]
  store i32 1, i32* %8, align 4
  invoke void @__cxa_throw(i8* %7, i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI3foo to i8*), void (i8*)* null) noreturn
          to label %.noexc3 unwind label %lpad

.noexc3:                                          ; preds = %bb4.i
  unreachable

bb2:                                              ; preds = %lpad
  %9 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  invoke void @__cxa_rethrow() noreturn
          to label %.noexc unwind label %lpad44

.noexc:                                           ; preds = %bb2
  unreachable

bb11:                                             ; preds = %lpad44
  %10 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr45) nounwind ; <i8*> [#uses=0]
  %11 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %15) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %bb18 unwind label %lpad48

bb18:                                             ; preds = %bb11
  tail call void @__cxa_end_catch()
  br label %bb37

bb27:                                             ; preds = %ppad86
  %12 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i32 %15) ; <i32> [#uses=0]
  tail call void @__cxa_end_catch()
  br label %bb37

bb36:                                             ; preds = %ppad86
  %13 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), i32 %15) ; <i32> [#uses=0]
  tail call void @__cxa_end_catch()
  br label %bb37

bb37:                                             ; preds = %bb36, %bb27, %bb18
  %14 = add i32 %15, 1                            ; <i32> [#uses=1]
  br label %bb38

bb38:                                             ; preds = %bb37, %entry
  %15 = phi i32 [ 0, %entry ], [ %14, %bb37 ]     ; <i32> [#uses=9]
  %16 = icmp ugt i32 %15, 9                       ; <i1> [#uses=1]
  br i1 %16, label %bb40, label %bb

bb40:                                             ; preds = %bb38, %bb3.i
  ret i32 0

lpad:                                             ; preds = %bb4.i, %bb2.i, %bb.i
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=3]
  %eh_select43 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI3foo to i8*), i8* bitcast (%struct.__class_type_info_pseudo* @_ZTIi to i8*), i8* null) ; <i32> [#uses=2]
  %eh_typeid = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI3foo to i8*)) ; <i32> [#uses=1]
  %17 = icmp eq i32 %eh_select43, %eh_typeid      ; <i1> [#uses=1]
  br i1 %17, label %bb2, label %ppad86

lpad44:                                           ; preds = %bb2
  %eh_ptr45 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=3]
  %eh_select47 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr45, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI3foo to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid82 = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI3foo to i8*)) ; <i32> [#uses=1]
  %18 = icmp eq i32 %eh_select47, %eh_typeid82    ; <i1> [#uses=1]
  br i1 %18, label %bb11, label %ppad80

lpad48:                                           ; preds = %bb11
  %eh_ptr49 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select51 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr49, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad80

lpad60:                                           ; preds = %ppad80
  %eh_ptr61 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=1]
  %eh_select63 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr61, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad80:                                           ; preds = %lpad48, %lpad44
  %eh_exception.0 = phi i8* [ %eh_ptr49, %lpad48 ], [ %eh_ptr45, %lpad44 ] ; <i8*> [#uses=1]
  invoke void @__cxa_end_catch()
          to label %Unwind unwind label %lpad60

ppad86:                                           ; preds = %lpad
  %eh_typeid87 = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__class_type_info_pseudo* @_ZTIi to i8*)) ; <i32> [#uses=1]
  %19 = icmp eq i32 %eh_select43, %eh_typeid87    ; <i1> [#uses=1]
  %20 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  br i1 %19, label %bb27, label %bb36

Unwind:                                           ; preds = %ppad80
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for.i32(i8*) nounwind

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare void @__cxa_end_catch()

declare void @_ZSt9terminatev() noreturn nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)
