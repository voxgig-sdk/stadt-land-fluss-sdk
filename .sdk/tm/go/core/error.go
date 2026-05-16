package core

type StadtLandFlussError struct {
	IsStadtLandFlussError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewStadtLandFlussError(code string, msg string, ctx *Context) *StadtLandFlussError {
	return &StadtLandFlussError{
		IsStadtLandFlussError: true,
		Sdk:              "StadtLandFluss",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *StadtLandFlussError) Error() string {
	return e.Msg
}
