import {
  IsEmail,
  isNotEmpty,
  IsNotEmpty,
  IsNumber,
  IsString,
} from "class-validator";

export class ForgotPasswordDto {
  @IsEmail()
  @IsNotEmpty()
  email: string;
}
