#include "yStPlayerCameraParam.h"

FyStPlayerCameraParam::FyStPlayerCameraParam() {
    this->CameraID = 0;
    this->FieldOfView = 0.00f;
    this->AimFOVRate = 0.00f;
    this->m_PitchRangeMin = 0.00f;
    this->m_PitchRangeMax = 0.00f;
    this->HideUnderwearPitch = 0.00f;
    this->HideUnderwearSpeed = 0.00f;
    this->m_MinDistanceFromChar = 0.00f;
    this->m_VerticalLag = 0.00f;
    this->m_VerticalLag_Jump = 0.00f;
    this->m_ProbeSize = 0.00f;
    this->m_AlphaSpeed = 0.00f;
    this->TargetSightPitchMoveUp = 0.00f;
    this->TargetSightPitchMoveDown = 0.00f;
    this->ClipingCollisionDir = false;
    this->ClipingCollisionLength = 0.00f;
    this->ClipingCollisionRange = 0.00f;
    this->PlayerFadeDistance = 0.00f;
}

