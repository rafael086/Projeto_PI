﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Projeto_PI.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EntidadesProjeto_PI : DbContext
    {
        public EntidadesProjeto_PI()
            : base("name=EntidadesProjeto_PI")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Doadores> Doadores { get; set; }
        public virtual DbSet<Enderecos> Enderecos { get; set; }
        public virtual DbSet<Imagens> Imagens { get; set; }
        public virtual DbSet<Ongs> Ongs { get; set; }
        public virtual DbSet<Projetos> Projetos { get; set; }
        public virtual DbSet<Sobre> Sobre { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<Voluntarios> Voluntarios { get; set; }
    }
}
