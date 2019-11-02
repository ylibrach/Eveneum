﻿using Eveneum.Documents;

namespace Eveneum
{
    public class Response
    {
        internal Response(double requestCharge)
        {
            this.RequestCharge = requestCharge;
        }

        public double RequestCharge { get; }
    }

    public class StreamResponse : Response
    {
        internal StreamResponse(Stream? stream, double requestCharge)
            : base(requestCharge)
        {
            this.Stream = stream;
        }

        public Stream? Stream { get; }
    }

    public class DeleteResponse : Response
    {
        internal DeleteResponse(ulong deletedDocuments, double requestCharge)
            : base(requestCharge)
        {
            this.DeletedDocuments = deletedDocuments;
        }

        public ulong DeletedDocuments { get; }
    }

    internal class DocumentResponse : Response
    {
        internal DocumentResponse(EveneumDocument document, double requestCharge)
            : base(requestCharge)
        {
            this.Document = document;
        }

        public EveneumDocument Document { get; }
    }
}
