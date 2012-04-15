; ModuleID = 'ctor_dtor_count-2.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.A = type { i32 }
%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@.str = private constant [16 x i8] c"A(const A&) %d\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str1 = private constant [9 x i8] c"~A() %d\0A\00", align 1 ; <[9 x i8]*> [#uses=1]
@d = internal global i32 0                        ; <i32*> [#uses=6]
@.str2 = private constant [8 x i8] c"A() %d\0A\00", align 1 ; <[8 x i8]*> [#uses=1]
@.str3 = private constant [14 x i8] c"Throwing 1...\00", align 1 ; <[14 x i8]*> [#uses=1]
@_ZTI1A = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([3 x i8]* @_ZTS1A, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS1A = internal constant [3 x i8] c"1A\00"     ; <[3 x i8]*> [#uses=1]
@.str4 = private constant [8 x i8] c"Caught.\00", align 1 ; <[8 x i8]*> [#uses=1]
@.str5 = private constant [18 x i8] c"c == %d, d == %d\0A\00", align 1 ; <[18 x i8]*> [#uses=1]

declare i32 @printf(i8* noalias nocapture, ...) nounwind

define internal void @_ZN1AD1Ev(%struct.A* nocapture %this) nounwind {
entry:
  %0 = getelementptr inbounds %struct.A* %this, i32 0, i32 0 ; <i32*> [#uses=1]
  %1 = load i32* %0, align 4                      ; <i32> [#uses=1]
  %2 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %1) ; <i32> [#uses=0]
  %3 = load i32* @d, align 4                      ; <i32> [#uses=1]
  %4 = add nsw i32 %3, 1                          ; <i32> [#uses=1]
  store i32 %4, i32* @d, align 4
  ret void
}

declare i32 @puts(i8* nocapture) nounwind

declare i8* @__cxa_allocate_exception(i32) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for.i32(i8*) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

define i32 @main() {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0)) ; <i32> [#uses=0]
  %1 = tail call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %2 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  store i32 1, i32* %2, align 4
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 1) nounwind ; <i32> [#uses=0]
  invoke void @__cxa_throw(i8* %1, i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI1A to i8*), void (i8*)* bitcast (void (%struct.A*)* @_ZN1AD1Ev to void (i8*)*)) noreturn
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %entry
  unreachable

bb18:                                             ; preds = %lpad
  %4 = tail call i8* @__cxa_get_exception_ptr(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %5 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 2) nounwind ; <i32> [#uses=0]
  %6 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %7 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0)) ; <i32> [#uses=0]
  %8 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 2) nounwind ; <i32> [#uses=0]
  %9 = load i32* @d, align 4                      ; <i32> [#uses=1]
  %10 = add nsw i32 %9, 1                         ; <i32> [#uses=1]
  store i32 %10, i32* @d, align 4
  tail call void @__cxa_end_catch()
  %11 = load i32* @d, align 4                     ; <i32> [#uses=1]
  %12 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 2, i32 %11) ; <i32> [#uses=0]
  %13 = load i32* @d, align 4                     ; <i32> [#uses=1]
  %14 = icmp ne i32 %13, 2                        ; <i1> [#uses=1]
  %15 = zext i1 %14 to i32                        ; <i32> [#uses=1]
  ret i32 %15

lpad:                                             ; preds = %entry
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=4]
  %eh_select21 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI1A to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__class_type_info_pseudo* @_ZTI1A to i8*)) ; <i32> [#uses=1]
  %16 = icmp eq i32 %eh_select21, %eh_typeid      ; <i1> [#uses=1]
  br i1 %16, label %bb18, label %Unwind

Unwind:                                           ; preds = %lpad
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable
}

declare i8* @__cxa_get_exception_ptr(i8*) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()
