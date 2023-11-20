import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserController } from './controllers/user/user.controller';
import { PrismaService } from './prisma.service';
import { UserService } from './services/user/user.service';
import { CriarUsuarioService } from './services/criar-usuario/criar-usuario.service';
import { CriarUsuarioController } from './controllers/criar-usuario/criar-usuario.controller';
import { LogarController } from './controllers/logar/logar.controller';
import { LogarService } from './services/logar/logar.service';
import { CriarTopicoService } from './services/criar-topico/criar-topico.service';
import { CriarTopicoController } from './controllers/criar-topico/criar-topico.controller';

@Module({
  imports: [],
  controllers: [AppController, UserController, CriarUsuarioController, LogarController, CriarTopicoController],
  providers: [AppService, UserService, PrismaService, CriarUsuarioService, LogarService, CriarTopicoService],
})
export class AppModule {}
