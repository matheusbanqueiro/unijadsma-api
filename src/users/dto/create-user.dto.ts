import { ApiProperty } from '@nestjs/swagger';

export class CreateUserDto {
  @ApiProperty({ example: 'John Doe', description: 'The name of the user' })
  name: string;

  @ApiProperty({ example: 'john.doe@example.com', description: 'The email of the user' })
  email: string;

}
