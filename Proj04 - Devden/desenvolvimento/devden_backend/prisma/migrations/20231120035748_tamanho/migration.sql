/*
  Warnings:

  - You are about to alter the column `POS_MENSAGEM` on the `POSTS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `TAG_NOME` on the `TAGS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `TIC_MENSAGEM` on the `TICKETS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `TIP_NOME` on the `TIPO_DENUNCIA` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `TOP_TITULO` on the `TOPICOS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `USR_NAME` on the `USUARIOS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `USR_SENHA` on the `USUARIOS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `USR_EMAIL` on the `USUARIOS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.
  - You are about to alter the column `USR_NOME_COMPLETO` on the `USUARIOS` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `VarChar(100)`.

*/
-- AlterTable
ALTER TABLE `POSTS` MODIFY `POS_MENSAGEM` VARCHAR(100) NOT NULL,
    MODIFY `POS_URL_FOTO` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `TAGS` MODIFY `TAG_NOME` VARCHAR(100) NOT NULL;

-- AlterTable
ALTER TABLE `TICKETS` MODIFY `TIC_MENSAGEM` VARCHAR(100) NOT NULL;

-- AlterTable
ALTER TABLE `TIPO_DENUNCIA` MODIFY `TIP_NOME` VARCHAR(100) NOT NULL;

-- AlterTable
ALTER TABLE `TOPICOS` MODIFY `TOP_TITULO` VARCHAR(100) NOT NULL,
    MODIFY `TOP_MENSAGEM` VARCHAR(500) NOT NULL;

-- AlterTable
ALTER TABLE `USUARIOS` MODIFY `USR_NAME` VARCHAR(100) NOT NULL DEFAULT 'no one',
    MODIFY `USR_SENHA` VARCHAR(100) NOT NULL DEFAULT 'no one',
    MODIFY `USR_EMAIL` VARCHAR(100) NOT NULL DEFAULT 'no one',
    MODIFY `USR_NOME_COMPLETO` VARCHAR(100) NOT NULL DEFAULT 'no one',
    MODIFY `USR_STAFF` INTEGER NOT NULL DEFAULT 0;
