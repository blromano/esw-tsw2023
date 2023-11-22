/*
  Warnings:

  - You are about to drop the column `fk_topico_id` on the `MENSAGENS` table. All the data in the column will be lost.
  - You are about to drop the column `fk_user_id` on the `MENSAGENS` table. All the data in the column will be lost.
  - Added the required column `FK_TOPICO_TOP_ID` to the `MENSAGENS` table without a default value. This is not possible if the table is not empty.
  - Added the required column `FK_USUARIOS_USR_ID` to the `MENSAGENS` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `MENSAGENS` DROP FOREIGN KEY `MENSAGENS_fk_topico_id_fkey`;

-- DropForeignKey
ALTER TABLE `MENSAGENS` DROP FOREIGN KEY `MENSAGENS_fk_user_id_fkey`;

-- AlterTable
ALTER TABLE `MENSAGENS` DROP COLUMN `fk_topico_id`,
    DROP COLUMN `fk_user_id`,
    ADD COLUMN `FK_TOPICO_TOP_ID` INTEGER NOT NULL,
    ADD COLUMN `FK_USUARIOS_USR_ID` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `MENSAGENS` ADD CONSTRAINT `MENSAGENS_FK_TOPICO_TOP_ID_fkey` FOREIGN KEY (`FK_TOPICO_TOP_ID`) REFERENCES `TOPICOS`(`TOP_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MENSAGENS` ADD CONSTRAINT `MENSAGENS_FK_USUARIOS_USR_ID_fkey` FOREIGN KEY (`FK_USUARIOS_USR_ID`) REFERENCES `USUARIOS`(`USR_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;
